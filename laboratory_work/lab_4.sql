-- 15 функциональных требований.

-- 1. Показать список специалистов.

SELECT *from specialist;

-- 2. Показать контактные данные специалиста.

SELECT `contact_details`
FROM specialist;

-- 3. Изменить адрес офиса в связи с переездом.

UPDATE office
SET address = 'Пролетарская, 5'
WHERE office.id = 1;

-- 4. Показать текст жалобы "1122а"

SELECT `text`
FROM petition
WHERE request_number = "1122а";

-- 5. Посчитать количество жалоб за месяц

SELECT count(*) FROM service;

-- 6. Отобразить специалистов, чья ЗП располагается в пределах [1000; 200000]

SELECT *from specialist
WHERE salary BETWEEN 1000 AND 200000;

-- 7. Вывести информацию о жалобе, текст которой "Нахамили"

SELECT * FROM petition 
WHERE text = 'Нахамили';

-- 8. Добавим новую жалобу на персонал ПАО Сбербанк

INSERT INTO petition
VALUES (11,"4212а","В услуге №2 отказали",10, 10,10);

-- 9. Изменить ФИО клиента в связи со ссменой фамилии
UPDATE `сlient`
SET `fullname` = 'Авдеева А.А.' 
WHERE id = 1;

-- 10. Удалить "11" сотрудника

DELETE from specialist
WHERE id = 11;

-- 11. Изменить номер телефона клиента

UPDATE `client`
SET mobile_phone = "79276013671"
WHERE  id = 1;

-- 12. Удалить продукт с датой полдключения

DELETE FROM product
WHERE `connection_date` =  "01.05.2001";

-- 13. Удалить специалиста, чей опыт работы - 7 лет

DELETE from specialist
WHERE `work_experience` = "7 лет";

-- 14. Вывести зп отдела специалистов конкретного отделения

SELECT SUM(DISTINCT salary) as sum FROM specialist;

-- 15. Отобразить специалистов с опытом работы 2 года и зп больше, чем 6000

SELECT * FROM specialist WHERE work_experience = "2 года" AND salary >= 6000;

-- UPDATE. 5 штук

-- 16. Изменить зарплату сотруднику в связи с повышением

UPDATE specialist
SET salary  = 100000
WHERE `work_experience` = "2 года";

-- 17. Сменить номер телефона клиента в связи с сменой мобильного телефона

UPDATE client 
SET mobile_phone = "79276013671"
WHERE fullname = "Пятаков Д.С.";

-- 18. Изменить дату подключения (плохой способ)

UPDATE product
SET connection_date = "01.05.2001"
WHERE id = 5;

-- 19. Изменить адрес в связи с переездом

UPDATE office
SET address = "Коммунистическая, 4"
WHERE address = "Коммунистическая,6" ;

-- 20. Изменить данные для конкретного банковского продукта 

UPDATE product_type
SET `name` = "Дебетовая"
WHERE `name` = "Дебетовая с повышенным кэшбеком";

-- DELETE. 5 штук

-- 21. Удалить специалиста, стаж работы которого - 5 лет

DELETE from specialist
WHERE `work_experience` = "5 лет";

-- 22. Удаление случайно созданной таблицы.

CREATE TABLE `pproduct`(
	name VARCHAR (100)
);
DELETE FROM `pproduct`;

-- 23. Удалим новый тип продукта

INSERT into product_type VALUES (11, "Брокерский счет");
DELETE FROM product_type
WHERE `name` = "Брокерский счет";

-- 24. Удалить адрес офиса в связи с переездом

DELETE FROM office
WHERE address = "Коммунистическая, 15";

-- 25. Удалить информацию по перевыпуска карты, т.к. такая уже присутствует в таблице

INSERT INTO action_type VALUES (11, "Перевыпуск карты - утеря носителя");
DELETE from action_type
WHERE id = 11;

--  SELECT в разных вариациях. 20 запросов.

-- 26. Показать всех клиентов

SELECT *from client;

-- 27. Показать всех специалистов

SELECT *from specialist;

-- 28. Показать всех специалистов,зарплата которых выше 6000р

SELECT *from specialist
WHERE salary> 6000;

-- 29. Показать офис, адрес которого "Ленина,22

SELECT *from office
WHERE address = "Ленина,22";

-- 30. Отобразить офис, адрес которого - Ленина, 22; телефон - 62-32-22

