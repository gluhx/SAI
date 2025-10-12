###########################################
######### Подключение библиотек ###########
###########################################

#библиотека работы  c Flask
from flask import Flask
from flask import render_template
from flask import request
from flask import redirect
from flask import make_response
from flask import send_file
from flask import session

#библиотека для работы с Oracle
import cx_Oracle

#библиотека работы в QR
from flask_qrcode import QRcode

#библиотека для работы с pdf
from fpdf import FPDF

###########################################
##### Подключение файлов с функциями ######
###########################################

#подключение файла с удобными функциями
import function as func

###########################################
############# Страницы сайта ##############
###########################################

#страница со списком всех тех процессов
def processes():
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    processes_data = []
    cursor.execute('SELECT Process_ID FROM TCHG_PROCESS')
    tp_processes = cursor.fetchall()
    if len(tp_processes) > 0:
        for process in tp_processes:
            process = process[0]
            process_data={'id': '', 'note':''}
            process_data['id'] = process
            cursor.execute('SELECT Process_Note FROM TCHG_PROCESS WHERE Process_ID = '+ str(process))
            process_data['note'] = cursor.fetchall()[0][0]
            processes_data.append(process_data)
    
    cursor.close()
    con_db.close()

    return render_template("technologist/processes.html", processes_data=processes_data, role=func.get_role(request.cookies.get('auth_login')))

#удаление процесса
def delete_process(id):
    # проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    role = func.get_role(request.cookies.get('auth_login'))
    if not(role == 'technologist' or role == 'director'):
        return redirect('/tech-processes')
    else:
        con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
        cursor = con_db.cursor()
        # Удаляем сначала из COM_TP_DEV
        cursor.execute('DELETE FROM COM_TP_DEV WHERE TP_ID = ' + str(id))
        # Удаляем операции
        cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_ID = ' + str(id))
        # Теперь можно удалить сам процесс
        cursor.execute('DELETE FROM TCHG_PROCESS WHERE Process_ID = ' + str(id))
        con_db.commit()
        cursor.close()
        con_db.close()
        return redirect('/tech-processes')

#добавление устройства
def add_process():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    if request.method == 'POST':
        role = func.get_role(request.cookies.get('auth_login'))
        if role == 'technologist' or role == 'director':
            cursor.execute('INSERT INTO TCHG_PROCESS (Process_ID, Process_Note) \
                        VALUES (S_TCHG_PROCESS.NEXTVAL, \''+request.form['process_note']+'\')')
            con_db.commit()  
    cursor.close()
    con_db.close()

    return redirect('/tech-processes')

#страница каждого процесса
def process(id):
    #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    role = func.get_role(request.cookies.get('auth_login'))
    
    if request.method=='POST':
        group_t = request.form['group']
    else:
        group_t = "1"
    con_db = func.connect_to_db(role)
    cursor = con_db.cursor()

    process_data={'id': '', 'note':''}
    process_data['id'] = id
    cursor.execute('SELECT Process_Note FROM TCHG_PROCESS WHERE Process_ID =\'' + id + '\'')
    process_data['note'] = cursor.fetchall()[0][0]
    if len(process_data['note']) == 0:
        return redirect('/tech-processes')

    cursor.execute('SELECT Process_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_ID =' + id + ' ORDER BY Process_Operation_ID')
    operations = cursor.fetchall()
    operations_data=[]
    j = 5
    for operation in operations:
        operation = operation[0]
        operation_select={
            'about': 'SELECT Operation_About FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation), 
            'gost_number' : 'SELECT Operation_Number FROM TCHG_OPERATION_LIST WHERE Operation_ID = \
                (SELECT GOST_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation)+')',
            'gost_name' : 'SELECT Operation_Name FROM TCHG_OPERATION_LIST WHERE Operation_ID = \
                (SELECT GOST_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation)+')',
            'gost_group' : 'SELECT Group_Number FROM TCHG_OPERATION_GROUP WHERE Group_ID = \
                (SELECT Operation_Group_ID FROM TCHG_OPERATION_LIST WHERE Operation_ID = \
                (SELECT GOST_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation)+'))', 
            'time': 'SELECT Operation_Time FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation), 
            'tools': 'SELECT Tool_Name FROM TCHG_TOOLS WHERE Tool_ID = (SELECT Operation_Tools_ID FROM \
                TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+str(operation)+')'
            }
        operation_data = {'id': '','number': '', 'about': '', 'gost_number' : '', 'gost_name' : '', 'gost_group' : '', 'tools': '', 'time':''}
        operation_data['id'] = operation
        for i in operation_select:
            cursor.execute(operation_select[i])
            operation_data[i] = cursor.fetchall()[0][0]
        operation_data['number']=j
        j+=5
        operations_data.append(operation_data)
    
    for i in operations_data:
        if i['gost_number']<10:
            i['gost_number'] = '0' + str(i['gost_number'])
        else:
            i['gost_number'] = str(i['gost_number'])
        if i['gost_group']<10:
            i['gost_group'] = '0' + str(i['gost_group'])
        else:
            i['gost_group'] = str(i['gost_group'])

    
    cursor.execute('SELECT Group_ID, Group_Name, Group_Number FROM TCHG_OPERATION_GROUP')
    group_lib = cursor.fetchall()

    cursor.execute('SELECT Operation_ID, Operation_Number, Operation_Name FROM TCHG_OPERATION_LIST WHERE Operation_Group_ID = \
                   (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = ' + str(group_t) + ')')
    operation_lib = cursor.fetchall()
    if len(group_t) == 1:
        group_t = "0"+group_t
    
    cursor.execute('SELECT Tool_ID, Tool_Name FROM TCHG_TOOLS')
    tools_lib = cursor.fetchall()

    cursor.execute('SELECT Device_ID, Device_Name FROM ENG_DEVICE')
    device_lib = cursor.fetchall()

    cursor.close()
    con_db.close()
    return render_template("technologist/process.html", role=role, process_data=process_data, operations_data=operations_data, group_lib=group_lib,
                           group_t=group_t, operation_lib=operation_lib, tools_lib=tools_lib, device_lib=device_lib, length=len(operations_data))

