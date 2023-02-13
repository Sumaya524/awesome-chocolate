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