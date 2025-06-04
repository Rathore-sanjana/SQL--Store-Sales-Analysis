
-- Total sales, profit, and quantity per month.
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,
SUM(Amount) AS Total_Sales,
SUM(Profit) AS Total_Profit,
SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY Month
ORDER BY Month;

-- Which category and sub-category generate the highest total profit?
SELECT Category , 'Sub-Category' , 
SUM(Profit) as Total_Profit
FROM sales
GROUP BY Category , 'Sub-Category'
ORDER BY Total_Profit DESC LIMIT 1;

-- Which product sub-categories have the lowest profit margins?
SELECT `Sub-Category`,
SUM(Profit) AS Total_Profit,
SUM(Amount) AS Total_Sales,
round(((SUM(Profit) / SUM(Amount)))*100, 2) AS Profit_Margin
FROM sales 
GROUP BY `Sub-Category`
ORDER  BY Profit_Margin asc limit 5;

-- Calculate the average order value (AOV) per payment mode.
SELECT PaymentMode,
ROUND(AVG(Quantity),1) AS Avg_Order_Value
FROM sales
GROUP BY PaymentMode
ORDER BY Avg_Order_Value DESC;

-- Which state contributed most to total sales? List top 5.
SELECT State,
SUM(Amount) AS Total_sales
FROM sales
GROUP BY State
ORDER BY Total_sales DESC LIMIT 5;

-- Monthly sales trend with month-over-month growth.
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS 'Month_Of_Year',
SUM(Amount) AS Total_Sales,
ROUND((SUM(Amount) - LAG(SUM(Amount)) OVER(ORDER BY DATE_FORMAT(`Order Date`, '%Y-%m'))) * 100 / LAG(SUM(Amount)) OVER(ORDER BY DATE_FORMAT(`Order Date`, '%Y-%m')),2)
AS Monthly_Sales_Trend
FROM sales 
GROUP BY DATE_FORMAT(`Order Date`, '%Y-%m');

-- Profit trend over time for each category.
SELECT DATE_FORMAT(`Order Date`, '%Y-%m') AS 'Month_Of_Year',
Category,
SUM(Profit) AS Total_Profit,
(SUM(Profit) - LAG(SUM(Profit)) OVER(PARTITION BY Category ORDER BY DATE_FORMAT(`Order Date`, '%Y-%m') )) * 100 / 
LAG(SUM(Profit)) OVER(PARTITION BY Category ORDER BY DATE_FORMAT(`Order Date`, '%Y-%m') )
AS Profit_Trend 
FROM sales
GROUP BY Category ,DATE_FORMAT(`Order Date`, '%Y-%m') ;

-- Top 10 customers by lifetime value (total amount spent).
SELECT CustomerName,
SUM(Amount) AS Total_Amount_Spent
FROM sales 
GROUP BY CustomerName
ORDER BY SUM(Amount) DESC LIMIT 10;

-- How many customers placed more than 5 orders?
SELECT COUNT(*) 
FROM(
	SELECT CustomerName,
	count(`Order ID`) as Total_Orders
	FROM sales
	GROUP BY CustomerName
	HAVING count(`Order ID`) > 5
    ) AS TOTAL_ORDER;

-- Average basket size (total quantity per order) by customer segment.
SELECT CustomerName,
ROUND(SUM(Quantity) / COUNT(DISTINCT `Order ID`), 1) AS Avg_Basket_Size
FROM sales
GROUP BY CustomerName
ORDER BY Avg_Basket_Size DESC;

-- Do certain customers prefer specific payment modes more often?
SELECT CustomerName,
PaymentMode,
COUNT(PaymentMode) AS Times_Used
FROM sales
GROUP BY  PaymentMode , CustomerName 
ORDER BY COUNT(PaymentMode) DESC;

-- Which sub-categories are more popular in which states?
SELECT * FROM sales;
SELECT * FROM (
	SELECT `Sub-Category`,
	COUNT(`Sub-Category`) AS Total_Consumption,
	State,
	row_number() OVER(PARTITION BY State ORDER BY COUNT(`Sub-Category`)) AS Row_Num
	FROM sales
	GROUP BY State, `Sub-Category`)
