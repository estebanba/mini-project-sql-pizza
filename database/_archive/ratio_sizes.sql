use mini_project_pizza;
CREATE TEMPORARY TABLE BD
SELECT B.pizza_orders_id, B.pizza_id, B.order_id, D.size_id  FROM mini_project_pizza.pizza_orders as B
JOIN mini_project_pizza.pizza_info as D
on B.pizza_id=D.pizza_id;


CREATE TEMPORARY TABLE pizza_sold_size
SELECT COUNT(BD.pizza_orders_id) as pizza_sold, size_name from BD
JOIN mini_project_pizza.sizes as E
ON BD.size_id=E.size_id
group by size_name
order by pizza_sold DESC;


CREATE TEMPORARY TABLE BCD
SELECT BD.pizza_orders_id, BD.pizza_id, BD.order_id, BD.size_id, C.total_price from BD
JOIN mini_project_pizza.orders as C
ON BD.order_id=C.order_id;



CREATE TEMPORARY TABLE pizza_money_size
SELECT ROUND(SUM(BCD.total_price),2) as EARNS, E.size_name as size_name from BCD
JOIN mini_project_pizza.sizes as E
ON BCD.size_id=E.size_id
GROUP BY size_name;

CREATE TEMPORARY TABLE study_size
SELECT pizza_sold_size.size_name, pizza_sold_size.pizza_sold, pizza_money_size.EARNS from pizza_sold_size
JOIN pizza_money_size
on pizza_sold_size.size_name=pizza_money_size.size_name
ORDER BY size_name;

SELECT size_name, ROUND((pizza_sold/(sum(pizza_sold) OVER ()))*100,2) as total_sold, ROUND((EARNS/(sum(EARNS) OVER ()))*100,2) as total_EARNS, ROUND(ROUND((EARNS/(sum(EARNS) OVER ()))*100,2)/ROUND((pizza_sold/(sum(pizza_sold) OVER ()))*100,2),2) AS RATIO
FROM study_size
GROUP BY size_name;




