SELECT * FROM pizza_sales;

------#Totall Revenue

SELECT SUM(total_price) AS Total_Revenue 
FROM pizza_sales;

----#AVG Order Value

Select sum(total_price) / COUNT(DISTINCT order_id)  AS  Average_Order_Value
FROM pizza_sales;

----#Total Price Sold

SELECT SUM(quantity) AS Total_Pizza_Sold  FROM pizza_sales;


------# TOtall Order

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;


---#-Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))  /
CAST(COUNT(DISTINCT order_id)  AS DECIMAL(10,2)) AS DECIMAL(10,2)) ASAverage_Pizza_Sales
FROM pizza_sales;

----Chart Requirement----

--#Daily Trend for Total Orders


SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id)
AS Total_Orders
FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY DATENAME(DW, order_date)
ORDER BY COUNT(DISTINCT order_id) DESC;


--#Montly Trend for Total Orders

SELECT DATENAME(MONTH, order_date) AS MONTH_NAME, COUNT(DISTINCT order_id)
AS Total_Orders
FROM pizza_sales
GROUP BY  DATENAME(MONTH, order_date)
ORDER BY COUNT(DISTINCT order_id) DESC;

--#Percentage of sales by pizza Category

SELECT pizza_category, SUM(total_price) AS total_sales, SUM(total_price) * 100 /
(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS pct
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

SELECT pizza_category, SUM(total_price) AS total_sales, SUM(total_price) * 100 /
(SELECT SUM(total_price) FROM pizza_sales  WHERE DATEPART(QUARTER,order_date) = 1) AS pct
FROM pizza_sales
WHERE DATEPART(QUARTER,order_date) = 1
GROUP BY pizza_category



--#Percentage of sales by pizza size


SELECT pizza_size, SUM(total_price) AS total_sales,CAST( SUM(total_price) * 100 /
(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(quarter, order_date) = 1) AS DECIMAL (10, 2)) AS pct
FROM pizza_sales
WHERE DATEPART(quarter, order_date) = 1
GROUP BY pizza_size
ORDER BY pct DESC ;

--#Top 5 best seller by revenue,total quantity and total orders


SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC;

--#Top 5 best seller by revenue,total quantity and total orders

SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ;




--#Top 5 Pizzas by quantitys

SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ;

SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC;

--#. Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;







