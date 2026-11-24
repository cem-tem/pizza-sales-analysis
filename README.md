# Pizza Sales Analysis with MySQL and Power BI

When do customers place the most orders, and which pizzas contribute the most revenue? This project uses MySQL to analyze pizza sales and a two-page Power BI report to compare order patterns, sizes, categories and individual pizzas. Friday led with about 3,500 orders. Classic was the highest-volume category, while the two highest-revenue recipes were both chicken pizzas.

## Sales at a glance

| Metric | Result |
| --- | ---: |
| Total revenue | ≈818,000 |
| Distinct orders | ≈21,000 |
| Pizzas sold | 49,574 |
| Average order value | 38.31 |
| Average pizzas per order | 2.32 |

The exact pizza count is the sum of the four category totals. Revenue and order count are rounded as displayed on the dashboard.

## What the sales mix shows

- **Demand by day.** Friday recorded about 3,500 orders compared with 2,600 on Sunday. July had the highest monthly order count. These are useful starting points for staffing discussions, though shift planning would also need hourly demand.
- **Size and category.** Large pizzas generated 45.89% of revenue. Classic accounted for 26.91% of revenue and 14,888 pizzas sold.
- **Product performance.** Thai Chicken and Barbecue Chicken each generated about 43,000 in revenue. Classic Deluxe led by quantity at about 2,500 pizzas. A promotion aimed at increasing units sold could therefore feature a different recipe from one focused on revenue.

## Dashboard

![Sales overview showing five KPIs, order trends and the sales mix](images/sales-overview.png)

![Product performance showing revenue, quantity sold and orders by pizza](images/product-performance.png)

## SQL and metric definitions

The [MySQL script](pizzaPRJ.sql) aggregates sales, counts distinct orders, parses dates for weekday and monthly trends, and ranks the five highest-revenue pizzas.

An order can contain multiple sales lines. Average order value is therefore calculated as `SUM(total_price) / COUNT(DISTINCT order_id)`. The earlier `AVG(total_price)` query measures the average sales line. Average pizzas per order uses `SUM(quantity)` with the same distinct-order denominator.

The January category query divides January units by units sold over the full dataset. The dashboard's category and size revenue shares use revenue as their measure.

## Exploring the project

The screenshots show both report pages directly on GitHub. To run the SQL, load the source transactions into a MySQL table named `pizza_sales` with columns `order_id`, `order_date`, `pizza_name_id`, `pizza_name`, `pizza_category`, `pizza_size`, `quantity` and `total_price`. The script expects date strings in day-month-year format. The repository contains the queries and static report previews. Running the analysis requires the transaction data.
