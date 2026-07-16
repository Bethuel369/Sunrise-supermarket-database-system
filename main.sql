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




select * FROM sunrise.customers;