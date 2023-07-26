
show databases;

use CLASS0607;

show TABLES;

select * from nyc_1 ;
select * from nyc_2 ;

## MYSQL PROJECT 2 ##

-- Q.1 write query to show name from NYC_1

select NAME from nyc_1 ;

-- Q.2 write query to show count of id in nyc_1

select count(ID) from nyc_1 ; 

-- Q.3 write query to show count of id in nyc_2

select count(ID) from nyc_2 ; 

-- Q.4 write query to show host id in nyc_1

select HOST_ID from nyc_1 ;

-- Q.5 write query to show all unique host id from nyc_1

select distinct HOST_ID from nyc_1 ;

-- Q.6 write query to show all unique neighbourhood_group from nyc_1

select distinct neighbourhood_group from nyc_1 ;

-- Q.7 write query to show all unique neighbourhood from nyc_1

select distinct neighbourhood from nyc_1 ;

-- Q.8 write query to show room_type from nyc_1

select ROOM_TYPE from nyc_1;

-- Q.9 write query to show all values of Brooklyn & Manhattan from nyc_1

select * from nyc_1 where neighbourhood_group in ('Brooklyn' , 'Manhattan')
order by neighbourhood_group ;

-- Q.10 write query to show unique value of room type from nyc_1

select distinct ROOM_TYPE from nyc_1;

-- Q.11 write query to show maximum price from nyc_2

select MAX(PRICE) from nyc_2 ;

-- Q.12 write query to show minimum price from nyc_2

select min(price) from nyc_2;

-- Q.13 write query to show average price from nyc_2

select avg(price) from nyc_2 ;

-- Q.14 write query to show minimum value of minimum_nights from nyc_2

select min(minimum_nights) from nyc_2;

-- Q.15 write query to show maximum value of minimum_nights from nyc_2

select max(minimum_nights) from nyc_2;

-- Q.16 write query to show average availability_365

select avg(availability_365) from nyc_2;

-- Q.17 write query to show id , availability_365 and all availability_365 value is greater than 300

select id , availability_365 from nyc_2 
where availability_365 > 300;

-- Q.18 write query to show count of id where price is in between 300 to 400

select count(id) from nyc_2
where price between 300 and 400 ;

-- Q.19 write query to show count of id where minimum_nights spend is less than 5

select count(id) from nyc_2 
where minimum_nights < 5;

-- Q.20 write query to show count where minimum_nights spend is greater than 100

select count(id) from nyc_2 
where minimum_nights > 100;

-- Q.21 write query to show all data of nyc_1 & nyc_2

select nyc_1.* , nyc_2.* from nyc_1 
inner join nyc_2
on nyc_1.id = nyc_2.id ;

select * from nyc_1 
inner join nyc_2
on nyc_1.id = nyc_2.id ;

-- Q.22 write query to show host name and price

select nyc_1.host_name , nyc_2.price from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id ;

-- Q.23 write query to show room_type and price

select nyc_1.room_type , nyc_2.price from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id ;

-- Q.24 write query to show neighbourhood_group&minimum_nights spend

select nyc_1.neighbourhood_group,nyc_2.minimum_nights from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id ;

-- Q.25 write query to show neighbourhood & availability_365

select nyc_1.neighbourhood , nyc_2.availability_365  from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id ;

-- Q.26 write query to show total price by neighbourhood_group

select nyc_1.neighbourhood_group , sum(nyc_2.price) from nyc_1
inner join nyc_2 
on nyc_1.id = nyc_2.id
group by nyc_1.neighbourhood_group ;

-- Q.27 write query to show maximum price by neighbourhood_group

select NYC_1.neighbourhood_group ,MAX(NYC_2.price) from nyc_1 
inner join nyc_2 
on nyc_1.id = nyc_2.id
group by NYC_1.neighbourhood_group ;

-- Q.28 write query to show maximum night spend by neighbourhood_group

select NYC_1.neighbourhood_group ,MAX(NYC_2.minimum_nights) from nyc_1 
inner join nyc_2 
on nyc_1.id = nyc_2.id
group by NYC_1.neighbourhood_group ;

-- Q.29 write query to show maximum reviews_per_month spend by neighbourhood

select NYC_1.neighbourhood ,MAX(NYC_2.reviews_per_month) from nyc_1 
inner join nyc_2 
on nyc_1.id = nyc_2.id
group by NYC_1.neighbourhood;

-- Q.30 write query to show maximum price by room type

select NYC_1.room_type , MAX(NYC_2.price) from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
group by room_type ;

-- Q.31 write query to show average number_of_reviews by room_type

select NYC_1.room_type , AVG(NYC_2.number_of_reviews) from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
group by room_type ;

-- Q.32 write query to show average price by room type

