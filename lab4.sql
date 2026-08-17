use LAB1;
show tables;
select *from taxpayer;
select *from income_category;
select *from income_record;
select *from financial_year;
select full_name,income_source from taxpayer t inner join income_record ir on t.taxpayer_id=ir.taxpayer_id;
select full_name,category_name from taxpayer t inner join income_category ir on t.taxpayer_id=ir.category_id;
select income_id,year_label from income_record i inner join financial_year f on i.year_id=f.year_id;
select full_name,annual_income,amount from taxpayer t inner join income_record ir on t.taxpayer_id=ir.taxpayer_id;
select full_name,income_source,category_name,year_label from taxpayer t 
inner join income_record ir on t.taxpayer_id=ir.taxpayer_id 
inner join income_category ic on ir.category_id=ic.category_id
inner join financial_year f on ir.year_id=f.year_id;

/* level2*/
select t.full_name,ir.income_source,ic.category_name
from taxpayer t inner join income_record ir on t.taxpayer_id=ir.taxpayer_id
inner join income_category ic on ic.category_id=ir.category_id where ic.category_name='Salary';
select t.full_name,t.occupation,ir.income_source from taxpayer t inner join income_record ir on t.taxpayer_id=ir.taxpayer_id inner join income_category ic 
on ir.category_id=ic.category_id where ic.category_name='Business';

