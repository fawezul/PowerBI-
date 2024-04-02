--Selects every column in pizza sales table.
SELECT * FROM pizza_sales

--Total Revenue
SELECT sum(total_price) as Total_Revenue from pizza_sales

--Average price per Order
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value from pizza_sales

--Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizza_Sold from pizza_sales

--Total Orders
SELECT COUNT(DISTINCT order_id) from pizza_sales

--Average Pizza per order
SELECT SUM(quantity) / COUNT(DISTINCT order_id) from pizza_sales

--% of sales by category
SELECT (pizza_category), sum(total_price) as Sales_Category, sum(total_price) *100 / 
(SELECT sum(total_price) from pizza_sales WHERE month(order_date) =1) AS PCT_of_Total_Sales
from pizza_sales
WHERE month(order_date)=1
GROUP BY (pizza_category) 

--% sales by pizza Size
SELECT pizza_size, CAST(sum(total_price) AS DECIMAL (10,2)) as TotalPrice, CAST(sum(total_price) *100 / 
(SELECT sum(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT 
from pizza_sales
group by pizza_size
ORDER BY PCT DESC

--Top 5 seller pizzas by revenue, total quantity and total orders.

SELECT TOP 5 pizza_name, SUM (total_price) as Total_Revenue
from pizza_sales
group by pizza_name 
order by Total_Revenue DESC

SELECT TOP 5 pizza_name, SUM (quantity) as Total_QTY
from pizza_sales
group by pizza_name 
order by Total_QTY DESC

SELECT TOP 5 pizza_name, COUNT(DISTINCT(order_id)) as Total_Orders
from pizza_sales
group by pizza_name 
order by Total_Orders DESC
