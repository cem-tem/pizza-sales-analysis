select *
from pizza_sales;
-- 1. total revenue
select sum(total_price) as total_revenue
from pizza_sales;
-- 2. avg order value
select avg(total_price) as avg_revenue
from pizza_sales;
-- 3.total pizzas sold
select  count(DISTINCT order_id) as total_ORDER
from pizza_sales;
# total_revenue/total_order
select  sum(total_price)/count(DISTINCT order_id) as avg_order_value
from pizza_sales;
-- 4.total pizza sold
select sum(quantity) as total_pizza_sold
from pizza_sales;
select DISTINCT pizza_name_id, sum(quantity)
from pizza_sales
group by pizza_name_id
order by 2 desc
;
-- 5.avg pizzas per order
select round(sum(quantity)/count(DISTINCT order_id),2) as avg_pizza_perOrder
from pizza_sales;
# 1. DAILY TREND FOR ORDERS
SELECT
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_day
ORDER BY total_orders DESC;
# 2.monthly trends
SELECT
	monthname(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_month
ORDER BY total_orders DESC;
# 3.percentage of sales by pizza category
select DISTINCT pizza_category, sum(quantity) as sum_all
from pizza_sales
group by pizza_category
order by 2 desc
;
select DISTINCT pizza_category, sum(quantity) as pizzas_sold,
round(sum(total_price),2) as total_revenue,
ROUND(100*SUM(quantity)/(select sum(quantity) from pizza_sales),2) as pizza_sold_pct
from pizza_sales
#where month(order_date)=1
where MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) = 1
group by pizza_category
order by 2 desc
;
-- 3.1 pizza_size
select DISTINCT pizza_size, sum(quantity) as pizzas_sold,
round(sum(total_price),2) as total_revenue,
ROUND(100*SUM(quantity)/(select sum(quantity) from pizza_sales),2) as pizza_sold_pct
from pizza_sales
#where MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) = 1
group by pizza_size
order by 2 desc
;
-- top5 pizza name
select DISTINCT pizza_name, SUM(total_price) as total_revenue

from pizza_sales
group by pizza_name
order by 2 desc
LIMIT 5
;