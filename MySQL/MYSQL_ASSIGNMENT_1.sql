
show databases;

use CLASS0607;

select DATABASE();

show TABLES;

create table product(
code int not null auto_increment,
name varchar(15),
price int,
manufacturer int,
primary key(code)
);

show tables;


insert into product (name,price,manufacturer) values
("HARD DRIVE",240,5),
("MEMORY",120,6),
("ZIP DRIVE",150,4),
("FLOPPY DISK",5,6),
("MONITOR",240,1),
("DVD DRIVE",180,2),
("CD DRIVE",90,2),
("PRINTER",270,3),
("TONER CARTRIDGE",66,3),
("DVD BURNER",180,2);

select * from PRODUCT;


create table Manufactures(
code int ,
name varchar(15)
);

insert into manufactures(code , name) values
(1,"Sony"),
(2,"Creative Labs"),
(3,"Hewlett Packard"),
(4,"Lomega"),
(5,"Fujitsu"),
(6,"Winchester");

select * from manufactures ;

# ANSWER THE QUESTIONS

-- Q.1 Select the names of all the products in the store.

select name from product;

-- Q.2 Select the names and the prices of all the products in the store

select NAME , PRICE from product;

-- Q.3 Select the name of the products with a price less than or equal to $200.

select NAME from product where PRICE <= 200;

-- Q.4 Select all the products with a price between $60 and $120

select * from PRODUCT where PRICE between 60 AND 120 ;

-- Q.5 Select the name and price in cents (i.e. the price must be multiplied by 100).

select NAME , PRICE ,concat("PRICE IN CENTS: ",PRICE*100)  from PRODUCT 

-- Q.6 Compute the average price of all the products.

select avg(price) from product ;

-- Q.7 Compute the average price of all products with manufacturer code equal to 2.

select AVG(PRICE) from PRODUCT 
where MANUFACTURER = 2;

-- Q.8 Compute the number of products with a price larger than or equal to $180.

select COUNT(PRICE) from product 
where PRICE >=180;

-- Q.9 Select the name and price of all products with a price larger than or 
-- 	   equal to $180, and sort first by price (in descending order), and then by 
-- 	   name (in ascending order).

select NAME , PRICE from PRODUCT 
where PRICE >=180 order by PRICE desc , NAME ASC ;

-- Q.10 Select all the data from the products, including all the data for each product's manufacturer.

select * from product 
join manufactures 
on PRODUCT.CODE = MANUFACTURES.CODE;

-- Q.11 Select the product name, price, and manufacturer name of all the products.

select PRODUCT.NAME , PRODUCT.PRICE , MANUFACTURES.NAME
from product 
inner join manufactures 
on PRODUCT.CODE = MANUFACTURES.CODE;

-- Q.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.

desc product ;
select MANUFACTURER , AVG(PRICE) from product
group by MANUFACTURER order by MANUFACTURER;

-- Q.13 Select the average price of each manufacturer's products, showing the manufacturer's name.

select PRODUCT.NAME , AVG(PRODUCT.PRICE) , MANUFACTURES.NAME
from product 
inner join manufactures 
on PRODUCT.CODE = MANUFACTURES.CODE
group by MANUFACTURES.NAME
order by AVG(PRODUCT.PRICE) DESC;

-- Q.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.

select PRODUCT.NAME , AVG(PRODUCT.PRICE) ,MANUFACTURES.NAME  
from product 
inner join manufactures 
on PRODUCT.CODE = MANUFACTURES.CODE
group by MANUFACTURES.NAME
having AVG(PRODUCT.PRICE)>=150;

-- Q.15 Select the name and price of the cheapest product.

select NAME , PRICE from product 
where PRICE = (select MIN(PRICE) from PRODUCT); 

# ANOTHER SOLUTION 
SELECT NAME , PRICE FROM PRODUCT ORDER BY PRICE ASC limit 1;

-- Q.16 .Select the name of each manufacturer along with the name and price of its most expensive product.

select MANUFACTURES.NAME , PRODUCT.NAME , MAX(PRODUCT.PRICE) 
from product 
join manufactures 
on PRODUCT.CODE = MANUFACTURES.CODE
group by MANUFACTURES.NAME;

-- Q.17 . Add a new product: Loudspeakers, $70, manufacturer 2.

insert into PRODUCT (NAME,PRICE,MANUFACTURER)
values ("LOUD_SPEAKER",70,2);

select * from PRODUCT;

-- Q.18 Update the name of product 8 to "Laser Printer".

update product set name="LASER PRINTER" where CODE = 8;

select * from PRODUCT;

-- Q.19 Apply a 10% discount to all products.

select CODE , NAME , PRICE*10/100 as DISCOUNT_PRICE, 
PRICE*90/100 as SELLING_PRICE from product ; 

update PRODUCT set PRICE = PRICE*90/100;

select * from PRODUCT

-- Q.20 .Apply a 10% discount to all products with a price larger than or equal to $120

select CODE , NAME , PRICE ,PRICE*10/100 as DISCOUNT_PRICE, 
PRICE*90/100 as SELLING_PRICE from PRODUCT where PRICE>=120;

-- END --