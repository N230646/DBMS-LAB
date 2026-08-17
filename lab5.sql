use lab1;
show tables;
/*level 1*/

select count(*) as total_records from income_record;
select sum(amount) as total_income from income_record;
select avg(amount) as average_income from income_record;
select max(amount) as highest_income from income_record;
select min(amount) as lowest_income from income_record;

/* level 2*/
select category_id,count(*) as number_of_records from income_record group by category_id;
select category_id,sum(amount) as total_income from income_record group by category_id;
select category_id,avg(amount) as average_income from income_record group by category_id;
select category_id,max(amount) as highest_income from income_record group by category_id;
select category_id,min(amount) as lowest_income from income_record group by category_id;
SELECT year_id, SUM(amount) AS total_income FROM Income_Record GROUP BY year_id;
SELECT year_id, COUNT(*) AS number_of_records FROM Income_Record GROUP BY year_id;
SELECT category_id, year_id, SUM(amount) AS total_income FROM Income_Record GROUP BY category_id, year_id;


/*level3*/
SELECT category_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY category_id
HAVING SUM(amount) > 1000000;
SELECT category_id, AVG(amount) AS average_income
FROM Income_Record
GROUP BY category_id
HAVING AVG(amount) > 500000;
SELECT year_id, COUNT(*) AS number_of_records
FROM Income_Record
GROUP BY year_id
HAVING COUNT(*) > 3;
SELECT category_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY category_id
ORDER BY total_income DESC;
SELECT category_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY category_id
HAVING SUM(amount) > 1000000
ORDER BY total_income DESC;
SELECT category_id,
       SUM(amount) AS total_income,
       AVG(amount) AS average_income
FROM Income_Record
GROUP BY category_id;
SELECT category_id, year_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY category_id, year_id
ORDER BY total_income DESC;
SELECT I.year_id,
       COUNT(DISTINCT I.taxpayer_id) AS number_of_taxpayers
FROM Income_Record I
JOIN Financial_Year F
    ON I.year_id = F.year_id
GROUP BY I.year_id;


-- 
/*  REAL-WORLD TAXATION ANALYSIS */

SELECT C.category_name, SUM(I.income_amount) AS total_income
FROM Income_Record I
JOIN Income_Category C
    ON I.category_id = C.category_id
GROUP BY C.category_name
ORDER BY total_income DESC
LIMIT 1;

-- Task 2: 
SELECT F.year_label, SUM(I.amount) AS total_income
FROM Income_Record I
JOIN Financial_Year F
    ON I.year_id = F.year_id
GROUP BY F.year_label
ORDER BY total_income DESC
LIMIT 1;

-- Task 3: Income category having the highest average income
SELECT C.category_name, AVG(I.amount) AS average_income
FROM Income_Record I
JOIN Income_Category C
    ON I.category_id = C.category_id
GROUP BY C.category_name
ORDER BY average_income DESC
LIMIT 1;

-- Task 4: Income categories having more than two income records
SELECT C.category_name, COUNT(*) AS number_of_records
FROM Income_Record I
JOIN Income_Category C
    ON I.category_id = C.category_id
GROUP BY C.category_name
HAVING COUNT(*) > 2;

/*Task 5: */
SELECT F.year_label, SUM(I.amount) AS total_income
FROM Income_Record I
JOIN Financial_Year F
    ON I.year_id = F.year_id
GROUP BY F.year_label
HAVING SUM(I.amount) > 1000000;

-- Task 6: Summary report - Income Category, Number of Records,
--         Total Income, Average Income, Highest Income,
--         Lowest Income (all in one query)
SELECT C.category_name,
       COUNT(*)                AS number_of_records,
       SUM(I.amount)    AS total_income,
       AVG(I.amount)    AS average_income,
       MAX(I.amount)    AS highest_income,
       MIN(I.amount)    AS lowest_income
FROM Income_Record I
JOIN Income_Category C
    ON I.category_id = C.category_id
GROUP BY C.category_name
ORDER BY total_income DESC;