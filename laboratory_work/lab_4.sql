use sberbank;

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

--  SELECT в разных вариациях. 20 запросов.

-- 26. Показать всех клиентов
SELECT *from client;

-- 27. Показать всех специалистов
SELECT *from specialist;

-- 28. Показать всех специалистов,зарплата которых выше 6000р
SELECT *from specialist
WHERE salary> 6000;

-- 29. Показать офис, адрес которого "Ленина,22"
SELECT *from office
WHERE address = "Ленина,22";

-- 30. Отобразить офис, адрес которого - Ленина, 22; телефон - 62-32-22
SELECT  *from office
WHERE`address` = "Ленина,22" AND `oficce_contacts_details` = "62-32-22";

-- 31. Отобразить специалистов, чей статус 3 года, +7-905-391-87-93
SELECT *from specialist
WHERE `work_experience` = "3 года" AND `contact_details`= "+79053918793";

-- 32. Отобразить жалобы, где текст "Нахамили" и номер жалобы -  "1110а"
SELECT *from petition
WHERE `text` = "Нахамили" OR `request_number` = "1110а";

-- 33. Отобразить офисы,адресы которых: Ленина,22 / телефон: 62-32-22
SELECT *from office
WHERE`address` = "Ленина,22" OR`oficce_contacts_details` = "62-32-22";

-- 34. Отобразить специалистов, чья должность начинается со слова "Специалист"
SELECT * FROM specialist WHERE `post` LIKE 'Специалист%';

-- 35. Отобразить специалиста, чья должность - "аналитик"
SELECT * FROM specialist WHERE `post` LIKE '%аналитик';

-- 36. Отобразить текст жалобы, где было слово "В течение"
SELECT *FROM petition WHERE `text` LIKE '%В течение%';

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

-- 44. 
SELECT `text` AS `about_petition` FROM petition;

-- 45.
SELECT *FROM specialist
WHERE salary>5000 AND salary<1000000;

