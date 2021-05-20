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

-- Процедуры

DELIMITER //

CREATE PROCEDURE FirstProcedure()
BEGIN 
	SELECT 'This is my first procedure';
END //
DELIMITER ; 

CALL FirstProcedure();

-- 1.

-- Выведем при помощи процедуры информацию о карте в диапазоне
-- Выбираем данные, которые нужны, при помощи SELECT
-- Задаем условие выборки: у конкретной карты по id-конкретный тип продукта 
-- Возьмем не сильно объемную часть выборки - (5;100)

DELIMITER //
CREATE PROCEDURE CardType() 
BEGIN 
	SELECT  product.id, `name`, connection_date
    FROM product_type
    JOIN product ON product_type.id = product.id
    WHERE product.id>5 AND product.id<100;
END //
DELIMITER ;
CALL CardType();

-- 2

-- Выведем максимальную зарплату специалиста

DELIMITER //
CREATE PROCEDURE maximumPrize(OUT salary INT)
BEGIN 
	SELECT MAX(salary)
    INTO salary
    FROM specialist;
END //
DELIMITER ;

CALL maximumPrize(@MaxSalary);
SELECT @MaxSalary;

-- 3.

-- Выведем кота, который продается в магазине "Четыре лапы" и id

DELIMITER //
CREATE PROCEDURE catsAndShop()
BEGIN
	SELECT *
    FROM shops
    WHERE shopname = "Четыре лапы";
END //
CALL catsAndShop();

-- 3 функции.

-- 1
-- Создадим функцию, определяющую к какой группе принадлежит сотрудник
-- Занимаемую долнжость выведем через локальную переменную correct

DELIMITER $$ 
CREATE FUNCTION postSpecialist (post varchar(45))
RETURNS varchar(45)
DETERMINISTIC
BEGIN 
	DECLARE correct VARCHAR(45); 
    IF post LIKE  'Специалист отдела' THEN SET correct ='Младщий сотрудник'; 
ELSE SET correct='СТАРШИЙ СПЕЦИАЛИСТ или стажёр'; 
END IF; 
RETURN (correct); 
END $$; 
DELIMITER $$ 

SELECT post,specialist.fullname AS correct, postSpecialist (post)
FROM specialist;

-- 2.

-- Проверим, хранит ли наша табличка NULL.
-- Если Null будет найден, то вывести "0"

DELIMITER $$ 
CREATE FUNCTION addToNull (
	firstValue INT,
    secondValue INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	IF firstValue IS NULL THEN
		SET firstValue = 0;
	END IF;
    
    IF secondValue IS NULL THEN
		SET secondValue = 0;
	END IF;
    
    RETURN (secondValue,firstValue);
 END $$
 
 SELECT addToNull(code,code_shops) AS nullRow, id
 FROM cats
 WHERE id > 1;

-- 3

-- Напишем функцию, которая вычисляет размер кэшбэка по формуле

DELIMITER $$ 
CREATE FUNCTION Cashback (
	cashback INT
)
RETURNS  INT
DETERMINISTIC
BEGIN
	IF cashback > 5000 AND cashback < 250000 THEN
		SET cashback = 0.1 * cashback;
	END IF; 
RETURN (cashback); 
END $$; 
DELIMITER $$ 	

SELECT Cashback(amountINT)
FROM`action`
WHERE id < 11;

-- Представления.
-- 1. 

-- Аналог №54. INNER JOIN. Выведем название отдела и его состав

CREATE VIEW specialistPertition
AS SELECT   `staff`, `name`
FROM  `department` AS `d`
JOIN `department_type` AS `d_t`
ON d.id = d_t.id;

-- 2

-- 55. Такая же логика: название банковского продукта + описание по ID

CREATE VIEW prudctToProductType
AS SELECT `name`, `description`
FROM `product` AS `p`
JOIN `product_type` AS `p_t`
ON p.id = p_t.id;

-- 3.

-- Для заданного клиента по ФИО вывести выписку о его действиях по его продуктам.
-- В действиях приjoinить ID, тип действия , без отделения


CREATE VIEW actionAndType
AS SELECT  id_type_of_action AS new_id_type_of_action , fullname,`name`, `amount`
FROM сlient c 
LEFT JOIN  `product` p 
ON p.id_client = c.id
LEFT JOIN `action` a
ON a.account_subject_id = p.id
LEFT JOIN `action_type` a_t
ON a.id_type_of_action = a_t.id
WHERE c.fullname =  'Авдеева А.А.';
 
 -- Мода
 
 DELIMITER //
CREATE PROCEDURE createPetition ( 
	OUT
	idType INT,
    idClient INT,
    termOfExecution DATE
)
BEGIN
    SELECT client.id,specialist.id,petition.id,petiton.term_of_execution, petition.text
    FROM client
    JOIN petition 
    ON client.id = petiton.id
    JOIN specialist 
    ON petition.id = specialist.id;
	SELECT petiton.term_of_execution AS correctDate 
    FROM petiton
    WHERE DATE (petiton.term_of_execution) >= "2021-05-20" AND DATE (petiton.term_of_execution) <= "2021-06-20";
    IF DATE (petiton.term_of_execution) >= "2021-05-20" AND DATE (petiton.term_of_execution) <= "2021-06-20"
		THEN SET =
    
END//
DELIMITER ;
