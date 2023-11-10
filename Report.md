# Term Project 1
Data Engineering 1  
Central European University  
Alejandra Savage Briz  
## Operational Layer
### Project data 
<p align="justify"> The data used in the project comprises public information related to e-commerce orders executed on Olist Store, a prominent online retail platform in Brazil. The different datasets encompass a range of details regarding orders spanning the period from 2016 to 2018. These orders were placed across several online marketplaces in Brazil. The dataset offers a comprehensive view of each order, spanning diverse facets such as order status, pricing, payment, shipping performance, customer location, product attributes, and customer reviews. By having this information, it is possible to create a relational database since each dataset has a primary key that can relate to another dataset. It is noteworthy that all references to actual companies and partners in the review texts have been anonymized and replaced with the names of notable houses from the Game of Thrones series.

<p align="justify">The dataset was generously shared by Olist, a leading player in the Brazilian marketplace landscape. Olist serves as a bridge between small businesses across Brazil and various sales channels, simplifying the process through a single contractual agreement. These small businesses can list their products for sale on Olist Store, and Olist handles the logistics, facilitating direct shipping to customers through its network of partners. For more information about Olist, please visit their website at www.olist.com.

<p align="justify">The order fulfillment process on Olist Store involves the following steps: when a customer places an order, a seller is promptly notified to prepare and ship the order. Upon the customer's receipt of the product or upon the estimated delivery date, the customer is invited to participate in a satisfaction survey via email. This survey enables the customer to provide feedback by assigning a rating to their purchase experience and by adding comments. Each order within this dataset may consist of multiple individual items. Each of these items could be fulfilled by different sellers. Importantly, all textual references to specific stores and partners have been anonymized and substituted with the names of prominent Game of Thrones noble houses.  </p>

### Structure of the data
The data used for this project has nine different datasets:  
1.  Customers
        
        
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/da91579f-088d-41fe-98d1-d4549c68944d)
 

2.  Geolocation

        
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/cb65a36a-6829-4490-9901-08f452da0628)


3.  Order Items

        
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/e940245b-6129-475a-9d0d-c3d6da2a01a4)
      





4.  Payments


![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/016a21a8-8d1e-45ee-b59a-fd63768000dc)        



5.  Reviews

                
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/19fd8bff-29b3-4f53-98e3-d232636197c0)



6.  Orders

        
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/e9b39095-1530-4e7a-9112-3f5a23a8cca6)        




7.  Products

            
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/e471b4a6-bf66-4e66-acce-242743788d8a)



8. Sellers

            
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/25a40243-c667-4d47-922d-4f2e8901d8a3)



9.  Product category name

    
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/fa13de27-f3da-4ca5-a18b-ce26187366cc)


### Data schema  
The following diagram explains the way in which the nine datasets are related:
        ![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/90c9955b-7db8-419c-b0c5-41fbe13a1a1f)

### EER Diagram        
<p align="justify">The following Enhanced-Entity-Relationship Diagram (ERR) was created within MySQL Workbench, considering the distinctive attributes and interconnections inherent in each of the nine datasets associated with Olist Supermarket available data. This comprehensive ERD is emblematic of the primary keys, serving as unique identifiers for records within each dataset, and the consequential establishment of corresponding foreign keys that underpin pivotal connections and associations between the datasets.         

![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/43eb7cf4-2767-46df-b3e0-c9e064d416b3)        


## Analytics
<p align="justify"> With the different datasets that are available for the project, enterprises such as Olist Supermarket, can thrive by harnessing the potency of data analytics to glean invaluable insights and facilitate well-informed decision-making. As the datasets encompass a variety of aspects such as orders, payments, customer reviews, and more, it is possible to prepare an analytics plan guided by data-driven exploration.

<p align="justify"> The following plan outlines various queries and analyses that can be performed using the datasets available for Olist Supermarket:
        
* _Customer purchase trend (2016-2018)_: Counts of delivered orders for each month across the specified years.
  
* _Top 5 Cities with Highest Revenue (2016-2018)_: Identify and rank the top five cities with the highest revenue generated from 2016 to 2018.

