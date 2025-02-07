USE mini_project_pizza;

# Category analysis total
SELECT
    pm.pizza_category,
    SUM(po.quantity) AS total_quantity,
     ROUND(SUM(po.quantity) * 100.0 / SUM(SUM(po.quantity)) OVER (), 2) AS quantity_percentage,
    ROUND(AVG(pi.unit_price) * SUM(po.quantity), 2) AS total_revenue,
    ROUND((AVG(pi.unit_price) * SUM(po.quantity)) * 100.0 / 
        SUM(AVG(pi.unit_price) * SUM(po.quantity)) OVER (), 2) AS revenue_percentage,
	ROUND(
        ((AVG(pi.unit_price) * SUM(po.quantity)) * 100.0 / SUM(AVG(pi.unit_price) * SUM(po.quantity)) OVER ()) /
        (SUM(po.quantity) * 100.0 / SUM(SUM(po.quantity)) OVER ()), 
    2) AS ratio_revenue_quantity
FROM pizza_orders AS po
JOIN pizza_info AS pi ON po.pizza_id = pi.pizza_id
JOIN pizzas_menu AS pm ON pi.pizza_name_id_y = pm.pizza_name_id
GROUP BY pm.pizza_category
ORDER BY revenue_percentage DESC;