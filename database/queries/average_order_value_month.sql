USE mini_project_pizza;
-- total amount of order and average order value by month
SELECT 
    DATE_FORMAT(o.order_date, '%m') as month,
    ROUND(AVG(o.total_price), 2) as avg_order_value,
    COUNT(DISTINCT o.order_id) as total_orders
FROM orders AS o
GROUP BY DATE_FORMAT(o.order_date, '%m')
ORDER BY month;