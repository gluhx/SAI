CREATE OR REPLACE PACKAGE Expert IS
  FUNCTION Sel_Slots RETURN VARCHAR2;
  FUNCTION Sel_Slots_val RETURN VARCHAR2;
END Expert;
/

CREATE OR REPLACE PACKAGE BODY Expert IS

  FUNCTION Sel_Slots RETURN VARCHAR2 IS
    v_id   NUMBER;
    v_name VARCHAR2(50);
  BEGIN
    SELECT slots_id, slots_name
    INTO v_id, v_name
    FROM (
      SELECT slots_id, slots_name
      FROM slots
      WHERE slots_id NOT IN (SELECT sl_id FROM slots_temp)
      ORDER BY slots_name DESC
    )
    WHERE ROWNUM = 1;
    INSERT INTO slots_temp(sl_id) VALUES (v_id);
    COMMIT;
    RETURN v_name;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN '!no_found!';
  END;

  FUNCTION Sel_Slots_val RETURN VARCHAR2 IS
    v_id        NUMBER;
    v_name      VARCHAR2(50);
    v_slot_id   NUMBER;
  BEGIN
    SELECT sl_id INTO v_slot_id
    FROM (
      SELECT sl_id
      FROM slots_temp
      ORDER BY sl_temp_id DESC
    )
    WHERE ROWNUM = 1;

    SELECT slots_val_id, slots_val_name
    INTO v_id, v_name
    FROM (
      SELECT slots_val_id, slots_val_name
      FROM slots_val
      WHERE slots_val_slots_id = v_slot_id
        AND slots_val_id NOT IN (SELECT sl_val_id FROM slots_val_temp)
      ORDER BY slots_val_name DESC
    )
    WHERE ROWNUM = 1;

    INSERT INTO slots_val_temp(sl_val_id) VALUES (v_id);  -- ← НЕТ sl_id!
    COMMIT;
    RETURN v_name;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN '!no_found!';
  END;

END Expert;
/
