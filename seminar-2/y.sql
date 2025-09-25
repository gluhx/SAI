DECLARE
  v_msg VARCHAR2(100);
  v_frame_desc CLOB;
  v_frame_found NUMBER := 0;
BEGIN
  DBMS_OUTPUT.enable;
  DBMS_OUTPUT.put_line('Ok!');
  DBMS_OUTPUT.put_line('----');

  -- Попытка найти фрейм, соответствующий всем выбранным значениям
  BEGIN
    SELECT f.description
    INTO v_frame_desc
    FROM frames f
    WHERE f.frame_id IN (
      SELECT fs.frame_id
      FROM frame_slots fs
      WHERE fs.slots_val_id IN (SELECT sl_val_id FROM slots_val_temp)
      GROUP BY fs.frame_id
      HAVING COUNT(*) = (SELECT COUNT(*) FROM slots_val_temp)
         AND COUNT(*) = (SELECT COUNT(*) FROM frame_slots fs2 WHERE fs2.frame_id = fs.frame_id)
    )
    AND ROWNUM = 1;
    v_frame_found := 1;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      v_frame_found := 0;
  END;

  IF v_frame_found = 1 THEN
    DBMS_OUTPUT.put_line('Found matching frame!');
    DBMS_OUTPUT.put_line('Description:');
    DBMS_OUTPUT.put_line(v_frame_desc);
    RETURN;
  END IF;

  v_msg := EXPERT.Sel_Slots;
  IF v_msg = '!no_found!' THEN
    DBMS_OUTPUT.put_line('No matching frame found.');
  ELSE
    DBMS_OUTPUT.put_line('Choose ' || v_msg || ', please:');
    v_msg := EXPERT.Sel_Slots_val;
    DBMS_OUTPUT.put_line(chr(9) || v_msg || '. (@ + y/n)?');
  END IF;
END;
/
