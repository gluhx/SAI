SPOOL ./mktable.list


-- Создаём таблицы
DROP TABLE slots CASCADE CONSTRAINTS;
CREATE TABLE slots (
  slots_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  slots_name VARCHAR2(100) NOT NULL UNIQUE
);

DROP TABLE slots_val CASCADE CONSTRAINTS;
CREATE TABLE slots_val (
  slots_val_id         NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  slots_val_name       VARCHAR2(100) NOT NULL,
  slots_val_slots_id   NUMBER NOT NULL
);

DROP TABLE frames CASCADE CONSTRAINTS;
CREATE TABLE frames (
  frame_id     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  frame_name   VARCHAR2(50) NOT NULL UNIQUE,
  frame_class  VARCHAR2(20) NOT NULL,
  description  CLOB
);

DROP TABLE frame_slots CASCADE CONSTRAINTS;
CREATE TABLE frame_slots (
  fs_id          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  frame_id       NUMBER NOT NULL,
  slots_val_id   NUMBER NOT NULL
);

DROP TABLE slots_temp CASCADE CONSTRAINTS;
CREATE TABLE slots_temp (
  sl_temp_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  sl_id      NUMBER NOT NULL
);

DROP TABLE slots_val_temp CASCADE CONSTRAINTS;
CREATE TABLE slots_val_temp (
  sl_val_temp_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  sl_val_id      NUMBER NOT NULL
);

-- Добавляем внешние ключи
ALTER TABLE slots_val ADD CONSTRAINT fk_slot FOREIGN KEY (slots_val_slots_id) REFERENCES slots(slots_id);
ALTER TABLE frame_slots ADD CONSTRAINT fk_frame FOREIGN KEY (frame_id) REFERENCES frames(frame_id);
ALTER TABLE frame_slots ADD CONSTRAINT fk_slot_val FOREIGN KEY (slots_val_id) REFERENCES slots_val(slots_val_id);
ALTER TABLE slots_temp ADD CONSTRAINT fk_sl_temp FOREIGN KEY (sl_id) REFERENCES slots(slots_id);
ALTER TABLE slots_val_temp ADD CONSTRAINT fk_sl_val_temp FOREIGN KEY (sl_val_id) REFERENCES slots_val(slots_val_id);

-- Заполнение слотов
INSERT INTO slots (slots_name) VALUES ('KMO');
INSERT INTO slots (slots_name) VALUES ('защита от влаги');
INSERT INTO slots (slots_name) VALUES ('компоненты с BGA выводами');
INSERT INTO slots (slots_name) VALUES ('фиксация платы');

-- Заполнение значений слотов
INSERT INTO slots_val (slots_val_name, slots_val_slots_id)
VALUES (
  'есть',
  (SELECT slots_id FROM slots WHERE slots_name = 'KMO')
);

INSERT INTO slots_val (slots_val_name, slots_val_slots_id)
VALUES (
  'не нужна',
  (SELECT slots_id FROM slots WHERE slots_name = 'KMO')
);

INSERT INTO slots_val (slots_val_name, slots_val_slots_id)
VALUES (
  'отсутствуют',
  (SELECT slots_id FROM slots WHERE slots_name = 'KMO')
);

INSERT INTO slots_val (slots_val_name, slots_val_slots_id)
VALUES (
  'нужна',
  (SELECT slots_id FROM slots WHERE slots_name = 'защита от влаги')
);

INSERT INTO slots_val (slots_val_name, slots_val_slots_id)
VALUES (
  'не нужна',
  (SELECT slots_id FROM slots WHERE slots_name = 'защита от влаги')
);

INSERT INTO slots_val (slots_val_name, slots_val_slots_id)
VALUES (
  'отсутствуют',
  (SELECT slots_id FROM slots WHERE slots_name = 'компоненты с BGA выводами')
);

INSERT INTO slots_val (slots_val_name, slots_val_slots_id)
VALUES (
  'есть',
  (SELECT slots_id FROM slots WHERE slots_name = 'компоненты с BGA выводами')
);

INSERT INTO slots_val (slots_val_name, slots_val_slots_id)
VALUES (
  'винтами',
  (SELECT slots_id FROM slots WHERE slots_name = 'фиксация платы')
);

INSERT INTO slots_val (slots_val_name, slots_val_slots_id)
VALUES (
  'зашемлением',
  (SELECT slots_id FROM slots WHERE slots_name = 'фиксация платы')
);

