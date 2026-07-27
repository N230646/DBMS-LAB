SELECT * FROM LAB1.income_record;
SELECT * FROM LAB1.financial_year;
alter table income_record
drop column category_name;
alter table income_record
drop column financial_year;
alter table income_record
add category_id INT,
ADD year_id INT;
alter table income_record
add constraint fk_taxpayer
foreign key(taxpayer_id)
references taxpayer(taxpayer_id);
alter table income_record
add constraint fk_category
foreign key(category_id)
references income_category(category_id);
alter table income_record
add constraint fk_year
foreign key (year_id)
references financial_year(year_id);
update income_record
set category_id=1,
year_id=4
where income_id=1001;
update income_record
set category_id=1,
year_id=4
where income_id=1002;
update income_record
set category_id=1,
year_id=4
where income_id=1003;
update income_record
set category_id=1,
year_id=4
where income_id=1004;
update income_record
set category_id=1,
year_id=4
where income_id=1005;
update income_record
set category_id=1,
year_id=4
where income_id=1006;


#part b
insert into  income_record values(1007,999,'ABC COMPANY',500000,'2026-03-31',NULL,1,6);
insert into  income_record values(1008,101,'ABC COMPANY',500000,'2026-03-31',NULL,20,6);
insert into  income_record values(1009,101,'ABC COMPANY',500000,'2026-03-31',NULL,1,15);
delete from taxpayer where taxpayer_id=101;
delete from income_category where category_id=1;


#part c
select distinct ocuupation from taxpayer;
select  distinct category_name from income_category;
select distinct year_label from financial_year;
select distinct income_source from income_record;


#part d
select full_nume
from taxpayer
where taxpayer_id in
(
	select taxpayer_id
    from income_record
    where category_id=1
)

union 
select full_nume
from taxpayer
where taxpayer_id in
(
	select taxpayer_id
    from income_record
    where category_id=2
);

select income_source
from income_record
where year_id=5
union
select income_source
from income_record
where year_id=6;

select full_nume
from taxpayer
where ocuupation='teacher'

union
select full_nume
from taxpayer
where ocuupation='software engineer';

#part f
SELECT taxpayer_id
FROM Income_Record
WHERE category_id = 1
AND taxpayer_id IN
(
    SELECT taxpayer_id
    FROM Income_Record
    WHERE category_id = 2
);
SELECT full_nume
FROM taxpayer
WHERE taxpayer_id IN 
(
SELECT taxpayer_id
FROM Income_Record
WHERE category_id=1
AND taxpayer_id NOT IN 
(
SELECT taxpayer_id
FROM Income_Record
WHERE category_id=2
)
);

#part g
SELECT full_nume
FROM taxpayer
WHERE taxpayer_id IN 
(
SELECT taxpayer_id
FROM Income_Record
);
