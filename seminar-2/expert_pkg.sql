-- expert_pkg.sql
CREATE OR REPLACE PACKAGE expert IS
  FUNCTION get_next_slot RETURN VARCHAR2;
  FUNCTION get_next_value RETURN VARCHAR2;
  FUNCTION get_current_value_id RETURN NUMBER;
END expert;
/

CREATE OR REPLACE PACKAGE BODY expert IS

  g_current_slot_id   NUMBER;
  g_current_value_id  NUMBER;

  FUNCTION get_next_slot RETURN VARCHAR2 IS
    v_name VARCHAR2(100);
  BEGIN
    -- Очищаем список "уже показанных" значений для нового слота
    EXECUTE IMMEDIATE 'TRUNCATE TABLE slots_val_seen';

    SELECT s.slot_name
    INTO v_name
    FROM slots s
    WHERE s.slot_id NOT IN (
      SELECT sv.slot_id
      FROM slots_val sv
      JOIN user_choices uc ON sv.val_id = uc.val_id
    )
    ORDER BY s.slot_name
    FETCH FIRST 1 ROW ONLY;

    SELECT slot_id INTO g_current_slot_id
    FROM slots WHERE slot_name = v_name;

    g_current_value_id := NULL;
    RETURN v_name;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
  END;

  FUNCTION get_next_value RETURN VARCHAR2 IS
    v_name VARCHAR2(100);
    v_id   NUMBER;
  BEGIN
    SELECT sv.val_name, sv.val_id
    INTO v_name, v_id
    FROM slots_val sv
    WHERE sv.slot_id = g_current_slot_id
      AND sv.val_id NOT IN (SELECT val_id FROM user_choices)
      AND sv.val_id NOT IN (SELECT val_id FROM slots_val_seen)
    ORDER BY sv.val_name
    FETCH FIRST 1 ROW ONLY;

    g_current_value_id := v_id;
    INSERT INTO slots_val_seen (val_id) VALUES (v_id);
    RETURN v_name;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN NULL;
  END;

  FUNCTION get_current_value_id RETURN NUMBER IS
  BEGIN
    RETURN g_current_value_id;
  END;

END expert;
/
