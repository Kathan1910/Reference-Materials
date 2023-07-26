
show databases;

use CLASS0607;

show TABLES;

select * from big_mart;

##  MYSQL PROJECT 1  ##

-- Q.1 WRITE a sql query to show all Item_Identifier.

select ITEM_IDENTIFIER from big_mart;

-- Q.2 WRITE a sql query to show count of total Item_Identifier

select count(ITEM_IDENTIFIER) from big_mart; 
             # OR
select count(*) from big_mart; 

-- Q.3 WRITE a sql query to show maximum Item Weight

select MAX(ITEM_WEIGHT) from big_mart;

-- Q.4 WRITE a query to show minimun Item Weight.

select MIN(ITEM_WEIGHT) from big_mart;

-- Q.5 WRITE a query to show average Item_Weight

select AVG(ITEM_WEIGHT) from big_mart;

-- Q.6 WRITE a query to show count OF Item_Fat_Content WHERE Item_Fat_Content IS Low Fat.

select COUNT(ITEM_FAT_CONTENT) from big_mart where Item_Fat_Content = 'Low Fat' ;

-- Q.7 WRITE a query to show count OF Item_Fat_Content WHERE Item_Fat_Content IS Regular

select COUNT(ITEM_FAT_CONTENT) from big_mart where Item_Fat_Content = 'REGULAR';

-- Q.8 WRITE a query TO show maximum Item_MRP

select MAX(ITEM_MRP) from big_mart;

-- Q.9 WRITE a query TO show minimum Item_MRP

select MIN(ITEM_MRP) from big_mart;

-- Q.10 WRITE a query to show Item_Identifier , Item_Fat_Content ,Item_Type,Item_MRP and Item_MRP IS greater than 200

select ITEM_IDENTIFIER , ITEM_FAT_CONTENT , ITEM_TYPE , ITEM_MRP from big_mart where Item_MRP > 200 ; 

-- Q.11 WRITE a query to show maximum Item_MRP WHERE Item_Fat_Content IS Low Fat

select MAX(ITEM_MRP) from big_mart where Item_Fat_Content = 'Low Fat' ; 

-- Q.12 WRITE a query to show minimum Item_MRp AND Item_Fat_Content IS Low Fat

select MIN(ITEM_MRP) from big_mart where Item_Fat_Content = 'LOW FAT';

-- Q.13 WRITE a query to show ALL DATA WHERE item MRP IS BETWEEN 50 TO 100

select * from big_mart where Item_MRP between 50 AND 100;

-- Q.14 WRITE a query to show ALL UNIQUE value Item_Fat_Content

select distinct (ITEM_FAT_CONTENT) from big_mart;

-- Q.15 WRITE a query to show ALL UNIQUE value Item_Type

select distinct (Item_Type) from big_mart;

-- Q.16 WRITE a query to show ALL DATA IN descending ORDER BY Item MRP

select * from big_mart order by Item_MRP desc; 

-- Q.17 WRITE a query to show ALL DATA IN ascending ORDER BY Item_Outlet_Sales

select * from big_mart order by Item_Outlet_Sales asc ;

-- Q.18 WRITE a query to show ALL DATA IN ascending BY Item_Type

select * from big_mart order by Item_Type asc ;

-- Q.19 WRITE a query to show DATA OF item_type dairy & Meat

select * from big_mart where Item_Type in ('DAIRY','MEAT');

-- Q.20 WRITE a query to show ALL UNIQUE value OF Outlet_Size

select distinct OUTLET_SIZE from big_mart;

-- Q.21 WRITE a query to show ALL UNIQUE value OF Outlet_Location_Type

select distinct Outlet_Location_Type from big_mart;

-- Q.22 WRITE a query to show ALL UNIQUE value OF Outlet_Type

select distinct Outlet_TYPE from big_mart;

-- Q.23 WRITE a query to show count NO. OF item BY Item_Type AND ordered it IN descending

