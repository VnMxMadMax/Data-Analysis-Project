-- Creating a new database for Sales Analysis
CREATE DATABASE SalesAnalysis;
USE SalesAnalysis;

-- Viewing all data from the e-commerce sales table
SELECT * FROM ecommerce_sales_analysis;

-- 1️⃣ Identifying the Top Performing Product Categories
SELECT category, 
       SUM(sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4 + 
           sales_month_5 + sales_month_6 + sales_month_7 + sales_month_8 + 
           sales_month_9 + sales_month_10 + sales_month_11 + sales_month_12) AS total_sales
FROM ecommerce_sales_analysis
GROUP BY category
ORDER BY total_sales DESC;

-- Saving the output to a CSV file
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Top_Performing_Categories.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 2️⃣ Calculating Total Review Counts Per Category
SELECT category,
		SUM(review_count) AS total_review
FROM ecommerce_sales_analysis
GROUP BY category
ORDER BY total_review DESC;

-- Saving the output to a CSV file
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Review_Counts.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 3️⃣ Computing Average Review Score Per Category
SELECT category,
	   AVG(review_score) AS review_score
FROM ecommerce_sales_analysis
GROUP BY category
ORDER BY review_score DESC;

-- Saving the output to a CSV file
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Average_Review.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 4️⃣ Finding the Highest and Lowest Selling Products by Category
SELECT product_name,
		category,
       SUM(sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4 + 
           sales_month_5 + sales_month_6 + sales_month_7 + sales_month_8 + 
           sales_month_9 + sales_month_10 + sales_month_11 + sales_month_12) AS total_sales
FROM ecommerce_sales_analysis
GROUP BY product_name, category
ORDER BY total_sales DESC;

-- Saving the output to a CSV file
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Highest_and_Lowest_Selling_Product.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 5️⃣ Analyzing Total Sales Based on Product Price
SELECT product_name,
		price,
        SUM(sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4 + 
           sales_month_5 + sales_month_6 + sales_month_7 + sales_month_8 + 
           sales_month_9 + sales_month_10 + sales_month_11 + sales_month_12) AS total_sales
FROM ecommerce_sales_analysis
GROUP BY product_name, price
ORDER BY price DESC;

-- Saving the output to a CSV file
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Total_Sales_vs_Price.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 6️⃣ Calculating Total Monthly Sales
SELECT 
    SUM(sales_month_1) AS sales_jan,
    SUM(sales_month_2) AS sales_feb,
    SUM(sales_month_3) AS sales_mar,
    SUM(sales_month_4) AS sales_apr,
    SUM(sales_month_5) AS sales_may,
    SUM(sales_month_6) AS sales_jun,
    SUM(sales_month_7) AS sales_jul,
    SUM(sales_month_8) AS sales_aug,
    SUM(sales_month_9) AS sales_sep,
    SUM(sales_month_10) AS sales_oct,
    SUM(sales_month_11) AS sales_nov,
    SUM(sales_month_12) AS sales_dec
FROM ecommerce_sales_analysis;

-- Saving the output to a CSV file
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Total_Monthly_Sales.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 7️⃣ Comparing Sales in Summer and Winter Months
SELECT product_name,
	   category,
       price,
       SUM(sales_month_3 + sales_month_4 + sales_month_5) AS Summer_sales,
       SUM(sales_month_1 + sales_month_2 + sales_month_12) AS Winter_sales
FROM ecommerce_sales_analysis
GROUP BY product_name, category, price
ORDER BY Summer_sales DESC;

-- Saving the output to a CSV file
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Seasonal_Sales.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- 8️⃣ Finding the Top 10 Highest Priced Products
SELECT product_name,
	   category,
	   price
FROM ecommerce_sales_analysis
GROUP BY product_name, category, price
ORDER BY price DESC
LIMIT 50;

-- Saving the output to a CSV file
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Highest_Pricing_Product.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';
