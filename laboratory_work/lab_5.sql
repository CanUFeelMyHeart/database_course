-- Для начала создадим файлы в формате CVS, используя генератор данных.
-- В моем случае - это https://www.mockaroo.com/.
-- Добавим 1000 данных в каждую из 11 таблиц, для этого используем команду LOAD DATA (mysql). 

use sberbank;

-- LOAD DATA INFILE INTO TABLE -  оператор импортирует данные из файла ".csv" в таблицу "..."
-- Поля файла завершаются запятой, относящейся к FIELD TERMINATED BY ‘,’,
-- которая заключена в двойные кавычки, предусмотренные форматом ENCLOSED BY ‘»‘.
-- Каждая строка CSV файла завершается символом новой строки, обозначающим TERMINATED BY ‘n’.
-- Поскольку первая строка файла содержит заголовки столбцов, которые не должны быть импортированы в таблицу,
-- мы игнорируем ее, указав опцию IGNORE 1 ROWS.

-- 1

LOAD DATA INFILE 'С:/lab_5/MOCK_DATA(1).csv' 
INTO TABLE `action`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 2

LOAD DATA INFILE 'С:/lab_5/MOCK_DATA(2).csv' 
INTO TABLE `action_type`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 3

LOAD DATA INFILE 'С:/lab_5/MOCK_DATA(3).csv' 
INTO TABLE `department`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 4

LOAD DATA INFILE 'С:/lab_5/MOCK_DATA(4).csv' 
INTO TABLE `department_type`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 5

LOAD DATA INFILE 'С:/lab_5/MOCK_DATA(5).csv' 
INTO TABLE `office`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 6

LOAD DATA INFILE 'С:/lab_5/MOCK_DATA(6).csv' 
INTO TABLE `petition`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 7

LOAD DATA INFILE 'С:/lab_5/MOCK_DATA(7).csv' 
INTO TABLE `product`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 8

LOAD DATA INFILE 'С:/lab_5/MOCK_DATA(8).csv' 
INTO TABLE `product_type`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 9

LOAD DATA INFILE 'С:/lab_5/MOCK_DATA(9).csv' 
INTO TABLE `service`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 10

LOAD DATA INFILE 'С:/lab_5/MOCK_DATA(10).csv' 
INTO TABLE `specialist`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;

-- 11

LOAD DATA INFILE 'С:/lab_5/MOCK_DATA(11).csv' 
INTO TABLE `client`
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY 'n'
IGNORE 1 ROWS;