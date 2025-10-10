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


