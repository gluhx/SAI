-- mktable.sql
SPOOL ./mktable.log

-- Очистка существующих объектов (как в оригинале)
DROP TABLE slots_val_seen;
DROP TABLE user_choices;
DROP TABLE frame_slots;
DROP TABLE frames;
DROP TABLE slots_val;
DROP TABLE slots;

-- Создание таблиц
CREATE TABLE slots (
  slot_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  slot_name VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE slots_val (
  val_id     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  val_name   VARCHAR2(100) NOT NULL,
  slot_id    NUMBER NOT NULL
);

CREATE TABLE frames (
  frame_id    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  frame_name  VARCHAR2(50) NOT NULL UNIQUE,
  frame_class VARCHAR2(20) NOT NULL,
  description CLOB
);

CREATE TABLE frame_slots (
  frame_id NUMBER NOT NULL,
  val_id   NUMBER NOT NULL
);

CREATE TABLE user_choices (
  val_id NUMBER PRIMARY KEY
);

CREATE TABLE slots_val_seen (
  val_id NUMBER PRIMARY KEY
);

-- Внешние ключи
ALTER TABLE slots_val ADD CONSTRAINT fk_slot FOREIGN KEY (slot_id) REFERENCES slots(slot_id);
ALTER TABLE frame_slots ADD CONSTRAINT fk_frame FOREIGN KEY (frame_id) REFERENCES frames(frame_id);
ALTER TABLE frame_slots ADD CONSTRAINT fk_val FOREIGN KEY (val_id) REFERENCES slots_val(val_id);
ALTER TABLE user_choices ADD CONSTRAINT fk_choice_val FOREIGN KEY (val_id) REFERENCES slots_val(val_id);
ALTER TABLE slots_val_seen ADD CONSTRAINT fk_seen_val FOREIGN KEY (val_id) REFERENCES slots_val(val_id);

-- Заполнение слотов
INSERT INTO slots (slot_name) VALUES ('KMO');
INSERT INTO slots (slot_name) VALUES ('защита от влаги');
INSERT INTO slots (slot_name) VALUES ('компоненты с BGA выводами');
INSERT INTO slots (slot_name) VALUES ('фиксация платы');

-- Заполнение значений слотов
INSERT INTO slots_val (val_name, slot_id)
VALUES ('есть', (SELECT slot_id FROM slots WHERE slot_name = 'KMO'));

INSERT INTO slots_val (val_name, slot_id)
VALUES ('отсутствуют', (SELECT slot_id FROM slots WHERE slot_name = 'KMO'));

INSERT INTO slots_val (val_name, slot_id)
VALUES ('нужна', (SELECT slot_id FROM slots WHERE slot_name = 'защита от влаги'));

INSERT INTO slots_val (val_name, slot_id)
VALUES ('не нужна', (SELECT slot_id FROM slots WHERE slot_name = 'защита от влаги'));

INSERT INTO slots_val (val_name, slot_id)
VALUES ('отсутствуют', (SELECT slot_id FROM slots WHERE slot_name = 'компоненты с BGA выводами'));

INSERT INTO slots_val (val_name, slot_id)
VALUES ('есть', (SELECT slot_id FROM slots WHERE slot_name = 'компоненты с BGA выводами'));

INSERT INTO slots_val (val_name, slot_id)
VALUES ('винтами', (SELECT slot_id FROM slots WHERE slot_name = 'фиксация платы'));

INSERT INTO slots_val (val_name, slot_id)
VALUES ('защемлением', (SELECT slot_id FROM slots WHERE slot_name = 'фиксация платы'));

-- Заполнение фреймов с описаниями
INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №1',
  'Есть KMO',
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
  'Есть KMO',
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
  'Есть KMO',
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
  'Есть KMO',
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
  'Нет KMO',
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
  'Нет KMO',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Нанесение лака ->
Сборка корпуса.'
);

INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №7',
  'Нет KMO',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Впаивание резьбовых втулок ->
Сборка корпуса.'
);

INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №8',
  'Нет KMO',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Сборка корпуса.'
);