select  ITEM_TYPE , COUNT(*) from big_mart group by Item_Type order by Item_Type desc;

-- Q.24 WRITE a query to show count NO. OF item BY Outlet_Size AND ordered it IN ascending

select  Outlet_Size , COUNT(*) from big_mart group by Outlet_Size  order by Outlet_Size Asc;

-- Q.25 WRITE a query to show count NO. OF item BY Outlet_Establishment_Year AND ordered it IN ascening

select  Outlet_Establishment_Year  , COUNT(*) from big_mart group by Outlet_Establishment_Year  
order by Outlet_Establishment_Year Asc;

-- Q.26 WRITE a query to show count NO. OF item BY Outlet_Type AND ordered it IN descending

select  Outlet_Type ,COUNT(*) from big_mart group by Outlet_Type order by Outlet_TYPE DEsc;

-- Q.27 WRITE a query to show count of item BY Outlet_Location_Type AND ordered it IN descending

select  Outlet_Location_Type  ,COUNT(*) from big_mart group by Outlet_Location_Type order by Outlet_Location_Type DEsc;

-- Q.28 WRITE a query to show maximum MRP BY Item_Type

select ITEM_TYPE,MAX(ITEM_MRP) from big_mart
group by Item_Type ;

-- Q.29 WRITE a query to show minimum MRP BY Item_Type

select ITEM_TYPE,MIN(ITEM_MRP) from big_mart
group by Item_Type ;

-- Q.30 WRITE a query to show minimum MRP BY Outlet_Establishment_Year AND ordered it IN descending
      
select Outlet_Establishment_Year,MIN(Item_MRP) from big_mart
group by Outlet_Establishment_Year
order by MIN(Item_MRP) desc ;

-- 31 WRITE a query to show maximum MRP BY Outlet_Establishment_Year AND ordered IN descending

select Outlet_Establishment_Year,max(ITEM_MRP) from big_mart
group by Outlet_Establishment_Year order by Outlet_Establishment_Year desc;

-- 32 WRITE a query to show average MRP BY Outlet_Size AND ordered IN descending

select Outlet_Size ,AVG(itEM_MRP) from big_mart 
group by Outlet_Size ORDER by Outlet_Size desc;

-- 33 WRITE a query to show average MRP BY Outlet_Size

select Outlet_Size,AVG(ITEM_MRP) from big_mart group by Outlet_Size 
order by AVG(ITEM_MRP) ;

-- 34 WRITE a query to show Average MRP BY Outlet_Type AND ordered IN ascending

select Outlet_Type ,AVG(ITEM_MRP) from big_mart group by Outlet_Type  
order by AVG(ITEM_MRP) ASC ;

-- 35 WRITE a query to show maximum MRP BY Outlet_Type

select Outlet_Type , MAX(ITEM_MRP) from big_mart group by Outlet_Type 
order by MAX(ITEM_MRP) ;

-- 36 WRITE a query to show maximum Item_Weight BY Item_Type 

select Item_Type ,MAX(ITEM_WEIGHT) from big_mart group by Item_TYPE 
order by MAX(Item_Weight) desc ;

-- 37 WRITE a query to show maximum Item_Weight BY Outlet_Establishment_Year 

select Outlet_Establishment_Year,MAX(ITEM_WEIGHT) from big_mart 
group by Outlet_Establishment_Year  
order by MAX(Item_Weight);

-- 38 WRITE a query to show minimum Item_Weight BY Outlet_Type 

select Outlet_Type , MIN(ITEM_WEIGHT) from big_mart
group by Outlet_Type 
order by MIN(Item_Weight); 

-- 39 WRITE a query to show average Item_Weight BY Outlet_Location_Type ORDER BY descending

select Outlet_Location_Type , AVG(ITEM_WEIGHT) from big_mart
group by Outlet_Location_Type  
order by AVG(Item_Weight) DESC; 

