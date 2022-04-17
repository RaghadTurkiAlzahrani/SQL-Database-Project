create database store;
create table users(
id int primary key,
full_name varchar(20),
email varchar(20) unique,
gender char(10) check (gender='m' or gender='f'),
date_of_birth varchar (15),
created_at datetime,
country_code int); 
create table countries(
code int primary key,
name varchar (20) not null,
continent_name varchar(20) unique,
foreign key(code) references users(country_code) );
create table orders(
id int primary key,
user_id int,
status varchar(6) check (status='start' or status='finish'),
created_at datetime,
foreign key(user_id) references user (id));
create table order_products(
order_id int,
product_id int,
quantity int default 0,
primary key (order_id, product_id),
foreign key (order_id) references orders (id),
foreign key (product_id) references products (id)
);
create table products(
id int primary key,
name varchar (10) not null,
prince int default 0,
status varchar (10) check (status='expired' or status='valid'),
foreign key(product_id) references order_products (product_id));
insert into countries values(1,'Raghad','Riyadh');
select * from countries;
insert into users values(2,'Raghad Alzahrani','raghadturkialzahranii@gmail.com','f','17-12-1999',17-03-2022,1234);
select * from users;
insert into orders values(3,33,'start',17-03-2022);
select * from orders;
insert into products values(4,'Raghadd',100,'valid');
select * from products;
insert into order_products values(5,55,555);
select * from order_products;
update countries set name='Raghad Turki' where id='1';
select * from countries;
delete from products where id ='4';
select * from products;
alter table products
modify column created_at datetime DEFAULT CURRENT_TIMESTAMP;
alter table users
modify column created_at datetime DEFAULT CURRENT_TIMESTAMP;