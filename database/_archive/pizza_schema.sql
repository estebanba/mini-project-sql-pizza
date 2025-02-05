CREATE DATABASE IF NOT EXISTS mini_project_pizza;
USE mini_project_pizza;

DROP TABLE IF EXISTS `pizzas`;
CREATE TABLE `pizzas`(
    `pizza_name_id` VARCHAR(255) NOT NULL PRIMARY KEY,
    `pizza_name` BIGINT NOT NULL,
    `pizza_size` VARCHAR(255) NOT NULL,
    `unit_price` BIGINT NOT NULL,
    `pizza_category` VARCHAR(255) NOT NULL,
    `ingredients` BIGINT NOT NULL
);
ALTER TABLE
    `pizzas` ADD UNIQUE `pizzas_pizza_name_id_unique`(`pizza_name_id`);
    
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`(
    `order_id` BIGINT NOT NULL PRIMARY KEY,
    `order_date` BIGINT NOT NULL,
    `order_time` BIGINT NOT NULL,
    `total_price` BIGINT NOT NULL
);

DROP TABLE IF EXISTS `pizza_orders`;
CREATE TABLE `pizza_orders`(
    `id` BIGINT NOT NULL PRIMARY KEY,
    `order_id` BIGINT NOT NULL,
    `pizza_name_id` BIGINT NOT NULL,
    `quantity` BIGINT NOT NULL,
    `subtotal_price` BIGINT NOT NULL
);
-- CREATE TABLE `ingredients`(
--     `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
-- );
ALTER TABLE
    `pizza_orders` ADD CONSTRAINT `pizza_orders_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`order_id`);
ALTER TABLE
    `pizza_orders` ADD CONSTRAINT `pizza_orders_pizza_name_id_foreign` FOREIGN KEY(`pizza_name_id`) REFERENCES `pizzas`(`pizza_name_id`);