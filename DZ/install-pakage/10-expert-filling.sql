SPOOL log_temp.txt

PROMPT Заполняем таблицу слотов экспертной системы
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'компоненты берутся',
            'Откуда берутся компоненты для последующих технологических операций: со склада или из привезённых машин сразу, без хранения?');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'входной контроль',
            'Нужен ли входной контроль перед использованием? Или вы доверяете производителю компонентов/своим данным хранения?');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'КМО',
            'Еслить в электронной ячейке КМО компоненты');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'способ установки компонентов',
            'Каким способом устанавливабтся компоненты на печатную плату');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'защита от влаги',
            'Надо ли наносить лак, чтобы защитить ЭЯ от влаги?');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'есть ли компоненты с BGA выводами',
            'Есть ли компоненты с BGA выводами?');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'пайка КМП',
            'Каким способом паяються КМП компоненты');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'пайка КМО',
            'Каким способом паяються КМО компоненты');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'тип платы',
            'Двух или одностороняя ли плата?');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'фиксация платы',
            'Каким образом фиксируется плата?');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'герметизация',
            'Нужно ли герметизировать корпус устройства?');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'после производства',
            'Что делать с товаром после производства');
INSERT INTO EXPERT_SLOTS (Slot_ID, Slot_Name, Slot_Desc)
    VALUES (S_EXPERT_SLOTS.NEXTVAL, 'способ промывки',
            'Каким способом промывается ЭЯ?');

PROMPT Заполняем таблицу значений слотов
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'компоненты берутся'),
            'со склада');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'компоненты берутся'),
            'сразу из транспортных машин');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'входной контроль'),
            'нужен');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'входной контроль'),
            'не нужен');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО'),
            'есть');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО'),
            'нет');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов'),
            'ручной');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов'),
            'автоматизированный');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'защита от влаги'),
            'нужна');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'защита от влаги'),
            'не нужна');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'есть ли компоненты с BGA выводами'),
            'есть');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'есть ли компоненты с BGA выводами'),
            'нет');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП'),
            'феном');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП'),
            'в печи');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП'),
            'селективная');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМО'),
            'волной припоя');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМО'),
            'селективная');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'тип платы'),
            'ДПП');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'тип платы'),
            'ОПП');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'фиксация платы'),
            'защемлением');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'фиксация платы'),
            'винтами');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'герметизация'),
            'нужна');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'герметизация'),
            'не нужна');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'после производства'),
            'на склад');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'после производства'),
            'заказчику');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ промывки'),
            'водой');
INSERT INTO EXPERT_SLOT_VALUES (Slot_Value_ID, Slot_ID, Value_Name)
    VALUES (S_EXPERT_SLOT_VALUES.NEXTVAL,
            (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ промывки'),
            'в ультразвуковой ванне');

PROMPT Заполняем таблицу фреймов
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '1. Подготовительные операции', NULL, NULL, 0);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2. Монтаж ИЭТ', NULL, NULL, 0);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '1.1 Разгрузка - Распаковка - Входной контроль - Комплектование',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1. Подготовительные операции'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '1.2 Разгрузка - Распаковка - Комплектование',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1. Подготовительные операции'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '1.3 Перегрузка(со склада) - Распаковка - Входной контроль - Комплектование',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1. Подготовительные операции'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '1.4 Перегрузка(со склада) - Распаковка - Комплектование',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1. Подготовительные операции'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1 Есть КМО',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2. Монтаж ИЭТ'), NULL, 0);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2 Нет КМО',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2. Монтаж ИЭТ'), NULL, 0);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.1 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.3 Ручная установка КМП - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.4 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.5 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.6 Автоматизированная установка КМП - Селективная пайка - Автоматизированная установка КМП - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.7 Ручная установка КМП - Селективная пайка - Ручная установка КМП - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '3. Обработка электронной ячейки', NULL, NULL, 0);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '3.1. Промывка - Сушка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3. Обработка электронной ячейки'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '3.2 Промывка - Сушка - Нанесение лака',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3. Обработка электронной ячейки'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '3.3 Промывка в ультразвуковой ванне - Сушка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3. Обработка электронной ячейки'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3. Обработка электронной ячейки'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '4. Сборка устройства', NULL, NULL, 0);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '4.1 Установка ЭЯ в корпус - Установка крышки в основание',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4. Сборка устройства'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4. Сборка устройства'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4. Сборка устройства'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4. Сборка устройства'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '5. Завершающие операции', NULL, NULL, 0);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5. Завершающие операции'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5. Завершающие операции'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном - Ручная установка КМО - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.4 Формовка выводов КМО - Автоматизированная установка КМП И КМО - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.5 Ручная установка КМП И КМО - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);