-- Заполнение фреймов с описаниями
INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №1',
  'Есть KMD',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Формовка выводов КМО ->
Установка КМО ->
Пайка волной ->
Нанесение лака ->
Впаивание резьбовых втулок ->
Сборка корпуса.'
);

INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №2',
  'Есть KMD',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Формовка выводов КМО ->
Установка КМО ->
Пайка волной ->
Нанесение лака ->
Сборка корпуса.'
);

INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №3',
  'Есть KMD',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Формовка выводов КМО ->
Установка КМО ->
Пайка волной ->
Впаивание резьбовых втулок ->
Сборка корпуса.'
);

INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №4',
  'Есть KMD',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Формовка выводов КМО ->
Установка КМО ->
Пайка волной ->
Сборка корпуса.'
);

INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №5',
  'Нет KMD',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Нанесение лака ->
Впаивание резьбовых втулок ->
Сборка корпуса.'
);

INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №6',
  'Нет KMD',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Нанесение лака ->
Сборка корпуса.'
);

INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №7',
  'Нет KMD',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Впаивание резьбовых втулок ->
Сборка корпуса.'
);

INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №8',
  'Нет KMD',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Сборка корпуса.'
);

INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №9',
  'Нет KMD',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Контроль BGA шаров ->
Нанесение лака ->
Сборка корпуса.'
);

-- Привязка значений к фреймам (без JOIN, только вложенные SELECT)

-- ТП №1
INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №1'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'KMO' AND sv.slots_val_name = 'есть')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №1'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'защита от влаги' AND sv.slots_val_name = 'нужна')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №1'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'компоненты с BGA выводами' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №1'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'фиксация платы' AND sv.slots_val_name = 'винтами')
);

-- ТП №2
INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №2'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'KMO' AND sv.slots_val_name = 'есть')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №2'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'защита от влаги' AND sv.slots_val_name = 'не нужна')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №2'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'компоненты с BGA выводами' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №2'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'фиксация платы' AND sv.slots_val_name = 'зашемлением')
);

-- ТП №3
INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №3'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'KMO' AND sv.slots_val_name = 'есть')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №3'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'защита от влаги' AND sv.slots_val_name = 'не нужна')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №3'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'компоненты с BGA выводами' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №3'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'фиксация платы' AND sv.slots_val_name = 'винтами')
);

-- ТП №4
INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №4'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'KMO' AND sv.slots_val_name = 'есть')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №4'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'защита от влаги' AND sv.slots_val_name = 'не нужна')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №4'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'компоненты с BGA выводами' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №4'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'фиксация платы' AND sv.slots_val_name = 'зашемлением')
);

-- ТП №5
INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №5'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'KMO' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №5'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'защита от влаги' AND sv.slots_val_name = 'нужна')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №5'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'компоненты с BGA выводами' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №5'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'фиксация платы' AND sv.slots_val_name = 'винтами')
);

-- ТП №6
INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №6'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'KMO' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №6'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'защита от влаги' AND sv.slots_val_name = 'нужна')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №6'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'компоненты с BGA выводами' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №6'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'фиксация платы' AND sv.slots_val_name = 'зашемлением')
);

-- ТП №7
INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №7'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'KMO' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №7'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'защита от влаги' AND sv.slots_val_name = 'не нужна')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №7'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'компоненты с BGA выводами' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №7'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'фиксация платы' AND sv.slots_val_name = 'винтами')
);

-- ТП №8
INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №8'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'KMO' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №8'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'защита от влаги' AND sv.slots_val_name = 'не нужна')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №8'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'компоненты с BGA выводами' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №8'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'фиксация платы' AND sv.slots_val_name = 'зашемлением')
);

-- ТП №9
INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №9'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'KMO' AND sv.slots_val_name = 'отсутствуют')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №9'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'защита от влаги' AND sv.slots_val_name = 'нужна')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №9'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'компоненты с BGA выводами' AND sv.slots_val_name = 'есть')
);

INSERT INTO frame_slots (frame_id, slots_val_id)
VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №9'),
  (SELECT slots_val_id FROM slots_val sv JOIN slots s ON sv.slots_val_slots_id = s.slots_id WHERE s.slots_name = 'фиксация платы' AND sv.slots_val_name = 'зашемлением')
);

COMMIT;
