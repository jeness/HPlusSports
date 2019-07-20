drop database if exists hplus;

create database hplus;

use hplus;


-- create tables
create table products(product_id integer primary key, product_name varchar(50), image_path varchar(100));


create table users(username varchar(50) primary key not null,password varchar(50),
 first_name varchar(50), last_name varchar(50),age integer,activity varchar(100));
 
 
create table orders(order_id int primary key auto_increment, product_name varchar(50), image_path varchar(50),order_date date, user_name varchar(50),
FOREIGN KEY (user_name) REFERENCES users(username));
 
-- insert statements

insert into users values('admin','admin','admin','admin',23,'gym');
insert into users values('admin1','admin1','admin1','admin1',32,'Playing a sport');

insert into orders values(1,"mineralwater-blueberry","images/mineralwater-blueberry.jpg",'2017-03-07','admin');
insert into orders values(2,"mineralwater-lemonlime","images/mineralwater-lemonlime.jpg",'2017-06-01','admin');
insert into orders values(3,"mineralwater-blueberry","images/mineralwater-blueberry.jpg",'2017-10-23','admin');
insert into orders values(4,"vitamin-bcomplex.jpg","images/vitamin-bcomplex.jpg",'2016-12-02','admin');
insert into orders values(5,"proteinbar-peanutbutter.jpg","images/proteinbar-peanutbutter.jpg",'2015-07-15','admin');
 
insert into products values(1,"mineralwater-blueberry","images/mineralwater-blueberry.jpg");
insert into products values(2,"mineralwater-lemonlime","images/mineralwater-lemonlime.jpg");
insert into products values(3,"mineralwater-orange","images/mineralwater-orange.jpg");
insert into products values(4,"mineralwater-peach","images/mineralwater-peach.jpg");
insert into products values(5,"mineralwater-raspberry","images/mineralwater-raspberry.jpg");
insert into products values(6,"mineralwater-strawberry","images/mineralwater-strawberry.jpg");
insert into products values(7,"proteinbar-chocolate","images/proteinbar-chocolate.jpg");
insert into products values(8,"proteinbar-lemon","images/proteinbar-lemon.jpg");
insert into products values(9,"proteinbar-peanutbutter","images/proteinbar-peanutbutter.jpg");
insert into products values(10,"vitamin-a","images/vitamin-a.jpg");
insert into products values(11,"vitamin-bcomplex","images/vitamin-bcomplex.jpg");
insert into products values(12,"vitamin-calcium","images/vitamin-c.jpg");





