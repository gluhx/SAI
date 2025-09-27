# admin.py
from flask import render_template, request, redirect
import cx_Oracle
import function as func

def get_table_columns_and_data(con_db, table_name):
    cursor = con_db.cursor()
    cursor.execute(f"SELECT * FROM {table_name} WHERE 1=0")
    columns = [col[0] for col in cursor.description]
    cursor.execute(f"SELECT * FROM {table_name}")
    rows = cursor.fetchall()
    cursor.close()
    return columns, rows

def admin_tables():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    if func.get_role(request.cookies.get('auth_login')) != 'admin':
        return redirect('/')
    
    table_name = request.args.get('table', 'AUTH_USERS')
    allowed_tables = [
        'AUTH_USERS', 'ENG_DEVICE', 'ENG_COMPONENT', 'ENG_COMPONENT_LIB',
        'ENG_COMPONENT_CLASS', 'TCHG_PROCESS', 'TCHG_PROCESS_OPERATION',
        'TCHG_OPERATION_LIST', 'TCHG_OPERATION_GROUP', 'TCHG_TOOLS',
        'COM_TP_DEV', 'DIR_TASKS', 'ENG_HELP_GOSTS'
    ]
    if table_name not in allowed_tables:
        table_name = 'AUTH_USERS'

    con_db = func.connect_to_db('admin')
    try:
        columns, rows = get_table_columns_and_data(con_db, table_name)
        error_message = None
    except Exception as e:
        error_message = str(e).replace('\n', ' ').replace('\r', ' ').replace('\t', ' ')
        columns, rows = [], []
    finally:
        con_db.close()

    return render_template("admin/admin_tables.html",
                           table_name=table_name,
                           columns=columns,
                           rows=rows,
                           pk_index=0,
                           pk_column=columns[0] if columns else '',
                           error_message=error_message)

def delete_row(table_name):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'admin':
        return redirect('/')
    pk_value = request.form.get('pk')
    if not pk_value:
        return redirect('/')

    con_db = func.connect_to_db('admin')
    cursor = con_db.cursor()
    try:
        cursor.execute(f"SELECT * FROM {table_name} WHERE 1=0")
        pk_col = cursor.description[0][0]
        
        # Проверка на дочерние записи (если есть FK)
        if table_name == 'ENG_COMPONENT_LIB':
            cursor.execute("""
                SELECT COUNT(*) FROM ENG_COMPONENT 
                WHERE Component_ID_in_Lib = :1
            """, (pk_value,))
            child_count = cursor.fetchone()[0]
            if child_count > 0:
                raise Exception("Нельзя удалить запись: есть зависимые компоненты в таблице ENG_COMPONENT.")

        cursor.execute(f"DELETE FROM {table_name} WHERE {pk_col} = :1", (pk_value,))
        con_db.commit()
        error_message = None
    except Exception as e:
        error_message = str(e).replace('\n', ' ').replace('\r', ' ').replace('\t', ' ')
    finally:
        cursor.close()
        con_db.close()

    if error_message:
        return render_template("admin/admin_tables.html",
                               table_name=table_name,
                               columns=[], rows=[],
                               pk_index=0,
                               pk_column='',
                               error_message=error_message)
    else:
        return redirect('/admin-tables?table=' + table_name)

def insert_row(table_name):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'admin':
        return redirect('/')
    
    con_db = func.connect_to_db('admin')
    cursor = con_db.cursor()
    try:
        cursor.execute(f"SELECT * FROM {table_name} WHERE 1=0")
        columns = [col[0] for col in cursor.description]
        
        # Исключаем первый столбец (PK)
        data_columns = columns[1:]
        values = [request.form.get(col) or '' for col in data_columns]
        
        # Формируем запрос: INSERT INTO table (col2, col3, ...) VALUES (:1, :2, ...)
        placeholders = ', '.join([f':{i+1}' for i in range(len(data_columns))])
        query = f"INSERT INTO {table_name} ({', '.join(data_columns)}) VALUES ({placeholders})"
        
        seq_name = f"S_{table_name}"
        all_placeholders = [f"{seq_name}.NEXTVAL"] + [f':{i+1}' for i in range(len(data_columns))]
        query = f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({', '.join(all_placeholders)})"
        
        cursor.execute(query, values)
        con_db.commit()
        error_message = None

    except Exception as e:
        error_message = str(e).replace('\n', ' ').replace('\r', ' ').replace('\t', ' ')
        if "cannot insert NULL into" in error_message:
            start = error_message.find('"') + 1
            end = error_message.find('"', start)
            if start != -1 and end != -1:
                column_name = error_message[start:end].split('.')[-1]
                error_message = f"Нельзя вставить NULL в столбец '{column_name}'. Пожалуйста, заполните это поле."
    finally:
        cursor.close()
        con_db.close()

    if error_message:
        return render_template("admin/admin_tables.html",
                               table_name=table_name,
                               columns=[], rows=[],
                               pk_index=0,
                               pk_column='',
                               error_message=error_message)
    else:
        return redirect('/admin-tables?table=' + table_name)

