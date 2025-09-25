-- start.sql
CLEAR SCREEN;
SET SERVEROUTPUT ON;
SET FEEDBACK OFF;

TRUNCATE TABLE user_choices;
TRUNCATE TABLE slots_val_seen;

DECLARE
  v_slot VARCHAR2(100);
  v_val  VARCHAR2(100);
BEGIN
  DBMS_OUTPUT.PUT_LINE('Запуск экспертной системы...');
  v_slot := expert.get_next_slot();
  IF v_slot IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('Все слоты опрошены. Фрейм не найден.');
    RETURN;
  END IF;

  v_val := expert.get_next_value();
  IF v_val IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('Нет доступных значений для слота "' || v_slot || '".');
    RETURN;
  END IF;

  DBMS_OUTPUT.PUT_LINE('Значение "' || v_slot || '" соответствует:');
  DBMS_OUTPUT.PUT_LINE(CHR(9) || v_val || '. (@y или @n)?');
END;
/
