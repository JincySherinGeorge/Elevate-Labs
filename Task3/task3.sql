select * from customer;

select * from customer where age>35 and age<50;
orderscustomer
select * from customer where age>35 and age<50 order by age asc;

select age,count(*) from customer group by age order by age;

SELECT o.Or_ID, c.C_Name FROM orders o INNER JOIN customer c ON o.C_ID = c.C_ID;

SELECT * FROM customer WHERE C_ID = (
    SELECT C_ID FROM orders WHERE Or_ID = 'OR_31003479'
);

SELECT * FROM product WHERE Price > (
    SELECT AVG(Price) FROM product
);

SELECT monthname(ORDER_DATE) AS MONTH,SUM(QTY) AS COUNT FROM ORDERS GROUP BY MONTH(ORDER_DATE), MONTHNAME(ORDER_DATE)
ORDER BY MONTH(ORDER_DATE);
 
 #moNTHLY oRDER sUMMARY
 CREATE VIEW Monthly_Order_Summary AS
SELECT 
    YEAR(ORDER_DATE) AS Year,
    MONTHNAME(ORDER_DATE) AS Month,
    SUM(Qty) AS TotalQuantity
FROM orders
GROUP BY YEAR(ORDER_DATE), MONTH(ORDER_DATE), MONTHNAME(ORDER_DATE);

SELECT * FROM Monthly_Order_Summary;

CREATE VIEW Customer_Order_Totals AS
SELECT 
    c.C_ID,
    c.C_Name,
    SUM(o.Qty) AS TotalQuantity
FROM customer c
JOIN orders o ON c.C_ID = o.C_ID
GROUP BY c.C_ID, c.C_Name;

SELECT * FROM Customer_Order_Totals;


CREATE INDEX idx_orders_customer_id ON orders(C_ID);

SELECT * 
FROM customer c
JOIN orders o ON c.C_ID = o.C_ID;