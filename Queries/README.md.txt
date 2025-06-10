# 🛍️ Retail SQL Analytics Project

Designed and developed an end-to-end Business Intelligence dashboard for a fictional retail company using real-world sales, customer, product, employee, and payment data. The goal was to uncover key insights for stakeholders to improve customer targeting, product performance, and store efficiency.
This project focuses on performing SQL based analytics on a retail dataset, then visualizing the key insights

## 📁 Project Structure

- queries/ – SQL scripts (table creation, data loading, analysis queries and kpis)
- data/ – Raw CSV datasets (customers, products, employees, sales, stores and payments.)
- dashboard/ – Power BI dashboard file (Retail sales Analysis.pbix)
- images/ – Screenshots of dashboard or visuals
- README.md – This documentation file.
 
---

## 🔧 Tools Used

- SQL Server / MySQL – for data manipulation and analysis
- Power BI – for interactive data visualization
- Git & GitHub – for version control and project sharing

---

## 🧩 Dataset Overview

| Table       | Description                                      |
|-------------|--------------------------------------------------|
| Customers   | Customer personal and biography                  |
| Employees   | Store employee information                       |
| Stores      | Store names and locations                        |
| Products    | Items available for sale and category            |
| Sales       | Sales transactions and amounts                   |
| Payments    | Payment method and date information              |

---

## 🧠 Key Business Questions Answered

1. Which stores generated the most revenue?
2. Who are the top 5 highest-spending customers?
3. What are the best-selling products by quantity?
4. What is the average transaction value?
5. What is the monthly revenue trend?

---

## 📊 KPIs Created (Power BI)

- Total Revenue
- Total Customers
- Average Transaction Value
- Total Products
- Total Stores
- Product Category
- Count of Transaction

---

## 📁 How to Run This Project

1. Clone the repository or download the ZIP.
2. Open SQL Server and run create_tables.sql and insert_data.sql from the queries/ folder.
3. Run individual analysis queries (total_sales_by_store.sql, top_customers.sql, etc.)
4. Open retail_dashboard.pbix in Power BI.
5. Load data and explore the dashboards.

---

## 🧠 Business Insights

- Product Category Focus: 
  Toys are outselling every other category by a huge margin.
  This gives us a clear direction of push toy promotions harder, bundle them with slower moving products like books and ensure we’re never understocked in our best-seller category.
  This isn’t just about sales, it’s about knowing what your customers love and doubling down on it.
- Store Strategy Optimization:
  Some stores significantly outperform others (e.g., Hernandez Store vs. James Store).
  Business leaders can reallocate inventory, staff, or promotions toward better performing stores, while Underperforming stores can be audited for issues (e.g., location, staff, local demand).
  Potential for cost reduction and waste and boosts net revenue.
- Strategic focus on high-performing locations and seasonal Campaign Planning:
  Revenue spikes in February and dips in May. 
  Use trend data to plan campaigns and product launches around seasonal peaks.

---

## 📷 Dashboard Preview

![Retail Dashboard](image/dashboard_overview.png)

---
### 🗺️ Data Model

Below is the data relationship model used in Power BI:

![Data Model](images/data_model.png)

---
## 📌 Author

[Okafor,sopuluchukwu.T]  
SQL Analyst | Data Visualization Enthusiast  
📧 [sopuluchukwutoby@gmail.com]  
🌐 GitHub: [Jrtoby](https://github.com/Jrtoby)

---

## 📝 License

This project is for educational purposes only.