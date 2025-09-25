DECLARE
  v_msg VARCHAR2(50);
BEGIN
  DBMS_OUTPUT.enable;
  v_msg := EXPERT.Sel_Slots_val;
  IF v_msg = '!no_found!' THEN
    DBMS_OUTPUT.put_line('Nothing found!');
  ELSE
    DBMS_OUTPUT.put_line(chr(9) || v_msg || '. (@ + y/n)?');
  END IF;
END;
/