INSERT INTO frames (frame_name, frame_class, description) VALUES (
  'ТП №9',
  'Нет KMO',
  'Подготовительные операции ->
Нанесение паяльной пасты ->
Установка КМП ->
Пайка в печи ->
Контроль BGA шаров ->
Нанесение лака ->
Сборка корпуса.'
);

-- Привязка значений к фреймам

-- ТП №1
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №1'),
  (SELECT val_id FROM slots_val WHERE val_name = 'есть' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'KMO'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №1'),
  (SELECT val_id FROM slots_val WHERE val_name = 'нужна' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'защита от влаги'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №1'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'компоненты с BGA выводами'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №1'),
  (SELECT val_id FROM slots_val WHERE val_name = 'винтами' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'фиксация платы'))
);

-- ТП №2
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №2'),
  (SELECT val_id FROM slots_val WHERE val_name = 'есть' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'KMO'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №2'),
  (SELECT val_id FROM slots_val WHERE val_name = 'не нужна' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'защита от влаги'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №2'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'компоненты с BGA выводами'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №2'),
  (SELECT val_id FROM slots_val WHERE val_name = 'защемлением' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'фиксация платы'))
);

-- ТП №3
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №3'),
  (SELECT val_id FROM slots_val WHERE val_name = 'есть' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'KMO'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №3'),
  (SELECT val_id FROM slots_val WHERE val_name = 'не нужна' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'защита от влаги'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №3'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'компоненты с BGA выводами'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №3'),
  (SELECT val_id FROM slots_val WHERE val_name = 'винтами' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'фиксация платы'))
);

-- ТП №4
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №4'),
  (SELECT val_id FROM slots_val WHERE val_name = 'есть' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'KMO'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №4'),
  (SELECT val_id FROM slots_val WHERE val_name = 'не нужна' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'защита от влаги'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №4'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'компоненты с BGA выводами'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №4'),
  (SELECT val_id FROM slots_val WHERE val_name = 'защемлением' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'фиксация платы'))
);

-- ТП №5
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №5'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'KMO'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №5'),
  (SELECT val_id FROM slots_val WHERE val_name = 'нужна' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'защита от влаги'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №5'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'компоненты с BGA выводами'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №5'),
  (SELECT val_id FROM slots_val WHERE val_name = 'винтами' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'фиксация платы'))
);

-- ТП №6
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №6'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'KMO'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №6'),
  (SELECT val_id FROM slots_val WHERE val_name = 'нужна' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'защита от влаги'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №6'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'компоненты с BGA выводами'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №6'),
  (SELECT val_id FROM slots_val WHERE val_name = 'защемлением' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'фиксация платы'))
);

-- ТП №7
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №7'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'KMO'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №7'),
  (SELECT val_id FROM slots_val WHERE val_name = 'не нужна' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'защита от влаги'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №7'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'компоненты с BGA выводами'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №7'),
  (SELECT val_id FROM slots_val WHERE val_name = 'винтами' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'фиксация платы'))
);

-- ТП №8
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №8'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'KMO'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №8'),
  (SELECT val_id FROM slots_val WHERE val_name = 'не нужна' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'защита от влаги'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №8'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'компоненты с BGA выводами'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №8'),
  (SELECT val_id FROM slots_val WHERE val_name = 'защемлением' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'фиксация платы'))
);

-- ТП №9
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №9'),
  (SELECT val_id FROM slots_val WHERE val_name = 'отсутствуют' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'KMO'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №9'),
  (SELECT val_id FROM slots_val WHERE val_name = 'нужна' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'защита от влаги'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №9'),
  (SELECT val_id FROM slots_val WHERE val_name = 'есть' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'компоненты с BGA выводами'))
);
INSERT INTO frame_slots (frame_id, val_id) VALUES (
  (SELECT frame_id FROM frames WHERE frame_name = 'ТП №9'),
  (SELECT val_id FROM slots_val WHERE val_name = 'защемлением' AND slot_id = (SELECT slot_id FROM slots WHERE slot_name = 'фиксация платы'))
);

COMMIT;
SPOOL OFF;
