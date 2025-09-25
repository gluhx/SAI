-- n.sql
DECLARE
  v_val VARCHAR2(100);
  v_slot_name VARCHAR2(100);
BEGIN
  -- Определяем текущий слот (тот, что ещё не выбран)
  BEGIN
    SELECT s.slot_name
    INTO v_slot_name
    FROM slots s
    WHERE s.slot_id NOT IN (
      SELECT sv.slot_id
      FROM slots_val sv
      JOIN user_choices uc ON sv.val_id = uc.val_id
    )
    ORDER BY s.slot_name
    FETCH FIRST 1 ROW ONLY;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Все слоты уже опрошены.');
      RETURN;
  END;

  v_val := expert.get_next_value();
  IF v_val IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('Больше нет значений для слота "' || v_slot_name || '".');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Значение "' || v_slot_name || '" соответствует:');
    DBMS_OUTPUT.PUT_LINE(CHR(9) || v_val || '. (@y или @n)?');
  END IF;
END;
/
