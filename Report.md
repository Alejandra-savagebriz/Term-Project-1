# Term Project 1: Brazilian E-Commerce Marketplace Data Analytics
Data Engineering 1  
Central European University  
Alejandra Savage Briz 

## Table of Contents
# Table of Contents
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

<p align="justify"> The data used for this project has eight different datasets related to the different steps in which Olist fulfills an order. For more information regarding the description of each of the columns of the datasets visit: 

### Data schema  
<p align="justify">The following diagram explains the way in which the eight datasets are related:
<p align="justify"> ![image](https://github.com/Alejandra-savagebriz/Term-Project-1/assets/88064979/41b558b3-6891-4ef3-afa2-3f1264aded94)




## Analytics Plan
<p align="justify"> With the different datasets that are available for the project, enterprises such as Olist Supermarket, can thrive by harnessing the potency of data analytics to glean invaluable insights and facilitate well-informed decision-making. As the datasets encompass a variety of aspects such as orders, payments, customer reviews, and more, it is possible to prepare an analytics plan guided by data-driven exploration.

<p align="justify"> The following plan outlines various queries and analyses that can be performed using the datasets available for Olist Supermarket:
        
* _Top 10 City Revenue_:This view provides a summary of city-wise revenue, including the top 10 cities with the highest revenue.
  
* _Product Category Summary_: This view provides a summary of the 15 more popular product categories, including the number of products and the average review score.

* _Order Status Summary_: This view provides a summary of the total number of orders per order status.

* _Orders By Payment Type_: This view provides a summary of the number of orders per payment type.

* _Monthly Order Summary_: This view provides a summary of total orders per year and month.

# Operational Layer
## Architecture

## EER Diagram        
<p align="justify">The following Enhanced-Entity-Relationship Diagram (ERR) was created within MySQL Workbench, considering the distinctive attributes and interconnections inherent in each of the nine datasets associated with Olist Supermarket available data. This comprehensive ERD is emblematic of the primary keys, serving as unique identifiers for records within each dataset, and the consequential establishment of corresponding foreign keys that underpin pivotal connections and associations between the datasets.         

![image](https://github.com/Alejandra-savagebriz/Term-Project-1/assets/88064979/d448c2ce-db39-451b-ac39-22fc37f0051a)

        
<p align="justify"> For the last step of the creation of the operational data it was necessary to create the schema and the different tables. In MySQL Workbench the schema **supermarket_olist** was created as well as nine different tables in order to be consistent with the names of the store and the datasets.
        
# Analytical Layer
## Datawarehouse
<p align="justify"> To create the analytical layer after loading all the tables from the Entity-Relationship Diagram (EER), it is essential to understand the primary keys within each table. This understanding is crucial for determining the best way to link and join these tables efficiently. In SQL, establishing an analytical layer revolves around identifying the key elements that facilitate smooth data correlation and analysis across multiple datasets, ultimately enabling the extraction of valuable insights.

![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/c15cd86b-9cb9-45bd-bc28-2863803de3c7)

# ETL Pipeline
## Events and Store Procedures
<p align="justify"> After identifying the specific attributes and features necessary for the initial comprehensive table, the start of data processing through the ETL (Extract, Transform, Load) procedure becomes a pivotal step. The extraction phase is represented through inner joins, combining data from diverse datasets. Subsequently, the transformation stage manifests in the conversion of dates into weekdays, thereby amplifying the data's analytical utility. Lastly, the loading phase takes shape with the creation of a new table named *ProductInfo*. 

<p align="justify"> To optimize the process and ensure repeatability, a stored procedure named **CreateProductInfoTable()** was created, streamlining the formation of this filtered table (**ProductInfo**) by extracting details from the array of datasets. This approach simplifies the procedure, enabling a more efficient conversion of unprocessed data into well-structured, insightful data within the MySQL database. 
        
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/d5bac3a0-a91e-43e4-ad62-bd3f0c4886ec)        

<p align="justify"> The utilization of events was essential for automating and executing the various ETL tasks within the project. Events are a fundamental component of MySQL, allowing for the scheduling and execution of tasks at specified intervals. To ensure the correct execution of these ETL jobs, an initial event was created (**CreateProductInfoEvent**) following an evaluation of the scheduler's status. This event was  designed to execute the ETL process established in the preceding step. It was scheduled to run at one-minute intervals, consistently, over the course of an hour.

![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/75e77041-c1fb-4f59-8e3d-3814ca49089f)

## Triggers
        

## Data Marts
<p align="justify"> Constructing data marts and views within MySQL is important for the creation of the analytics plan subsequent to an ETL (Extract, Transform, Load) process. Data marts represent purpose-built data subsets tailored for specific business units or functions. This segmentation of data into specialized marts facilitates a streamlined focus on precise analytical requirements, thereby expediting query processing and alleviating the computational burden on the primary database. Views, in contrast, offer abstract data representations that grant analysts access to intricate data without altering the underlying architecture. They simplify the data retrieval process, and through transformations or aggregations, views render data in a more accessible format for analytical purposes.

<p align="justify"> By delivering a structured and user-friendly gateway to data, these constructs extract insights, make informed decisions, and develop a comprehensive comprehension of business processes. The following views and data marts were created based on the initial analytics plan:

Customer purchase trend (2016-2018)
* _Customer purchase trend (2016-2018)_: 

# Extras

## Trigger


## Testing

## Visualizations 

