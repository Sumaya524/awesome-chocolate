show tables; -- Show tables

desc sales; -- Describe tables

-- Select everthing from sales table
select * FROM sales;

-- Select just a few columns from sales table
select SaleDate, Amount, Customers from sales;

-- Adding a calculated  Naming column with AS in SQL
select SaleDate, Amount, Boxes, Amount/Boxes as 'Amount per box'  from sales;

-- Using WHERE Clause in SQL
select *
from sales
where Amount >10000;

-- Showing sales data where amount is greater than 10,000 by descending order
select * from sales
where Amount >10000
order by Amount desc;

-- Showing sales data where GeoID is g1 by product id PID
-- descending order of amounts
select *
from sales
where GeoID='g1' 
order by PID, Amount desc;

-- Working with dates in SQL
select *
from sales
where Amount >10000 AND SaleDate>='2022-01-01';

-- Using year() fucntion to select all data in a specific year
-- descending order of amounts
select *
from sales
where Amount >10000 AND year(SaleDate)=2022
order by Amount desc;

-- BETWEEN condition in SQL with < & > opertors
select *
from sales
where Boxes>0 and Boxes <=50;

-- Using BETWEEN operator in SQL
select *
from sales
where Boxes between 0 and 50;

-- Using weekday() function  Friday as day of week  in SQL
select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of Week'
from sales
where weekday(SaleDate)=4;

-- Working with people table
select * from people;

-- OR Operator
select * from people
where Team='Delish' OR Team='Jucies';

-- IN operator
select * from people
where Team in ('Delish', 'Jucies');

-- LIKE operator in SQL
-- Salesperson name starts with B using LIKE operator
select * from people
where Salesperson like 'B%';

select * from people
where Salesperson like '%B%';


select * from sales;
-- Using CASE to create branching logic in SQL
select  SaleDate, Amount,
		case when amount <1000 then 'Under 1k'
             when amount <5000 then 'Under 5k'
             when amount <10000 then 'Under 10k'
         else '10k or more'
       end   as 'Amount Category'
       
       from sales;
       

-- JOINS
select * from geo;
select * from sales;

select * from people;
-- We are going to JOIN sales table with the people table
select sales.SaleDate, sales.Amount, people.Salesperson,people.SPID,sales.SPID
from sales 
inner join people  on people.SPID=sales.SPID;

-- INNER JOIN
select * from sales;
select * from products;
-- We are going to do LEFT JOIN sales table with products table
select sales.SaleDate, sales.Amount, products.Product
from sales
left join products on
sales.PID= products.PID;

-- Multiple JOINS
select people.Salesperson, people.Team, products.Product, sales.SaleDate, sales.Amount
from sales 
join people on 
sales.SPID=people.SPID
JOIN products on
sales.PID=products.PID;

-- Multiple JOINS with Conditions 
select people.Salesperson, people.Team, products.Product, sales.SaleDate, sales.Amount
from sales 
join people on 
sales.SPID=people.SPID
JOIN products on
sales.PID=products.PID
where sales.Amount <500  and people.Team= 'Yummies';

-- Multiple JOINS with Conditions
select people.Salesperson, people.Team, products.Product, sales.SaleDate, sales.Amount
from sales 
JOIN people on 
sales.SPID=people.SPID
JOIN products on
sales.PID=products.PID
where sales.Amount <500  and people.Team='';

-- GEO TABLE
select people.Salesperson, people.Team, products.Product, sales.SaleDate, sales.Amount
from sales 
JOIN people on 
sales.SPID=people.SPID
JOIN products on
sales.PID=products.PID
JOIN geo on
sales.GeoID=geo.GeoID
where sales.Amount <500  and people.Team='' and geo.Geo in( 'USA', 'Canada')
order by SaleDate;

-- GROUP BY
select (GeoID), sum(Amount),avg(Amount), sum(Boxes)
from sales
group by GeoID
order by COUNT(GeoID) desc;

-- GROUP BY country using joins 
select geo.Geo, sum(Amount), avg(Amount), sum(Boxes)
from sales
join geo ON
sales.GeoID=geo.GeoID
group by Geo;

-- People and Product table JOINS and GROUP BY,ORDER BY
select products.Category, people.Team, sum(Amount), sum(Boxes)
from sales
JOIN people ON
sales.SPID=people.SPID
JOIN products ON
sales.PID=products.PID
group by products.Category, people.Team
order by products.Category, people.Team;

-- Total amounts by top 10 products 
select products.Product, sum(Amount) as 'Total Amount'
from sales
JOIN products ON
sales.PID=products.PID
group by products.Product
order by 'Total Amount' desc
limit 10;


-- Print details of shipments(sales) where amount are >2000 and boxes are <100
select *
from sales
where Amount>2000 and Boxes<100;

-- How many shipments(sales) each of the sales persons had in the month of January 2022
select people.Salesperson, count(*) AS 'shipment count'
from sales
JOIN people ON
sales.SPID=people.SPID 
where SaleDate BETWEEN '2022-01-01' and '2022-01-31'
group by people.Salesperson; 

-- Which product sells more boxes? Milk bars or Eclairs?
select products.Product, sum(Boxes) as 'Total Boxes'
from sales
JOIN products ON
sales.PID=products.PID
where products.Product in('Milk Bars', 'Eclairs')
group by products.Product
order by products.Product desc;

-- Which product sold more boxes in the first 7 days of February 2022 ? Milk Bars or Eclairs ?
select products.Product, sum(Boxes) as 'Total Boxes'
from sales
JOIN products ON
sales.PID=products.PID
where products.Product IN('Milk Bars', 'Eclairs')
and SaleDate BETWEEN '2022-01-01' and '2022-01-07'
group by products.Product;

-- Which shipment had under 100 customers & under 100 boxes ? 
select *
from sales
where Customers <100 and Boxes <100;

-- What are the names of salesperson who had at least one shipment (sale) in the last 7 days
select distinct people.Salesperson
from sales 
JOIN people ON
sales.SPID=people.SPID
where SaleDate BETWEEN '2022-01-01' and '2022-01-07';








     



     
     
     



















