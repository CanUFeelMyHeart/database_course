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

-- 9. Изменить ФИО клиента в связи со свадьбой
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

-- 18. Изменить дату поделючения (плохой способ)
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