#удаление операции из процесса
def delete_operation(id):
        #проверка авторизации
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor = con_db.cursor()
    cursor.execute('SELECT Process_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ id)
    redir = cursor.fetchall()
    if redir != []:
        redir=redir[0][0]

        role = func.get_role(request.cookies.get('auth_login'))
        if role == 'technologist' or role== 'director':
            cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ id)
            con_db.commit()


        cursor.close()
        con_db.close()
    
        return redirect('/process/'+str(redir))
    cursor.close()
    con_db.close()
    return redirect('/processes')

#добавление операции в процесс
def add_operation(id):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    if request.method == 'POST':
        role = func.get_role(request.cookies.get('auth_login'))
        if role == 'technologist' or role == 'director':
            cursor.execute('INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID) \
            VALUES (S_TCHG_PROCESS_OPERATION.NEXTVAL, '+ str(id) +', '+request.form['operation_gost']+', \''+request.form['operation_about']+'\', '+request.form['operation_time']+', '+request.form['operation_tool']+')')
            con_db.commit()
    
    
    cursor.close()
    con_db.close()

    return redirect('/process/'+id)

#добавление ТП к устройству
def tp_to_device(id_tp):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))

    con_db = func.connect_to_db(func.get_role(role))
    cursor  = con_db.cursor()

    if request.method == 'POST':
        if role == 'technologist' or role == 'director':
            cursor.execute('DELETE FROM COM_TP_DEV WHERE Dev_ID = '+ request.form['device_id']+'')
            cursor.execute('INSERT INTO COM_TP_DEV (TPDEV_Link_ID, TP_ID, Dev_ID) VALUES (S_COM_TP_DEV.NEXTVAL, '+ str(id_tp) +', '+request.form['device_id']+')')
            con_db.commit()
    
    
    cursor.close()
    con_db.close()

    return redirect('/device/'+request.form['device_id'])

#перемещение операции выше
def operation_high(id):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))

    if role == 'technologist' or role == 'director':
        con_db = func.connect_to_db(func.get_role(role))
        cursor  = con_db.cursor()

        cursor.execute('SELECT MAX(Process_Operation_ID) FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID < '+ str(id)+' AND Process_ID = \
                       (SELECT Process_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id)+')')
        id_2 = cursor.fetchall()[0][0]

        cursor.execute('SELECT Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id))
        operation_1 = cursor.fetchall()[0]
        cursor.execute('SELECT Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id_2))
        operation_2 = cursor.fetchall()[0]
        
        cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id))
        cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id_2))

        cursor.execute('INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID) \
            VALUES ('+str(id_2)+', '+ str(operation_1[0]) +', '+str(operation_1[1])+', \''+operation_1[2]+'\', '+str(operation_1[3])+', '+str(operation_1[4])+')')
        cursor.execute('INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID) \
            VALUES ('+str(id)+', '+ str(operation_2[0]) +', '+str(operation_2[1])+', \''+operation_2[2]+'\', '+str(operation_2[3])+', '+str(operation_2[4])+')')

        con_db.commit()
        cursor.close()
        con_db.close()

    return redirect('/process/'+str(operation_1[0]))

