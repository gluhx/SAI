###########################################
######### Подключение библиотек ###########
###########################################
# Библиотека cx_Oracle для подключения к БД
import cx_Oracle
from pprint import pprint as pp
# Библиотека flask для создания Web приложения
from flask import Flask
from flask import render_template
from flask import request
from flask import redirect
from flask import make_response
from flask import send_file
# библиотека работы с QR
from flask_qrcode import QRcode

app = Flask(__name__)
QRcode(app)

###########################################
##### Подключение файлов с функциями ######
###########################################
# модуль авторизации
import authorization as auth
# модуль инженера-конструктора
import engineer as eng
# модуль технолога
import technologist as tech
# модуль директора
import director as dir
# подключение файла с удобными функциями
import function as func
# модуль администратора
import admin as adm
# модуль эксперта
import expert as exp

###########################################
############# Страницы сайта ##############
###########################################

@app.route('/')
def main():
    # проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    role = func.get_role(request.cookies.get('auth_login'))
    tasks = []
    if role in ['engineer', 'technologist', 'admin']:
        con_db = func.connect_to_db(role)
        cursor = con_db.cursor()
        cursor.execute('SELECT Task_ID, Task_About, Task_Check FROM DIR_TASKS WHERE Task_User_ID = (SELECT User_ID FROM AUTH_USERS WHERE User_Login = \'' + request.cookies.get('auth_login') + '\')')
        tasks = cursor.fetchall()
        cursor.close()
        con_db.close()
    return render_template("main.html", role=role, tasks_data=tasks)

########### модуль авторизации ############
# вход на сайт
@app.route('/login', methods=['POST', 'GET'])
def login():
    return auth.login()
# информация о пользователе
@app.route('/user')
def user():
    return auth.user()
# выход из аккаунта
@app.route('/logout', methods=['POST', 'GET'])
def logout():
    return auth.logout()
# регистрация
@app.route('/registration', methods=['POST', 'GET'])
def registration():
    return auth.registration()

############# модуль инженера ##############
# страница со всеми устройствами
@app.route('/all-devices')
def devices():
    return eng.all_devices()
# удаление устройства
@app.route('/device/delete/<id>')
def delete_device(id):
    return eng.delete_device(id)
# добавления устройства
@app.route('/add-device', methods=['POST'])
def add_device():
    return eng.add_device()
# страница каждого устройства
@app.route('/device/<id>')
def device(id):
    return eng.device(id)
# удаление компонента
@app.route('/component-delete/<id>')
def delete_component(id):
    return eng.delete_component(id)
# добавление компонента
@app.route('/component-add/<id_device>', methods=['POST'])
def add_component(id_device):
    return eng.add_component(id_device)
# генерация ПЭ3 excel
@app.route('/generate-pe3-xlsx/<id_device>')
def generate_xls(id_device):
    return eng.generate_xls(id_device)
# страница библиотеки компонентов
@app.route('/component-lib')
def component_lib():
    return eng.component_lib()
# удаление компонента из библиотеки
@app.route('/component-lib-delete/<id>')
def delete_component_lib(id):
    return eng.delete_component_lib(id)
# добавление компонента
@app.route('/component-lib-add', methods=['POST'])
def add_component_lib():
    return eng.add_device_lib()
# помощь инженеру
@app.route('/engineer-help', methods=['POST', 'GET'])
def engineer_help():
    return eng.engineer_help()

############ модуль технолога #############
# список ТП
@app.route('/tech-processes')
def processes():
    return tech.processes()
# удаление ТП
@app.route('/process/delete/<id>')
def delete_process(id):
    return tech.delete_process(id)
# добавления ТП
@app.route('/add-process', methods=['POST'])
def add_process():
    return tech.add_process()
# страница каждого процесса
@app.route('/process/<id>', methods=['POST', 'GET'])
def process(id):
    return tech.process(id)
# удаление операции
@app.route('/operation-delete/<id>')
def delete_operation(id):
    return tech.delete_operation(id)
# добавление операции
@app.route('/operation-add/<id_device>', methods=['POST'])
def add_operation(id_device):
    return tech.add_operation(id_device)
# добавление ТП к устройству
@app.route('/tp-to-device/<id>', methods=['POST'])
def tp_to_dev(id):
    return tech.tp_to_device(id)
# перемещение операции вверх
@app.route('/operation-high/<id>')
def op_high(id):
    return tech.operation_high(id)
# перемещение операции вниз
@app.route('/operation-low/<id>')
def op_low(id):
    return tech.operation_low(id)
# генерация маршрутной карты
@app.route('/generate-mcard/<TP_id>')
def generate_mcard(TP_id):
    return tech.mcard(TP_id)
