Create database SalesAnalysis;
use SalesAnalysis;

select * from ecommerce_sales_analysis;

-- Top Performing Product Categories
SELECT category, 
       SUM(sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4 + 
           sales_month_5 + sales_month_6 + sales_month_7 + sales_month_8 + 
           sales_month_9 + sales_month_10 + sales_month_11 + sales_month_12) AS total_sales
FROM ecommerce_sales_analysis
GROUP BY category
ORDER BY total_sales DESC

-- saving the csv file    
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Top_Perfrming_Categories.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';



-- Total Review Counts Per Category
SELECT category,
		SUM(review_count) AS total_review
FROM ecommerce_sales_analysis
GROUP BY category
ORDER BY total_review DESC

-- saving the csv file    
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Review_Counts.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Average Review Score Per Categroy
select category,
	avg(review_score) AS review_score
FROM ecommerce_sales_analysis
GROUP By category
ORDER By review_score DESC

-- saving the csv file    
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Average_Review.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


-- Highest and Lowest Selling Product  By Categories
SELECT product_name,
		category,
       SUM(sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4 + 
           sales_month_5 + sales_month_6 + sales_month_7 + sales_month_8 + 
           sales_month_9 + sales_month_10 + sales_month_11 + sales_month_12) AS total_sales
FROM ecommerce_sales_analysis
GROUP BY Product_name, category
ORDER BY total_sales DESC

-- saving the csv file    
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Highest_and_Lowest_Selling_Product.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Total Sales based on the Price of the Product
SELECT product_name,
		price,
        SUM(sales_month_1 + sales_month_2 + sales_month_3 + sales_month_4 + 
           sales_month_5 + sales_month_6 + sales_month_7 + sales_month_8 + 
           sales_month_9 + sales_month_10 + sales_month_11 + sales_month_12) AS total_sales
FROM ecommerce_sales_analysis
GROUP BY product_name, price
ORDER BY price DESC

-- saving the csv file    
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Total_sales_vs_price.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Total Monthly Sales
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
FROM ecommerce_sales_analysis

-- saving the csv file    
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Total_Monthly_Sales.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Sales in Summer and Winter Months
SELECT product_name,
	category,
    price,
    SUM(sales_month_3 + sales_month_4 + 
           sales_month_5) AS Summer_sales,
	SUM(sales_month_1 + sales_month_2 + sales_month_12) AS Winter_sales
FROM ecommerce_sales_analysis
GROUP BY product_name, category, price
ORDER BY Summer_sales DESC

-- saving the csv file    
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Seasonal_Sales.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Top 10 HIghest Pricing Product
SELECT Product_name,
category,
price
FROM ecommerce_sales_analysis
GROUP BY product_name, category, price
ORDER BY price desc
limit 50

-- saving the csv file    
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Highest_Pricing_Product.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';
