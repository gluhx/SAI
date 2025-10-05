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
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '1.1 Разгрузка -> Распаковка -> Входной контроль -> Комплектование',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1. Подготовительные операции'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '1.2 Разгрузка -> Распаковка -> Комплектование',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1. Подготовительные операции'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '1.3 Перегрузка(со склада) -> Распаковка -> Входной контроль -> Комплектование',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1. Подготовительные операции'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '1.4 Перегрузка(со склада) -> Распаковка -> Комплектование',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1. Подготовительные операции'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1 Есть КМО',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2. Монтаж ИЭТ'), NULL, 0);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2 Нет КМО',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2. Монтаж ИЭТ'), NULL, 0);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.01 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка в Печи',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.02 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.03 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка феном',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.04 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка феном',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.06 Ручная установка КМП -> Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.07 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Рентген контроль BGA шаров',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.08 Нанесение паяльной пасты -> Нанесение клея -> Ручная установка КМП -> Пайка в Печи > Ручная установка КМП -> Пайка в Печи',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.09 Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП - Пайка в Печи',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.12 Автоматизированная установка КМП -> Селективная пайка - Автоматизированная установка КМП -> Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.13 Ручная установка КМП -> Селективная пайка - Ручная установка КМП -> Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2 Нет КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.2.14 Нанесение паяльной пасты - Нанесение клея -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМП -> Пайка в Печи - Рентген контроль BGA шаров',
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
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.04 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.05 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка феном - Ручная установка КМО - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.06 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Пайка волной припоя',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.07 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка феном - Автомотизированная установка КМО - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.08 Формовка выводов КМО - Автоматизированная установка КМП И КМО - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.09 Ручная установка КМП И КМО - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.10 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи - Автомотизированная установка КМО - Пайка волной припоя - Рентген контроль BGA шаров',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.12 Нанесение паяльной пасты - Ручная установка КМП -> Пайка в Печи > Ручная установка КМП и КМО - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.13 Формовка выводов КМО - Нанесение паяльной пасты - Нанесение клея - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Пайка волной припоя',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.14 Формовка выводов КМО - Нанесение паяльной пасты - Автомотизированная установка КМП - Пайка в Печи - Автомотизированная установка КМП и КМО - Селективная пайка',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);
INSERT INTO EXPERT_FRAMES (Frame_ID, Frame_Name, Parent_Frame_ID, Frame_Desc, Is_Prototype)
    VALUES (S_EXPERT_FRAMES.NEXTVAL, '2.1.15 Нанесение паяльной пасты - Нанесение клея -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМП и КМО -> Пайка волной припоя - Рентген контроль BGA шаров',
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1 Есть КМО'), NULL, 1);

PROMPT Заполняем таблицу связей фреймов и значений слотов
-- Используем JOIN для однозначного определения Slot_Value_ID
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.1 Разгрузка -> Распаковка -> Входной контроль -> Комплектование'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'компоненты берутся' AND sv.Value_Name = 'сразу из транспортных машин'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.1 Разгрузка -> Распаковка -> Входной контроль -> Комплектование'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'входной контроль' AND sv.Value_Name = 'нужен'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.2 Разгрузка -> Распаковка -> Комплектование'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'компоненты берутся' AND sv.Value_Name = 'сразу из транспортных машин'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.2 Разгрузка -> Распаковка -> Комплектование'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'входной контроль' AND sv.Value_Name = 'не нужен'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.3 Перегрузка(со склада) -> Распаковка -> Входной контроль -> Комплектование'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'компоненты берутся' AND sv.Value_Name = 'со склада'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.3 Перегрузка(со склада) -> Распаковка -> Входной контроль -> Комплектование'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'входной контроль' AND sv.Value_Name = 'нужен'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.4 Перегрузка(со склада) -> Распаковка -> Комплектование'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'компоненты берутся' AND sv.Value_Name = 'со склада'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '1.4 Перегрузка(со склада) -> Распаковка -> Комплектование'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'входной контроль' AND sv.Value_Name = 'не нужен'));

-- Привязки для остальных фреймов
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.01 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка в Печи'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'КМО' AND sv.Value_Name = 'нет'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.01 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка в Печи'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'способ установки компонентов' AND sv.Value_Name = 'ручной'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.01 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка в Печи'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'пайка КМП' AND sv.Value_Name = 'в печи'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.01 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка в Печи'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'тип платы' AND sv.Value_Name = 'ОПП'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.02 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'КМО' AND sv.Value_Name = 'нет'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.02 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'способ установки компонентов' AND sv.Value_Name = 'автоматизированный'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.02 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'пайка КМП' AND sv.Value_Name = 'в печи'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.02 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'тип платы' AND sv.Value_Name = 'ОПП'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.03 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка феном'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'КМО' AND sv.Value_Name = 'нет'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.03 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка феном'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'способ установки компонентов' AND sv.Value_Name = 'ручной'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.03 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка феном'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'пайка КМП' AND sv.Value_Name = 'феном'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.03 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка феном'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'тип платы' AND sv.Value_Name = 'ОПП'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.04 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка феном'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'КМО' AND sv.Value_Name = 'нет'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.04 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка феном'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'способ установки компонентов' AND sv.Value_Name = 'автоматизированный'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.04 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка феном'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'пайка КМП' AND sv.Value_Name = 'феном'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.04 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка феном'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'тип платы' AND sv.Value_Name = 'ОПП'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.06 Ручная установка КМП -> Селективная пайка'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'КМО' AND sv.Value_Name = 'нет'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.06 Ручная установка КМП -> Селективная пайка'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'способ установки компонентов' AND sv.Value_Name = 'ручной'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.06 Ручная установка КМП -> Селективная пайка'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'пайка КМП' AND sv.Value_Name = 'селективная'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.06 Ручная установка КМП -> Селективная пайка'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'тип платы' AND sv.Value_Name = 'ОПП'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.07 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Рентген контроль BGA шаров'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'КМО' AND sv.Value_Name = 'нет'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.07 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Рентген контроль BGA шаров'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'способ установки компонентов' AND sv.Value_Name = 'автоматизированный'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.07 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Рентген контроль BGA шаров'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'пайка КМП' AND sv.Value_Name = 'в печи'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.07 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Рентген контроль BGA шаров'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'тип платы' AND sv.Value_Name = 'ОПП'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.07 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Рентген контроль BGA шаров'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'есть ли компоненты с BGA выводами' AND sv.Value_Name = 'есть'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'КМО' AND sv.Value_Name = 'есть'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'способ установки компонентов' AND sv.Value_Name = 'автоматизированный'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'пайка КМП' AND sv.Value_Name = 'в печи'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'пайка КМО' AND sv.Value_Name = 'волной припоя'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'тип платы' AND sv.Value_Name = 'ОПП'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.1. Промывка - Сушка'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'способ промывки' AND sv.Value_Name = 'водой'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.1. Промывка - Сушка'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'защита от влаги' AND sv.Value_Name = 'не нужна'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.2 Промывка - Сушка - Нанесение лака'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'способ промывки' AND sv.Value_Name = 'водой'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.2 Промывка - Сушка - Нанесение лака'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'защита от влаги' AND sv.Value_Name = 'нужна'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.3 Промывка в ультразвуковой ванне - Сушка'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'способ промывки' AND sv.Value_Name = 'в ультразвуковой ванне'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.3 Промывка в ультразвуковой ванне - Сушка'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'защита от влаги' AND sv.Value_Name = 'не нужна'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'способ промывки' AND sv.Value_Name = 'в ультразвуковой ванне'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'защита от влаги' AND sv.Value_Name = 'нужна'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.1 Установка ЭЯ в корпус - Установка крышки в основание'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'фиксация платы' AND sv.Value_Name = 'защемлением'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.1 Установка ЭЯ в корпус - Установка крышки в основание'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'герметизация' AND sv.Value_Name = 'не нужна'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'фиксация платы' AND sv.Value_Name = 'винтами'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'герметизация' AND sv.Value_Name = 'не нужна'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'фиксация платы' AND sv.Value_Name = 'винтами'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'герметизация' AND sv.Value_Name = 'нужна'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'фиксация платы' AND sv.Value_Name = 'защемлением'));
INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'герметизация' AND sv.Value_Name = 'нужна'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'после производства' AND sv.Value_Name = 'на склад'));

