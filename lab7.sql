use lab1;
create view highest_income as 
select * from income_record where amount=
(select max(amount) from income_record);
select * from highest_income;

create view lowest_income as
select* from income_record where amount=
(select min(amount) from income_record);
select * from lowest_income;

create view above_average_income as
select * from income_record where amount >
(select avg(amount) from income_record);
select * from above_average_income;

create view income_equal_to_highest as
select * from income_record where amount=
(select max(amount) from income_record);
select * from income_equal_to_highest;

create view business_owners as
select * from taxpayer where occupation='business owner';
select * from business_owners;

#level2
create view taxpayers_with_income as
select * from taxpayer where taxpayer_id in
(SELECT taxpayer_id FROM income_record);
select * from taxpayers_with_income;

create view business_income_taxpayers as
select * from taxpayer where taxpayer_id in 
(select taxpayer_id from income_record where category_id in 
(select category_id from income_category where category_name='business'));
select * from business_income_taxpayers;

create view income_2025_2026 as
select i.* from income_record i join financial_year f on i.year_id=f.year_id where f.year_label='2025-2026';
select *from income_2025_2026;


create  view greater_than_min_business_income as
select * from income_record where amount >
(select min(i.amount) from income_record i join income_category c on i.category_id=c.category_id where c.category_name='business');
select * from greater_than_min_business_income;

create view less_than_max_salary_income as
select * from income_record where amount <
(select max(i.amount) from income_record i join income_category c on i.category_id=c.category_id where c.category_name='salary');
select * from less_than_max_salary_income;

create view taxpayers_above_average_income as
select t.* from taxpayer t join income_record i on t.taxpayer_id=i.taxpayer_id where i.amount >
(select avg(amount) from income_record);
select * from taxpayers_above_average_income;

create view categories_with_income as 
select * from income_category where category_id in(select category_id from income_record);
select * from categories_with_income;

create view taxpayers_without_investment_income as
select * from taxpayer where taxpayer_id not in
(select taxpayer_id from income_record where category_id in
(select category_id from income_category where category_name ='investment'));
select * from taxpayers_without_investment_income;

#level3
CREATE VIEW taxpayer_highest_income AS
SELECT t.*, ir.amount
FROM Taxpayer t
JOIN Income_Record ir
ON t.taxpayer_id = ir.taxpayer_id
WHERE ir.amount = (
    SELECT MAX(amount)
    FROM Income_Record
);
SELECT * FROM taxpayer_highest_income;

CREATE VIEW above_average_business_income AS
SELECT *
FROM Income_Record
WHERE amount > (
    SELECT AVG(amount)
    FROM Income_Record
    WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Business'
    )
);
SELECT * FROM above_average_business_income;

CREATE VIEW taxpayers_above_average_total AS
SELECT taxpayer_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) > (
    SELECT AVG(total_income)
    FROM (
        SELECT taxpayer_id, SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY taxpayer_id
    ) AS totals
);
SELECT * FROM taxpayers_above_average_total;

CREATE VIEW greater_than_any_investment AS
SELECT *
FROM Income_Record
WHERE amount > ANY (
    SELECT amount
    FROM Income_Record
    WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'
    )
);
SELECT * FROM greater_than_any_investment;

CREATE VIEW greater_than_all_investment AS
SELECT *
FROM Income_Record
WHERE amount > ALL (
    SELECT amount
    FROM Income_Record
    WHERE category_id IN (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'
    )
);
SELECT * FROM greater_than_all_investment;

CREATE VIEW category_highest_income AS
SELECT *
FROM Income_Category
WHERE category_id IN (
    SELECT category_id
    FROM Income_Record
    WHERE amount = (
        SELECT MAX(amount)
        FROM Income_Record
    )
);
SELECT * FROM category_highest_income;

CREATE VIEW year_highest_total_income AS
SELECT fy.year_id,
       fy.year_label,
       SUM(ir.amount) AS total_income
FROM Financial_Year fy
JOIN Income_Record ir
ON fy.year_id = ir.year_id
GROUP BY fy.year_id, fy.year_label
HAVING SUM(ir.amount) = (
    SELECT MAX(total_income)
    FROM (
        SELECT year_id,
               SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY year_id
    ) AS yearly_totals
);
SELECT * FROM year_highest_total_income;

CREATE VIEW taxpayers_greater_than_average_total AS
SELECT taxpayer_id,
       SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) > (
    SELECT AVG(total_income)
    FROM (
        SELECT taxpayer_id,
               SUM(amount) AS total_income
        FROM Income_Record
        GROUP BY taxpayer_id
    ) AS taxpayer_totals
);
SELECT * FROM taxpayers_greater_than_average_total;