PROMPT Заполняем таблицу связей фреймов и значений слотов

-- 1.1 Разгрузка -> Распаковка -> Входной контроль -> Комплектование
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.1 Разгрузка - Распаковка - Входной контроль - Комплектование'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'компоненты берутся') AND Value_Name = 'сразу из транспортных машин'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.1 Разгрузка - Распаковка - Входной контроль - Комплектование'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'входной контроль') AND Value_Name = 'нужен'));

-- 1.2 Разгрузка -> Распаковка -> Комплектование
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.2 Разгрузка - Распаковка - Комплектование'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'компоненты берутся') AND Value_Name = 'сразу из транспортных машин'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.2 Разгрузка - Распаковка - Комплектование'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'входной контроль') AND Value_Name = 'не нужен'));

-- 1.3 Перегрузка(со склада) -> Распаковка -> Входной контроль -> Комплектование
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.3 Перегрузка(со склада) - Распаковка - Входной контроль - Комплектование'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'компоненты берутся') AND Value_Name = 'со склада'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.3 Перегрузка(со склада) - Распаковка - Входной контроль - Комплектование'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'входной контроль') AND Value_Name = 'нужен'));

-- 1.4 Перегрузка(со склада) -> Распаковка -> Комплектование
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.4 Перегрузка(со склада) - Распаковка - Комплектование'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'компоненты берутся') AND Value_Name = 'со склада'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.4 Перегрузка(со склада) - Распаковка - Комплектование'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'входной контроль') AND Value_Name = 'не нужен'));

-- 2.2.1 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.1 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'нет'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.1 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.1 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'в печи'));

-- 2.2.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'нет'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'ручной'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'феном'));

-- 2.2.3 Ручная установка КМП - Селективная пайка
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.3 Ручная установка КМП - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'нет'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.3 Ручная установка КМП - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'ручной'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.3 Ручная установка КМП - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'селективная'));

-- 2.2.4 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.4 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'нет'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.4 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.4 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'в печи'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.4 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'есть ли компоненты с BGA выводами') AND Value_Name = 'есть'));

-- 2.2.5 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.5 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'нет'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.5 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.5 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'в печи'));

-- 2.2.6 Автоматизированная установка КМП - Селективная пайка - Автоматизированная установка КМП - Селективная пайка
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.6 Автоматизированная установка КМП - Селективная пайка - Автоматизированная установка КМП - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'нет'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.6 Автоматизированная установка КМП - Селективная пайка - Автоматизированная установка КМП - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.6 Автоматизированная установка КМП - Селективная пайка - Автоматизированная установка КМП - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'селективная'));

-- 2.2.7 Ручная установка КМП - Селективная пайка - Ручная установка КМП - Селективная пайка
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.7 Ручная установка КМП - Селективная пайка - Ручная установка КМП - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'нет'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.7 Ручная установка КМП - Селективная пайка - Ручная установка КМП - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'ручной'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.7 Ручная установка КМП - Селективная пайка - Ручная установка КМП - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'селективная'));

-- 2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'нет'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'в печи'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'есть ли компоненты с BGA выводами') AND Value_Name = 'есть'));

-- 3.1. Промывка - Сушка
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.1. Промывка - Сушка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ промывки') AND Value_Name = 'водой'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.1. Промывка - Сушка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'защита от влаги') AND Value_Name = 'не нужна'));