INSERT INTO EXPERT_FRAME_VALUES (Frame_Value_ID, Frame_ID, Slot_Value_ID)
    VALUES (S_EXPERT_FRAME_VALUES.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику'),
            (SELECT sv.Slot_Value_ID FROM EXPERT_SLOT_VALUES sv JOIN EXPERT_SLOTS s ON sv.Slot_ID = s.Slot_ID WHERE s.Slot_Name = 'после производства' AND sv.Value_Name = 'заказчику'));

PROMPT Заполняем операции для фреймов
-- Добавляем оборудование только если его нет
MERGE INTO TCHG_TOOLS t
USING (SELECT 'Рентгеновская установка' AS Tool_Name FROM dual
       UNION ALL SELECT 'Паяльная станция с феном' FROM dual
       UNION ALL SELECT 'Селективная паяльная машина' FROM dual
       UNION ALL SELECT 'Установка для нанесения клея' FROM dual
       UNION ALL SELECT 'Установка для формовки выводов' FROM dual) src
ON (t.Tool_Name = src.Tool_Name)
WHEN NOT MATCHED THEN
    INSERT (Tool_ID, Tool_Name) VALUES (S_TCHG_TOOLS.NEXTVAL, src.Tool_Name);

-- Операции по фреймам
-- 2.2.01
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.01 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка в Печи'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.01 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка в Печи'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 58 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.01 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка в Печи'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

