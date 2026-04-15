# 🛒 Retail Sales SQL Analysis

## 📌 Project Overview

This project analyzes a structured retail sales dataset using SQL Server.  
The objective is to extract actionable business insights related to revenue performance, customer behavior, product trends, and demographic patterns.

The analysis demonstrates strong SQL proficiency and practical business-oriented data interpretation.

---

## 🛠 Tools Used

- SQL Server  
- SQL Server Management Studio (SSMS)  
- Aggregate Functions (SUM, AVG, COUNT)  
- Window Functions (RANK, Running Total)  
- CTE (Common Table Expressions)  
- JOIN Operations  
- Data Normalization  

---

## 📊 Dataset Summary

- 1000 Transactions  
- Customer demographic attributes included  
- Product categories: Beauty, Clothing, Electronics  
- Transaction-level revenue and quantity information  

---

## 🔎 Business Questions Answered

✔ What is the total revenue generated?  
✔ Which product category generates the most revenue?  
✔ What is the monthly revenue trend?  
✔ Who are the top 10 customers?  
✔ What is the average order value per category?  
✔ Which gender spends more overall?  
✔ How does spending vary by gender and category?  
✔ Which age group generates the most revenue?  
✔ Which month has the highest number of transactions?  
✔ Which category sells the highest quantity?  
✔ How do product categories rank by revenue?  
✔ What is the running total revenue over time?  
✔ Which customers spend above average?  
✔ How can normalized tables be analyzed using JOIN operations?  

---

## 🧠 SQL Skills Demonstrated

- GROUP BY and ORDER BY  
- SUM(), AVG(), COUNT()  
- CASE statements for segmentation  
- Window Functions (RANK, Running Total)  
- CTE for layered query logic  
- INNER JOIN for relational analysis  
- Data normalization into Customers, Products, and Transactions tables  
- Revenue ranking and performance analysis  

---

## 📈 Key Insights

- **Total Revenue Generated:** 456,000  
- **Highest Revenue Category:** Electronics  
- **Highest Average Order Value:** Beauty  
- **Clothing sells the highest total quantity**  
- Female customers slightly outspend male customers overall  
- Male customers dominate Electronics spending  
- Female customers dominate Beauty and Clothing categories  
- October 2023 recorded the highest revenue month  
- Multiple customers exceed the average spending benchmark  

---

## 🗂 Data Modeling Approach

To demonstrate relational database design, the original dataset was normalized into three tables:

- Customers  
- Products  
- Transactions  

JOIN operations were then applied to analyze revenue by demographic and product dimensions, simulating a real-world database environment.

---

## 📂 Project Structure

```
Retail-Sales-SQL-Analysis
 ├── retail_sales_analysis.sql
 └── README.md
```

---

## 🚀 How to Reproduce

1. Import the dataset into SQL Server.
2. Execute the `retail_sales_analysis.sql` script.
3. Run queries sequentially to reproduce all insights.

---

