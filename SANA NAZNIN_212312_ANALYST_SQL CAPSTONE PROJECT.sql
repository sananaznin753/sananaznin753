create database ablejobs;

create table sales1(salesman_id int,name varchar(200),city varchar(200),commission decimal(5,2));
insert into sales1 values (5001,'james hoog','new york',0.15),(5002,'nail knite','paris',0.13),(5005,'pit alex','london',0.11),(5006,'mc lyon','paris',0.14),(5007,'paul adam','rome',0.13),(5003,'lauson hen','san jose',0.12);
select*from sales1;

create table sales2(customer_id int,cust_name varchar(200),city varchar(200),grade int,salesman_id int);
select*from sales2;

update sales1
set commission = 0.22
where name='pit alex';

set sql_safe_updates=0;

update sales1
set city='paris'
where salesman_id=5003;

update sales2
set grade=300
where cust_name ='graham zusi';

update sales2
set city='london'
where customer_id=3009;

select*from sales1
where city='paris' or city='rome';

select*from sales1
where city<>'paris' and city<>'rome';

select*from sales1
where commission between 0.12 and 0.14;

select*from sales1
WHERE name >= 'A' AND name < 'L';

SELECT*FROM SALES2
WHERE CUST_NAME LIKE 'B%';

SELECT*FROM SALES2
WHERE CUST_NAME LIKE '%N';

select*from sales1
WHERE NAME LIKE 'N__I%';

create table noble;
select*from noble;

select year,subject,winner
from noble
where year = 1970 or year = 1987;

select winner
from noble
where SUBJECT = 'literature' and year =1971;

select year,subject
from noble
where winner= 'Dennis Gabor';

select winner
from noble
where subject='physics' and year>= 1950;

select year, subject, winner,country
from noble
WHERE subject = 'Chemistry'
and year between 1965 and 1975;

select*from noble 
where category='prime minister' and year>1972;

select*from noble
where winner like 'louis%';

select*from noble
where winner='Johannes Georg Bednorz';

create table orders;
select*from orders;

select sum(purch_amt) as total_purchase_amount
from orders;

select round(avg(purch_amt),2) as average_purchase_amount
from orders;

SELECT COUNT(DISTINCT salesman_id) AS num_salespeople
FROM orders;

SELECT COUNT(DISTINCT customer_id) AS num_customers
FROM orders;

select*from noble 
WHERE (year = 1970 AND subject = 'Physics') OR (year = 1971 AND subject = 'Economics');

SELECT s1.name AS Salesman, s2.cust_name, s1.city
FROM sales1 s1
JOIN sales2 s2 ON s1.city = s2.city;

select  s2.Cust_Name, s1.city, s1.name as Salesman, s1.commission
from sales1 s1
join sales2 s2
on s1.salesman_id=s2.salesman_id;

select*from sales1
where commission>0.12;

select s2.Cust_Name, s2.city as customer_city, s1.name as Salesman, s1.city as salesman_city, s1.commission
from sales1 s1
join sales2 s2
on s1.salesman_id=s2.salesman_id
where s1.city<>s2.city 
and commission>0.12;

CREATE DATABASE ONLINE_BOOKSTORE;
USE ONLINE_BOOKSTORE;

CREATE TABLE CUSTOMERS (CUSTOMER_ID INT,CUSTOMER_NAME VARCHAR(50),CITY VARCHAR(50));
INSERT INTO CUSTOMERS VALUES (1,'John Smith','NewYork'),(2,'Jane Doe','Los Angeles'),(3,'Bob Johnson','Chicago');

CREATE TABLE ORDERS (OrderID INT,CustomerID INT,Product VARCHAR(200),Quantity INT,Price INT);
INSERT INTO ORDERS VALUES (1,1,'Laptop',2,340),(2,1,'Printer',1,240),(3,2,'Smartphone',3,70),(4,3,'Tablet',2,80);

SELECT distinct C.CUSTOMER_NAME
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID=O.CUSTOMERID
WHERE  PRICE>100;

SELECT O.PRODUCT
FROM CUSTOMERS C
JOIN ORDERS O
ON C.CUSTOMER_ID=O.CUSTOMERID
WHERE Customer_Name='JOHN SMITH';

SELECT PRODUCT,ORDERID,SUM(PRICE) AS TOT_ORDER_AMT
FROM ORDERS
GROUP BY PRODUCT,ORDERID,QUANTITY
HAVING QUANTITY>2;