-- 2.2.02
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.02 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.02 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 58 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автоматизированные линия поверхностного монтажа'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.02 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));

-- 2.2.03
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.03 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка феном'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.03 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка феном'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 58 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.03 Нанесение паяльной пасты -> Ручная установка КМП -> Пайка феном'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 11 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Паяльная станция с феном'));

-- 2.2.04
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.04 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка феном'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.04 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка феном'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 58 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автоматизированные линия поверхностного монтажа'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.04 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка феном'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 11 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Паяльная станция с феном'));

-- 2.2.06
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.06 Ручная установка КМП -> Селективная пайка'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 58 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.06 Ручная установка КМП -> Селективная пайка'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 11 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Селективная паяльная машина'));

-- 2.2.07
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.07 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Рентген контроль BGA шаров'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.07 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Рентген контроль BGA шаров'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 58 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автоматизированные линия поверхностного монтажа'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.07 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Рентген контроль BGA шаров'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.2.07 Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Рентген контроль BGA шаров'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 10 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 2)),
            4, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Рентгеновская установка'));

-- 2.1.03
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 31 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 85)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для формовки выводов'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 57 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 65)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автомат для нанесения паяльной пасты'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 58 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Автоматизированные линия поверхностного монтажа'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 14 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)),
            4, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Пятизонная печь'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 58 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            5, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Система монтажа с роботом SCARA'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '2.1.03 Формовка выводов КМО - Нанесение паяльной пасты -> Автомотизированная установка КМП -> Пайка в Печи -> Автомотизированная установка КМО -> Пайка волной припоя'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 18 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 80)),
            6, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для пайки волной'));

-- 3.1
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.1. Промывка - Сушка'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 25 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для промывки'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.1. Промывка - Сушка'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 70 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Шкаф сушильный'));

-- 3.2
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.2 Промывка - Сушка - Нанесение лака'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 25 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для промывки'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.2 Промывка - Сушка - Нанесение лака'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 70 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Шкаф сушильный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.2 Промывка - Сушка - Нанесение лака'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 11 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для нанесения лака'));

-- 3.3
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.3 Промывка в ультразвуковой ванне - Сушка'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 35 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для промывки'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.3 Промывка в ультразвуковой ванне - Сушка'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 70 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Шкаф сушильный'));

-- 3.4
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 35 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для промывки'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 70 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Шкаф сушильный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '3.4 Промывка в ультразвуковой ванне - Сушка - Нанесение лака'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 11 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 74)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Установка для нанесения лака'));

-- 4.1
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.1 Установка ЭЯ в корпус - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.1 Установка ЭЯ в корпус - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- 4.2
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 23 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.2. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- 4.3
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 23 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.3. Монтаж резьбовых втулок - Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            4, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- 4.4
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '4.4. Установка ЭЯ в корпус - Установка прокладки - Установка крышки в основание'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 88)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

-- 5.1
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 15 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 80 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 30 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.1. Функциональный контроль - Маркеровка - Упаковка - Перемещение на склад'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)),
            4, 0, NULL);

-- 5.2
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 15 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 6)),
            1, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 80 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 1)),
            2, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 30 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 8)),
            3, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));
INSERT INTO EXPERT_PROCESS_OPERATIONS (Process_Op_ID, Frame_ID, Operation_ID, Op_Order, Op_Duration, Tool_ID)
    VALUES (S_EXPERT_PROCESS_OPERATIONS.NEXTVAL,
            (SELECT Frame_ID FROM EXPERT_FRAMES WHERE Frame_Name = '5.2. Функциональный контроль - Маркеровка - Упаковка - Транспортировка заказчику'),
            (SELECT Operation_ID FROM TCHG_OPERATION_LIST WHERE Operation_Number = 1 AND Operation_Group_ID = (SELECT Group_ID FROM TCHG_OPERATION_GROUP WHERE Group_Number = 4)),
            4, 0,
            (SELECT Tool_ID FROM TCHG_TOOLS WHERE Tool_Name = 'Стол монтажный'));

SPOOL off;
quit;