select NYC_1.room_type , AVG(NYC_2.price) from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
group by room_type ;

-- Q.33 write query to show average night spend by room type

select NYC_1.room_type , AVG(NYC_2.minimum_nights) from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
group by room_type ;

-- Q.34 write query to show average price by room type but average price is less than 100

select NYC_1.room_type , AVG(NYC_2.PRICE) from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
group by room_type
having AVG(NYC_2.PRICE)<100;

-- Q.35 write query to show average night by neighbourhood and average_nights is greater than 5

select NYC_1.neighbourhood , AVG(NYC_2.minimum_nights) from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
group by NYC_1.neighbourhood 
having AVG(NYC_2.minimum_nights)>5;

-- Q.36 write query to show all data from nyc_1 and price is greater than 200 using sub-query

select ID from nyc_2 where PRICE > 200;

select * from nyc_1
where id in (select ID from nyc_2 where PRICE > 200);

-- Q.37 write query to show all values from nyc_2 table and host id is 314941

select ID from nyc_1 where host_id = 314941

select * from nyc_2 
where ID in (select ID from nyc_1 where host_id = 314941);

-- Q.38 Find all pairs of id having the same host id, each pair coming once only.

select distinct n.id , n.host_id 
from nyc_1 n, nyc_1 n1 
where  n.host_id = n1.host_id 
and n.id  <> n1.id  
order by host_id;

-- Q.39 write sql query to show fetch all records that have the term cozy in name

select * from nyc_1 where name like "%COZY%";

-- Q.40 write query to show price host id neighbourhood_group of manhattanneighbourhood_group

select NYC_1.host_id PRICE,NYC_2.price,NYC_1.neighbourhood_group from nyc_1
inner join NYC_2 
on nyc_1.id = nyc_2.id
where NYC_1.neighbourhood_group = 'MANHATTAN';

-- Q.41 write query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood also price is greater than 100

select NYC_1.host_id , NYC_1.host_name , NYC_1.neighbourhood ,NYC_2.price from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
where NYC_1.neighbourhood in ("Upper West Side" , "Williamsburg") and NYC_2.price > 100;

-- Q.42 write query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant

select NYC_1.host_id , NYC_1.host_name , NYC_1.neighbourhood ,NYC_2.price from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
where NYC_1.host_name  = "ELISE" and NYC_1.neighbourhood = 'Bedford-Stuyvesant';

-- Q.43 write query to show host_name,availability_365,minimum_nights only for 100+ availability_365 and minimum_nights

select NYC_1.host_name , NYC_2.availability_365 , NYC_2.minimum_nights from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
where NYC_2.availability_365 > 100 and NYC_2.minimum_nights >100;

-- Q.44 write query to show to fetch id ,host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+

select NYC_1.id , NYC_1.host_name , NYC_2.number_of_reviews , NYC_2.reviews_per_month from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
where NYC_2.number_of_reviews  < 500 and NYC_2.reviews_per_month > 5 ;


-- Q.45 write query to show neighbourhood_group which have most total number of review

select NYC_1.neighbourhood_group , SUM(NYC_2.number_of_reviews) from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
group by NYC_1.neighbourhood_group 
order by SUM(NYC_2.number_of_reviews) desc limit 1 ;

-- Q.46 write query to show host name which have most cheaper total price

select NYC_1.host_name , SUM(NYC_2.price) from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
group by NYC_1.host_name 
order by SUM(NYC_2.price) asc limit 1 ;

-- Q.47 write query to show host name which have most costly total price

select NYC_1.host_name , SUM(NYC_2.price) from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
group by NYC_1.host_name 
order by SUM(NYC_2.price) DESC limit 1 ;

-- Q.48 write query to show host name which have max price using subquery

select MAX(NYC_2.price) from nyc_2 

select NYC_1.host_name,NYC_2.price  from nyc_1
inner join nyc_2 
on nyc_1.id = nyc_2.id
where NYC_2.PRICE = (select MAX(NYC_2.price) from nyc_2 );

-- Q.49 write query to show neighbourhood_group which price are less than 100

select ID from nyc_2 where PRICE < 100

select NYC_1.neighbourhood_group , NYC_2.price from nyc_1
inner join nyc_2
on nyc_1.id = nyc_2.id
where NYC_1.id IN (select ID from nyc_2 where PRICE < 100);

-- Q.50 write query to find max price, average availability_365 for each room type and order in ascending by maximum price

select NYC_1.room_type,NYC_1.neighbourhood_group ,MAX(NYC_2.price) ,AVG(NYC_2.availability_365) from nyc_1
inner join nyc_2 
on nyc_1.id = nyc_2.id
group by NYC_1.room_type 
order by MAX(NYC_2.price) asc ;

-- END -- 