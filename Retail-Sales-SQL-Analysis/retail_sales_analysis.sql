use RetailDatabase

select * from  retail_sales_dataset

--total revenue generated
select sum(Total_amount) as TotalAmountGenerated
from retail_sales_dataset

--Product category the generate most revenue
select 
   Product_category, 
   sum(Total_Amount) as revenue
from retail_sales_dataset
group by Product_Category
order by revenue desc

select distinct Product_category from retail_sales_dataset

--monthly revenue trend
select 
  format(Date, 'yyyy-MM') as YearMonth,
  sum(Total_Amount) as Monthly_Revenue
from retail_sales_dataset
group by format(Date, 'yyyy-MM')
order by YearMonth

--Top 10 customers
SELECT TOP 10
  Customer_ID,
  SUM(Total_Amount) AS Total_Spent
FROM retail_sales_dataset
GROUP BY Customer_ID
ORDER BY Total_Spent DESC;

--Average order value per category
SELECT
  Product_Category,
  AVG(CAST(Total_Amount AS decimal(10,2))) AS Avg_Order_Value
FROM retail_sales_dataset
GROUP BY Product_Category
ORDER BY Avg_Order_Value DESC;


--Which gender spends more (overall + by category)
SELECT
  Gender,
  SUM(Total_Amount) AS Total_Spent
FROM retail_sales_dataset
GROUP BY Gender
ORDER BY Total_Spent DESC;

SELECT
  Product_Category,
  Gender,
  SUM(Total_Amount) AS Total_Spent
FROM retail_sales_dataset
GROUP BY Product_Category, Gender
ORDER BY Product_Category, Total_Spent DESC;

--Age Group that generate most revenue
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS Age_Group,
    SUM(Total_Amount) AS Revenue
FROM retail_sales_dataset
GROUP BY 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END
ORDER BY Revenue DESC;


--month with highest no:of transaction
SELECT 
    FORMAT(Date, 'yyyy-MM') AS YearMonth,
    COUNT(*) AS Number_of_Transactions
FROM retail_sales_dataset
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY Number_of_Transactions DESC;


--category sells the highest quantity (not revenue)
SELECT 
    Product_Category,
    SUM(Quantity) AS Total_Quantity_Sold
FROM retail_sales_dataset
GROUP BY Product_Category
ORDER BY Total_Quantity_Sold DESC;

--Rank categories by revenue
SELECT 
    Product_Category,
    SUM(Total_Amount) AS Revenue,
    RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Revenue_Rank
FROM retail_sales_dataset
GROUP BY Product_Category;

--Running total revenue over time
SELECT
    Date,
    SUM(Total_Amount) AS Daily_Revenue,
    SUM(SUM(Total_Amount)) OVER (ORDER BY Date) AS Running_Total
FROM retail_sales_dataset
GROUP BY Date
ORDER BY Date;

--customers who spent above average
WITH CustomerTotals AS (
    SELECT 
        Customer_ID,
        SUM(Total_Amount) AS Total_Spent
    FROM retail_sales_dataset
    GROUP BY Customer_ID
)

SELECT *
FROM CustomerTotals
WHERE Total_Spent > (
    SELECT AVG(Total_Spent) 
    FROM CustomerTotals
)
ORDER BY Total_Spent DESC;


DROP TABLE IF EXISTS dbo.Transactions;
DROP TABLE IF EXISTS dbo.Customers;
DROP TABLE IF EXISTS dbo.Products;
GO

SELECT DISTINCT
    Customer_ID,
    Gender,
    Age
INTO Customers
FROM retail_sales_dataset;

SELECT DISTINCT
    Product_Category,
    Price_per_Unit
INTO Products
FROM retail_sales_dataset;

SELECT
    Transaction_ID,
    Date,
    Customer_ID,
    Product_Category,
    Quantity,
    Total_Amount
INTO Transactions
FROM retail_sales_dataset;

select * from Transactions

--Revenue by gender using join
SELECT
    c.Gender,
    SUM(t.Total_Amount) AS Total_Revenue
FROM Transactions t
JOIN Customers c
    ON t.Customer_ID = c.Customer_ID
GROUP BY c.Gender
ORDER BY Total_Revenue DESC;

--Revenue by Category and Gender
SELECT
    p.Product_Category,
    c.Gender,
    SUM(t.Total_Amount) AS Total_Revenue
FROM Transactions t
JOIN Customers c
    ON t.Customer_ID = c.Customer_ID
JOIN Products p
    ON t.Product_Category = p.Product_Category
GROUP BY p.Product_Category, c.Gender
ORDER BY p.Product_Category, Total_Revenue DESC;


