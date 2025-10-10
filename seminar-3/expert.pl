% -----------------------------
% Классы фреймов (по наличию КМО)
% -----------------------------
frame_class(has_kmo).
frame_class(no_kmo).

% -----------------------------
% Слоты (характеристики изделия)
% -----------------------------
slot(moisture_protection).      % защита от влаги
slot(has_bga_components).       % компоненты с BGA выводами
slot(board_fixation).           % фиксация платы

% -----------------------------
% Значения слотов
% -----------------------------
% Для слота "защита от влаги"
slot_value(moisture_protection, needed).
slot_value(moisture_protection, not_needed).

% Для слота "компоненты с BGA выводами"
slot_value(has_bga_components, yes).
slot_value(has_bga_components, no).

% Для слота "фиксация платы"
slot_value(board_fixation, screws).
slot_value(board_fixation, clamping).

% -----------------------------
% Фреймы (технологические процессы)
% -----------------------------
% Структура: frame(Имя_ТП, Класс_фрейма, [Список_значений_слотов])
frame('ТП №1', has_kmo, [moisture_protection=needed, has_bga_components=no, board_fixation=screws]).
frame('ТП №2', has_kmo, [moisture_protection=not_needed, has_bga_components=no, board_fixation=clamping]).
frame('ТП №3', has_kmo, [moisture_protection=not_needed, has_bga_components=no, board_fixation=screws]).
frame('ТП №4', has_kmo, [moisture_protection=not_needed, has_bga_components=no, board_fixation=clamping]).

frame('ТП №5', no_kmo, [moisture_protection=needed, has_bga_components=no, board_fixation=screws]).
frame('ТП №6', no_kmo, [moisture_protection=needed, has_bga_components=no, board_fixation=clamping]).
frame('ТП №7', no_kmo, [moisture_protection=not_needed, has_bga_components=no, board_fixation=screws]).
frame('ТП №8', no_kmo, [moisture_protection=not_needed, has_bga_components=no, board_fixation=clamping]).
frame('ТП №9', no_kmo, [moisture_protection=needed, has_bga_components=yes, board_fixation=clamping]).

% -----------------------------
% Описания технологических процессов
% -----------------------------
description('ТП №1', 
    "Подготовительные операции ->\nНанесение паяльной пасты ->\nУстановка КМП ->\nПайка в печи ->\nФормовка выводов КМО ->\nУстановка КМО ->\nПайка волной ->\nНанесение лака ->\nВпаивание резьбовых втулок ->\nСборка корпуса.").

description('ТП №2', 
    "Подготовительные операции ->\nНанесение паяльной пасты ->\nУстановка КМП ->\nПайка в печи ->\nФормовка выводов КМО ->\nУстановка КМО ->\nПайка волной ->\nНанесение лака ->\nСборка корпуса.").

description('ТП №3', 
    "Подготовительные операции ->\nНанесение паяльной пасты ->\nУстановка КМП ->\nПайка в печи ->\nФормовка выводов КМО ->\nУстановка КМО ->\nПайка волной ->\nВпаивание резьбовых втулок ->\nСборка корпуса.").

description('ТП №4', 
    "Подготовительные операции ->\nНанесение паяльной пасты ->\nУстановка КМП ->\nПайка в печи ->\nФормовка выводов КМО ->\nУстановка КМО ->\nПайка волной ->\nСборка корпуса.").

description('ТП №5', 
    "Подготовительные операции ->\nНанесение паяльной пасты ->\nУстановка КМП ->\nПайка в печи ->\nНанесение лака ->\nВпаивание резьбовых втулок ->\nСборка корпуса.").

description('ТП №6', 
    "Подготовительные операции ->\nНанесение паяльной пасты ->\nУстановка КМП ->\nПайка в печи ->\nНанесение лака ->\nСборка корпуса.").

description('ТП №7', 
    "Подготовительные операции ->\nНанесение паяльной пасты ->\nУстановка КМП ->\nПайка в печи ->\nВпаивание резьбовых втулок ->\nСборка корпуса.").

description('ТП №8', 
    "Подготовительные операции ->\nНанесение паяльной пасты ->\nУстановка КМП ->\nПайка в печи ->\nСборка корпуса.").

description('ТП №9', 
    "Подготовительные операции ->\nНанесение паяльной пасты ->\nУстановка КМП ->\nПайка в печи ->\nКонтроль BGA шаров ->\nНанесение лака ->\nСборка корпуса.").

% -----------------------------
% Предикат для поиска подходящего ТП по характеристикам
% -----------------------------
% match_tp(+Moisture, +BGA, +Fixation, -TP)
match_tp(Moisture, BGA, Fixation, TP) :-
    frame(TP, _, Conditions),
    member(moisture_protection=Moisture, Conditions),
    member(has_bga_components=BGA, Conditions),
    member(board_fixation=Fixation, Conditions).

% -----------------------------
% Предикат для получения полной информации о ТП
% -----------------------------
% tp_info(+Moisture, +BGA, +Fixation, -TP, -Description)
tp_info(Moisture, BGA, Fixation, TP, Description) :-
    match_tp(Moisture, BGA, Fixation, TP),
    description(TP, Description).

% -----------------------------
% Примеры использования:
%
% ?- tp_info(needed, no, screws, TP, Desc).
% TP = 'ТП №1',
% Desc = "Подготовительные операции ->\nНанесение паяльной пасты -> ..."
%
% ?- tp_info(not_needed, yes, clamping, TP, Desc).
% false.  % такого ТП нет
%
% ?- tp_info(needed, yes, clamping, TP, Desc).
% TP = 'ТП №9',
% Desc = "Подготовительные операции ->\nНанесение паяльной пасты -> ..."
% -----------------------------