SELECT  *from office
WHERE`address` = "Ленина,22" AND `oficce_contacts_details` = "62-32-22";

-- 31. Отобразить специалистов, чей статус 3 года, +7-905-391-87-93

SELECT *from specialist
WHERE `work_experience` = "3 года" AND `contact_details`= "+79053918793";

-- 32. Отобразить жалобы, где текст "Нахамили" и номер жалобы -  "1110а

SELECT *from petition
WHERE `text` = "Нахамили" OR `request_number` = "1110а";

-- 33. Отобразить офисы,адресы которых: Ленина,22 / телефон: 62-32-22

SELECT *from office
WHERE`address` = "Ленина,22" OR`oficce_contacts_details` = "62-32-22";

-- 34. Отобразить все услуги, где наименования "Информация о расходах"

SELECT *FROM service
WHERE `description` IN ("Информация о расходах");

-- 35. Отобразить количество работников

SELECT DISTINCT staff FROM department;

-- 36. Уникальные значения з/п

SELECT DISTINCT salary FROM specialist;


-- 37. Отобразить все типы продуктов

SELECT COUNT(*) FROM product_type;

-- 38. Отобразить всех клиентов

SELECT COUNT(*) FROM client;

-- 39. Отобразить телефон, стаж работы и id специалиста

SELECT  CONCAT (contact_details, " ", work_experience, " ", id) AS contact_details
FROM specialist;

-- 40. Отобразим информацию о жалобе: ее номер и текст

SELECT CONCAT (request_number, " ", `text`) AS `information`
FROM petition;

-- 41. Вывести контактные данные специалистов, чей опыт работы и телефон совпадают

SELECT contact_details, COUNT(*) work_experience
FROM specialist
GROUP BY contact_details, work_experience;

-- 42. Сгруппировать специалистов по зп (от меньшего к большему)

SELECT id, MIN(salary)
FROM specialist
GROUP BY salary;

-- 43. Изменим названиея столбцов в таблице "специалистов"

SELECT work_experience AS work_year, ID as primary_key FROM specialist;

-- 44. Изменить название "текст" жалобы на "о жалобе"

SELECT `text` AS `about_petition` FROM petition;

-- 45. Вывести зарплату в пределах [5000, 1000000]

SELECT *FROM specialist
WHERE salary>5000 AND salary<1000000;

-- LIKE и другие функции работы со строками

-- 46. Отобразить текст жалобы, где было слово "В течение"

SELECT *FROM petition WHERE `text` LIKE '%В течение%';

-- 47. Отобразить специалистов, чья должность начинается со слова "Специалист"

SELECT * FROM specialist WHERE `post` LIKE 'Специалист%';

-- 48. Отобразить специалиста, чья должность - "аналитик"

SELECT * FROM specialist WHERE `post` LIKE '%аналитик';

-- 49. Вывести все офисы, адреса которых не начинаются с буквы "В"

SELECT `address`
FROM office
WHERE `address` NOT LIKE '%В';

-- 50. Вывести все номера жалоб, в которых нет цифры "1"

SELECT `request_number`
FROM petition
WHERE `request_number` NOT LIKE '%1%';

-- SELECT INTO, INSERT SELECT

-- 51. Выведем в переменные значения id и описапния по нашему описанию - "Перевод из приложения"

SELECT `description`,`id`  INTO @newtable, @new_id
FROM action_type
WHERE `description` = 'Перевод из приложения'; 

SELECT @newtable, @new_id;

-- 52. Создадим пустую тестовую таблицу. В переменную созданной твблицы перенесем данные из существующей страницы.

CREATE TABLE `new_department_type`(
	`string` VARCHAR (100)
);

INSERT INTO `new_department_type` (`string`)
SELECT `description` FROM `department_type`;

SELECT *from `new_department_type`;

-- JOIN. 20 запросов

-- 53. INNER JOIN. Выведем описание и сумму
SELECT `description`, `amount`
FROM `action` AS `a`
JOIN `action_type`  AS `a_t`
ON a_t.id = a.id;	

-- 54. INNER JOIN. Выведем название отдела и его состав
SELECT  `staff`, `name`
FROM  `department` AS `d`
JOIN `department_type` AS `d_t`
ON d.id = d_t.id;

-- 55. Такая же логика: название банковского продукта + описание по ID
SELECT `name`, `description`
FROM `product` AS `p`
JOIN `product_type` AS `p_t`
ON p.id = p_t.id;

