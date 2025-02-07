USE mini_project_pizza;

-- Ranking of Categories and Sizes by total revenue
SELECT
    pm.pizza_category,
    s.size_name,
    ROUND(AVG(pi.unit_price), 2) AS avg_unit_price,
    SUM(po.quantity) as total_quantity,
    ROUND(AVG(pi.unit_price) * SUM(po.quantity), 2) AS total_revenue
FROM pizza_orders AS po
JOIN pizza_info AS pi 
	ON po.pizza_id = pi.pizza_id
JOIN sizes AS s 
	ON pi.size_id = s.size_id
JOIN pizzas_menu AS pm 
	ON pi.pizza_name_id_y = pm.pizza_name_id
GROUP BY pm.pizza_category, s.size_name
ORDER BY total_revenue DESC, pm.pizza_category;