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