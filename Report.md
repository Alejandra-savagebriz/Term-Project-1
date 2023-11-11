# Term Project 1: Brazilian E-Commerce Marketplace Data Analytics
Data Engineering 1  
Central European University  
Alejandra Savage Briz 

## Table of Contents
- [Overview](#overview)
  - [Data Source](#data-source)
    - [Data Schema](#data-schema)
  - [Analytics Plan](#analytics-plan)
- [Operational Layer](#operational-layer)
  - [Architecture](#architecture)
  - [EER Diagram](#eer-diagram)
- [Analytical Layer](#analytical-layer)
  - [Datawarehouse](#datawarehouse)
- [ETL Pipeline](#etl-pipeline)
  - [Events and Stored Procedures](#events-and-stored-procedures)
  - [Triggers](#triggers)
- [Datamarts](#datamarts)
- [Extras](#extras)
  - [Triggers](#triggers-2)
  - [Testing](#testing)
  - [Visualizations](#visualizations)

# Overview
## Data Source 
<p align="justify"> The data used in the project comprises public information related to e-commerce orders executed on Olist Store, a prominent online retail platform in Brazil. The different datasets encompass a range of details regarding orders spanning the period from 2016 to 2023. These orders were placed across several online marketplaces in Brazil. The dataset offers a comprehensive view of each order, spanning diverse facets such as order status, pricing, payment, shipping performance, customer location, product attributes, and customer reviews. By having this information, it is possible to create a relational database since each dataset has a primary key that can relate to another dataset. 

<p align="justify">The order fulfillment process on Olist Store involves the following steps: when a customer places an order, a seller is promptly notified to prepare and ship the order. Upon the customer's receipt of the product or upon the estimated delivery date, the customer is invited to participate in a satisfaction survey via email. This survey enables the customer to provide feedback by assigning a rating to their purchase experience and by adding comments. Each order within this dataset may consist of multiple individual items. Each of these items could be fulfilled by different sellers. Importantly, all textual references to specific stores and partners have been anonymized and substituted with the names of prominent Game of Thrones noble houses.  

<p align="justify"> Source: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce </p>
<p align="justify"> For more information about Olist, please visit their website at www.olist.com.

<p align="justify"> The data used for this project has eight different datasets related to the different steps in which Olist fulfills an order. For more information regarding the description of each of the columns of the datasets visit: https://github.com/Alejandra-savagebriz/Term-Project-1/blob/main/Dataset%20Description.xlsx


### Data schema  
The following diagram explains the way in which the eight datasets are related:
      ![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/5f26a4f0-dad7-4495-9ecb-2098fcad7b9c)


## Analytics Plan
<p align="justify"> With the different datasets that are available for the project, enterprises such as Olist Supermarket, can thrive by harnessing the potency of data analytics to glean invaluable insights and facilitate well-informed decision-making. As the datasets encompass a variety of aspects such as orders, payments, customer reviews, and more, it is possible to prepare an analytics plan guided by data-driven exploration.

<p align="justify"> The following plan outlines various queries and analyses that can be performed using the datasets available for Olist Supermarket:
        
* _Top 10 City Revenue_:This view provides a summary of city-wise revenue, including the top 10 cities with the highest revenue.
  
* _Product Category Summary_: This view provides a summary of the 15 more popular product categories, including the number of products and the average review score.

* _Order Status Summary_: This view provides a summary of the total number of orders per order status.

* _Orders By Payment Type_: This view provides a summary of the number of orders per payment type.

* _Monthly Order Summary 2022_: This view provides a summary of total orders per month in 2022.

# Operational Layer
## Architecture
<p align="justify"> This is the architecture followed for creating the Operational layer.

  ## EER Diagram        
<p align="justify">The following Enhanced-Entity-Relationship Diagram (ERR) was created within MySQL Workbench, considering the distinctive attributes and interconnections inherent in each of the nine datasets associated with Olist Supermarket available data. This comprehensive ERD is emblematic of the primary keys, serving as unique identifiers for records within each dataset, and the consequential establishment of corresponding foreign keys that underpin pivotal connections and associations between the datasets.         

![image](https://github.com/Alejandra-savagebriz/Term-Project-1/assets/88064979/cff05e02-ef0d-4e13-a894-c7592f92bc54)


        
For the last step of the creation of the operational data it was necessary to create the schema and the different tables. In MySQL Workbench the schema _supermarket_brasil_ was created as well as nine different tables in order to be consistent with the names of the store and the datasets.
        
# Analytical Layer
## Data Warehouse
To create the analytical layer after loading all the tables from the Entity-Relationship Diagram (EER), it is essential to understand the primary keys within each table. This understanding is crucial for determining the best way to link and join these tables efficiently. In SQL, establishing an analytical layer revolves around identifying the key elements that facilitate smooth data correlation and analysis across multiple datasets, ultimately enabling the extraction of valuable insights.

![image](https://github.com/Alejandra-savagebriz/Term-Project-1/assets/88064979/0b78b4de-aaed-4796-a8d8-a6f00ef626c0)
![image](https://github.com/Alejandra-savagebriz/Term-Project-1/assets/88064979/6961dc56-5a82-471a-8c89-adafb94edac9)


# ETL Pipeline
After identifying the specific attributes and features necessary for the initial comprehensive table, the start of data processing through the ETL (Extract, Transform, Load) procedure becomes a pivotal step. The extraction phase is represented through inner joins, combining data from diverse datasets. Subsequently, the transformation stage manifests in the conversion of dates into weekdays, thereby amplifying the data's analytical utility. Lastly, the loading phase takes shape with the creation of a new table named **Supermarket_info**. 

![image](https://github.com/Alejandra-savagebriz/Term-Project-1/assets/88064979/926ef2a6-0613-44df-afbb-6ecdf5a81449)




<p align="justify">The **Extract** part consisted in extracting and joining data from the following source tables (orders, customers, order_items, products, category_name_t, seller, reviews, payments) based on common keys (customer_id, order_id, product_id, product_category_name, seller_id).

The **Transform** part consisted in the following:
  - `UPPER(TRIM(orders.order_status)) AS OrderStatus`: Converts the order status to uppercase and removes leading and trailing spaces.
  - `UPPER(TRIM(customers.customer_city)) AS City`: Converts the customer city to uppercase and removes leading and trailing spaces.
  - `ROUND(AVG(reviews.review_score), 2) AS AverageReviewScore`: Calculates the average review score from the 'reviews' table and rounds it to two decimal places.
  - `ROUND(SUM(order_items.price + order_items.freight_value), 2) AS TotalRevenue`: Calculates the total revenue by summing the price and freight value from the 'order_items' table and rounds the result to two decimal places.
  - `ROUND(AVG(order_items.price + order_items.freight_value), 2) AS AverageOrderValue`: Calculates the average order value by averaging the sum of price and freight value from the 'order_items' table and rounds the result to two decimal places.
  - `YEAR(orders.order_purchase_timestamp) AS OrderYear`: Transforms the date timestamp into years.
  - `MONTHNAME(orders.order_purchase_timestamp) AS OrderMonth`: Transforms the date timestamp into months and returns only the month name.
  - `UPPER(TRIM(payments.payment_type)) AS PaymentType`: Converts payment types to uppercase and removes leading and trailing spaces.

The **Load** part consisted in creating a new table _Supermarket_info_ and loading it with the result of the transformation.

<p align="justify">To optimize the process and ensure repeatability, a stored procedure named **CreateSupermarket_info()** was created, streamlining the formation of this filtered table (**Supermarket_info**) by extracting details from the array of datasets. This approach simplifies the procedure, enabling a more efficient conversion of unprocessed data into well-structured, insightful data within the MySQL database.  

The utilization of events was essential for automating and executing the various ETL tasks within the project. Events are a fundamental component of MySQL, allowing for the scheduling and execution of tasks at specified intervals. To ensure the correct execution of these ETL jobs, an initial event was created (**CreateSupermarket_info()**) following an evaluation of the scheduler's status. This event was  designed to execute the ETL process established in the preceding step. It was scheduled to run at one-minute intervals, consistently, over the course of an hour.
![image](https://github.com/Alejandra-savagebriz/Term-Project-1/assets/88064979/9d0ec44c-5fe3-48b9-8e55-17be3c1ec51c)

## Events and Store Procedures
The event **'CreateSupermarket_infoEvent** was configured to execute the previously established ETL process at a recurring interval of every minute. Throughout its execution, the event accomplishes two crucial tasks: firstly, it records a timestamped message denoting the execution time into the 'messages' table, serving as a log for monitoring purposes. Secondly, it invokes the 'CreateSupermarket_info' stored procedure, thereby initiating the ETL process. This event-driven approach not only automates the execution of ETL tasks but also provides a systematic means of logging execution times, contributing to the overall efficiency and traceability of the data processing workflow.

The stored procedure named **CreateSupermarket_info** performs a crucial role in the database by generating and populating the 'Supermarket_info' table (data warehouse). The procedure begins by checking for the existence of the table; if present, it is dropped to ensure a fresh start. Subsequently, a new 'Supermarket_info' table is created and loaded with data sourced from various tables, including 'orders,' 'customers,' 'order_items,' and others, through a series of INNER JOIN operations. The procedure incorporates data transformations such as converting text fields to uppercase, trimming spaces, rounding numeric values, and extracting temporal information. This orchestrates the creation of a structured and consolidated 'Supermarket_info' table, facilitating a comprehensive view of relevant information within the database.

**See trigger in Extras section**

## Data Marts
<p align="justify"> Constructing data marts and views within MySQL is important for the creation of the analytics plan subsequent to an ETL (Extract, Transform, Load) process. Data marts represent purpose-built data subsets tailored for specific business units or functions. This segmentation of data into specialized marts facilitates a streamlined focus on precise analytical requirements, thereby expediting query processing and alleviating the computational burden on the primary database. Views, in contrast, offer abstract data representations that grant analysts access to intricate data without altering the underlying architecture. They simplify the data retrieval process, and through transformations or aggregations, views render data in a more accessible format for analytical purposes.

<p align="justify"> By delivering a structured and user-friendly gateway to data, these constructs extract insights, make informed decisions, and develop a comprehensive comprehension of business processes. The following views and data marts were created based on the initial analytics plan:

![image](https://github.com/Alejandra-savagebriz/Term-Project-1/assets/88064979/62c7a091-9445-4b92-a598-ac974fe700f6)


# Extras

## Trigger
The creation of the **"AFTER INSERT"** trigger named after_insert_customers for the CUSTOMERS table within the supermarket_brasil database was designed to execute automatically after each new insertion into the CUSTOMERS table. The trigger logic checks if the newly inserted row has a NULL or empty value for the customer_unique_id column. If this condition is true, the trigger initiates an update operation on the CUSTOMERS table, setting the customer_unique_id column to the value of customer_id for the corresponding row. The update is applied selectively, only where the customer_id matches the newly inserted customer_id. This trigger mechanism ensures that the customer_unique_id is consistently populated with the associated customer_id value, maintaining data integrity in the CUSTOMERS table.

## Testing
<p align="justify"> Following the establishment of the project schema and its associated tables, critical testing points were thoughtfully integrated into the code to meticulously validate the accuracy of input values. This comprehensive testing approach extends to the scrutiny of stored procedures, events, and triggers, where check points were strategically placed. The examination of messages, along with the assessment of event and trigger statuses, proved invaluable in ensuring the seamless functionality of the system. Emphasizing the significance of thorough testing, a dedicated testing point was introduced to insert values into the data warehouse table, allowing for a meticulous evaluation of trigger performance. 

<p align="justify"> Moreover, the SQL code culminates with a dedicated Testing section featuring an array of tests meticulously designed to verify the integrity of data marts, reinforcing the importance of robust testing practices throughout the development lifecycle. This multifaceted testing strategy serves as a linchpin in guaranteeing the reliability and effectiveness of the overall system.


## Visualizations 
<p align="justify"> The SQL process was mirrored in Python to facilitate the upload of datasets and the creation of the data warehouse. With all the necessary values and columns seamlessly integrated into the data warehouse, replicating the data marts and their corresponding views in Python became a straightforward task. Following this replication, specific visualizations were generated for each view, adding a layer of clarity and insight to the dataset analysis. This cohesive transition between SQL and Python not only streamlined the data management process but also allowed for dynamic visual representations, enhancing the interpretability of the underlying data.
