---Created the sunrise schema---
create schema sunrise

set search_path to sunrise

---Created the customers table to store customer: ids,names,emails,phone numbers and location information---
create table customers(
customer_id INT primary key,
full_name VARCHAR(80) not null,
email VARCHAR(90) unique,
phone_number VARCHAR(90) unique,
location CHAR(60) not NULL
);

---Inserted some values to the customers table---
insert into sunrise.customers(customer_id,full_name,email,phone_number,location)
values 
(1,'Grace Wambui','grace.wambui@gmail.com',0711223344,'Nairobi'),
(2,'Kevin Mutiso','kevin.mutiso@gmail.com',0722334455,'Nakuru'),
(3,'Faith Chebet','faith.chebet@gmail.com',0733445566,'Eldoret'),
(4,'Ibrahim Noor','ibrahim.noor@gmail.com',0744556677,'Mombasa');

---Created the products table---
create table sunrise.products(
product_id INT primary key,
product_name VARCHAR(80) not null,
category CHAR(80) not null,
unit_price NUMERIC(8,2) CHECK(unit_price>0),
stock INT default 0
);

-- Inserted sample records---
INSERT INTO sunrise.products(product_id, product_name, category, unit_price, stock) VALUES
(1, 'Maize Flour 2kg', 'Groceries', 180.00, 50),
(2, 'Cooking Oil 1L', 'Groceries', 320.00, 30),
(3, 'Bathing Soap', 'Toiletries', 85.00, 100),
(4, 'Notebook A4', 'Stationery', 60.00, 200);



---Created orders table---
CREATE TABLE sunrise.orders (
    order_id INT PRIMARY KEY,
    customer_id INT references sunrise.customers(customer_id),
    order_date DATE not NULL,
    status VARCHAR(20) default 'Pending'
);

-- Inserted sample records
INSERT INTO sunrise.orders (order_id, customer_id, order_date, status) VALUES
(1, 1, '2024-03-01', 'Delivered'),
(2, 2, '2024-03-02', 'Pending'),
(3, 1, '2024-03-03', 'Delivered'),
(4, 3, '2024-03-04', 'Cancelled');


-- Created order items table ---
CREATE TABLE sunrise.order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT references sunrise.orders,
    product_id INT references sunrise.products,
    quantity INT check(quantity>0)
);

-- Inserted sample records--
INSERT INTO sunrise.order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 1),
(4, 3, 4, 5);



select * FROM sunrise.customers;