-- 40 WRITE a query to show maximum Item_Outlet_Sales BY Item_Type

select Item_Type, MAX(Item_Outlet_Sales) from big_mart
group by Item_Type 
order by MAX(Item_Outlet_Sales);

-- 41 WRITE a query to show minimum Item_Outlet_Sales BY Item_Type

select Item_Type, MIN(Item_Outlet_Sales) from big_mart
group by Item_Type 
order by MIN(Item_Outlet_Sales);

-- 42 WRITE a query to show minimum Item_Outlet_Sales BY Outlet_Establishment_Year

select Outlet_Establishment_Year , MIN(Item_Outlet_Sales) from big_mart
group by Outlet_Establishment_Year 
order by MIN(Item_Outlet_Sales);

-- 43 WRITE a query to show maximum Item_Outlet_Sales BY Outlet_Establishment_Year ordered BY descending

select Outlet_Establishment_Year , MAX(Item_Outlet_Sales) from big_mart
group by Outlet_Establishment_Year 
order by max(Item_Outlet_Sales) DESC;

-- 44 WRITE a query to show average Item_Outlet_Sales BY Outlet_Size AND ORDER it itn descending

select Outlet_Size , AVG(Item_Outlet_Sales) from big_mart
group by Outlet_Size 
order by AVG(Item_Outlet_Sales) DESC;

-- 45 WRITE a query to show average Item_Outlet_Sales BY Outlet_Size 

select AVG(ITEM_OUTLET_SALES) from big_mart
group by Outlet_Size ;

-- 46 WRITE a query to show average Item_Outlet_Sales BY Outlet_Type

select Outlet_Type ,AVG(Item_Outlet_Sales) from big_mart
group by Outlet_Type 
order by AVG(Item_Outlet_Sales) DESC;

-- 47 WRITE a query to show maximum Item_Outlet_Sales BY Outlet_Type

select Outlet_Type,MAX(Item_Outlet_Sales) from big_mart
group by Outlet_Type 
order by maX(Item_Outlet_Sales);

-- 48 WRITE a query to show total Item_Outlet_Sales BY

select SUM(ITEM_OUTLET_SALES) from big_mart;

-- 49 WRITE a query to show total Item_Outlet_Sales BY Item_Type

select Item_Type , SUM(ITEM_OUTLET_SALES) from big_mart
group by Item_Type ;

-- 50 WRITE a query to show total Item_Outlet_Sales BY Outlet_Location_Type

select Outlet_Location_Type  , SUM(ITEM_OUTLET_SALES) from big_mart
group by Outlet_Location_Type ;

-- 51 WRITE a query to show total Item_Outlet_Sales BY Item_Fat_Content

select Item_Fat_Content  , SUM(ITEM_OUTLET_SALES) from big_mart
group by Item_Fat_Content ;

-- 52 WRITE a query to show maximum Item_Visibility BY Item_Type

select Item_Type,MAX(ITEM_VISIBILITY) from big_mart 
group by Item_Type ;

-- 53 WRITE a query to show Minimum Item_Visibility BY Item_Type 

select Item_Type,MIN(ITEM_VISIBILITY) from big_mart 
group by Item_Type ;

-- 54 WRITE a query to show total Item_Outlet_Sales BY Item_Type but ONLY WHERE Outlet_Location_Type IS Tier 1

select Item_Type , SUM(ITEM_OUTLET_SALES) from big_mart
where Outlet_Location_Type = 'TIER 1'
group by Item_Type
order by SUM(ITEM_OUTLET_SALES) desc;

-- 55 WRITE a query to show total Item_Outlet_Sales BY Item_Type WHERE Item_Fat_Content IS ONLY Low Fat & LF

select Item_Type , SUM(ITEM_OUTLET_SALES) from big_mart
where Item_Fat_Content 
group by Item_Type
order by SUM(ITEM_OUTLET_SALES) desc;