# страница списка оборудования
@app.route('/tools')
def tools():
    return tech.tools()
# страница помощи технологу
@app.route('/technologist-help')
def tech_help():
    return tech.help()

############# модуль директора ##############
@app.route('/add-tasks', methods=['POST', 'GET'])
def create_task():
    return dir.create_task()
@app.route('/delete-task/<id>')
def delete_task(id):
    return dir.delete_task(id)
@app.route('/staff')
def staff():
    return dir.staff()

############# модуль администратора ##############
@app.route('/admin-tables')
def admin_tables_page():
    return adm.admin_tables()

@app.route('/admin/delete/<table_name>', methods=['POST'])
def admin_delete(table_name):
    return adm.delete_row(table_name)

@app.route('/admin/insert/<table_name>', methods=['POST'])
def admin_insert(table_name):
    return adm.insert_row(table_name)

@app.route('/admin/update/<table_name>', methods=['POST'])
def admin_update(table_name):
    return adm.update_row(table_name)

# Новые маршруты для редактирования
@app.route('/admin/edit/<table_name>/<pk_value>')
def admin_edit_form(table_name, pk_value):
    return adm.edit_form(table_name, pk_value)

@app.route('/admin/update/<table_name>', methods=['POST'])
def admin_handle_edit(table_name):
    pk_value = request.form.get('pk')
    return adm.handle_edit(table_name, pk_value)

############# модуль эксперта ##############
@app.route('/expert/slots', methods=['GET', 'POST'])
def expert_slots():
    if request.method == 'POST':
        return exp.add_slot()
    return exp.slots_page()

@app.route('/expert/slot/<int:slot_id>/update', methods=['POST'])
def expert_update_slot(slot_id):
    return exp.update_slot(slot_id)

@app.route('/expert/slot/<int:slot_id>/delete', methods=['POST'])
def expert_delete_slot(slot_id):
    return exp.delete_slot(slot_id)

@app.route('/expert/slot/<int:slot_id>/value/add', methods=['POST'])
def expert_add_slot_value(slot_id):
    return exp.add_slot_value(slot_id)

@app.route('/expert/slot/value/<int:value_id>/delete')
def expert_delete_slot_value(value_id):
    return exp.delete_slot_value(value_id)

@app.route('/expert/frames', methods=['GET', 'POST'])
def expert_frames():
    if request.method == 'POST':
        return exp.add_frame()
    return exp.frames_page()

@app.route('/expert/frame/<int:frame_id>/update', methods=['POST'])
def expert_update_frame(frame_id):
    return exp.update_frame(frame_id)

@app.route('/expert/frame/<int:frame_id>/delete', methods=['POST'])
def expert_delete_frame(frame_id):
    return exp.delete_frame(frame_id)

# === Страница назначения слотов фреймам ===
@app.route('/expert/frame-slots')
def expert_frame_slots():
    return exp.frame_slots_page()

@app.route('/expert/frame/<frame_id>/slot/add', methods=['POST'])
def expert_add_frame_slot(frame_id):
    return exp.add_frame_slot(frame_id)

@app.route('/expert/frame-slot/<int:frame_value_id>/delete')
def expert_delete_frame_slot(frame_value_id):
    return exp.delete_frame_slot(frame_value_id)

@app.route('/expert/frame-slot/<int:frame_value_id>/update', methods=['POST'])
def expert_update_frame_slot_value(frame_value_id):
    return exp.update_frame_slot_value(frame_value_id)

# Эндпоинт для подгрузки значений слота (AJAX)
@app.route('/expert/slot/<int:slot_id>/values')
def expert_get_slot_values_json(slot_id):
    return exp.get_slot_values_json(slot_id)

# === Операции фрейма ===
@app.route('/expert/frame/<int:frame_id>/operations')
def expert_frame_operations(frame_id):
    return exp.frame_operations_page(frame_id)

@app.route('/expert/frame/<int:frame_id>/operation/add', methods=['POST'])
def expert_add_frame_operation(frame_id):
    return exp.add_frame_operation(frame_id)

@app.route('/expert/frame-op/<int:op_id>/delete')
def expert_delete_frame_operation(op_id):
    return exp.delete_frame_operation(op_id)

@app.route('/expert/frame-op/<int:op_id>/up')
def expert_move_operation_up(op_id):
    return exp.move_operation_up(op_id)

@app.route('/expert/frame-op/<int:op_id>/down')
def expert_move_operation_down(op_id):
    return exp.move_operation_down(op_id)

# запуск Web приложения
if __name__ == '__main__':
    app.run(debug=True)
