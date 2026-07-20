---Created the sunrise schema---
create schema sunrise

set search_path to sunrise

---Created the customers table to store customer: ids,names,emails,phone numbers and location information---
create table sunrise.customers(
customer_id INT primary key,
full_name VARCHAR(80) not null,
email VARCHAR(90) unique,
phone_number VARCHAR(90) unique,
location CHAR(60) not NULL
);


---Created the products table---
create table sunrise.products(
product_id INT primary key,
product_name VARCHAR(80) not null,
category CHAR(80) not null,
unit_price NUMERIC(8,2) CHECK(unit_price>0),
stock INT default 0
);


---Created orders table---
CREATE TABLE sunrise.orders (
    order_id INT PRIMARY KEY,
    customer_id INT references sunrise.customers(customer_id),
    order_date DATE not NULL,
    status VARCHAR(20) default 'Pending'
);


-- Created order items table ---
CREATE TABLE sunrise.order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT references sunrise.orders,
    product_id INT references sunrise.products,
    quantity INT check(quantity>0)
);


---PART 1---

---Renamed the stock column in products table to stock_quantity---
alter table products 
rename column stock to stock_quantity

---Created a new column loyality points in customers tab;e---
alter table customers 
add column loyality_points INT default 0;

---Changed the length of product name column---
alter table products
alter column product_name type VARCHAR(150);


---	PART 2---

---Inserted some values to the customers table---
insert into sunrise.customers(customer_id,full_name,email,phone_number,location)
values 
(1,'Grace Wambui','grace.wambui@gmail.com',0711223344,'Nairobi'),
(2,'Kevin Mutiso','kevin.mutiso@gmail.com',0722334455,'Nakuru'),
(3,'Faith Chebet','faith.chebet@gmail.com',0733445566,'Eldoret'),
(4,'Ibrahim Noor','ibrahim.noor@gmail.com',0744556677,'Mombasa');

-- Inserted sample records to the products table---
INSERT INTO sunrise.products(product_id, product_name, category, unit_price, stock) VALUES
(1, 'Maize Flour 2kg', 'Groceries', 180.00, 50),
(2, 'Cooking Oil 1L', 'Groceries', 320.00, 30),
(3, 'Bathing Soap', 'Toiletries', 85.00, 100),
(4, 'Notebook A4', 'Stationery', 60.00, 200);

---Inserted records to the orders table---
INSERT INTO orders (order_id, customer_id, order_date, status) VALUES 
(1, 1, '2024-03-01', 'Delivered'),
(2, 2, '2024-03-02', 'Pending'),
(3, 1, '2024-03-03', 'Delivered'),
(4, 3, '2024-03-04', 'Cancelled');

-- Inserted records to the order items table---
INSERT INTO sunrise.order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 1),
(4, 3, 4, 5);

---Chaged status foe order id 4---
update orders 
set status = 'Delivered'
where order_id = 4;

---Deleted the cancelled order from both the orders table and the order items table---
delete from order_items
where order_id= 4;

delete from orders
where order_id= 4;


----PART 3---

---Show products priced above 100---
select product_name,unit_price
from products
where unit_price > 100;

---Show customers who are NOT from Nairobi---
select full_name, location
from customers
where location != 'Nairobi';

---Show products priced between 60 and 200---
select product_name,unit_price
from products
where unit_price between 60 and 200;

---Show customers from Nairobi Nakuru and Mombasa
select full_name,location
from customers 
where location in ('Nairobi','Nakuru','Mombasa');

---show products having the name'Oil' in them--
select product_name 
from products 
where product_name like '%Oil%';

---Show orders that are of pending status---
select order_date,order_id,status
from orders 
where status = 'Pending'
order by order_date desc;

---Show the two most expensive products---
select product_name,unit_price
from products 
order by unit_price desc 
limit 2;

---Show how many orders each customer placed---
select customer_id,COUNT(order_id) as total_orders
from orders
group by customer_id;

---Show customers who placed more than One order---
select customer_id,COUNT(order_id) as total_orders
from orders
group by customer_id
having COUNT(order_id) > 1;


---PART 5---

---Connect customers and orders table using inner join---
select c.full_name,o.order_id,o.status
from orders o
inner join customers c
on c.customer_id=o.customer_id;

---Join orders table with order_items using a left join---
select * 
from orders o
inner join order_items i
on o.order_id=i.order_id;

---Show product name from products table and quantity from order items---
select p.product_name,i.quantity
from products p
inner join order_items i
on p.product_id=i.product_id;

---Join all tables together while showing customer name order id, product name and quantity---
SELECT  c.full_name,o.order_id,p.product_name,i.quantity
FROM orders o
INNER JOIN customers c ON c.customer_id = o.customer_id 
INNER JOIN order_items i ON o.order_id = i.order_id
INNER JOIN products p ON p.product_id = i.product_id;

---Show total quantity grouped by product name
SELECT p.product_name,SUM(i.quantity) as total_quantity
FROM orders o
INNER JOIN customers c ON c.customer_id = o.customer_id 
INNER JOIN order_items i ON o.order_id = i.order_id
INNER JOIN products p ON p.product_id = i.product_id
group by (p.product_name);




select * FROM customers;