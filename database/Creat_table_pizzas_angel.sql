CREATE TABLE `pizzas_menu`(
    `pizza_name_id` BIGINT NOT NULL,
    `pizza_name` VARCHAR(255) NOT NULL,
    `pizza_category` VARCHAR(255) NOT NULL,
    `pizza_ingredient` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`pizza_name_id`)
);
CREATE TABLE `orders`(
    `order_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_date` DATE NOT NULL,
    `order_time` TIME NOT NULL,
    `total_price` FLOAT(53) NOT NULL
);
CREATE TABLE `pizza_orders`(
    `pizza_orders_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` BIGINT NOT NULL,
    `pizza_id` BIGINT NOT NULL,
    `quantity` BIGINT NOT NULL
);
CREATE TABLE `sizes`(
    `size_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `size_name` VARCHAR(255) NOT NULL
);
CREATE TABLE `pizza_info`(
    `pizza_id` BIGINT NOT NULL,
    `pizza_name` VARCHAR(255) NOT NULL,
    `size_id` BIGINT NOT NULL,
    `unit_price` FLOAT(53) NOT NULL,
    PRIMARY KEY(`pizza_id`)
);
ALTER TABLE
    `pizza_info` ADD CONSTRAINT `pizza_info_size_id_foreign` FOREIGN KEY(`size_id`) REFERENCES `sizes`(`size_id`);
ALTER TABLE
    `pizza_info` ADD CONSTRAINT `pizza_info_pizza_name_foreign` FOREIGN KEY(`pizza_name`) REFERENCES `pizzas_menu`(`pizza_name`);
ALTER TABLE
    `pizza_orders` ADD CONSTRAINT `pizza_orders_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `orders`(`order_id`);
ALTER TABLE
    `pizza_orders` ADD CONSTRAINT `pizza_orders_pizza_id_foreign` FOREIGN KEY(`pizza_id`) REFERENCES `pizza_info`(`pizza_id`);