* _State-wise Revenue Table (2016-2018)_: Create a table that shows the revenue for each state, aggregated over the period of 2016 to 2018.

* _Top Successful Sellers_: Determine the top sellers based on the number of goods sold, total revenue, and the count of unique customers they served.

* _Sellers with Highest 5-Star Ratings_: Identify sellers with the highest number of 5-star ratings in customer reviews.

* _Delivery Success Rate across State_: Calculate and analyze the delivery success rate, specifically examining the success rates across different states.

* _Preferred Form of Payment by Categories_: Explore the preferred form of payment for different product categories, providing insights into customer payment behavior.

* _Percentage of Reviews with No Comments_: Calculate the percentage of reviews that do not have accompanying comments, shedding light on customer feedback patterns.

* _Orders from State of São Paulo (Excluding São Paulo City)_: Determine how many orders originated from the State of São Paulo but not from the City of São Paulo, if any.

* _Orders Over $10 by Customer_: Select and analyze orders where the total purchase amount per customer exceeds $10, including customer information, order details, and product categories.

* _Interstate Orders Delivery Time_: Calculate the delivery time (in days) for interstate orders, providing insights into delivery efficiency.

* _Orders Price and Item Quantity Analysis_: Select and analyze the sum of order prices and the quantity of items purchased per order, highlighting variations between orders.

* _Volumetric Weight vs. Product's Weight Analysis_: Distinguish between orders that are charged based on volumetric weight and those charged based on the product's weight, uncovering insights about Olist's freight services.

<p align="justify"> This analytics plan will cover a variety of interesting aspects, including questions related to revenue, customer behavior, logistics improvements, and more. Through our data exploration, our objective is to equip Olist Supermarket with the insights needed to make decisions based on data and improve the overall shopping experience for its customers.

        
### Loading data in MySQL Workbench
<p align="justify"> For the last step of the creation of the operational data it was necessary to create the schema and the different tables. In MySQL Workbench the schema **supermarket_olist** was created as well as nine different tables in order to be consistent with the names of the store and the datasets.

#### Schema creation
<p align="justify"> During the schema creation process, we took into account the possibility of existing schemas with the same name as "**supermarket_olist**". If such schemas were identified, they were dropped. In cases where the schema did not exist, we proceeded to create it using the following code:

![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/92f12e8d-aca9-4d31-bd6b-e321855e697c)


#### Table creation
<p align="justify"> To prepare the datasets for analysis, a specific table was created for each of the nine datasets, bearing names such as "customers," "reviews," "products," "orders," "payments," "sellers," "category name (translation)," "order items," and "geolocation." Within the creation of each table, meticulous attention was given to defining the data types associated with the respective datasets and specifying the required variable types. 

<p align="justify"> Leveraging the data manipulation methods covered during the course, it was deemed most prudent for the project to ingest the datasets and subsequently populate the tables. This approach facilitated the systematic transfer of values from the files to the main code, enhancing the reproducibility of the process. In adopting this methodology, various tables were established within the "supermarket_olist" schema, ensuring a structured foundation for further analysis.

<p align="justify"> This is a sample code for the creation of the table __category__, note that the SQL file with all of the process can be consulted in this repository:
        
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/f2082649-0ee2-4006-affb-7adf49997e7e)

        
## Analytical Layer
### Creation of analytical layer
<p align="justify"> To create the analytical layer after loading all the tables from the Entity-Relationship Diagram (EER), it is essential to understand the primary keys within each table. This understanding is crucial for determining the best way to link and join these tables efficiently. In SQL, establishing an analytical layer revolves around identifying the key elements that facilitate smooth data correlation and analysis across multiple datasets, ultimately enabling the extraction of valuable insights.

![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/c15cd86b-9cb9-45bd-bc28-2863803de3c7)

### ETL Pipeline & Store Procedures
<p align="justify"> After identifying the specific attributes and features necessary for the initial comprehensive table, the start of data processing through the ETL (Extract, Transform, Load) procedure becomes a pivotal step. The extraction phase is represented through inner joins, combining data from diverse datasets. Subsequently, the transformation stage manifests in the conversion of dates into weekdays, thereby amplifying the data's analytical utility. Lastly, the loading phase takes shape with the creation of a new table named *ProductInfo*. 

