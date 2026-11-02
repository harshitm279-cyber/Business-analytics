
drop DATABASE retail_sales_db;
CREATE DATABASE retail_sales_db;
USE retail_sales_db;

CREATE TABLE sales (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Region VARCHAR(20),
    City VARCHAR(50),
    Sales_Channel VARCHAR(30),
    Category VARCHAR(50),
    Product VARCHAR(80),
    Quantity INT,
    Unit_Price DECIMAL(12,2),
    Discount_Rate DECIMAL(5,2),
    Revenue DECIMAL(14,2),
    Cost DECIMAL(14,2),
    Profit DECIMAL(14,2),
    Payment_Method VARCHAR(30),
    Sales_Rep VARCHAR(80)
);

SELECT COUNT(*) AS total_records
FROM sales;

SELECT
    SUM(Revenue) AS total_revenue,
    SUM(Profit) AS total_profit,
    SUM(Quantity) AS units_sold,
    COUNT(*) AS total_orders,
    ROUND(AVG(Revenue), 2) AS average_order_value
FROM sales;

SELECT
    Region,
    SUM(Revenue) AS total_revenue,
    SUM(Profit) AS total_profit
FROM sales
GROUP BY Region
ORDER BY total_revenue DESC;

SELECT
    Category,
    SUM(Quantity) AS units_sold,
    SUM(Revenue) AS total_revenue,
    SUM(Profit) AS total_profit
FROM sales
GROUP BY Category
ORDER BY total_revenue DESC;

SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS sales_month,
    SUM(Revenue) AS monthly_revenue,
    SUM(Profit) AS monthly_profit
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY sales_month;