-- 56. Продукт и его тип - вся информацаия о них
SELECT *
FROM `product` 
LEFT JOIN `product_type` 
ON product.id = product_type.id; 

-- 57. Выведем специалистов по их офису
SELECT  *
FROM specialist s
LEFT JOIN department d
ON d.id=s.id;

-- 58. Вывести дату подключения и описание конкретного продукта

SELECT `description`,connection_date
FROM product p
LEFT JOIN product_type p_t
ON(p.id = p_t.id)
WHERE name = 'Дебетовая';

-- 59. Вывести данные начальника, исключив данные сына - стажера по id

SELECT contact_details,post,salary
FROM specialist s
LEFT JOIN department d
ON (s.id=d.id)
WHERE contact_details = "+79053918793" AND d.id > 2
ORDER BY 2 DESC;

-- 60. Выведем всех котиков по магазитнам по id. Пример с котами нагляднее :)

CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);

SELECT `name`, `shopname`
FROM `cats` 
JOIN `shops`
ON shops_id = cats.id;

-- 61. LEFT JOIN. Все значения, что были в шоп_нэйм пустыми, окажутся заполненными NULL

INSERT INTO `cats` VALUES ("Reks", 6, NULL );

SELECT `name`, `shopname`
FROM `cats` 
left JOIN `shops`
ON shops.id = cats.id;

-- 62. Вывести все значения , НО без Рекса (NULL)

SELECT `name`, `shopname`
FROM `cats` 
inner JOIN `shops`
ON shops.id = cats.id;

-- 63.  Заполнит левую таблицу пустыми значениями, если они имеются

INSERT INTO `cats` VALUES ("",8, 4);

SELECT `name`, `shopname`
FROM `cats` 
RIGHT JOIN `shops`
ON shops.id = cats.id;

-- 64. IINER JOIN и CROSS JOIN в mysql одинаковые (такой же рузультат, что и в №62)

SELECT `name`, `shopname`
FROM `cats` 
CROSS JOIN `shops`
ON shops.id = cats.id;

-- 65. "Декартово объединение" таблиц

SELECT *from specialist
JOIN department
JOIN office
JOIN department_type;

-- 66. Одинаковые таблицы 1 раз появляются

SELECT *from specialist
NATURAL JOIN department;

-- 67. Выведем магазин, в котором продается кот Мурзик

SELECT shopname
FROM shops s
LEFT JOIN cats c
ON (s.id=c.id)
WHERE name = 'Murzik';

-- 68. Отобразим информацию об котах и их магазинах

SELECT *FROM cats
JOIN shops;

-- 69. Выведем по ID всех продуктов их типы

SELECT connection_date
FROM product p
JOIN product_type p_t
ON p.id=p_t.id;

-- 70. Тип продукта и его имя по ID

SELECT `name` 
FROM product_type p_t
RIGHT JOIN product p
ON p.id = p_t.id;

-- 71. Декартово объединение

SELECT *
FROM service
JOIN specialist
JOIN office;

-- 72. Стоблцы используются только 1 раз

SELECT *
FROM specialist
NATURAL JOIN department;

-- 73. То же самое

SELECT *
FROM `action`
NATURAL JOIN action_type;

-- GROUP BY. 10 штук

-- 74. Выведем количество номеров 

SELECT contact_details, COUNT(*) AS "Total kol"
FROM specialist
GROUP BY contact_details;

-- 75. Минимальная зарплата

SELECT contact_details,MIN(salary) AS "Lowest salary"
FROM specialist
GROUP BY contact_details;

-- 76. Максимальная з/п

SELECT contact_details,MAX(salary) AS "Highest salary"
FROM specialist
GROUP BY contact_details;

-- 77. Выбрать количество текста на жалобу конкретного номера

SELECT `request_number`,COUNT(*) `text`
FROM `petition`
GROUP BY `request_number`;

-- 78. Выведем информацию только о 2 котах

SELECT * 
FROM cats
GROUP BY `name` LIMIT 2;

-- 79. Округление зп для конкретных специалистов

SELECT post,AVG(salary)
FROM specialist
GROUP BY post;

-- 80. Вывести количество зарплат по количеству людей,занятых на конкретной  профессии

SELECT post, COUNT(*)salary
FROM specialist
GROUP BY post;

-- 81.  Вывести котов с именами, если есть повторяющиеся,то будет два "number_of_cats_name"

