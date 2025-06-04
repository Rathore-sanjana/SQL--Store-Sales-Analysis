                                                      SQL Project – Sales Data Analysis

This project is based on a transactional retail dataset that records customer purchase details. The dataset consists of several fields capturing sales performance, profit metrics, product categorization, order timelines, customer demographics, and payment modes. This structured data enables holistic business analytics from multiple angles.Project Aim is to convert raw sales data into interactive insights and visual stories that support decision-makers in optimizing sales strategy, inventory management, and customer targeting.

📌 Dataset Columns and its description:

Order ID  :  Unique identifier assigned to each order

Amount  :  Total monetary value of each order

Profit  :  Net profit earned on the order

Quantity  :  Total number of items purchased

Category  :  Broad classification of product (e.g., Furniture, Technology)

Sub-Category  :  Specific type of product (e.g., Chairs, Phones)

PaymentMode  :  Method used to complete the purchase (Cash, Online, etc.)

Order Date  :  Date when the order was placed

CustomerName  :  Name of the customer

State  :  State where the order was shipped

City  :  City of delivery

Year-Month  :  Time-period format (e.g., 2024-07) derived from Order Date for time series analysis

     Problem Statement
                             
1.	Calculate total sales, profit, and quantity for each month.
2.	Which category and sub-category generate the highest total profit?
3.	Which product sub-categories have the lowest profit margins?
4.	Calculate the average order value (AOV) per payment mode.
5.	Which state contributed most to the total sales? List top 5.
6.	Calculate Monthly sales trend with month-over-month growth.
7.	Calculate Profit trend over time for each category.
8.	Calculate Top 10 customers by lifetime value (total amount spent)?
9.	How many customers placed more than 5 orders?
10.	Calculate Average basket size (total quantity per order) by customer segment.
11.	Do certain customers prefer specific payment modes more often?
12.	Which sub-category is popular in which states?
13.	What is the average order quantity for each sub-category?
14.	Which combination of category and payment mode is most profitable?
15.	Which sub-category has the highest profit per unit sold?
16.	Compare performance of top 3 sub-categories over time.
17.	Calculate Top 5 states with highest average profit margin.
18.	Calculate profit margin: (Profit / Amount) * 100 for each order and rank customers.
19.	Which city has the best average profit per order?
20.	Which sub-categories have the highest variability in profit margins (using STDDEV)?
21.	Calculate cumulative profit per month per category (running total).
22.	Perform RFM (Recency, Frequency, Monetary) analysis using Order Date and Amount.
    
                    
    Technology Used
   	

MySQL:

Used to write SQL queries for extracting insights such as:

•	Total Sales and Profit

•	Best Selling Categories and Sub-Categories

•	City- and State-wise Performance

•	Month-over-Month Sales Trends

•	Most Used Payment Modes

•	Customer Purchase Patterns

Excel:

For importing and reviewing the dataset
 
      Insights
                     
•	Identified top-performing categories and sub-categories, helping prioritize inventory and marketing strategies.

•	Revealed unprofitable segments and low-margin products, suggesting areas for cost control or price optimization.

•	Enabled data-driven decision-making by linking metrics (like AOV, profit margin, and order frequency) with operational strategies.

•	Flagged regions and payment modes contributing most to profitability, useful for regional sales targeting and payment gateway optimization.

•	Performed advanced analytics like RFM segmentation, MoM growth analysis, and running totals—demonstrating strong grasp of customer and sales lifecycle management.












