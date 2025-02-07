USE mini_project_pizza;

-- Estudiamos que día se han generado más pedidos.
SELECT y.num_week as day_week, count(o.order_id) as Total_orders, round(sum(o.total_price),2) as Total_revenue from mini_project_pizza.year_day as y
JOIN mini_project_pizza.orders as o
on y.year_day_id=o.order_date
group by day_week
order by Total_orders DESC;

-- Estudiamos qué mes se han generado más pedidos 
SELECT 
DATE_FORMAT(o.order_date, "%m") as month_, count(o.order_id) as Total_orders, round(sum(o.total_price),2) as Total_revenue from mini_project_pizza.orders as o
group by month_
order by month_;

-- Estudiamos las horas

SELECT 
HOUR(o.order_time) as hour_, count(o.order_id) as Total_orders, round(sum(o.total_price),2) as Total_revenue from mini_project_pizza.orders as o
group by hour_
order by hour_;

-- Creo una tabla con número de pedido, día de la semana, día del pedido y hora 
SELECT y.num_week, HOUR(o.order_time) as hour_, count(o.order_id) as Total_orders from mini_project_pizza.orders as o
JOIN mini_project_pizza.year_day as y
ON o.order_date=y.year_day_id
GROUP BY num_week, hour_
order by num_week, hour_;
