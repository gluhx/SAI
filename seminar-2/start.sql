CLEAR SCREEN;
SET SERVEROUTPUT ON;
SET FEED OFF;

TRUNCATE TABLE slots_temp;
TRUNCATE TABLE slots_val_temp;

DECLARE
  v_msg VARCHAR2(50);
BEGIN
  DBMS_OUTPUT.enable;
  v_msg := EXPERT.Sel_Slots;
  DBMS_OUTPUT.put_line('Значение "' || v_msg || '" соответствует:');
  v_msg := EXPERT.Sel_Slots_val;
  DBMS_OUTPUT.put_line(chr(9) || v_msg || '. (@ + y/n)?');
END;
/