-- 3.2 Промывка - Сушка - Нанесение лака
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.2 Промывка - Сушка - Нанесение лака'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ промывки') AND Value_Name = 'водой'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.2 Промывка - Сушка - Нанесение лака'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'защита от влаги') AND Value_Name = 'нужна'));

-- 3.3 Промывка в ультразвуковой ванне - Сушка
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.3 Промывка в ультразвуковой ванне - Сушка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ промывки') AND Value_Name = 'в ультразвуковой ванне'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.3 Промывка в ультразвуковой ванне - Сушка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'защита от влаги') AND Value_Name = 'не нужна'));

-- 3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ промывки') AND Value_Name = 'в ультразвуковой ванне'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'защита от влаги') AND Value_Name = 'нужна'));

-- 4.1 Установка ЭЯ в корпус - Установка крышки в основание
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.1 Установка ЭЯ в корпус - Установка крышки в основание'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'фиксация платы') AND Value_Name = 'защемлением'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.1 Установка ЭЯ в корпус - Установка крышки в основание'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'герметизация') AND Value_Name = 'не нужна'));

-- 4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'фиксация платы') AND Value_Name = 'винтами'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'герметизация') AND Value_Name = 'не нужна'));

-- 4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'фиксация платы') AND Value_Name = 'винтами'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'герметизация') AND Value_Name = 'нужна'));

-- 4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'фиксация платы') AND Value_Name = 'защемлением'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'герметизация') AND Value_Name = 'нужна'));

-- 5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'после производства') AND Value_Name = 'на склад'));

-- 5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'после производства') AND Value_Name = 'заказчику'));

-- 2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'есть'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'в печи'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМО') AND Value_Name = 'волной припоя'));

-- 2.1.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном - Ручная установка КМО - Селективная пайка
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном - Ручная установка КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'есть'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном - Ручная установка КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'ручной'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном - Ручная установка КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'феном'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном - Ручная установка КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМО') AND Value_Name = 'селективная'));

-- 2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'есть'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'феном'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМО') AND Value_Name = 'волной припоя'));

-- 2.1.4 Формовка выводов КМО - Автоматизированная установка КМП И КМО - Селективная пайка
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.4 Формовка выводов КМО - Автоматизированная установка КМП И КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'есть'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.4 Формовка выводов КМО - Автоматизированная установка КМП И КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.4 Формовка выводов КМО - Автоматизированная установка КМП И КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'селективная'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.4 Формовка выводов КМО - Автоматизированная установка КМП И КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМО') AND Value_Name = 'селективная'));

-- 2.1.5 Ручная установка КМП И КМО - Селективная пайка
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.5 Ручная установка КМП И КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'есть'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.5 Ручная установка КМП И КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'ручной'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.5 Ручная установка КМП И КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'селективная'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.5 Ручная установка КМП И КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМО') AND Value_Name = 'селективная'));

-- 2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'есть'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'в печи'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМО') AND Value_Name = 'волной припоя'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'есть ли компоненты с BGA выводами') AND Value_Name = 'есть'));

-- 2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'есть'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'в печи'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМО') AND Value_Name = 'волной припоя'));

-- 2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'есть'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'в печи'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМО') AND Value_Name = 'селективная'));

-- 2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'КМО') AND Value_Name = 'есть'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'способ установки компонентов') AND Value_Name = 'автоматизированный'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМП') AND Value_Name = 'в печи'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'пайка КМО') AND Value_Name = 'волной припоя'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
        (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
        (SELECT Slot_Value_ID FROM EXPERT_SLOT_VALUES WHERE Slot_ID = (SELECT Slot_ID FROM EXPERT_SLOTS WHERE Slot_Name = 'есть ли компоненты с BGA выводами') AND Value_Name = 'есть'));

PROMPT Заполняем таблицу операций для фреймов
-- Группа 1. Подготовительные операции