<p align="justify"> To optimize the process and ensure repeatability, a stored procedure named **CreateProductInfoTable()** was created, streamlining the formation of this filtered table (**ProductInfo**) by extracting details from the array of datasets. This approach simplifies the procedure, enabling a more efficient conversion of unprocessed data into well-structured, insightful data within the MySQL database. 
        
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/d5bac3a0-a91e-43e4-ad62-bd3f0c4886ec)        


### Events to schedule ETL jobs
<p align="justify"> The utilization of events was essential for automating and executing the various ETL tasks within the project. Events are a fundamental component of MySQL, allowing for the scheduling and execution of tasks at specified intervals. To ensure the correct execution of these ETL jobs, an initial event was created (**CreateProductInfoEvent**) following an evaluation of the scheduler's status. This event was  designed to execute the ETL process established in the preceding step. It was scheduled to run at one-minute intervals, consistently, over the course of an hour.

![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/75e77041-c1fb-4f59-8e3d-3814ca49089f)

        

## Data Marts with Views
<p align="justify"> Constructing data marts and views within MySQL is important for the creation of the analytics plan subsequent to an ETL (Extract, Transform, Load) process. Data marts represent purpose-built data subsets tailored for specific business units or functions. This segmentation of data into specialized marts facilitates a streamlined focus on precise analytical requirements, thereby expediting query processing and alleviating the computational burden on the primary database. Views, in contrast, offer abstract data representations that grant analysts access to intricate data without altering the underlying architecture. They simplify the data retrieval process, and through transformations or aggregations, views render data in a more accessible format for analytical purposes.

<p align="justify"> By delivering a structured and user-friendly gateway to data, these constructs extract insights, make informed decisions, and develop a comprehensive comprehension of business processes. The following views and data marts were created based on the initial analytics plan:

### Customer purchase trend (2016-2018)
* _Customer purchase trend (2016-2018)_: Counts of delivered orders for each month across the specified years.
<p align="justify"> This view compiles delivery-related data from 2016 to 2018, specifically focusing on delivered orders while excluding those with missing delivery dates. It groups orders by customer, order, and month, categorizing each month numerically. The view then tabulates the count of delivered orders for each month across the specified years, producing a structured summary.
        
![image](https://github.com/Alejandra-savagebriz/TP1/assets/88064979/164d674d-9b30-4cce-8ee4-185e3b5fc9cd)


<p align="justify"> The results of the view are the following:
        
| month_no | month | Year2016 | Year2017 | Year2018 |
| -------- | ----- | -------- | -------- | -------- |
| 1        | Jan   | 15       | 15       | 9        |
| 2        | Feb   | 29       | 8        | 4        |
| 3        | Mar   | 21       | 13       | 8        |
| 4        | Apr   | 12       | 30       | 17       |
| 5        | May   | 33       | 28       | 27       |
| 6        | Jun   | 15       | 1        | 21       |
| 7        | Jul   | 6        | 7        | 11       |
| 8        | Aug   | 29       | 29       | 16       |
| 9        | Sep   | 2        | 1        | 14       |
| 10       | Oct   | 9        | 6        | 11       |
| 11       | Nov   | 13       | 9        | 3        |
| 12       | Dec   | 4        | 8        | 20       |


<p align="justify"> Upon analyzing the data, several noteworthy trends in order deliveries emerge. In 2016, January and February experienced a relatively high number of orders, while February in 2017 and 2018 saw a decrease in order counts. May of 2016 stands out with a significant surge in delivered orders, a trend that persisted throughout 2017 and 2018. 

<p align="justify"> Comparatively, June 2016 had a lower order count, but there was an increase in June 2018. Notably, April of 2017 witnessed a substantial uptick in delivered orders. Finally, December 2018 exhibited a significant increase in delivered orders in comparison to the previous December. These insights are valuable for understanding order delivery trends, enabling businesses to make informed decisions, optimize their logistics, and address any potential seasonality or customer demand patterns.

## Extras

### Triggers


### Testing plan

### Materialized views


### Visualizations (dashboard)


### NLP Model

