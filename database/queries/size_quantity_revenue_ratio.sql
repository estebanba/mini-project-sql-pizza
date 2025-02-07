USE mini_project_pizza;

-- analysis sizes quantity revenue ratio

SELECT
    s.size_name,
    ROUND(AVG(pi.unit_price), 2) AS avg_unit_price,
    SUM(po.quantity) as total_quantity,
    ROUND(AVG(pi.unit_price) * SUM(po.quantity), 2) AS total_revenue,
    ROUND(SUM(po.quantity) * 100.0 / SUM(SUM(po.quantity)) OVER (), 2) as quantity_percentage,
    ROUND((AVG(pi.unit_price) * SUM(po.quantity)) * 100.0 / SUM(AVG(pi.unit_price) * SUM(po.quantity)) OVER (), 2) as revenue_percentage,
    ROUND(((AVG(pi.unit_price) * SUM(po.quantity)) * 100.0 / SUM(AVG(pi.unit_price) * SUM(po.quantity)) OVER ()) / (SUM(po.quantity) * 100.0 / SUM(SUM(po.quantity)) OVER ()), 2) as revenue_quantity_ratio
FROM pizza_orders AS po
JOIN pizza_info AS pi ON po.pizza_id = pi.pizza_id
JOIN sizes AS s ON pi.size_id = s.size_id
GROUP BY s.size_name
ORDER BY total_revenue DESC;