def update_row(table_name):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'admin':
        return redirect('/')
    
    con_db = func.connect_to_db('admin')
    cursor = con_db.cursor()
    try:
        cursor.execute(f"SELECT * FROM {table_name} WHERE 1=0")
        columns = [col[0] for col in cursor.description]
        pk_col = columns[0]
        pk_value = request.form.get('pk')
        
        # Обновляем все поля, кроме PK
        update_columns = columns[1:]  # Пропускаем первый столбец (PK)
        set_clause = ', '.join([f"{col} = :{i+1}" for i, col in enumerate(update_columns)])
        values = [request.form.get(col) for col in update_columns] + [pk_value]
        query = f"UPDATE {table_name} SET {set_clause} WHERE {pk_col} = :{len(update_columns)+1}"
        cursor.execute(query, values)
        con_db.commit()
        error_message = None
    except Exception as e:
        error_message = str(e).replace('\n', ' ').replace('\r', ' ').replace('\t', ' ')
        # Попробуем выделить сообщение об ошибке "cannot insert NULL into"
        if "cannot insert NULL into" in error_message:
            # Выделяем имя столбца из ошибки
            start = error_message.find('"') + 1
            end = error_message.find('"', start)
            if start != -1 and end != -1:
                column_name = error_message[start:end].split('.')[-1]
                error_message = f"Нельзя вставить NULL в столбец '{column_name}'. Пожалуйста, заполните это поле."
    finally:
        cursor.close()
        con_db.close()

    if error_message:
        return render_template("admin/admin_tables.html",
                               table_name=table_name,
                               columns=[], rows=[],
                               pk_index=0,
                               pk_column='',
                               error_message=error_message)
    else:
        return redirect('/admin-tables?table=' + table_name)

# Новая функция — показ формы редактирования
def edit_form(table_name, pk_value):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'admin':
        return redirect('/')
    
    con_db = func.connect_to_db('admin')
    cursor = con_db.cursor()
    try:
        cursor.execute(f"SELECT * FROM {table_name} WHERE 1=0")
        columns = [col[0] for col in cursor.description]
        
        cursor.execute(f"SELECT * FROM {table_name} WHERE {columns[0]} = :1", (pk_value,))
        row = cursor.fetchone()
        if not row:
            return redirect('/admin-tables?table=' + table_name)
        
        # Преобразуем строку в словарь для удобства
        row_dict = {}
        for i, col in enumerate(columns):
            row_dict[col] = row[i]
        
        error_message = None
    except Exception as e:
        error_message = str(e).replace('\n', ' ').replace('\r', ' ').replace('\t', ' ')
        row_dict = {}
        columns = []
    finally:
        cursor.close()
        con_db.close()

    return render_template("admin/edit_form.html",
                           table_name=table_name,
                           columns=columns,
                           row=row_dict,
                           pk_index=0,
                           pk_column=columns[0] if columns else '',
                           pk_value=pk_value,
                           error_message=error_message)

# Новая функция — обработка формы редактирования
def handle_edit(table_name, pk_value):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'admin':
        return redirect('/')
    
    con_db = func.connect_to_db('admin')
    cursor = con_db.cursor()
    try:
        cursor.execute(f"SELECT * FROM {table_name} WHERE 1=0")
        columns = [col[0] for col in cursor.description]
        pk_col = columns[0]
        
        # Обновляем все поля, кроме PK
        update_columns = columns[1:]  # Пропускаем первый столбец (PK)
        set_clause = ', '.join([f"{col} = :{i+1}" for i, col in enumerate(update_columns)])
        values = [request.form.get(col) for col in update_columns] + [pk_value]
        query = f"UPDATE {table_name} SET {set_clause} WHERE {pk_col} = :{len(update_columns)+1}"
        cursor.execute(query, values)
        con_db.commit()
        error_message = None
    except Exception as e:
        error_message = str(e).replace('\n', ' ').replace('\r', ' ').replace('\t', ' ')
        # Попробуем выделить сообщение об ошибке "cannot insert NULL into"
        if "cannot insert NULL into" in error_message:
            # Выделяем имя столбца из ошибки
            start = error_message.find('"') + 1
            end = error_message.find('"', start)
            if start != -1 and end != -1:
                column_name = error_message[start:end].split('.')[-1]
                error_message = f"Нельзя вставить NULL в столбец '{column_name}'. Пожалуйста, заполните это поле."
    finally:
        cursor.close()
        con_db.close()

    if error_message:
        return render_template("admin/edit_form.html",
                               table_name=table_name,
                               columns=[], row={},
                               pk_index=0,
                               pk_column='',
                               pk_value=pk_value,
                               error_message=error_message)
    else:
        return redirect('/admin-tables?table=' + table_name)