-- Фрейм 1.1 Разгрузка -> Распаковка -> Входной контроль -> Комплектование
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Разгрузка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.1 Разгрузка - Распаковка - Входной контроль - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 6 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)), 
    1, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Распаковка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.1 Разгрузка - Распаковка - Входной контроль - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 51 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8)), 
    2, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Входной контроль компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.1 Разгрузка - Распаковка - Входной контроль - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 93 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3)), 
    3, 900,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Комплектование компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.1 Разгрузка - Распаковка - Входной контроль - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)), 
    4, 450,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- Фрейм 1.2 Разгрузка -> Распаковка -> Комплектование
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Разгрузка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.2 Разгрузка - Распаковка - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 6 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)), 
    1, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Распаковка компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.2 Разгрузка - Распаковка - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 51 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8)), 
    2, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Комплектование компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.2 Разгрузка - Распаковка - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)), 
    3, 450,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- Фрейм 1.3 Перегрузка(со склада) -> Распаковка -> Входной контроль -> Комплектование
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Перемещение со склада',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.3 Перегрузка(со склада) - Распаковка - Входной контроль - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 8 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)), 
    1, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Распаковка компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.3 Перегрузка(со склада) - Распаковка - Входной контроль - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 51 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8)), 
    2, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Проверка работоспособности компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.3 Перегрузка(со склада) - Распаковка - Входной контроль - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 93 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3)), 
    3, 900,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Комплектование элементов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.3 Перегрузка(со склада) - Распаковка - Входной контроль - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)), 
    4, 450,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- Фрейм 1.4 Перегрузка(со склада) -> Распаковка -> Комплектование
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Перемещение со склада',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.4 Перегрузка(со склада) - Распаковка - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 8 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)), 
    1, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Распаковка компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.4 Перегрузка(со склада) - Распаковка - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 51 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8)), 
    2, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Комплектование компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.4 Перегрузка(со склада) - Распаковка - Комплектование'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)), 
    3, 450,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- Группа 2.1 Есть КМО

-- Фрейм 2.1.1 Формовка выводов КМО - Нанесение паяльной пасты -> Автоматизированная установка КМП -> Пайка в Печи -> Автоматизированная установка КМО -> Пайка волной припоя
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Формовка выводов электрорадиоэлементов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 31 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85)), 
    1, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    2, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая в печи',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    4, 480,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    5, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая волной припоя',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.1 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    6, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для пайки волной'));

-- Фрейм 2.1.2 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка феном - Ручная установка КМО - Селективная пайка
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном - Ручная установка КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    1, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Ручная установка компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном - Ручная установка КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    2, 900,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка феном',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном - Ручная установка КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 11 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    3, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Паяльная станция с феном'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Ручная установка компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном - Ручная установка КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    4, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Селективная пайка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном - Ручная установка КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 15 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    5, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Селективная паяльная машина'));

-- Фрейм 2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автоматизированная установка КМП - Пайка феном - Автоматизированная установка КМО - Пайка волной припоя
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Формовка выводов электрорадиоэлементов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 31 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85)), 
    1, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    2, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка феном',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 11 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    4, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Паяльная станция с феном'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    5, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая волной припоя',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.3 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    6, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для пайки волной'));

-- Фрейм 2.1.4 Формовка выводов КМО - Автоматизированная установка КМП И КМО - Селективная пайка
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Формовка выводов электрорадиоэлементов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.4 Формовка выводов КМО - Автоматизированная установка КМП И КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 31 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85)), 
    1, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.4 Формовка выводов КМО - Автоматизированная установка КМП И КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    2, 240,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Селективная пайка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.4 Формовка выводов КМО - Автоматизированная установка КМП И КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 15 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    3, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Селективная паяльная машина'));

-- Фрейм 2.1.5 Ручная установка КМП И КМО - Селективная пайка
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Ручная установка компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.5 Ручная установка КМП И КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    1, 1200,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Селективная пайка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.5 Ручная установка КМП И КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 15 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    2, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Селективная паяльная машина'));

