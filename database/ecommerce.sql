admin
order_items
orders
products
users




orders	CREATE TABLE `orders` (
   `order_id` int NOT NULL AUTO_INCREMENT,
   `user_email` varchar(100) DEFAULT NULL,
   `total_amount` double DEFAULT NULL,
   `order_date` date DEFAULT NULL,
   `customer_name` varchar(100) DEFAULT NULL,
   `phone` varchar(15) DEFAULT NULL,
   `address` varchar(255) DEFAULT NULL,
   `status` varchar(30) DEFAULT 'Order Placed',
   PRIMARY KEY (`order_id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci