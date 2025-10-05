###########################################
######### Подключение библиотек ###########
###########################################
from flask import render_template, request, redirect, jsonify
import cx_Oracle
import function as func

def get_slots_with_values(con_db):
    cursor = con_db.cursor()
    cursor.execute("SELECT Slot_ID, Slot_Name, Slot_Desc FROM EXPERT_SLOTS ORDER BY Slot_Name")
    slots = cursor.fetchall()
    result = []
    for slot in slots:
        cursor.execute("SELECT Slot_Value_ID, Value_Name FROM EXPERT_SLOT_VALUES WHERE Slot_ID = :1 ORDER BY Value_Name", (slot[0],))
        values = [[row[0], row[1]] for row in cursor.fetchall()]
        result.append({
            'id': slot[0],
            'name': slot[1],
            'desc': slot[2] or '',
            'values': values
        })
    cursor.close()
    return result

def get_frames_tree(con_db):
    cursor = con_db.cursor()
    cursor.execute("SELECT Frame_ID, Frame_Name, Parent_Frame_ID, Is_Prototype FROM EXPERT_FRAMES ORDER BY Frame_Name")
    rows = cursor.fetchall()
    cursor.close()
    frames = {r[0]: {'id': r[0], 'name': r[1], 'parent': r[2], 'is_prototype': r[3], 'children': []} for r in rows}
    roots = []
    for fid, frame in frames.items():
        if frame['parent'] is None:
            roots.append(frame)
        else:
            if frame['parent'] in frames:
                frames[frame['parent']]['children'].append(frame)
    return roots

def get_all_frames(con_db):
    cursor = con_db.cursor()
    cursor.execute("SELECT Frame_ID, Frame_Name FROM EXPERT_FRAMES ORDER BY Frame_Name")
    frames = cursor.fetchall()
    cursor.close()
    return frames

def get_prototype_frames(con_db):
    cursor = con_db.cursor()
    cursor.execute("SELECT Frame_ID, Frame_Name FROM EXPERT_FRAMES WHERE Is_Prototype = 1 ORDER BY Frame_Name")
    frames = cursor.fetchall()
    cursor.close()
    return frames

def get_frame_slots(con_db, frame_id):
    cursor = con_db.cursor()
    cursor.execute("""
        SELECT s.Slot_Name, sv.Value_Name
        FROM EXPERT_FRAME_VALUES fv
        JOIN EXPERT_SLOT_VALUES sv ON fv.Slot_Value_ID = sv.Slot_Value_ID
        JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID
        WHERE fv.Frame_ID = :1
        ORDER BY s.Slot_Name, sv.Value_Name
    """, (frame_id,))
    data = {}
    for row in cursor.fetchall():
        if row[0] not in data:
            data[row[0]] = []
        data[row[0]].append(row[1])
    cursor.close()
    return data

def get_all_slots(con_db):
    cursor = con_db.cursor()
    cursor.execute("SELECT Slot_ID, Slot_Name FROM EXPERT_SLOTS ORDER BY Slot_Name")
    slots = cursor.fetchall()
    cursor.close()
    return slots

def get_slot_values(con_db, slot_id):
    cursor = con_db.cursor()
    cursor.execute("SELECT Slot_Value_ID, Value_Name FROM EXPERT_SLOT_VALUES WHERE Slot_ID = :1 ORDER BY Value_Name", (slot_id,))
    values = cursor.fetchall()
    cursor.close()
    return values

def check_expert_access():
    if request.cookies.get('auth_status') != 'True':
        return redirect('/login')
    role = func.get_role(request.cookies.get('auth_login'))
    if role not in ['expert', 'admin']:
        return redirect('/')
    return None

def slots_page():
    redirect_result = check_expert_access()
    if redirect_result:
        return redirect_result
    role = func.get_role(request.cookies.get('auth_login'))
    con_db = func.connect_to_db('expert')
    slots = get_slots_with_values(con_db)
    edit_slot = request.args.get('edit_slot')
    edit_slot_data = None
    if edit_slot:
        for s in slots:
            if str(s['id']) == edit_slot:
                edit_slot_data = s
                break
    con_db.close()
    return render_template("expert/slots.html", slots=slots, role=role, edit_slot=edit_slot_data)

def add_slot():
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    name = request.form.get('name', '').strip()
    desc = request.form.get('desc', '').strip()
    if not name:
        return redirect('/expert/slots')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc) VALUES (S_EXPERT_SLOTS.NEXTVAL, :1, :2)", (name, desc))
        con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect('/expert/slots')

def update_slot(slot_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    name = request.form.get('name', '').strip()
    desc = request.form.get('desc', '').strip()
    if not name:
        return redirect('/expert/slots')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("UPDATE EXPERT_SLOTS SET Slot_Name = :1, Slot_Desc = :2 WHERE Slot_ID = :3", (name, desc, slot_id))
        con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect('/expert/slots')

def delete_slot(slot_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("DELETE FROM EXPERT_SLOT_VALUES WHERE Slot_ID = :1", (slot_id,))
        cursor.execute("DELETE FROM EXPERT_SLOTS WHERE Slot_ID = :1", (slot_id,))
        con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect('/expert/slots')

def add_slot_value(slot_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    value = request.form.get('value', '').strip()
    if not value:
        return redirect(f'/expert/slots')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name) VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL, :1, :2)", (slot_id, value))
        con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect('/expert/slots')

def delete_slot_value(value_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("DELETE FROM EXPERT_SLOT_VALUES WHERE Slot_Value_ID = :1", (value_id,))
        con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect('/expert/slots')

# Frames
def frames_page():
    redirect_result = check_expert_access()
    if redirect_result:
        return redirect_result
    role = func.get_role(request.cookies.get('auth_login'))
    con_db = func.connect_to_db('expert')
    frames = get_frames_tree(con_db)
    all_frames = get_all_frames(con_db)
    edit_frame = request.args.get('edit_frame')
    edit_frame_data = None
    if edit_frame:
        cursor = con_db.cursor()
        cursor.execute("SELECT Frame_ID, Frame_Name, Parent_Frame_ID, Is_Prototype FROM EXPERT_FRAMES WHERE Frame_ID = :1", (edit_frame,))
        row = cursor.fetchone()
        if row:
            edit_frame_data = {
                'id': row[0],
                'name': row[1],
                'parent': row[2],
                'is_prototype': row[3]
            }
        cursor.close()
    con_db.close()
    return render_template("expert/frames.html", frames=frames, all_frames=all_frames, role=role, edit_frame=edit_frame_data)

def add_frame():
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    name = request.form.get('name', '').strip()
    parent_id = request.form.get('parent_id') or None
    is_proto = 1 if request.form.get('is_prototype') == '1' else 0
    if not name:
        return redirect('/expert/frames')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        if parent_id == 'null' or parent_id == '':
            parent_id = None
        cursor.execute("""
            INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Is_Prototype)
            VALUES (S_EXPERT_FRAMES.NEXTVAL, :1, :2, :3)
        """, (name, parent_id, is_proto))
        con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect('/expert/frames')

def update_frame(frame_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    name = request.form.get('name', '').strip()
    parent_id = request.form.get('parent_id') or None
    is_proto = 1 if request.form.get('is_prototype') == '1' else 0
    if not name:
        return redirect('/expert/frames')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        if parent_id == 'null' or parent_id == '':
            parent_id = None
        cursor.execute("""
            UPDATE EXPERT_FRAMES
            SET Frame_Name = :1, Parent_Frame_ID = :2, Is_Prototype = :3
            WHERE Frame_ID = :4
        """, (name, parent_id, is_proto, frame_id))
        con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect('/expert/frames')

def delete_frame(frame_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("""
            DELETE FROM EXPERT_FRAME_VALUES
            WHERE Frame_ID IN (
                SELECT Frame_ID
                FROM EXPERT_FRAMES
                START WITH Frame_ID = :root_id
                CONNECT BY PRIOR Frame_ID = Parent_Frame_ID
            )
        """, root_id=frame_id)

        cursor.execute("""
            DELETE FROM EXPERT_FRAMES
            WHERE Frame_ID IN (
                SELECT Frame_ID
                FROM EXPERT_FRAMES
                START WITH Frame_ID = :root_id
                CONNECT BY PRIOR Frame_ID = Parent_Frame_ID
            )
        """, root_id=frame_id)

        con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect('/expert/frames')

def frame_slots_page():
    redirect_result = check_expert_access()
    if redirect_result:
        return redirect_result
    role = func.get_role(request.cookies.get('auth_login'))
    con_db = func.connect_to_db('expert')
    frames = get_prototype_frames(con_db)
    selected_frame = request.args.get('frame')
    
    frame_data = None
    all_slots = []
    assigned_slots = []
    frame_name = ""
    operations = []
    groups = []
    group_operations = []
    selected_group = None
    tools = []

    if selected_frame:
        # --- Слоты ---
        cursor = con_db.cursor()
        cursor.execute("SELECT Frame_Name FROM EXPERT_FRAMES WHERE Frame_ID = :1", (selected_frame,))
        row = cursor.fetchone()
        if row:
            frame_name = row[0]
        cursor.close()

        all_slots = get_all_slots(con_db)
        cursor = con_db.cursor()
        cursor.execute("""
            SELECT DISTINCT s.Slot_ID
            FROM EXPERT_FRAME_VALUES fv
            JOIN EXPERT_SLOT_VALUES sv ON fv.Slot_Value_ID = sv.Slot_Value_ID
            JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID
            WHERE fv.Frame_ID = :1
        """, (selected_frame,))
        assigned_slot_ids = {str(row[0]) for row in cursor.fetchall()}
        cursor.close()
        all_slots = [(sid, sname) for (sid, sname) in all_slots if str(sid) not in assigned_slot_ids]

        cursor = con_db.cursor()
        cursor.execute("""
            SELECT fv.Frame_Value_ID, s.Slot_Name, sv.Value_Name
            FROM EXPERT_FRAME_VALUES fv
            JOIN EXPERT_SLOT_VALUES sv ON fv.Slot_Value_ID = sv.Slot_Value_ID
            JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID
            WHERE fv.Frame_ID = :1
            ORDER BY s.Slot_Name
        """, (selected_frame,))
        assigned_slots = [
            {'frame_value_id': r[0], 'slot_name': r[1], 'value_name': r[2]}
            for r in cursor.fetchall()
        ]
        cursor.close()

        frame_data = {'id': selected_frame, 'assigned_slots': assigned_slots, 'name': frame_name}

        # --- Операции ---
        groups = get_operation_groups(con_db)
        tools = get_all_tools(con_db)

        selected_group = request.args.get('group') or (str(groups[0][0]) if groups else None)
        selected_group = int(selected_group) if selected_group else None
        group_operations = get_operations_by_group(con_db, selected_group) if selected_group else []

        cursor = con_db.cursor()
        cursor.execute("""
            SELECT po.Process_Op_ID, ol.Operation_Name, t.Tool_Name, po.Op_Order,
                   og.Group_Number, ol.Operation_Number
            FROM EXPERT_PROCESS_OPERATIONS po
            JOIN TCHG_OPERATION_LIST ol ON po.Operation_ID = ol.Operation_ID
            LEFT JOIN TCHG_TOOLS t ON po.Tool_ID = t.Tool_ID
            JOIN TCHG_OPERATION_GROUP og ON ol.Operation_Group_ID = og.Group_ID
            WHERE po.Frame_ID = :1
            ORDER BY po.Op_Order
        """, (selected_frame,))
        operations = [
            {
                'id': r[0],
                'name': r[1],
                'tool': r[2],
                'order': r[3],
                'group_number': r[4],
                'operation_number': r[5]
            }
            for r in cursor.fetchall()
        ]
        cursor.close()

    con_db.close()
    return render_template(
        "expert/frame_slots.html",
        frames=frames,
        selected_frame=selected_frame,
        frame_data=frame_data,
        all_slots=all_slots,
        operations=operations,
        groups=groups,
        group_operations=group_operations,
        selected_group=selected_group,
        tools=tools,
        role=role
    )
def add_frame_slot(frame_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    slot_id = request.form.get('slot_id')
    value_id = request.form.get('value_id')
    if not slot_id or not value_id:
        return redirect(f'/expert/frame-slots-ops?frame={frame_id}')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("""
            SELECT 1 FROM EXPERT_FRAME_VALUES fv
            JOIN EXPERT_SLOT_VALUES sv ON fv.Slot_Value_ID = sv.Slot_Value_ID
            WHERE fv.Frame_ID = :frame_id AND sv.Slot_ID = :slot_id
        """, frame_id=frame_id, slot_id=slot_id)
        if not cursor.fetchone():
            cursor.execute("""
                INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
                VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL, :1, :2)
            """, (frame_id, value_id))
            con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect(f'/expert/frame-slots-ops?frame={frame_id}')

def delete_frame_slot(frame_value_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    frame_id = request.args.get('frame_id')
    if not frame_id:
        return redirect('/expert/frame-slots-ops')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("DELETE FROM EXPERT_FRAME_VALUES WHERE Frame_Value_ID = :1", (frame_value_id,))
        con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect(f'/expert/frame-slots-ops?frame={frame_id}')

def get_slot_values_json(slot_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return jsonify([]), 403
    con_db = func.connect_to_db('expert')
    values = get_slot_values(con_db, slot_id)
    con_db.close()
    return jsonify([{'id': v[0], 'name': v[1]} for v in values])

# === Операции (вспомогательные функции) ===
def get_operation_groups(con_db):
    cursor = con_db.cursor()
    cursor.execute("SELECT Group_ID, Group_Name, Group_Number FROM TCHG_OPERATION_GROUP ORDER BY Group_Number")
    groups = cursor.fetchall()
    cursor.close()
    return groups

def get_operations_by_group(con_db, group_id):
    cursor = con_db.cursor()
    cursor.execute("""
        SELECT Operation_ID, Operation_Number, Operation_Name
        FROM TCHG_OPERATION_LIST
        WHERE Operation_Group_ID = :1
        ORDER BY Operation_Number
    """, (group_id,))
    ops = cursor.fetchall()
    cursor.close()
    return ops

def get_all_tools(con_db):
    cursor = con_db.cursor()
    cursor.execute("SELECT Tool_ID, Tool_Name FROM TCHG_TOOLS ORDER BY Tool_Name")
    tools = cursor.fetchall()
    cursor.close()
    return tools

# === Управление операциями ===
def add_frame_operation(frame_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    op_id = request.form.get('operation_id')
    tool_id = request.form.get('tool_id') or None  # может быть None
    duration = 0  # всегда 0

    if not op_id:
        return redirect(f'/expert/frame-slots-ops?frame={frame_id}')
    
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("SELECT NVL(MAX(Op_Order), 0) FROM EXPERT_PROCESS_OPERATIONS WHERE Frame_ID = :1", (frame_id,))
        max_order = cursor.fetchone()[0]
        new_order = max_order + 10
        
        cursor.execute("""
            INSERT INTO EXPERT_PROCESS_OPERATIONS 
            (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
            VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, :1, :2, :3, :4, :5)
        """, (frame_id, op_id, new_order, duration, tool_id))
        con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect(f'/expert/frame-slots-ops?frame={frame_id}')

def delete_frame_operation(op_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("SELECT Frame_ID FROM EXPERT_PROCESS_OPERATIONS WHERE Process_Op_ID = :1", (op_id,))
        row = cursor.fetchone()
        if not row:
            con_db.close()
            return redirect('/expert/frames')
        frame_id = row[0]
        cursor.execute("DELETE FROM EXPERT_PROCESS_OPERATIONS WHERE Process_Op_ID = :1", (op_id,))
        con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect(f'/expert/frame-slots-ops?frame={frame_id}')

def move_operation_up(op_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("SELECT Frame_ID, Op_Order FROM EXPERT_PROCESS_OPERATIONS WHERE Process_Op_ID = :1", (op_id,))
        current = cursor.fetchone()
        if not current:
            con_db.close()
            return redirect('/expert/frames')
        frame_id, current_order = current
        
        cursor.execute("""
            SELECT Process_Op_ID, Op_Order
            FROM EXPERT_PROCESS_OPERATIONS
            WHERE Frame_ID = :1 AND Op_Order < :2
            ORDER BY Op_Order DESC
            FETCH FIRST 1 ROW ONLY
        """, (frame_id, current_order))
        prev = cursor.fetchone()
        
        if prev:
            prev_id, prev_order = prev
            cursor.execute("UPDATE EXPERT_PROCESS_OPERATIONS SET Op_Order = :1 WHERE Process_Op_ID = :2", (prev_order, op_id))
            cursor.execute("UPDATE EXPERT_PROCESS_OPERATIONS SET Op_Order = :1 WHERE Process_Op_ID = :2", (current_order, prev_id))
            con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect(f'/expert/frame-slots-ops?frame={frame_id}')

def move_operation_down(op_id):
    if request.cookies.get('auth_status') != 'True' or func.get_role(request.cookies.get('auth_login')) != 'expert':
        return redirect('/')
    con_db = func.connect_to_db('expert')
    cursor = con_db.cursor()
    try:
        cursor.execute("SELECT Frame_ID, Op_Order FROM EXPERT_PROCESS_OPERATIONS WHERE Process_Op_ID = :1", (op_id,))
        current = cursor.fetchone()
        if not current:
            con_db.close()
            return redirect('/expert/frames')
        frame_id, current_order = current
        
        cursor.execute("""
            SELECT Process_Op_ID, Op_Order
            FROM EXPERT_PROCESS_OPERATIONS
            WHERE Frame_ID = :1 AND Op_Order > :2
            ORDER BY Op_Order ASC
            FETCH FIRST 1 ROW ONLY
        """, (frame_id, current_order))
        next_op = cursor.fetchone()
        
        if next_op:
            next_id, next_order = next_op
            cursor.execute("UPDATE EXPERT_PROCESS_OPERATIONS SET Op_Order = :1 WHERE Process_Op_ID = :2", (next_order, op_id))
            cursor.execute("UPDATE EXPERT_PROCESS_OPERATIONS SET Op_Order = :1 WHERE Process_Op_ID = :2", (current_order, next_id))
            con_db.commit()
    except Exception as e:
        pass
    finally:
        cursor.close()
        con_db.close()
    return redirect(f'/expert/frame-slots-ops?frame={frame_id}')