-- Фрейм 2.1.6 Формовка выводов КМО - Нанесение паяльной пасты -> Автоматизированная установка КМП -> Пайка в Печи -> Автоматизированная установка КМО -> Пайка волной припоя - Рентген контроль BGA шаров
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Формовка выводов электрорадиоэлементов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 31 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85)), 
    1, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    2, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая в печи',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    4, 480,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    5, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая волной припоя',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    6, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для пайки волной'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Рентген контроль BGA шаров',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.6 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 25 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2)), 
    7, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Рентгеновская установка (№10)'));

-- Фрейм 2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автоматизированная установка КМП - Пайка в Печи - Автоматизированная установка КМП и КМО - Пайка волной припоя
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Формовка выводов электрорадиоэлементов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 31 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85)), 
    1, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    2, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение клея',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    3, 90,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для нанесения клея'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    4, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая в печи',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    5, 480,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    6, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая волной припоя',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.7 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    7, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для пайки волной'));

-- Фрейм 2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автоматизированная установка КМП - Пайка в Печи - Автоматизированная установка КМП и КМО - Селективная пайка
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Формовка выводов электрорадиоэлементов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 31 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85)), 
    1, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    2, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая в печи',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    4, 480,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    5, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Селективная пайка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.8 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 15 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    6, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Селективная паяльная машина'));

-- Фрейм 2.1.9 Нанесение паяльной пасты - Нанесение клея -> Автоматизированная установка КМП -> Пайка в Печи -> Автоматизированная установка КМП и КМО -> Пайка волной припоя - Рентген контроль BGA шаров
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    1, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение клея',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    2, 90,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для нанесения клея'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая в печи',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    4, 480,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    5, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая волной припоя',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    6, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для пайки волной'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Рентген контроль BGA шаров',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.9 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 25 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2)), 
    7, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Рентгеновская установка (№10)'));

-- Группа 2.2 Нет КМО

-- Фрейм 2.2.1 Нанесение паяльной пасты -> Автоматизированная установка КМП -> Пайка в Печи
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.1 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    1, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.1 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    2, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая в печи',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.1 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    3, 480,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

-- Фрейм 2.2.2 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка феном
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    1, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Ручная установка компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    2, 900,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка феном',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.2 Нанесение паяльной пасты - Ручная установка КМП - Пайка феном'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 11 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    3, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Паяльная станция с феном'));

-- Фрейм 2.2.3 Нанесение паяльной пасты -> Автоматизированная установка КМП -> Пайка феном
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.3 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    1, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.3 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    2, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка феном',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.3 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 11 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    3, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Паяльная станция с феном'));

-- Фрейм 2.2.4 Нанесение паяльной пасты -> Автоматизированная установка КМП -> Пайка в Печи -> Рентген контроль BGA шаров
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.4 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    1, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.4 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    2, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая в печи',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.4 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    3, 480,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Рентген контроль BGA шаров',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.4 Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 25 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2)), 
    4, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Рентгеновская установка (№10)'));

-- Фрейм 2.2.5 Нанесение паяльной пасты - Нанесение клея - Автоматизированная установка КМП - Пайка в Печи - Автоматизированная установка КМП - Пайка в Печи
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.5 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    1, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение клея',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.5 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    2, 90,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для нанесения клея'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.5 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая в печи',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.5 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    4, 480,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.5 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    5, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая в печи',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.5 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    6, 480,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

-- Фрейм 2.2.6 Автоматизированная установка КМП -> Селективная пайка - Автоматизированная установка КМП -> Селективная пайка
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.6 Автоматизированная установка КМП - Селективная пайка - Автоматизированная установка КМП - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    1, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Селективная пайка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.6 Автоматизированная установка КМП - Селективная пайка - Автоматизированная установка КМП - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 15 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    2, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Селективная паяльная машина'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.6 Автоматизированная установка КМП - Селективная пайка - Автоматизированная установка КМП - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Селективная пайка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.6 Автоматизированная установка КМП - Селективная пайка - Автоматизированная установка КМП - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 15 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    4, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Селективная паяльная машина'));

