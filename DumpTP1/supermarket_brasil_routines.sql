CREATE DATABASE  IF NOT EXISTS `supermarket_brasil` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `supermarket_brasil`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: supermarket_brasil
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `monthlyordersummary`
--

DROP TABLE IF EXISTS `monthlyordersummary`;
/*!50001 DROP VIEW IF EXISTS `monthlyordersummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `monthlyordersummary` AS SELECT 
 1 AS `OrderYear`,
 1 AS `OrderMonth`,
 1 AS `TotalOrders`,
 1 AS `TotalRevenue`,
 1 AS `AverageOrderValue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ordersbypaymenttype`
--

DROP TABLE IF EXISTS `ordersbypaymenttype`;
/*!50001 DROP VIEW IF EXISTS `ordersbypaymenttype`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersbypaymenttype` AS SELECT 
 1 AS `PaymentType`,
 1 AS `TotalOrders`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cityrevenue`
--

DROP TABLE IF EXISTS `cityrevenue`;
/*!50001 DROP VIEW IF EXISTS `cityrevenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cityrevenue` AS SELECT 
 1 AS `City`,
 1 AS `State`,
 1 AS `TotalRevenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orderstatussummary`
--

DROP TABLE IF EXISTS `orderstatussummary`;
/*!50001 DROP VIEW IF EXISTS `orderstatussummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orderstatussummary` AS SELECT 
 1 AS `OrderStatus`,
 1 AS `TotalOrders`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productcategorysummary`
--

DROP TABLE IF EXISTS `productcategorysummary`;
/*!50001 DROP VIEW IF EXISTS `productcategorysummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productcategorysummary` AS SELECT 
 1 AS `Category`,
 1 AS `NumberOfProducts`,
 1 AS `AverageReviewScore`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `monthlyordersummary`
--

/*!50001 DROP VIEW IF EXISTS `monthlyordersummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monthlyordersummary` AS select `supermarket_info`.`OrderYear` AS `OrderYear`,`supermarket_info`.`OrderMonth` AS `OrderMonth`,count(distinct `supermarket_info`.`Order_Id`) AS `TotalOrders`,round(sum(`supermarket_info`.`TotalRevenue`),2) AS `TotalRevenue`,round(avg(`supermarket_info`.`AverageOrderValue`),2) AS `AverageOrderValue` from `supermarket_info` where (`supermarket_info`.`OrderYear` between 2011 and 2022) group by `supermarket_info`.`OrderYear`,`supermarket_info`.`OrderMonth` order by `supermarket_info`.`OrderYear` desc,`supermarket_info`.`OrderMonth` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordersbypaymenttype`
--

/*!50001 DROP VIEW IF EXISTS `ordersbypaymenttype`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersbypaymenttype` AS select `supermarket_info`.`PaymentType` AS `PaymentType`,count(distinct `supermarket_info`.`Order_Id`) AS `TotalOrders` from `supermarket_info` where (`supermarket_info`.`PaymentType` is not null) group by `supermarket_info`.`PaymentType` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cityrevenue`
--

/*!50001 DROP VIEW IF EXISTS `cityrevenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cityrevenue` AS select `supermarket_info`.`City` AS `City`,`supermarket_info`.`State` AS `State`,`supermarket_info`.`TotalRevenue` AS `TotalRevenue` from `supermarket_info` group by `supermarket_info`.`City`,`supermarket_info`.`State`,`supermarket_info`.`TotalRevenue` order by `supermarket_info`.`TotalRevenue` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderstatussummary`
--

/*!50001 DROP VIEW IF EXISTS `orderstatussummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderstatussummary` AS select `supermarket_info`.`OrderStatus` AS `OrderStatus`,count(distinct `supermarket_info`.`Order_Id`) AS `TotalOrders` from `supermarket_info` group by `supermarket_info`.`OrderStatus` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productcategorysummary`
--

/*!50001 DROP VIEW IF EXISTS `productcategorysummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productcategorysummary` AS select `supermarket_info`.`Category` AS `Category`,count(`supermarket_info`.`ProductNumber`) AS `NumberOfProducts`,`supermarket_info`.`AverageReviewScore` AS `AverageReviewScore` from `supermarket_info` group by `supermarket_info`.`Category`,`supermarket_info`.`AverageReviewScore` order by `NumberOfProducts` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'supermarket_brasil'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `CreateSupermarket_infoEvent` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `CreateSupermarket_infoEvent` ON SCHEDULE EVERY 1 MINUTE STARTS '2023-11-10 22:39:58' ENDS '2023-11-10 23:39:58' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
        INSERT INTO messages SELECT CONCAT('event:', NOW());
        CALL CreateSupermarket_info();
    END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'supermarket_brasil'
--
/*!50003 DROP PROCEDURE IF EXISTS `CreateProductInfoTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateProductInfoTable`()
BEGIN
    CREATE TABLE IF NOT EXISTS ProductInfo AS -- LOAD: Creates new table and loads the result of the select in it
    SELECT
        orders.customer_id AS CustomerNumber,
        orders.order_id AS Orders,
        UPPER(TRIM(orders.order_status)) AS OrderStatus,
        UPPER(TRIM(customers.customer_city)) AS City,
        customers.customer_state AS State,
        order_items.product_id AS ProductNumber,
        order_items.price AS Price,
        order_items.freight_value AS FreightValue,
		YEAR(orders.order_purchase_timestamp) AS OrderYear, -- TRANSFORM: Transforms the date timestamp into years
        MONTHNAME(orders.order_purchase_timestamp) AS OrderMonth, -- TRANSFORM: Transforms the date timestamp into months
        products.product_id AS Product,
        category_name_t.product_category_name_english AS Category,
        seller.seller_state AS SellerState,
        seller.seller_city AS SellerCity,
        UPPER(TRIM(payments.payment_type)) AS PaymentType,
        payments.payment_value AS PaymentValue,
        reviews.review_score AS ReviewScore
    FROM orders
	INNER JOIN -- EXTRACT
        customers USING (customer_id)
    INNER JOIN -- EXTRACT
        order_items USING (order_id)
    INNER JOIN -- EXTRACT
        products USING (product_id)
    INNER JOIN -- EXTRACT
        category_name_t USING (product_category_name)
    INNER JOIN -- EXTRACT
        seller USING (seller_id)
    INNER JOIN -- EXTRACT
        reviews USING (order_id)
	INNER JOIN
		payments USING (order_id);
    -- Commit the changes
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateProductos_test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateProductos_test`()
BEGIN
    CREATE TABLE IF NOT EXISTS Productos_test AS -- LOAD: Creates new table and loads the result of the select in it
    SELECT
        orders.customer_id AS CustomerNumber,
        COUNT(DISTINCT orders.order_id) AS TotalOrders,
        UPPER(TRIM(orders.order_status)) AS OrderStatus,
        UPPER(TRIM(customers.customer_city)) AS City,
        customers.customer_state AS State,
        order_items.product_id AS ProductNumber,
		COUNT(products.product_id) AS NumberOfProducts,
		ROUND(AVG(reviews.review_score), 2) AS AverageReviewScore,
        ROUND(SUM(order_items.price + order_items.freight_value),2) AS TotalRevenue,
		ROUND(AVG(order_items.price + order_items.freight_value),2) AS AverageOrderValue,
		YEAR(orders.order_purchase_timestamp) AS OrderYear, -- TRANSFORM: Transforms the date timestamp into years
        MONTHNAME(orders.order_purchase_timestamp) AS OrderMonth, -- TRANSFORM: Transforms the date timestamp into months
        category_name_t.product_category_name_english AS Category,
        seller.seller_state AS SellerState,
        seller.seller_city AS SellerCity,
        UPPER(TRIM(payments.payment_type)) AS PaymentType,
        payments.payment_value AS PaymentValue
    FROM orders
	INNER JOIN -- EXTRACT
        customers USING (customer_id)
    INNER JOIN -- EXTRACT
        order_items USING (order_id)
    INNER JOIN -- EXTRACT
        products USING (product_id)
    INNER JOIN -- EXTRACT
        category_name_t USING (product_category_name)
    INNER JOIN -- EXTRACT
        seller USING (seller_id)
    INNER JOIN -- EXTRACT
        reviews USING (order_id)
	INNER JOIN
		payments USING (order_id)
    GROUP BY
        orders.customer_id,
        orders.order_status,
        customers.customer_city,
        customers.customer_state,
        order_items.product_id,
        YEAR(orders.order_purchase_timestamp),
        MONTHNAME(orders.order_purchase_timestamp),
        category_name_t.product_category_name_english,
        seller.seller_state,
        seller.seller_city,
        payments.payment_type,
        payments.payment_value;
    -- Commit the changes
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateSupermarket_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateSupermarket_info`()
BEGIN
    IF (EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'Supermarket_info')) THEN
        -- If the table exists, drop it
        DROP TABLE Supermarket_info;
    END IF;
    CREATE TABLE Supermarket_info AS -- LOAD: Creates a new table and loads the result of the select into it
    SELECT
        orders.customer_id AS CustomerNumber,
        orders.order_id AS Order_Id,
        UPPER(TRIM(orders.order_status)) AS OrderStatus,
        UPPER(TRIM(customers.customer_city)) AS City,
        customers.customer_state AS State,
        order_items.product_id AS ProductNumber,
        ROUND(AVG(reviews.review_score), 2) AS AverageReviewScore,
        ROUND(SUM(order_items.price + order_items.freight_value),2) AS TotalRevenue,
        ROUND(AVG(order_items.price + order_items.freight_value),2) AS AverageOrderValue,
        YEAR(orders.order_purchase_timestamp) AS OrderYear, -- TRANSFORM: Transforms the date timestamp into years
        MONTHNAME(orders.order_purchase_timestamp) AS OrderMonth, -- TRANSFORM: Transforms the date timestamp into months
        category_name_t.product_category_name_english AS Category,
        seller.seller_state AS SellerState,
        seller.seller_city AS SellerCity,
        UPPER(TRIM(payments.payment_type)) AS PaymentType,
        payments.payment_value AS PaymentValue
    FROM orders
    INNER JOIN -- EXTRACT
        customers USING (customer_id)
    INNER JOIN -- EXTRACT
        order_items USING (order_id)
    INNER JOIN -- EXTRACT
        products USING (product_id)
    INNER JOIN -- EXTRACT
        category_name_t USING (product_category_name)
    INNER JOIN -- EXTRACT
        seller USING (seller_id)
    INNER JOIN -- EXTRACT
        reviews USING (order_id)
    INNER JOIN
        payments USING (order_id)
    GROUP BY
        orders.customer_id,
        orders.order_id,
        orders.order_status,
        customers.customer_city,
        customers.customer_state,
        order_items.product_id,
        YEAR(orders.order_purchase_timestamp),
        MONTHNAME(orders.order_purchase_timestamp),
        category_name_t.product_category_name_english,
        seller.seller_state,
        seller.seller_city,
        payments.payment_type,
        payments.payment_value;
    -- Commit the changes
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Supermarket_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Supermarket_info`()
BEGIN
    CREATE TABLE IF NOT EXISTS Supermarket_info AS -- LOAD: Creates new table and loads the result of the select in it
    SELECT
        orders.customer_id AS CustomerNumber,
        COUNT(DISTINCT orders.order_id) AS TotalOrders,
        UPPER(TRIM(orders.order_status)) AS OrderStatus,
        UPPER(TRIM(customers.customer_city)) AS City,
        customers.customer_state AS State,
        order_items.product_id AS ProductNumber,
		COUNT(products.product_id) AS NumberOfProducts,
		ROUND(AVG(reviews.review_score), 2) AS AverageReviewScore,
        ROUND(SUM(order_items.price + order_items.freight_value),2) AS TotalRevenue,
		ROUND(AVG(order_items.price + order_items.freight_value),2) AS AverageOrderValue,
		YEAR(orders.order_purchase_timestamp) AS OrderYear, -- TRANSFORM: Transforms the date timestamp into years
        MONTHNAME(orders.order_purchase_timestamp) AS OrderMonth, -- TRANSFORM: Transforms the date timestamp into months
        category_name_t.product_category_name_english AS Category,
        seller.seller_state AS SellerState,
        seller.seller_city AS SellerCity,
        UPPER(TRIM(payments.payment_type)) AS PaymentType,
        payments.payment_value AS PaymentValue
    FROM orders
	INNER JOIN -- EXTRACT
        customers USING (customer_id)
    INNER JOIN -- EXTRACT
        order_items USING (order_id)
    INNER JOIN -- EXTRACT
        products USING (product_id)
    INNER JOIN -- EXTRACT
        category_name_t USING (product_category_name)
    INNER JOIN -- EXTRACT
        seller USING (seller_id)
    INNER JOIN -- EXTRACT
        reviews USING (order_id)
	INNER JOIN
		payments USING (order_id)
    GROUP BY
        orders.customer_id,
        orders.order_status,
        customers.customer_city,
        customers.customer_state,
        order_items.product_id,
        YEAR(orders.order_purchase_timestamp),
        MONTHNAME(orders.order_purchase_timestamp),
        category_name_t.product_category_name_english,
        seller.seller_state,
        seller.seller_city,
        payments.payment_type,
        payments.payment_value;
    -- Commit the changes
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-10 23:20:51
