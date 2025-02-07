USE mini_project_pizza;

-- Ranking Top 5 Pizzas
SELECT 
    menu.pizza_name AS name,
    sizes.size_name AS size,
    info.unit_price AS unit_price,
    SUM(p_orders.quantity) AS total_quantity,
    ROUND(SUM(info.unit_price * p_orders.quantity), 2) AS total_revenue,
    menu.pizza_category AS category,
    ROUND(SUM(p_orders.quantity) * 100.0 / SUM(SUM(p_orders.quantity)) OVER (), 2) as quantity_percentage,
    ROUND(SUM(info.unit_price * p_orders.quantity) * 100.0 / 
        SUM(SUM(info.unit_price * p_orders.quantity)) OVER (), 2) as revenue_percentage,
    ROUND(
        (SUM(info.unit_price * p_orders.quantity) * 100.0 / SUM(SUM(info.unit_price * p_orders.quantity)) OVER ()) /
        (SUM(p_orders.quantity) * 100.0 / SUM(SUM(p_orders.quantity)) OVER ()), 
    2) as revenue_quantity_ratio
FROM pizza_orders AS p_orders
JOIN orders ON p_orders.order_id = orders.order_id
JOIN pizza_info AS info ON info.pizza_id = p_orders.pizza_id
JOIN pizzas_menu AS menu ON menu.pizza_name_id = info.pizza_name_id_y
JOIN sizes ON info.size_id = sizes.size_id
GROUP BY name, size, unit_price, category
ORDER BY total_revenue DESC
LIMIT 5;