-- Фрейм 2.2.7 Ручная установка КМП -> Селективная пайка - Ручная установка КМП -> Селективная пайка
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Ручная установка компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.7 Ручная установка КМП - Селективная пайка - Ручная установка КМП - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    1, 900,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Селективная пайка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.7 Ручная установка КМП - Селективная пайка - Ручная установка КМП - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 15 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    2, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Селективная паяльная машина'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Ручная установка компонентов',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.7 Ручная установка КМП - Селективная пайка - Ручная установка КМП - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Селективная пайка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.7 Ручная установка КМП - Селективная пайка - Ручная установка КМП - Селективная пайка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 15 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    4, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Селективная паяльная машина'));

-- Фрейм 2.2.8 Нанесение паяльной пасты - Нанесение клея -> Автоматизированная установка КМП -> Пайка в Печи -> Автоматизированная установка КМП -> Пайка в Печи - Рентген контроль BGA шаров
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение рисунка и надписей по трафарету',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 73)), 
    1, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение клея',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    2, 90,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для нанесения клея'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая в печи',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    4, 480,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Базирование',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    5, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Пайка готовым припоем флюсовая в печи',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)), 
    6, 480,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Рентген контроль BGA шаров',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.8 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи - Рентген контроль BGA шаров'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 25 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2)), 
    7, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Рентгеновская установка (№10)'));

-- Группа 3. Обработка электронной ячейки

-- Фрейм 3.1 Промывка - Сушка
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Промывка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.1. Промывка - Сушка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 25 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    1, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для промывки'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Сушка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.1. Промывка - Сушка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 70 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    2, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Шкаф сушильный'));

-- Фрейм 3.2 Промывка - Сушка - Нанесение лака
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Промывка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.2 Промывка - Сушка - Нанесение лака'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 25 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    1, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для промывки'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Сушка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.2 Промывка - Сушка - Нанесение лака'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 70 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    2, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Шкаф сушильный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение лака',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.2 Промывка - Сушка - Нанесение лака'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 46 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    3, 240,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для нанесения лака'));

-- Фрейм 3.3 Промывка в ультразвуковой ванне - Сушка
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Промывка в ультразвуковой ванне',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.3 Промывка в ультразвуковой ванне - Сушка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 35 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    1, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для промывки'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Сушка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.3 Промывка в ультразвуковой ванне - Сушка'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 70 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    2, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Шкаф сушильный'));

-- Фрейм 3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Промывка в ультразвуковой ванне',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 35 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    1, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для промывки'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Сушка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 70 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    2, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Шкаф сушильный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Нанесение лака',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 46 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    3, 240,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для нанесения лака'));

-- Группа 4. Сборка устройства

-- Фрейм 4.1 Установка ЭЯ в корпус - Установка крышки в основание
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Установка ЭЯ в корпус',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.1 Установка ЭЯ в корпус - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    1, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Установка крышки в основание',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.1 Установка ЭЯ в корпус - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    2, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- Фрейм 4.2 Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Монтаж резьбовых втулок',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 8 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    1, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Установка ЭЯ в корпус',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    2, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Установка крышки в основание',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- Фрейм 4.3 Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Монтаж резьбовых втулок',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 8 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    1, 420,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Установка ЭЯ в корпус',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    2, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Установка прокладки',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Установка крышки в основание',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    4, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- Фрейм 4.4 Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Установка ЭЯ в корпус',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    1, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Установка прокладки',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    2, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Установка крышки в основание',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)), 
    3, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- Группа 5. Завершающие операции

-- Фрейм 5.1 Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Функциональный контроль',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 93 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3)), 
    1, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Маркеровка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 80 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    2, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Упаковка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 30 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8)), 
    3, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Перемещение на склад',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 8 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)), 
    4, 180,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- Фрейм 5.2 Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Функциональный контроль',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 93 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 3)), 
    1, 600,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Маркеровка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 80 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)), 
    2, 120,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Упаковка',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 30 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8)), 
    3, 300,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Operation_Name, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL, 'Транспортировка заказчику',
    (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику'),
    (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = 
        (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)), 
    4, 240,
    (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

SPOOL off;
quit;
