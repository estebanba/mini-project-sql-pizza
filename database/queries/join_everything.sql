USE mini_project_pizza;
-- just joining all tables to resemble original csv
SELECT 
	p_orders.pizza_orders_id AS pizza_orders_id,
    orders.order_id AS order_id,
    orders.order_date AS date,
    orders.order_time AS time,
    menu.pizza_name AS name,
    sizes.size_name AS size,
    info.unit_price AS unit_price,
    p_orders.quantity AS quantity,
    menu.pizza_category AS category,
    menu.pizza_ingredient AS ingredients
FROM pizza_orders AS p_orders
JOIN orders
ON p_orders.order_id = orders.order_id
JOIN pizza_info AS info
ON info.pizza_id = p_orders.pizza_id
JOIN pizzas_menu AS menu
ON menu.pizza_name_id = info.pizza_name_id_y
JOIN sizes
ON info.size_id = sizes.size_id;

-- JOIN sizes ON pizza_info.size_id = sizes.size_id
-- JOIN pizzas_menu AS menu ON pizza_info.pizza_name_id_y = menu.pizza_name_id;