AS Most_Popular
WHERE Row_Num = 12;

-- What is the average order quantity for each sub-category?
SELECT AVG(Quantity) AS Avg_Order,
`Sub-Category`
FROM sales 
GROUP BY `Sub-Category`
ORDER BY AVG(Quantity) DESC;

-- Which combination of category and payment mode is most profitable?
SELECT Category,
PaymentMode,
SUM(Profit) AS Total_Profit
FROM sales
GROUP BY PaymentMode, Category
ORDER BY SUM(Profit) DESC LIMIT 1;

-- Which sub-category has the highest profit per unit sold?
SELECT `Sub-Category`,
SUM(Profit) AS Total_Profit,
SUM(Quantity) AS Total_Quantity,
(SUM(Profit) / SUM(Quantity)) AS Profit_per_unit
FROM sales
GROUP BY `Sub-Category`
ORDER BY SUM(Profit) / SUM(Quantity) DESC LIMIT 1;

-- Compare performance of top 3 sub-categories over time.
WITH Top_subCategory AS(
	SELECT `Sub-Category`,
	SUM(Profit) AS Total_Profit
	FROM sales
	GROUP BY `Sub-Category`
	ORDER BY SUM(Profit) DESC LIMIT 3)
SELECT DATE_FORMAT(`Order Date` , '%Y-%m') AS Month,
`Sub-Category`,
SUM(Profit) AS Total_Profit
FROM sales
WHERE `Sub-Category` IN (
	SELECT `Sub-Category` FROM Top_subCategory)
GROUP BY DATE_FORMAT(`Order Date` , '%Y-%m'), `Sub-Category` 
ORDER BY DATE_FORMAT(`Order Date` , '%Y-%m'), `Sub-Category`;

-- Top 5 states with highest average profit margin.
SELECT State,
SUM(Profit) AS Total_Profit,
SUM(Amount) AS Total_Sales,
(SUM(Profit) * 100 / SUM(Amount)) AS Avg_profit_margin
FROM sales
GROUP BY State
ORDER BY Avg_profit_margin DESC LIMIT 5;

-- Calculate profit margin: (Profit / Amount) * 100 for each order and rank customers.
SELECT CustomerName,
ROUND(AVG(Profit * 100 / Amount), 1) AS Profit_margin_for_each_order,
RANK() OVER( ORDER BY AVG(Profit * 100 / Amount) DESC) AS Customer_rank
FROM sales
GROUP BY CustomerName
ORDER BY Profit_margin_for_each_order DESC;

-- Which cities have the best average profit per order?
SELECT City,
ROUND(AVG(Profit),2) AS avg_profit_per_order
FROM sales
GROUP BY City
ORDER BY avg_profit_per_order DESC LIMIT 1;

-- Which sub-categories have the highest variability in profit margins (using STDDEV)?
SELECT * FROM sales;
SELECT `Sub-Category` ,
ROUND(STDDEV(Profit * 100 / Amount ), 2) AS Variability_in_profit_margin
FROM sales
GROUP BY `Sub-Category`
ORDER BY Variability_in_profit_margin DESC LIMIT 1;

-- Calculate cumulative profit per month per category (running total).
SELECT Category,
`Year-Month`,
SUM(Profit) AS Monthly_Profit,
SUM(SUM(Profit)) OVER (PARTITION BY Category ORDER BY `Year-Month`) AS Cumulative_Profit
FROM sales
GROUP BY Category, `Year-Month`
ORDER BY Category, `Year-Month`;

-- Perform RFM (Recency, Frequency, Monetary) analysis using Order Date and Amount.
SELECT CustomerName,
DATEDIFF(CURDATE(), MAX(`Order Date`)) AS Recency,
COUNT(*) AS Frequency,
SUM(Amount) AS Monetary
FROM sales
GROUP BY CustomerName;