#перемещение операции ниже
def operation_low(id):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')

    role = func.get_role(request.cookies.get('auth_login'))

    if role == 'technologist' or role == 'director':
        con_db = func.connect_to_db(func.get_role(role))
        cursor  = con_db.cursor()

        cursor.execute('SELECT MIN(Process_Operation_ID) FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID > '+ str(id)+' AND Process_ID = \
                       (SELECT Process_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id)+')')
        id_2 = cursor.fetchall()[0][0]

        cursor.execute('SELECT Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id))
        operation_1 = cursor.fetchall()[0]
        cursor.execute('SELECT Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id_2))
        operation_2 = cursor.fetchall()[0]
        
        cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id))
        cursor.execute('DELETE FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = '+ str(id_2))

        cursor.execute('INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID) \
            VALUES ('+str(id_2)+', '+ str(operation_1[0]) +', '+str(operation_1[1])+', \''+operation_1[2]+'\', '+str(operation_1[3])+', '+str(operation_1[4])+')')
        cursor.execute('INSERT INTO TCHG_PROCESS_OPERATION (Process_Operation_ID, Process_ID, GOST_Operation_ID, Operation_About, Operation_Time, Operation_Tools_ID) \
            VALUES ('+str(id)+', '+ str(operation_2[0]) +', '+str(operation_2[1])+', \''+operation_2[2]+'\', '+str(operation_2[3])+', '+str(operation_2[4])+')')

        con_db.commit()
        cursor.close()
        con_db.close()

    return redirect('/process/'+str(operation_1[0]))

