 /* Q 1:what is the total revenue ? */
SELECT sum(total_price) as total_revenue from pizza_sales


  /*Q 2: What is the total average value ?*/
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales


 /* Q 3:what are the total pizzas sold?*/
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales


  /*Q 4: what are the total orders?*/
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales


  /*Q 5: what is the average pizzas per orders ?*/
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales


 /* Q 6: what is the daily trend for total orders ?*/
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)


  /*Q 7: what is the monthly trend for total orders ?*/
select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)


  /*Q 8 : what is the % of sales by pizza category ?*/
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category 
ORDER BY total_revenue desc


  /*Q 9 : what is the % of sales by pizza size ?*/
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size


 /*Q 10 : what are  the total pizza sold by pizza category ?*/
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category 
ORDER BY Total_Quantity_Sold DESC


  /*Q 11 : what are the top 5 pizzas by revenue ?*/
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC


  /*Q 12 : what are the bottom 5 pizzas by revenue ?*/
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC


 /* Q 13 : what are the top 5 pizzas by quantity ? */
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC


 /* Q 14 : what are the bottom 5 pizzas by quantity ?*/
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC


 /*Q 15 : what are the top 5 pizzas by total orders ?*/
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC


 /* Q 16 : what are the bottom 5 pizzas by total orders ?*/
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC


  /*Q 17 : what are the top 5  pizzas of classic category by total orders ?*/
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders 
