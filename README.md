# 🍔 E-commerce & Delivery Data Analysis (SQL Project)

## 📌 Project Overview
Yeh project ek e-commerce delivery database par kiya gaya hai jiska maksad restaurants ki performance, delivery patterns, aur monthly revenue growth ko track karna hai. Isme advanced SQL concepts ka use karke real-world business problems ko solve kiya gaya hai.

## 🛠️ Tech Stack & Concepts Used
* **Database:** MySQL / MySQL Workbench
* **Core Concepts:** 
  * `INNER JOIN` & `LEFT JOIN` (Anti-join patterns)
  * `GROUP BY` & `HAVING` (Aggregations and threshold filtering)
  * **CTEs (Common Table Expressions)** for multi-step clean queries
  * **Window Functions:** `DENSE_RANK()`, `LAG()`, and `LEAD()` for time-series and ranking analysis
  * **Date Functions:** `MONTH()` and `MONTHNAME()` for temporal analysis

## 📊 Key Business Questions Solved
1. **Restaurant Performance:** Calculated total orders, total revenue, and AOV (Average Order Value) for each restaurant.
2. **Month-over-Month (MoM) Growth:** Used CTEs and `LAG()` window function to track monthly revenue fluctuations and growth/drop trends.
3. **Department & Employee Rankings:** Implemented `DENSE_RANK()` partitioned by department to find top earners.

## 🚀 How to Run the Code
1. Clone this repository or download the `.sql` script.
2. Open your MySQL Workbench.
3. Import or paste the queries from `delivery_analysis.sql` into your query editor and execute them step-by-step.