SELECT `name`, COUNT(*) AS `number_of_cats_name`
FROM `cats`
WHERE id > 1
GROUP BY `name`
HAVING COUNT(*) > 0;

-- 82. Выведем количество питомцев  в каждом магазине. Если id > 1, значит, что в данном зоомагазине более 2 питомцев

SELECT COUNT(shops.id) AS `new_shop_id`, `shopname` AS `new_shopname`
FROM `shops`
GROUP BY `shopname`; 

-- 83. Выведем зарплату в порядке убывания, причем работник не должен работать в офисе 2

SELECT SUM(`salary`) AS 'payroll' , `fullname` AS 'specialist_FIO'
FROM `specialist`
WHERE id_department > 2
GROUP BY fullname
ORDER BY 1 DESC;

-- 84. Выведем среднюю зарплату по сотрудникам

SELECT AVG(salary) AS `pay`, `fullname` AS `FIO`
FROM `specialist`
WHERE id_department < 14
GROUP BY fullname;

-- UNION, GROUP_CONCAT

-- 85. Выведем код отдела с его описанием, объединив таблицы "офис" и "тип офиса"

SELECT `code` AS `code_description`, `id` AS `name_id`
FROM `department`
UNION SELECT `name`, `description`
FROM `department_type`
ORDER BY `code_description` DESC ;

-- 86. Начислим премию за успешную работу сотрудникам , используя коэффициент

SELECT `fullname`, salary * 0.5 AS `prize`
FROM `specialist`
WHERE salary <= 100000
UNION SELECT `fullname`, salary * 0.25 AS `prize`
FROM `specialist` 
WHERE salary <= 500000;

-- 87. 

SELECT `connection_date` AS `connect_date`,`description` AS `d-t`
FROM `product` 
WHERE id <=5
UNION SELECT`connection_date` AS `connect_date`,`description` AS `d-t`
FROM `product`
WHERE id>=5;

-- 88. Выведем повторяющиеся значения

SELECT `name` FROM `cats`
UNION ALL
SELECT `shopname` FROM `shops`;

-- 89. Объединим результаты выборки таблицы. Результаты будут разделены двойным двоеточием

SELECT DISTINCT `name` as `name1`, 
(select GROUP_CONCAT(`id`SEPARATOR '::') as `new_id` from `cats` where `name` = `name1` ) as `new_id`
FROM `cats`;

-- 90. Выборка "стаж работы - ФИО". Одинаковые значения "отбрасываются"

SELECT `work_experience`, GROUP_CONCAT(`fullname`) AS `fullName`
FROM `specialist`
GROUP BY `work_experience`;

-- 91. Выведем строки с 3 по 5 (первые 2 строчки пропускаются, затем - выводятся 3 последующие)

SELECT * 
FROM `shops`
LIMIT 2, 3;

-- 92. Пример с "order by"

SELECT * 
FROM `shops`
ORDER BY `shopname`
LIMIT 5;

-- 93. Выведем данные отделения, начиная со 2 позиции (id)

SELECT * 
FROM office 
WHERE id >0 
LIMIT 1, 3;

-- 94. Специалист - з/п с помошью сложения строк с разделителем в виде "-"

SELECT *,
CONCAT_WS(' - ',  `fullname`, `salary`) AS `result`
FROM `specialist`;

-- 95. Сложение строк без разделителей

SELECT *,
CONCAT('Информация: ',  `fullname`, `salary`) AS `result`
FROM `specialist`;

-- 96. Присвоим всем сотрудникам почтовые адреса
 
SELECT *,
CONCAT(contact_details, ', почта: user@mail.ru') AS contact_details
FROM specialist;

-- 97. Посчитаем длину строки

SELECT *, 
LENGTH(address) as length 
FROM office;

-- 98.  Выведем всех котиков с магазинами, причем id магазина не должен быть "null"

SELECT * 
FROM `cats`
WHERE `shops_id` IS NOT NULL;

-- 99. Подстрока "течение"

SELECT `id`,
MID(`name`, 2, 8) as `text` 
FROM `service`;

-- 100. 'В течение дня(с пн по пт)'

SELECT `id`, 
RPAD(`name`, 25, '(с пн по пт)') as `text` 
FROM `service`;

-- 101. 'В-течение-дня'

SELECT `id`, 
REPLACE(`name`, ' ', '-') as `text`
FROM service;

