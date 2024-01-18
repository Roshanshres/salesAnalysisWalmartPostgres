---Generic--
--HOw many unique cities does the data have?
SELECT
DISTINCT city FROM sales;

--In which city is each branch?--
SELECT DISTINCT branch FROM sales;

SELECT DISTINCT city,
branch FROM sales;


----------------------------------
---PRODUCT--

---How many unique product lines does the data have?
SELECT 
DISTINCT product_line
FROM sales;

SELECT 
	COUNT(DISTINCT product_line)
FROM sales;

-------What is the most common payment method?
SELECT payment FROM sales;

SELECT 
	payment, 
	COUNT(payment) AS cnt FROM sales
GROUP BY payment
ORDER BY cnt DESC;

---------What is the most selling product line?--
SELECT product_line,
	COUNT(product_line) AS prod FROM sales
GROUP BY product_line
ORDER BY prod DESC;


---What is the total revenue by month?--
SELECT * FROM 	sales;

SELECT month_name AS month,
	SUM(total) AS total_revenue 
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC; 

----What month had the largest COGS?
SELECT 
	month_name AS MOmonth,
	SUM(cogs) AS cogs
FROM sales
GROUP BY month_name
ORDER BY cogs DESC;

----What product line had the largest revenue?--
SELECT 
	product_line,
	SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

---What is the city with the largest revenue?
SELECT 
	city, branch,
	SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch
ORDER BY city DESC;


--What product line had the largest VAT?--
SELECT
	product_line,
	AVG(VAT) AS avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;



---Fetch each product line and add a column to those product
--line showing "Good", "Bad". Good if its greater than average sales-





------Which branch sold more products than average product sold?--
SELECT 
	branch,
	SUM(quantity) AS qty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);


----What is the most common product line by gender?
SELECT 
	gender, 
	product_line,
	COUNT(gender) AS total_cnt
FROM sales
GROUP BY  gender, product_line
ORDER BY  total_cnt DESC;
	
---What is the average rating of each product line?

SELECT 
	ROUND(AVG(rating),  2) AS avg_rating,
	product_line
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;


-----------------------SALES
-----Number of sales made in each time of the day per weekday--
select * from sales;
SELECT 
	time_of_day,
	COUNT(*)AS total_sales

FROM sales
	GROUP BY time_of_day
ORDER BY total_sales DESC;

SELECT 
	time_of_day,
	COUNT(*) AS total_sales
FROM sales
WHERE day_of_week= 'Tuesday'
GROUP BY time_of_day
ORDER BY total_sales DESC;


---Which of the customer types brings the most revenue?

SELECT 
	customer_type,
	SUM(total) AS  total_rev
FROM sales
GROUP BY customer_type
ORDER BY total_rev DESC;

---- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT 
	city,
	AVG(VAT) AS VAT
FROM sales
GROUP BY city
ORDER BY VAT desc;


---Which customer type pays the most in VAT?--

SELECT 
	customer_type,
	AVG(VAT) AS VAT
FROM sales
GROUP BY customer_type
ORDER BY VAT DESC;

------------CUSTOMER----
----How many unique customer types does the data have?--
SELECT 
	DISTINCT customer_type
FROM sales;

---How many unique payment methods does the data have?
SELECT 
	DISTINCT payment
FROM sales;

---What is the most common customer type?
SELECT 
	customer_type,
	COUNT(*) AS cust_type
FROM sales
GROUP BY customer_type
ORDER BY cust_type DESC;


----Which customer type buys the most?

SELECT 
	customer_type,
	COUNT(*) AS cust_cnt
FROM sales
GROUP BY customer_type
ORDER BY  cust_cnt DESC;



---What is the gender of most of the customers?
SELECT 
gender,
COUNT(*) as gender_cnt FROM sales
GROUP BY gender 
ORDER BY gender_cnt DESC;


---What is the gender distribution per branch?
SELECT 
gender, 
COUNT(*) gender_cnt FROM sales
WHERE branch = 'C'
GROUP BY gender
ORDER BY gender_cnt DESC;

SELECT 
gender, 
COUNT(*) gender_cnt FROM sales
WHERE branch = 'B'
GROUP BY gender
ORDER BY gender_cnt DESC;



--Which time of the day do customers give most ratings?
SELECT 
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;


----Which time of the day do customers give most ratings per branch?
SELECT 
	time_of_day,
	AVG(rating) AS avg_rating
FROM sales
WHERE branch='B'
GROUP BY time_of_day
ORDER BY avg_rating DESC;


------Which day fo the week has the best avg ratings?--
SELECT 
	day_of_week,
	AVG(rating) AS avg_rating
FROM sales 
GROUP BY day_of_week
ORDER BY avg_rating DESC;

------Which day of the week has the best average ratings per branch?

SELECT 
	day_of_week,
	AVG(rating) AS avg_rating
FROM sales
WHERE branch='B'
GROUP BY day_of_week
ORDER BY avg_rating DESC;


	