#генерация маршрутной карты PDF
def mcard(id):
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    con_db = func.connect_to_db(func.get_role(request.cookies.get('auth_login')))
    cursor  = con_db.cursor()

    cursor.execute('SELECT Process_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_ID = ' + str(id) + ' ORDER BY Process_Operation_ID')
    operations = cursor.fetchall()
    if len(operations) == 0:
        return redirect('/process/'+ str(id))
    pdf = FPDF()
    pdf.add_font('DejaVu', '', '/usr/share/fonts/dejavu-serif-fonts/DejaVuSerif.ttf')
    pdf.set_font(family='DejaVu',size=12)
    pdf.add_page()
    
    col_width1 = int(pdf.w / 2.7)
    col_width2 = int(pdf.w / 10)
    row_height = pdf.font_size*2

    i=5
    operations_data = [["Номер", "Операция", "Оборудование", "Время, с"]]
    count_h = []
    count_h.append(len(operations_data[0][0]) // 6 + 1)
    count_h.append(round(len(operations_data[0][1])*(row_height/2)) // col_width1 + 1)
    count_h.append(round(len(operations_data[0][2])*(row_height/2)) // col_width1 + 1)
    count_h.append(len(operations_data[0][3]) // 6 + 1)

    operations_data[0].append(count_h)
    for operation in operations:
        operation_data = []
        count_h = []
        operation_data.append(str(i))
        count_h.append(len(operation_data[0]) // 6 + 1)

        operation=operation[0]

        cursor.execute('SELECT Operation_About FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = ' + str(operation))
        operation_data.append(str(cursor.fetchall()[0][0]))
        count_h.append(round(len(operation_data[1])*(row_height/2)) // col_width1 + 1)

        cursor.execute('SELECT Tool_Name FROM TCHG_TOOLS WHERE Tool_ID = (SELECT Operation_Tools_ID FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = ' + str(operation)+')')
        operation_data.append(str(cursor.fetchall()[0][0]))
        count_h.append(round(len(operation_data[2])*(row_height/2)) // col_width1 + 1)

        cursor.execute('SELECT Operation_Time FROM TCHG_PROCESS_OPERATION WHERE Process_Operation_ID = ' + str(operation))
        operation_data.append(str(cursor.fetchall()[0][0]))
        count_h.append(len(operation_data[3]) // 6 + 1)

        operation_data.append(count_h)

        i+=5
        operations_data.append(operation_data)
    

    cursor.close()
    con_db.close()
    xbegin = pdf.get_x()
    j=0
    for j in range(len(operations_data)):
        row = operations_data[j]
        y = pdf.get_y()
        pdf.set_xy(int(xbegin), int(y))
        for i in range(len(row) - 1):
            if j == len(operations_data) - 1:
                if i == 0:
                    y = pdf.get_y()
                    pdf.multi_cell(col_width2, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border=1)
                    x = pdf.get_x()
                    pdf.set_xy(int(x), int(y))
                elif i == 3:
                    pdf.multi_cell(col_width2, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border=1)
                else:
                    y = pdf.get_y()
                    pdf.multi_cell(col_width1, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border=1)
                    x = pdf.get_x()
                    pdf.set_xy(int(x), int(y))
            else:
                if i == 0:
                    y = pdf.get_y()
                    pdf.multi_cell(col_width2, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border="LTR")
                    x = pdf.get_x()
                    pdf.set_xy(int(x), int(y))
                elif i == 3:
                    pdf.multi_cell(col_width2, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border="LTR")
                else:
                    y = pdf.get_y()
                    pdf.multi_cell(col_width1, row_height*(max(row[4]) - row[4][i] + 1), txt=row[i], border="LTR")
                    x = pdf.get_x()
                    pdf.set_xy(int(x), int(y))
    pdf.output('temp/mcard.pdf')

    return send_file('temp/mcard.pdf', as_attachment=True)

#страница оборудования
def tools():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    role = func.get_role(request.cookies.get('auth_login'))

    con_db = func.connect_to_db(role)
    cursor = con_db.cursor()

    cursor.execute('SELECT Tool_ID, Tool_Name FROM TCHG_TOOLS')
    tools = cursor.fetchall()
    
    
    cursor.close()
    con_db.close()
    
    return render_template("technologist/tools.html", role=role, tools=tools)

#страница помощи технологу
def help():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    role = func.get_role(request.cookies.get('auth_login'))

    con_db = func.connect_to_db(role)
    cursor  = con_db.cursor()

    gosts_data = []

    cursor.execute('SELECT Group_ID FROM TCHG_OPERATION_GROUP ORDER BY Group_ID')
    gosts = cursor.fetchall()
    for gost in gosts:
        gost = gost[0]
        gost_data={'group_number': '', 'group_name': '', 'operations': '', 'id': str(gost)}
        cursor.execute('SELECT Group_Name FROM TCHG_OPERATION_GROUP WHERE Group_ID = \'' + str(gost) + '\'')
        gost_data['group_name'] = cursor.fetchall()[0][0]

        cursor.execute('SELECT Group_Number FROM TCHG_OPERATION_GROUP WHERE Group_ID =' + str(gost) + '')
        gost_data['group_number'] = cursor.fetchall()[0][0]
        if gost_data['group_number'] < 10:
            gost_data['group_number'] = "0"+str(gost_data['group_number'])
        else:
            gost_data['group_number'] = str(gost_data['group_number'])

        cursor.execute('SELECT Operation_Number, Operation_Name FROM TCHG_OPERATION_LIST WHERE Operation_Group_ID =' + str(gost) + ' ORDER BY Operation_Number')
        gost_data['operations'] = cursor.fetchall()
        gosts_data.append(gost_data)
    cursor.close()
    con_db.close()

    return render_template("technologist/tech_help.html", gosts_data=gosts_data, role=role)

def get_root_prototypes(con_db):
    """Получить все корневые прототипы (Parent_Frame_ID IS NULL AND Is_Prototype = 1)"""
    cursor = con_db.cursor()
    cursor.execute("""
        SELECT Frame_ID, Frame_Name
        FROM EXPERT_FRAMES
        WHERE Parent_Frame_ID IS NULL AND Is_Prototype = 0
        ORDER BY Frame_Name
    """)
    frames = cursor.fetchall()
    cursor.close()
    return frames

def get_frame_slots_values(con_db, frame_id):
    """Получить все слоты и их значения для фрейма"""
    cursor = con_db.cursor()
    cursor.execute("""SELECT s.Slot_ID, s.Slot_Name, sv.Slot_Value_ID, sv.Value_Name
        FROM EXPERT_FRAME_VALUES fv,
        EXPERT_SLOT_VALUES sv,
        EXPERT_SLOTS s
        WHERE fv.Slot_Value_ID = sv.Slot_Value_ID
        AND s.Slot_ID = sv.Slot_ID
        AND fv.Frame_ID = :1
        ORDER BY s.Slot_Name, sv.Value_Name
    """, (frame_id,))
    rows = cursor.fetchall()
    cursor.close()
    return rows

def find_first_prototype(con_db, parent_frame_id):
    """
    Найти прототип
    """
    cursor = con_db.cursor()
    cursor.execute("""
        SELECT Frame_ID, Frame_Name, Parent_Frame_ID, LEVEL AS depth
        FROM EXPERT_FRAMES
        WHERE Is_Prototype = 1
        START WITH Frame_ID = :1
        CONNECT BY PRIOR Frame_ID = Parent_Frame_ID
    """, (parent_frame_id,))
    candidates = [r[0] for r in cursor.fetchall()]
    if not candidates:
        cursor.close()
        return None
    else:
        cursor.close()
        return candidates[0]

def find_best_matching_prototype(con_db, parent_frame_id, answers):
    cursor = con_db.cursor()
    cursor.execute("""
        SELECT Frame_ID
        FROM EXPERT_FRAMES
        WHERE Is_Prototype = 1
        START WITH Frame_ID = :1
        CONNECT BY PRIOR Frame_ID = Parent_Frame_ID
    """, (parent_frame_id,))
    candidates = [r[0] for r in cursor.fetchall()]  # <-- добавь эту строку!
    cursor.close()

    if not candidates:
        return None

    best_score = -1
    best_frame = None
    for fid in candidates:
        score = 0
        frame_slots = get_frame_slots_values(con_db, fid)
        for slot_id, _, value_id, _ in frame_slots:
            key = (slot_id, value_id)
            if key in answers:
                if answers[key] == 1:
                    score += 1
                else:
                    score -= 10
        if score > best_score:
            best_score = score
            best_frame = fid

    if best_score < 0:
        return None
    return best_frame

def clear_session(con_db, user_id):
    cursor = con_db.cursor()
    cursor.execute("DELETE FROM EXPERT_SESSION WHERE User_ID = :1", (user_id,))
    con_db.commit()
    cursor.close()

def save_answer(con_db, user_id, frame_id, slot_id, value_id, answer):
    cursor = con_db.cursor()
    cursor.execute("""
        INSERT INTO EXPERT_SESSION (Answer_ID, User_ID, Frame_ID, Slot_ID, Slot_Value_ID, Answer)
        VALUES (S_EXPERT_SESSION.NEXTVAL, :1, :2, :3, :4, :5)
    """, (user_id, frame_id, slot_id, value_id, answer))
    con_db.commit()
    cursor.close()

def get_session_answers(con_db, user_id, root_frame_id):
    cursor = con_db.cursor()
    cursor.execute("""
        SELECT Slot_ID, Slot_Value_ID, Answer
        FROM EXPERT_SESSION
        WHERE User_ID = :1 AND Frame_ID = :2
    """, (user_id, root_frame_id))
    answers = {(r[0], r[1]): r[2] for r in cursor.fetchall()}
    cursor.close()
    return answers

def get_operations_by_frame_ids(con_db, frame_ids):
    """Возвращает операции с Tool_ID (число) — для сохранения в БД"""
    cursor = con_db.cursor()
    operations = []
    for fid in frame_ids:
        cursor.execute("""
            SELECT e.Operation_Name, e.Operation_ID, e.Op_Duration, e.Tool_ID
            FROM EXPERT_PROCESS_OPERATIONS e
            WHERE e.Frame_ID = :1
            ORDER BY e.Op_Order
        """, (fid,))
        ops = cursor.fetchall()
        operations.extend(ops)
    cursor.close()
    return operations  # op[3] = Tool_ID (число!)    

def expert_generate_tp():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    role = func.get_role(request.cookies.get('auth_login'))
    if role not in ['technologist', 'admin']:
        return redirect('/')
    con_db = func.connect_to_db('technologist')
    # Получаем User_ID
    cursor = con_db.cursor()
    cursor.execute("SELECT User_ID FROM AUTH_USERS WHERE User_Login = :1", (request.cookies.get('auth_login'),))
    user_id = cursor.fetchone()[0]
    cursor.close()
    clear_session(con_db, user_id)
    root_frames = get_root_prototypes(con_db)
    con_db.close()
    if not root_frames:
        return "Нет корневых прототипов", 400
    session['expert_frame_index'] = 0
    session['expert_root_frames'] = root_frames
    session['expert_user_id'] = user_id  # сохраняем ID, а не логин
    return redirect('/expert/dialog')

def expert_dialog():
    if request.cookies.get('auth_status') != 'True':
        print(">>> [expert_dialog] Пользователь не авторизован — редирект на /login")
        return redirect('/login')
    role = func.get_role(request.cookies.get('auth_login'))
    if role not in ['technologist', 'admin']:
        print(f">>> [expert_dialog] Недостаточно прав (роль: {role}) — редирект на /")
        return redirect('/')
    
    user_id = session.get('expert_user_id')
    if not user_id:
        print(">>> [expert_dialog] Нет user_id в сессии — редирект на /tech-processes")
        return redirect('/tech-processes')
    
    con_db = func.connect_to_db('technologist')
    print(f"\n{'='*60}")
    print(f">>> [expert_dialog] НАЧАЛО ДИАЛОГА | user_id={user_id}")
    
    root_frames = session.get('expert_root_frames', [])
    frame_index = session.get('expert_frame_index', 0)
    print(f">>> Корневые фреймы: {root_frames}")
    print(f">>> Текущий индекс фрейма: {frame_index}")

    if frame_index >= len(root_frames):
        print(">>> Все корневые фреймы обработаны — генерация ТП")
        solution_frame_ids = [fid for fid, name in root_frames]
        operations = get_operations_for_preview(con_db, solution_frame_ids)  # ← только для отображения!
        con_db.close()
        return render_template("technologist/tp_preview.html", operations=operations, role=role)

    current_root_id, current_root_name = root_frames[frame_index]
    print(f">>> Работаем с корневым фреймом: ID={current_root_id}, имя='{current_root_name}'")

    if 'current_prototype_id' not in session:
        print(">>> Инициализация: выбор первого прототипа")
        first_proto_id = find_first_prototype(con_db, current_root_id)
        if not first_proto_id:
            print(">>> ОШИБКА: не найдено ни одного прототипа для корневого фрейма!")
            session['expert_frame_index'] = frame_index + 1
            con_db.close()
            return redirect('/expert/dialog')
        session['current_prototype_id'] = first_proto_id
        session['slot_idx'] = 0
        print(f">>> Выбран первый прототип: {first_proto_id}")

    current_proto_id = session['current_prototype_id']
    slot_idx = session['slot_idx']
    print(f">>> Текущий прототип: {current_proto_id}, слот индекс: {slot_idx}")

    proto_slots = get_frame_slots_values(con_db, current_proto_id)
    print(f">>> Слоты текущего прототипа: {proto_slots}")

    if not proto_slots:
        print(">>> У прототипа нет слотов — принимаем как решение")
        root_frames[frame_index] = (current_proto_id, "Решение")
        session['expert_root_frames'] = root_frames
        session['expert_frame_index'] = frame_index + 1
        session.pop('current_prototype_id', None)
        session.pop('slot_idx', None)
        con_db.close()
        return redirect('/expert/dialog')

    if slot_idx >= len(proto_slots):
        print(">>> Все слоты прототипа пройдены — ищем однозначное решение по ответам 'да'")
        answers = get_session_answers(con_db, user_id, current_root_id)
        yes_answers = {k: v for k, v in answers.items() if v == 1}
        all_prototypes = get_all_prototypes(con_db, current_root_id)
        matching = []
        for fid, fname in all_prototypes:
            proto_slots_vals = get_frame_slots_values(con_db, fid)
            proto_set = {(s_id, v_id) for s_id, _, v_id, _ in proto_slots_vals}
            if all(key in proto_set for key in yes_answers.keys()):
                matching.append((fid, fname))
        if len(matching) == 1:
            solution_fid, solution_name = matching[0]
            print(f">>> Найдено однозначное решение: Frame_ID={solution_fid}")
            root_frames[frame_index] = (solution_fid, "Решение")
        else:
            print(f">>> Неоднозначность ({len(matching)} решений). Используем текущий прототип как решение.")
            root_frames[frame_index] = (current_proto_id, "Решение (неоднозначно)")
        session['expert_root_frames'] = root_frames
        session['expert_frame_index'] = frame_index + 1
        session.pop('current_prototype_id', None)
        session.pop('slot_idx', None)
        con_db.close()
        return redirect('/expert/dialog')

    slot_id, slot_name, value_id, value_name = proto_slots[slot_idx]
    print(f">>> Текущий вопрос: Слот='{slot_name}', Значение='{value_name}' (slot_id={slot_id}, value_id={value_id})")

    if request.method == 'POST':
        answer_str = request.form.get('answer', 'unknown')
        answer_val = 1 if answer_str == 'yes' else 0
        print(f">>> Получен ответ: '{answer_str}' → числовое значение: {answer_val}")

        # Сохраняем ответ в сессии БД
        save_answer(con_db, user_id, current_root_id, slot_id, value_id, answer_val)

        if answer_val == 1:
            print(">>> Ответ 'Да' — переходим к следующему слоту")
            session['slot_idx'] = slot_idx + 1
        else:
            print(">>> Ответ 'Нет' — фильтруем прототипы по всем ответам")
            answers = get_session_answers(con_db, user_id, current_root_id)
            compatible_prototypes = filter_prototypes_by_answers(con_db, current_root_id, answers)
            # Исключаем текущий прототип
            compatible_prototypes = [p for p in compatible_prototypes if p[0] != current_proto_id]

            if compatible_prototypes:
                session['current_prototype_id'] = compatible_prototypes[0][0]
                # slot_idx остаётся прежним — задаём тот же слот, но с новым значением
                print(f">>> Переключились на совместимый прототип: {compatible_prototypes[0][0]}")
            else:
                print(">>> Нет совместимых прототипов — пропускаем фрейм")
                session['expert_frame_index'] = frame_index + 1
                session.pop('current_prototype_id', None)
                session.pop('slot_idx', None)
                con_db.close()
                return redirect('/expert/dialog')

        con_db.close()
        return redirect('/expert/dialog')

    con_db.close()
    return render_template(
        "technologist/dialog.html",
        frame_name=current_root_name,
        slot_name=slot_name,
        value_name=value_name,
        slot_id=slot_id,
        value_id=value_id,
        role=role
    )

def expert_cancel():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    user_id = session.get('expert_user_id')
    if user_id:
        # Удаляем все ответы из БД
        con_db = func.connect_to_db('technologist')
        clear_session(con_db, user_id)
        con_db.close()

    # Полностью очищаем сессию от данных экспертной системы
    session.pop('expert_frame_index', None)
    session.pop('expert_root_frames', None)
    session.pop('expert_user_id', None)
    session.pop('slot_idx', None)
    session.pop('value_idx', None)

    return redirect('/tech-processes')

def expert_cancel():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    
    user_id = session.get('expert_user_id')
    if user_id:
        con_db = func.connect_to_db('technologist')
        clear_session(con_db, user_id)
        con_db.close()

    # Полная очистка
    session.pop('expert_frame_index', None)
    session.pop('expert_root_frames', None)
    session.pop('expert_user_id', None)
    session.pop('current_prototype_id', None)
    session.pop('slot_idx', None)

    return redirect('/tech-processes')

def get_all_prototypes(con_db, root_frame_id):
    """Получить все прототипы (Is_Prototype=1), достижимые от root_frame_id"""
    cursor = con_db.cursor()
    cursor.execute("""
        SELECT Frame_ID, Frame_Name
        FROM EXPERT_FRAMES
        WHERE Is_Prototype = 1
        START WITH Frame_ID = :1
        CONNECT BY PRIOR Frame_ID = Parent_Frame_ID
    """, (root_frame_id,))
    prototypes = cursor.fetchall()
    cursor.close()
    return prototypes

def get_slots_for_prototypes(con_db, prototype_ids):
    """Получить слоты и значения, общие или возможные для списка прототипов"""
    if not prototype_ids:
        return []
    placeholders = ','.join([str(pid) for pid in prototype_ids])
    cursor = con_db.cursor()
    cursor.execute(f"""
        SELECT DISTINCT s.Slot_ID, s.Slot_Name, sv.Slot_Value_ID, sv.Value_Name
        FROM EXPERT_FRAME_VALUES fv
        JOIN EXPERT_SLOT_VALUES sv ON fv.Slot_Value_ID = sv.Slot_Value_ID
        JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID
        WHERE fv.Frame_ID IN ({placeholders})
        ORDER BY s.Slot_Name, sv.Value_Name
    """)
    rows = cursor.fetchall()
    cursor.close()
    return rows

def filter_prototypes_by_answers(con_db, root_frame_id, answers):
    """Вернуть список прототипов, совместимых с ответами"""
    all_prototypes = get_all_prototypes(con_db, root_frame_id)
    compatible = []

    for fid, fname in all_prototypes:
        # Получить слоты и значения этого прототипа
        proto_slots = get_frame_slots_values(con_db, fid)
        match = True
        for slot_id, _, value_id, _ in proto_slots:
            key = (slot_id, value_id)
            if key in answers:
                if answers[key] == 0:  # пользователь сказал "Нет"
                    match = False
                    break
        # Также проверяем: если пользователь сказал "Да" на значение,
        # которого нет в прототипе — он не подходит
        for (s_id, v_id), ans in answers.items():
            if ans == 1:
                found = any(s == s_id and v == v_id for s, _, v, _ in proto_slots)
                if not found:
                    match = False
                    break

        if match:
            compatible.append((fid, fname))

    return compatible

def find_best_prototype_by_yes_answers(con_db, root_frame_id, answers):
    """
    Найти прототип, который:
    - достижим от root_frame_id,
    - содержит ВСЕ значения, по которым был дан ответ "Да".
    Возвращает (Frame_ID, Frame_Name) или None.
    """
    # Получаем все прототипы
    all_prototypes = get_all_prototypes(con_db, root_frame_id)
    
    yes_answers = {k: v for k, v in answers.items() if v == 1}
    
    for fid, fname in all_prototypes:
        proto_slots = get_frame_slots_values(con_db, fid)
        proto_set = {(s_id, v_id) for s_id, _, v_id, _ in proto_slots}
        
        # Проверяем, содержит ли прототип ВСЕ "Да"-значения
        if all(key in proto_set for key in yes_answers.keys()):
            return (fid, fname)
    
    return None

def save_generated_tp_to_db(con_db, user_id):
    """Сохраняет сгенерированный ТП в основные таблицы, используя Operation_Name из EXPERT_PROCESS_OPERATIONS"""
    cursor = con_db.cursor()
    # Создаём заголовок ТП
    pid_var = cursor.var(cx_Oracle.NUMBER)
    cursor.execute("""
        INSERT INTO TCHG_PROCESS (Process_ID, Process_Note)
        VALUES (S_TCHG_PROCESS.NEXTVAL, 'Сгенерирован ЭС')
        RETURNING Process_ID INTO :pid
    """, pid=pid_var)
    process_id = int(pid_var.getvalue()[0])

    # Получаем операции с кастомными названиями
    operations = generate_tp_operations(con_db, user_id)
    for op_name, op_id, op_time, tool_id in operations:
        cursor.execute("""
            INSERT INTO TCHG_PROCESS_OPERATION (
                Process_Operation_ID, Process_ID, GOST_Operation_ID,
                Operation_About, Operation_Time, Operation_Tools_ID
            ) VALUES (
                S_TCHG_PROCESS_OPERATION.NEXTVAL, :process_id, :op_id,
                :op_name, :op_time, :tool_id
            )
        """, {
            'process_id': process_id,
            'op_id': op_id,
            'op_name': op_name,
            'op_time': op_time,
            'tool_id': tool_id
        })
    con_db.commit()
    cursor.close()
    return process_id

def expert_create_tp():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    role = func.get_role(request.cookies.get('auth_login'))
    if role not in ['technologist', 'admin']:
        return redirect('/')
    
    user_id = session.get('expert_user_id')
    if not user_id:
        return redirect('/tech-processes')

    # Получаем пользовательское описание или используем значение по умолчанию
    process_note = request.form.get('process_note', '').strip()
    if not process_note:
        process_note = 'Сгенерирован ЭС'

    con_db = func.connect_to_db('technologist')
    cursor = con_db.cursor()

    # Создаём заголовок ТП
    pid_var = cursor.var(cx_Oracle.NUMBER)
    cursor.execute("""
        INSERT INTO TCHG_PROCESS (Process_ID, Process_Note)
        VALUES (S_TCHG_PROCESS.NEXTVAL, :note)
        RETURNING Process_ID INTO :pid
    """, note=process_note, pid=pid_var)
    process_id = int(pid_var.getvalue()[0])

    # Получаем ID решений из сессии
    solution_frame_ids = [fid for fid, name in session.get('expert_root_frames', [])]

    if solution_frame_ids:
        # Заново получаем операции с Tool_ID (число!) — НЕ с Tool_Name!
        operations = get_operations_by_frame_ids(con_db, solution_frame_ids)
        for op_name, op_id, op_time, tool_id in operations:
            # tool_id здесь — число (Tool_ID), как и требуется для Operation_Tools_ID
            cursor.execute("""
                INSERT INTO TCHG_PROCESS_OPERATION (
                    Process_Operation_ID, Process_ID, GOST_Operation_ID,
                    Operation_About, Operation_Time, Operation_Tools_ID
                ) VALUES (
                    S_TCHG_PROCESS_OPERATION.NEXTVAL, :process_id, :op_id,
                    :op_name, :op_time, :tool_id
                )
            """, {
                'process_id': process_id,
                'op_id': op_id,
                'op_name': op_name,
                'op_time': op_time,
                'tool_id': tool_id  # ← это число, не строка!
            })

    con_db.commit()
    cursor.close()
    con_db.close()

    # Очистка сессии
    session.pop('expert_frame_index', None)
    session.pop('expert_root_frames', None)
    session.pop('expert_user_id', None)
    session.pop('current_prototype_id', None)
    session.pop('slot_idx', None)

    return redirect(f'/process/{process_id}')

def get_operations_for_preview(con_db, frame_ids):
    """Возвращает операции с Tool_Name — для отображения в tp_preview.html"""
    cursor = con_db.cursor()
    operations = []
    for fid in frame_ids:
        cursor.execute("""
            SELECT e.Operation_Name, e.Operation_ID, e.Op_Duration, t.Tool_Name
            FROM EXPERT_PROCESS_OPERATIONS e
            LEFT JOIN TCHG_TOOLS t ON e.Tool_ID = t.Tool_ID
            WHERE e.Frame_ID = :1
            ORDER BY e.Op_Order
        """, (fid,))
        ops = cursor.fetchall()
        operations.extend(ops)
    cursor.close()
    return operations  # op[3] = Tool_Name (строка)
