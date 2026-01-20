1\.**# Flat File System vs**



\*structure:

single table or text file (CSV, TSV).

-------------------------------------------------------------------



\*Data Redundancy:

Is has High redundancy, that is mean same  data stored in multiple files, leading to duplication.

-------------------------------------------------------------------



\*Relationship:

No inherent relationships; files are standalone, making cross-file queries.

------------------------------------------------------------------



\*Example Usage:

Small apps, config files, logs, simple storage.

------------------------------------------------------------------



\*Drawbacks:

Data inconsistency if one file is updated but others not.it will be lack of integrity and inefficient updates.

--------------------------------------------------------------------





**#Relational Database**

\*structure:

Multiple tables with defined relationships.

---------------------------------------------------------------------



\*Data Redundancy:

Low redundancy, that is mean the data stored one time to avoid duplication.

-------------------------------------------------------------------------



\*Relationship:

Strong relationships: tables linked by primary  key and foreign key, enabling complex queries and joins.

-----------------------------------------------------------------------------





\*Example Usage:

Business apps, financial systems, enterprise software.

---------------------------------------------------------------------------------



\*Drawbacks:

Complex setup so it requires more resources and expertise and may be overkill small datasets.

=================================================================================================





2\. DBMS Advantages – Mind Map



Security  : protects sensitive data from unauthorized access



Integrity: ensures accuracy and consistency of stored information



Backup : supports recovery in case of data loss



Redundancy : minimizes duplication of data



Concurrency : enables multiple users to access data simultaneously



Data Sharing :allows collaboration across teams and applications

=================================================================================================







3\. Explain the following key roles and what each person typically does in a database project:



\*System Analyst:

He is the a as bridge between business needs and technical solutions.



He gathers requirements from stakeholders, analyzes workflows, and defines what the database must achieve.



He ensures the database project aligns with organizational goals.

--------------------------------------------------------------------------------------------



\* Database Designer:

He translates requirements into a conceptual and logical data model.



He defines tables, relationships, constraints, and normalization rules.



He focuses on efficiency, integrity, and scalability of the database structure.

--------------------------------------------------------------------------------------------------



\* **Database Developer**

He implements the database design by writing SQL scripts, stored procedures and functions.



He optimizes queries for performance.



He works closely with designers and application developers to ensure smooth integration.

------------------------------------------------------------------------------------------------





**\* Database Administrator (DBA)**



He manages and maintains the database system after deployment.



He handles backups, recovery, security, and performance .



He ensures availability, reliability, and compliance with policies.

**----------------------------------------------------------------------------------------**



**\*Application Developer**

He builds the front‑end or middleware applications that interact with the database.

He designs user interfaces, APIs, and business logic.

He ensures that applications correctly query and update the database.



**-----------------------------------------------------------------------------------------**



**\*BI (Business Intelligence) Developer**

He focuses on turning raw data into insights.



He builds dashboards, reports, and data pipelines using tools like Power BI, Tableau, or SSRS.



He works with stakeholders to provide analytics that support decision‑making.

------------------------------------------------------------------------------------------





**4.Types of Database**



 **# Relational Databases**



It is structured schema with tables, rows, and columns.it use for SQL queries .It is strong  consistency and ACID compliance.



Example of it: 

Banking systems, ERP, CRM where structured data and transactions matter.





**# Non-Relational Databases (NoSQL)**



It is flexible schema, designed for unstructured or semi-structured data. It support prioritize scalability and availability.



Examples of it:

**MongoDB**: Document-oriented, great for evolving data models and complex queries.



**Cassandra:** Wide-column store, excels at high write throughput and distributed scalability.



Example of it: Social media feeds and recommendation engines.

=====================================================================================



**5.Cloud Storage Database**



**Cloud storage** is a service that allows data to be stored remotely on servers accessed by the internet. 

Examples of it :

&nbsp;Amazon S3, Google Cloud Storage, and Azure Blob Storage.



**Relationship Between Cloud Storage and Databases**





**Cloud storage:**



Stores unstructured or semi-structured data such as files, images, videos, logs, and backups.



Examples: Amazon S3, Azure Blob Storage, Google Cloud Storage.



Focuses on durability, scalability, and accessibility over the internet.



**Databases:**



Organize data into structured formats (tables, rows, columns in relational databases; documents or key-value pairs in NoSQL).



Enable efficient querying, updating, and management of data using languages like SQL.



Examples: Amazon RDS, Azure SQL Database, Google Cloud Spanner.



**Relationship:**



Cloud storage acts as the underlying infrastructure for storing raw data.



Databases build on this by providing logic, indexing, and querying capabilities to make data useful for applications.



Together, they form a synergistic system: storage ensures persistence and scalability, while databases ensure organization and usability.











Support for databases:



Provides the underlying infrastructure for storing structured and unstructured data.



Enables high availability and ensuring databases can reliably access data.



Facilitates backup and disaster recovery, critical for database resilience.



Acts as a scalable storage layer, allowing databases to expand seamlessly as data grows.







**Advantages of Cloud-Based Databases:**



Scalability: Easily scale up or down based on demand without purchasing hardware.



Cost efficiency: Pay-as-you-go pricing reduces upfront capital expenditure.



Managed services: Providers handle patching, updates, backups, and monitoring (e.g., Amazon RDS, Azure SQL).



Global accessibility: Data can be accessed from anywhere, supporting distributed teams and applications.



High availability: Built-in redundancy and failover mechanisms minimize downtime.



Advanced features: Services like Google Cloud Spanner offer global consistency and horizontal scaling.





**Disadvantages or Challenges:**



Vendor lock-in: Migrating databases between providers can be complex and costly.



Latency: Network delays may affect performance compared to on-premises solutions.



Compliance and security: Organizations must ensure data privacy and meet regulatory requirements (e.g., GDPR, HIPAA).



Cost unpredictability: Usage-based billing can lead to unexpected expenses if workloads spike.



Limited customization: Cloud databases may restrict certain configurations compared to self-managed systems.



Dependency on internet connectivity: Outages or poor connections can disrupt access.



























