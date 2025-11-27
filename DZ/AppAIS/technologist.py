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
import re

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
    cursor = con_db.cursor()
    cursor.execute('SELECT Process_Operation_ID FROM TCHG_PROCESS_OPERATION WHERE Process_ID = :id ORDER BY Process_Operation_ID', {'id': id})
    operations = cursor.fetchall()
    if len(operations) == 0:
        cursor.close()
        con_db.close()
        return redirect('/process/' + str(id))
    pdf = FPDF()
    pdf.add_page()
    # Попытка подключить DejaVu (для поддержки кириллицы)
    try:
        pdf.add_font('DejaVu', '', '/usr/share/fonts/dejavu-serif-fonts/DejaVuSerif.ttf')
        pdf.set_font('DejaVu', size=10)
    except Exception:
        pdf.set_font('helvetica', size=10)
    if pdf.font_size <= 0:
        pdf.set_font_size(10)
    line_h = pdf.font_size * 1.5
    if line_h <= 0:
        line_h = 6  # fallback минимальной высоты строки
    margin_lr = 10
    usable_w = pdf.w - 2 * margin_lr
    cw_num = int(usable_w * 0.15)   # №
    cw_op  = int(usable_w * 0.35)   # Операция
    cw_eq  = int(usable_w * 0.35)   # Оборудование
    cw_t   = int(usable_w * 0.15)   # Время
    col_widths = [cw_num, cw_op, cw_eq, cw_t]
    margin_top = 20
    margin_bottom = 20
    header = ["Номер", "Операция", "Оборудование", "Время, с"]
    rows = []
    i = 5
    for op_id, in operations:
        cursor.execute('''
            SELECT Operation_About, Operation_Tools_ID, Operation_Time
            FROM TCHG_PROCESS_OPERATION
            WHERE Process_Operation_ID = :op_id
        ''', {'op_id': op_id})
        op_about, tool_id, op_time = cursor.fetchone()
        tool_name = ""
        if tool_id:
            cursor.execute('SELECT Tool_Name FROM TCHG_TOOLS WHERE Tool_ID = :tool_id', {'tool_id': tool_id})
            res = cursor.fetchone()
            tool_name = res[0] if res else ""
        op_about_clean = str(op_about or "").replace('<br>', '\n').replace('<br/>', '\n').replace('<br />', '\n')
        tool_clean     = str(tool_name or "").replace('<br>', '\n').replace('<br/>', '\n').replace('<br />', '\n')
        time_clean     = str(op_time or "0")
        rows.append([str(i), op_about_clean.strip(), tool_clean.strip(), time_clean])
        i += 5
    cursor.close()
    con_db.close()
    pdf.set_auto_page_break(auto=False)
    y = margin_top
    x = margin_lr
    pdf.set_y(y)
    for idx, txt in enumerate(header):
        pdf.set_xy(x, y)
        pdf.multi_cell(col_widths[idx], line_h, txt, border=1, align='C', max_line_height=line_h)
        x += col_widths[idx]
    y += line_h
    for num, op, eq, tm in rows:

        def estimate_cell_height(text, w, h):
            temp_pdf = FPDF()
            temp_pdf.add_page()
            try:
                temp_pdf.add_font('DejaVu', '', '/usr/share/fonts/dejavu-serif-fonts/DejaVuSerif.ttf')
                temp_pdf.set_font('DejaVu', size=pdf.font_size)
            except Exception:
                temp_pdf.set_font('helvetica', size=pdf.font_size)
            return temp_pdf.get_string_width(text) // w * h + h if temp_pdf.get_string_width(text) > w else h

        def count_lines(text, w_mm):
            if not text:
                return 1
            lines = text.split('\n')
            total = 0
            for line in lines:
                line = line.strip()
                if not line:
                    total += 1
                    continue
                text_w = pdf.get_string_width(line)
                if text_w <= w_mm:
                    total += 1
                else:
                    needed = int(text_w / w_mm) + 1
                    total += needed
            return total

        ln1 = count_lines(num, col_widths[0] * 0.9)
        ln2 = count_lines(op,  col_widths[1] * 0.9)
        ln3 = count_lines(eq,  col_widths[2] * 0.9)
        ln4 = count_lines(tm,  col_widths[3] * 0.9)
        max_lines = max(ln1, ln2, ln3, ln4)

        row_h = max_lines * line_h

        if y + row_h > pdf.h - margin_bottom:
            pdf.add_page()
            y = margin_top
            # Повтор шапки
            x = margin_lr
            pdf.set_y(y)
            for idx, txt in enumerate(header):
                pdf.set_xy(x, y)
                pdf.multi_cell(col_widths[idx], line_h, txt, border=1, align='C', max_line_height=line_h)
                x += col_widths[idx]
            y += line_h
        x0 = margin_lr
        pdf.set_xy(x0, y)
        pdf.multi_cell(col_widths[0], line_h * (max_lines / ln1), num, border=1, align='C', max_line_height=line_h)
        pdf.set_xy(x0 + col_widths[0], y)
        pdf.multi_cell(col_widths[1], line_h * (max_lines / ln2), op, border=1, max_line_height=line_h)
        pdf.set_xy(x0 + col_widths[0] + col_widths[1], y)
        pdf.multi_cell(col_widths[2], line_h * (max_lines / ln3), eq, border=1, max_line_height=line_h)
        pdf.set_xy(x0 + col_widths[0] + col_widths[1] + col_widths[2], y)
        pdf.multi_cell(col_widths[3], line_h * (max_lines / ln4), tm, border=1, align='C', max_line_height=line_h)
        y += row_h
    # === Возврат PDF ===
    pdf_data = pdf.output()
    if isinstance(pdf_data, str):
        pdf_data = pdf_data.encode('latin1')
    elif isinstance(pdf_data, bytearray):
        pdf_data = bytes(pdf_data)
    response = make_response(pdf_data)
    response.headers['Content-Type'] = 'application/pdf'
    response.headers['Content-Disposition'] = f'inline; filename=mcard_{id}.pdf'
    return response

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
        return redirect('/login')
    role = func.get_role(request.cookies.get('auth_login'))
    if role not in ['technologist', 'admin']:
        return redirect('/')
    
    user_id = session.get('expert_user_id')
    if not user_id:
        return redirect('/tech-processes')
    
    con_db = func.connect_to_db('technologist')
    
    root_frames = session.get('expert_root_frames', [])
    frame_index = session.get('expert_frame_index', 0)

    if frame_index >= len(root_frames):
        solution_frame_ids = [fid for fid, name in root_frames]
        operations = get_operations_for_preview(con_db, solution_frame_ids)  # ← только для отображения!
        con_db.close()
        return render_template("technologist/tp_preview.html", operations=operations, role=role)

    current_root_id, current_root_name = root_frames[frame_index]

    if 'current_prototype_id' not in session:
        first_proto_id = find_first_prototype(con_db, current_root_id)
        if not first_proto_id:
            session['expert_frame_index'] = frame_index + 1
            con_db.close()
            return redirect('/expert/dialog')
        session['current_prototype_id'] = first_proto_id
        session['slot_idx'] = 0

    current_proto_id = session['current_prototype_id']
    slot_idx = session['slot_idx']

    proto_slots = get_frame_slots_values(con_db, current_proto_id)

    if not proto_slots:
        root_frames[frame_index] = (current_proto_id, "Решение")
        session['expert_root_frames'] = root_frames
        session['expert_frame_index'] = frame_index + 1
        session.pop('current_prototype_id', None)
        session.pop('slot_idx', None)
        con_db.close()
        return redirect('/expert/dialog')

    if slot_idx >= len(proto_slots):
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
            root_frames[frame_index] = (solution_fid, "Решение")
        else:
            root_frames[frame_index] = (current_proto_id, "Решение (неоднозначно)")
        session['expert_root_frames'] = root_frames
        session['expert_frame_index'] = frame_index + 1
        session.pop('current_prototype_id', None)
        session.pop('slot_idx', None)
        con_db.close()
        return redirect('/expert/dialog')

    slot_id, slot_name, value_id, value_name = proto_slots[slot_idx]

    if request.method == 'POST':
        answer_str = request.form.get('answer', 'unknown')
        answer_val = 1 if answer_str == 'yes' else 0

        # Сохраняем ответ в сессии БД
        save_answer(con_db, user_id, current_root_id, slot_id, value_id, answer_val)

        if answer_val == 1:
            session['slot_idx'] = slot_idx + 1
        else:
            answers = get_session_answers(con_db, user_id, current_root_id)
            compatible_prototypes = filter_prototypes_by_answers(con_db, current_root_id, answers)
            compatible_prototypes = [p for p in compatible_prototypes if p[0] != current_proto_id]

            if compatible_prototypes:
                session['current_prototype_id'] = compatible_prototypes[0][0]
            else:
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
