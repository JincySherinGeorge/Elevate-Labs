CREATE DATABASE RETAILS_SALES;

USE RETAILS_SALES;

CREATE TABLE RETAILSALES(
row_id int(10) primary key auto_increment,
order_id VARCHAR(50),
order_date date, ship_date date,ship_mode varchar(10),
customer_id varchar(50),customer_name varchar(100),segment varchar(20),country varchar(100),city varchar(100),state varchar(100),
postal_code varchar(50),region varchar(100),product_id varchar(50),catgory varchar(100),sub_category varchar(100),p_name varchar(200),
sales float,
quantity int(5),
discount float(10),
profit float(10)
);

select * from RETAILSALES;

/*CHECKING NULL VALUES*/
SELECT *FROM RETAILSALES
WHERE order_date IS NULL or catgory IS NULL or sub_category IS NULL or sales IS NULL or quantity IS NULL or customer_id IS NULL;

/*profit margins by category and sub-category*/
SELECT catgory,sub_category,SUM(sales) AS TOTAL_SALE,SUM((SALES-PROFIT)) AS TOTAL_COST,sum(PROFIT) AS TOTAL_PROFIT,
CONCAT(ROUND(SUM(PROFIT)/SUM(sales) * 100 ,2),'%') AS PROFIT_MARGIN
FROM
RETAILSALES GROUP BY catgory,sub_category ORDER BY TOTAL_PROFIT DESC;

