--DAY NAME
SELECT * FROM sales;
SELECT 
    date,
    TO_CHAR(date, 'Day') AS day_of_week
FROM sales;

ALTER TABLE sales ADD COLUMN day_of_week  VARCHAR(10);
 --VALUE POPULATE
 UPDATE sales
 SET day_of_week = TO_CHAR(date, 'Day');
 
 
 
--month _name

SELECT
date,
TO_CHAR(date, 'Month') AS month_name
FROM sales;

Alter TABLE sales ADD COLUMN month_name VARCHAR(10);
UPDATE sales
SET month_name = TO_CHAR(date, 'Month');
