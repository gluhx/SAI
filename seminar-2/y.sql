-- y.sql
DECLARE
  v_val_id   NUMBER;
  v_count    NUMBER;
  v_frame_id NUMBER;
  v_desc     CLOB;
  v_slot     VARCHAR2(100);
  v_val      VARCHAR2(100);
BEGIN
  v_val_id := expert.get_current_value_id();
  IF v_val_id IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('Ошибка: нет текущего значения.');
    RETURN;
  END IF;

  INSERT INTO user_choices (val_id) VALUES (v_val_id);

  -- Сколько фреймов соответствует ВСЕМ выбранным параметрам?
  SELECT COUNT(*)
  INTO v_count
  FROM (
    SELECT fs.frame_id
    FROM frame_slots fs
    WHERE fs.val_id IN (SELECT val_id FROM user_choices)
    GROUP BY fs.frame_id
    HAVING COUNT(*) = (SELECT COUNT(*) FROM user_choices)
  );

  IF v_count = 0 THEN
    DBMS_OUTPUT.PUT_LINE('❌ Нет фреймов с такими параметрами.');
  ELSIF v_count = 1 THEN
    SELECT fs.frame_id
    INTO v_frame_id
    FROM frame_slots fs
    WHERE fs.val_id IN (SELECT val_id FROM user_choices)
    GROUP BY fs.frame_id
    HAVING COUNT(*) = (SELECT COUNT(*) FROM user_choices);

    SELECT description INTO v_desc FROM frames WHERE frame_id = v_frame_id;
    DBMS_OUTPUT.PUT_LINE('✅ Найден фрейм!');
    DBMS_OUTPUT.PUT_LINE(v_desc);
  ELSE
    -- Продолжаем: следующий слот
    v_slot := expert.get_next_slot();
    IF v_slot IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('Больше нет слотов. Найдено ' || v_count || ' фреймов.');
    ELSE
      v_val := expert.get_next_value();
      IF v_val IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Нет значений для слота "' || v_slot || '".');
      ELSE
        DBMS_OUTPUT.PUT_LINE('Значение "' || v_slot || '" соответствует:');
        DBMS_OUTPUT.PUT_LINE(CHR(9) || v_val || '. (@y или @n)?');
      END IF;
    END IF;
  END IF;
END;
/
