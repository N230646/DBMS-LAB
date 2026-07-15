CREATE DATABASE LAB1;
USE LAB1;
CREATE TABLE TAXPAYER(
	taxpayer_id INT Primary Key,
    pan_number VARCHAR(10) Not Null,
    full_name VARCHAR(100) Not Null,
    date_of_birth DATE Not Null,
    occupation VARCHAR(50) Not Null,
    annual_income DECIMAL(12,2) Not Null,
    email VARCHAR(100) Unique,
    is_active BOOLEAN);
INSERT INTO TAXPAYER() values('101','ABCDE1234F','Ravi Kumar','1995-06-15','Software Engineer','850000000','ravi.kumar@example.com',TRUE);
INSERT INTO TAXPAYER() values('102','BCDEF2345G','Priya Sharma','1992-11-22','Doctor','120000.00','priya.sharma@example.com',TRUE);
INSERT INTO TAXPAYER() values('103','CDEFG3456H','Arjun Reddy','1988-03-10','Business Owner','180000.00','arjun.reddy@example.com',TRUE);
INSERT INTO TAXPAYER() values('104','DEFGH4567J','Sneha Patel','1998-08-05','Teacher','620000.00','sneha.patel@example.com',TRUE);
INSERT INTO TAXPAYER() values('105','EFGHJ5678K','Kiran Rao','1990-01-18','Freelancer','750000.00','kiran.rao@example.com',TRUE);
INSERT INTO TAXPAYER() values('106','FGHIJK789L','Meera Singh','1985-12-30','consultant','1500000.00','meera.singh@example.com',FALSE);

CREATE TABLE Income_category(
	category_id INT Primary Key,
    category_name VARCHAR(50) Not Null,
    description VARCHAR(200) Not Null,
    taxable BOOLEAN Not Null);
INSERT INTO Income_category Values('1','Salary','Income Recieved from emplyment',TRUE);
INSERT INTO Income_category Values('2','Business','Income earned from Business activities',TRUE);
INSERT INTO Income_category Values('3','House Property','Income received from property or ren',TRUE);
INSERT INTO Income_category Values('4','Capital Gains','Income from transfer of eligible assets',TRUE );
INSERT INTO Income_category Values('5','Other Sources ','Income such as bank interest ',TRUE);
INSERT INTO Income_category Values('6','Agricultural Income ','Income from eligible agricultural activities',FALSE );



CREATE TABLE Financial_Year(
	year_id INT Primary Key,
    year_label VARCHAR(9) Not Null,
    start_date DATE Not Null,
    end_date DATE Not Null,
    filing_deadline DATE,
    Is_current BOOLEAN Not NulL);
INSERT INTO Financial_Year Values(1,'2020-2021 ','2020-04-01','2021-03-31','2021-07-31',FALSE);
INSERT INTO Financial_Year Values(2,'2021-2022 ','2021-04-01','2022-03-31','2022-07-31',FALSE);
INSERT INTO Financial_Year Values(3,'2022-2023 ','2023-04-01','2023-03-31','2023-07-31',FALSE);
INSERT INTO Financial_Year Values(4,'2023-2024 ','2024-04-01','2024-03-31','2024-07-31',FALSE);
INSERT INTO Financial_Year Values(5,'2024-2025 ','2025-04-01','2025-03-31','2025-07-31',TRUE);


CREATE TABLE Income_Record(
	income_id INT Primary Key,
    taxpayer_id INT Not Null,
    income_source VARCHAR(100) Not Null,
    category_name VARCHAR(50) Not Null,
    amount DECIMAL(12,2) Not Null,
    recieved_date DATE Not Null,
    financial_year VARCHAR(9) Not Null);
INSERT INTO Income_Record Values(1001,101,'TechNova_Solutions','Salary','850000.00','2026-03-31','2025-2026');
INSERT INTO Income_Record Values(1002,102,'City Care Hospital','Salary','1200000.00','2026-03-31','2025-2026');
INSERT INTO Income_Record Values(1003,103,'Reddy Enterprises','Business','1800000.00','2026-03-31','2025-2026');
INSERT INTO Income_Record Values(1004,104,'Sunrise School','Salary','620000.00','2026-03-31','2025-2026');
INSERT INTO Income_Record Values(1005,105,'Web Design Projects','Business','750000.00','2026-03-31','2025-2026');
INSERT INTO Income_Record Values(1006,106,'Professional Consulting','Business','1500000.00','2026-03-31','2025-2026');

INSERT INTO TAXPAYER Values(107,'GHIJKL789M','Likhita','2007-5-16','Singer','2000000','likhi@example.com',TRUE);
UPDATE TAXPAYER SET annual_income=950000.00 WHERE taxpayer_id=101;
UPDATE TAXPAYER SET ocuupation='Software Consultant' WHERE taxpayer_id=105;
UPDATE TAXPAYER SET is_active=TRUE WHERE taxpayer_id=106;
DELETE FROM TAXPAYER WHERE taxpayer_id=107;
INSERT INTO Income_Category Values(7,'Rental Income','Income Recieved from rented property',TRUE);


    

    ALTER TABLE TAXPAYER ADD Phone_Number VARCHAR(15);
    ALTER TABLE Income_Record ADD remarks VARCHAR(200);
    ALTER TABLE TAXPAYER MODIFY ocuupation VARCHAR(100);
    
    CREATE TABLE Tax_Office(
				OFFICE_ID INT Primary Key,
                office_name VARCHAR(50) Not NULL,
                city VARCHAR(15) Not Null);
                
	INSERT INTO Tax_Office VALUES(1,'INFOSIS','VIZAG');
    INSERT INTO Tax_Office VALUES(2,'FLIPKART','TUNI');
    TRUNCATE TABLE Tax_Office;
    DROP TABLE Tax_Office;
    
    
    
    