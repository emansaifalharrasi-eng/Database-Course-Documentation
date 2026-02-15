create database LibrarySystemProject
use LibrarySystemProject

--create library table--
create table library(
lib_ID int Primary key Identity(1,1),
lib_name varchar(100) Unique  Not null,
cont_num varchar(50)Not null,
loction varchar(50)Not null,
esta_year varchar(50)

)


select * from library 

--create table staff

create table staff(
staff_ID int Primary key Identity(1,1),
f_name varchar(50),
position varchar(50),
contact_num varchar(50),
lib_ID int, 
Foreign Key (lib_ID) References library(lib_ID) ON DELETE Cascade ON UPDATE Cascade
)

--create members table--

create table members1(
mem_ID int Primary key Identity(1,1),
f_name varchar(50),
phone varchar(50),
mem_start_dt Date Not null,
mem_email varchar(100)Unique Not null,

 lib_id int,
Foreign Key (lib_id) References library(lib_ID) ON DELETE Cascade ON UPDATE Cascade
)

select * from members1

--create book table

create table book1(

book_ID int Primary key Identity(1,1),
self_location varchar(50)Not null,
ISBN varchar(50)Unique Not null,
gerne varchar(50)Not null,
title varchar(50)Not null,
price varchar(50)Not null,
alia_sta varchar(50),


mem_ID int,
foreign key (mem_ID) references members1 (mem_ID),

LibID int,
foreign Key (LibID) references library(lib_ID)
)
alter table book1
 add CONSTRAINT fk_mem_id FOREIGN KEY (mem_ID) REFERENCES members1(mem_ID) ON DELETE CASCADE ON UPDATE CASCADE; 

 alter table book1
 drop column price

  alter table book1
 add  price int

select * from book1

UPDATE book1
SET price =13
where book_ID=10

UPDATE book1
SET price =15
where book_ID=2


UPDATE book1
SET price =14
where book_ID=4

UPDATE book1
SET price =15
where book_ID=2



--create loans table--

create table loans(
date_loan DATE Primary Key,
status varchar(50)Not null,
date_due DATE Not null, 
date_return DATE Not null,

book_id int,
foreign Key (book_id) references book1 (book_ID),
Mem_ID int,
foreign Key (Mem_ID) references members1(mem_ID)
)
ALTER table review
ADD review_ID INT IDENTITY(1,1);


select *from loans


--create review table--

create table review1(

review_ID INT IDENTITY(1,1) Primary key Not null,
reviw_date DATE,
rating tinyint Not null,
comment varchar(50),



Book_id int foreign key  references book1 (book_ID),
  
   
mem_id  int foreign Key references members1 (mem_ID)

)
select *from  members1

--create payment table--

create  table payment(

pay_date DATE Not null,
amount decimal (10,2) Not null,
method varchar(50),

Date_loan DATE,
foreign key (Date_loan) references loans(date_loan)
)
select * from loans 


 UPDATE loans
SET book_id =6
where date_loan='2026-01-05'


 UPDATE loans
SET book_id =9
where date_loan='2026-01-08'



 UPDATE staff
SET lib_ID =2
where staff_ID=1


UPDATE staff
SET lib_ID =3
where staff_ID=2

UPDATE staff
SET lib_ID =6
where staff_ID=3

 UPDATE book1
SET libID =2
where book_ID=1


UPDATE book1
SET libID =4
where book_ID=2


UPDATE book1
SET libID =5
where book_ID=3

UPDATE review
SET mem_id =4
where reviw_date ='2026-01-03'


UPDATE review
SET mem_id =5
where reviw_date ='2026-01-04'

UPDATE review
SET mem_id =3
where reviw_date ='2026-01-06'


UPDATE review
SET Book_id =3
where reviw_date ='2026-01-03'



UPDATE review
SET Book_id =4
where reviw_date ='2026-01-04'

UPDATE review
SET Book_id =7
where reviw_date ='2026-01-06'



select *from review


  

  insert into library( lib_name ,cont_num, loction ,esta_year)

  values             ('Gographical' ,'92203542',  'Oman '    ,2001),
                     ('Biology' ,'92302344',   'Britin '  ,2000),
					 ('Math'    ,'92340450',   ' Bahrin' ,1999),
					 ('Islamic' ,'96348721',   'Qater'  ,1994),
					 ('Arabic'  ,'93366778',   'Saudi'  ,1993),
					 ('English' ,'97845623',  'America' ,2004 ),
					 ('IT'      ,'92345875',   'Eypet'  ,19991),
					 ('Civil' , '99885521',     'Suirya' ,1988),
					 ('human Resourse' ,'98712342','Plastine',1999),
					 ('Engineering','98765412','Kuwait',1992);
					 

					 insert into staff(f_name,position ,contact_num)
					 values            ('ali salim','Nizwa',93287634),
					                   ('ahmed saif','Ibri' ,97390345),
					                   ('mohammed hamed','Ibra',98734522),
									   ('mahmood saif','Samail',92335982),
									   ('moath saif ','Muscat',987123423),
									   ('muyad salim','Sur',99037885),
									   ('Naji ahmed','Salalh',921341238),
									   ('hamood saif','Barka',98877333),
									   ('issa moosa','Izki',98761234),
									   ('ibrahim Marwan','Saham',98712305);
									   select *from members1

									   insert into members1(f_name,phone,mem_start_dt,mem_email)

									   values            ('saif salim',    98763456,' 2002-02-12', 'moon@gmail.com'),
									                      ('ahmed humeed', 987654329, '2002-01-11', 'flower@gmail.com'),
														  ('salim abullah', 98702345, '2003-04-2',  'rose@gmail.com'),
														  ('jenan suliman', 98712394, '2004-02-01', 'tree@gmail.com'),
														  ('talal hamed',   98612398, '2004-04-03' , 'yusar@gmail'),
														  ('ahmed salim',   98723490, '2003-02-11', 'star@gmail'),
														  ('abullah nasser', 98765323, '2001-01-03', 'beach@gmail'),
														  ('ahmed salah',   98187312, '2006-02-03',  'sea@gmail.com'),
														  ('salih hazzim',  90234568, '1999-04-19', 'butterfly@gmail.com'),
														  ('issa salim',     98702347,' 2020-02-03', 'zara@gmail.com');


														  insert into book1(self_location,ISBN,gerne,title,price,alia_sta) 

				                                          values('al kwair',22,'Children','IT',12.5,'true'),
														        ('mutruh',12,'Children','HR',10,'true'),
																('samail',13,'Fiction,','Civl',02,'false'),
																('ibra',14,'Non-fiction','eng',11,'true'),
																('sur',15,'Reference','Business',04,'false'),
																('ibri',16,'Children','math',06,'true'),	
																('bidbid',17,'Reference','colors',11,'false'),
																('dama',18,'Fiction','cats',05,'true'),
																('aseeb',19,'Fiction','tree',04,'false'),
																('sohar',20,'Non-fiction','animals',03,'true');

													insert into loans(date_loan,status,date_due,date_return)
													values           ('2026-01-02', 'Returned', '2026-01-12', '2026-01-10'),
													                 ('2026-01-05', 'Issued',  '2026-01-15'   ,'2026-02-02'),
													                 ('2026-01-08' , 'Returned','2026-01-18', '2026-01-17'),
													                 ('2026-01-10', 'Overdue',' 2026-01-20',   '2026-01-01'),
													                 ('2026-01-12', 'Returned','2026-01-20', '2026-01-21'),
													                 ('2026-01-15', 'Issued', '2026-01-25', '2026-02-11'),
													                 ('2026-01-18', 'Returned','2026-01-28', '2026-01-26'),
													                 ('2026-01-20', 'Issued','2026-01-30', '2026-02-22'),
													                 ('2026-01-22', 'Returned', '2026-02-01',' 2026-01-31'),
													                 ('2026-01-25', 'Overdue', '2026-02-04', '2026-03-14');


													insert into review( reviw_date ,rating,comment) 

													values('2026-01-03', 5, 'no comment'),
													      ('2026-01-06', 4,'no comment'),
													      ('2026-01-04', 6,'no comment'),
													      ('2026-01-07', 8,'no comment'),
													      ('2026-01-12', 7,'no comment'),
													      ('2026-01-10',1,'no comment'),
													      ('2026-01-11', 2,'no comment'),
													      ('2026-01-22', 3,'no comment'),
													      ('2026-01-18', 9,'no comment'),
													      ('2026-01-25', 10,'no comment'),
													       ('2026-01-19', 4,'no comment')




														   select * from loans


													insert into payment(pay_date,amount,method)
													
													values('2026-01-02', 2.00, 'Cash'),
													('2026-01-05', 5.50, 'Card'),
													('2026-01-08', 3.00, 'Cash'),
													('2026-01-12', 10.00, 'Online'),
													('2026-01-15', 1.50, 'Cash'),
													('2026-01-18', 7.00, 'Card'),
													('2026-01-20', 4.25, 'Online'),
													('2026-01-23', 6.00, 'Card'),
													('2026-01-27', 8.75, 'Cash'),
													('2026-02-01', 12.00, 'Online'),
													('2026-02-03', 15.00, 'Online')


													--Selection part1 till part12--
													
													SELECT *from library

													SELECT *from members1

													SELECT *from book1

													SELECT lib_name ,loction 
													From library

													SELECT Title genre, Price
													From book1

					                                SELECT  f_name , mem_email 
													From members1

													SELECT Staff_ID, f_name, position
													From staff

													SELECT gerne
													FROM   book1
													WHERE gerne ='fiction';


													SELECT loction,lib_name
													FROM   library
													WHERE  loction='Oman';


														SELECT alia_sta,title
													FROM   book1
													WHERE alia_sta  ='true';

													
														SELECT position,f_name
													FROM   staff
													WHERE position='Ibra';


													
														SELECT *
													FROM   loans
													WHERE Status='Overdue';


													SELECT *
													FROM   book1
													WHERE price >20;



													
													SELECT lib_name,esta_year
													FROM   library
													WHERE esta_year <2000;

														
													SELECT *
													FROM   book1
													WHERE price>=15;


													
													SELECT *
													FROM   review
													WHERE rating !=5;


													SELECT gerne,title,alia_sta
                                                     FROM book1
                                                     WHERE gerne='Fiction'AND  alia_sta ='TRUE' ;

													 
													SELECT gerne,title
                                                     FROM book1
                                                     WHERE gerne='Fiction' OR gerne='Children' ;



                                                     SELECT lib_name ,loction ,esta_year
                                                     FROM library
                                                     WHERE loction='Oman' AND esta_year> 2000 ;

													 
                                                     SELECT title ,price
                                                     FROM book1
                                                     WHERE price>=2 AND price<=10 ;


													 SELECT  status
                                                     FROM loans 
                                                     WHERE status <>'Returned' ;



													 SELECT title
                                                    FROM book1
                                                    ORDER BY title ASC;

													 SELECT price
                                                    FROM book1
                                                    ORDER BY price DESC;


													 SELECT mem_start_dt
                                                    FROM members1
                                                    ORDER BY mem_start_dt DESC;


													
													SELECT lib_name , esta_year
                                                    FROM library
                                                    ORDER BY esta_year DESC;

													
													
													
													SELECT rating, reviw_date 
                                                    FROM review
                                                    ORDER BY rating  DESC , reviw_date ASC ;



													 SELECT DISTINCT title, gerne
                                                     FROM book1;


													 
													 SELECT DISTINCT  loction
                                                     FROM library;



													 	 
													 SELECT DISTINCT position
                                                     FROM staff;

													 	 
													 SELECT DISTINCT status   
                                                     FROM loans;


												 SELECT TOP 5 title,price
												 from book1
												 ORDER BY price DESC;


												 SELECT TOP 3 esta_year
												 FROM library
												 ORDER BY esta_year  ASC 
												
												
												
												 SELECT TOP 5 rating
												 FROM review
												 ORDER BY rating DESC 

											 SELECT title
                                             FROM book1
                                             WHERE title LIKE 'c%';


											 
											 SELECT mem_email
                                             FROM members1
                                             WHERE mem_email LIKE '%gmail.com%';



											  
											 SELECT lib_name
                                             FROM library
                                             WHERE lib_name LIKE '%y';


											 	  
											 SELECT title
                                             FROM book1
                                             WHERE title LIKE '%advanture%';

												
												

													 SELECT f_name
                                                     FROM staff
                                                     WHERE f_name LIKE 'a%';

													 SELECT date_return
                                                      FROM loans
                                                      WHERE date_return IS NOT NULL;


												 SELECT date_return
                                                      FROM loans
                                                      WHERE date_return IS NULL;


													  SELECT comment
                                                      FROM review
                                                      WHERE comment IS NULL  
                                                       OR comment = 'no comments';

													   
													SELECT gerne ,price
                                                    FROM book1
													WHERE gerne ='Fiction' AND  price > 12
													 ORDER BY price;

													 SELECT TOP 5 * 
													 FROM loans
													 WHERE status = 'Overdue' 
													 ORDER BY date_due DESC;

													  SELECT TOP 5 * 
													 FROM loans
													 WHERE status = 'Overdue' 
													 ORDER BY date_due DESC;

													  SELECT  * 
													 FROM library
													 WHERE  loction = 'oman' AND esta_year>1999
													 ORDER BY lib_name ;


													 SELECT title, gerne, price, alia_sta
													 FROM book1
													 WHERE (gerne = 'Fiction' OR gerne = 'Children')
													 AND (price>=2 AND price<=11)
													 AND alia_sta = 'true' 
													 ORDER BY price;


													 SELECT f_name , mem_email, mem_start_dt
													 FROM members1 
													 WHERE (YEAR(mem_start_dt) = 1999 OR YEAR(mem_start_dt) = 2004)
													 AND mem_email LIKE '%@gmail.com' 
													 ORDER BY mem_start_dt;


													 SELECT top 10 title, gerne, price, alia_sta
													 FROM book1 
													 WHERE (gerne = 'Fiction' OR gerne = 'Non-fiction')
													 AND alia_sta = 'true'
													 ORDER BY price DESC 

													 SELECT *
													 FROM loans
													 WHERE status<> 'returned'
													 AND  YEAR (date_loan)=2026
													 ORDER BY date_loan
													 
													 
													SELECT lib_name, loction, esta_year
													FROM  library 
													WHERE esta_year> 1991 
													AND loction = 'nizwa' OR loction='ibra'


													
--task 12.4 I don't have relation between book table and review table--	


--task of join part A- 2.1 inner join--

SELECT title,date_loan,date_due
FROM loans l
INNER JOIN book1 b
ON l.book_id= b.book_ID;


SELECT f_name,position,lib_name,loction
FROM library l
INNER JOIN staff s
ON s.lib_id= l.lib_id;


SELECT title,gerne,price,lib_name, loction
FROM library l
INNER JOIN book1 b
ON b.LibID= l.lib_id;


SELECT F_name, Rating, Comment, reviw_date
FROM members1 m
INNER JOIN review r
ON r.mem_id= m.mem_ID;



SELECT title , Rating, Comment, reviw_date
FROM book1 b
INNER JOIN review r
ON r.Book_id= b.book_ID;


SELECT pay_date ,amount,method,status
FROM payment p
INNER JOIN loans l
ON p. pay_date= l.date_loan;
--no relation between these tables--


--aggregationTask 1--1.1


SELECT COUNT(*) AS TotalBooks
FROM book1 ;


SELECT COUNT(*)
FROM members1;


SELECT SUM(Price) AS TotalPrice 
FROM book1;


SELECT AVG(price) AS average_price 
FROM book1;

SELECT MIN(price) AS CheapestPrice, MAX(price) AS MostExpensivePrice 
FROM book1;


SELECT COUNT(*) AS OverdueLoans 
FROM Loans
WHERE Status = 'Overdue';


SELECT MAX(rating) AS HighestRating 
FROM review;

SELECT MIN(rating) AS LowestRating 
FROM Review;

SELECT COUNT(date_return) AS ReturnedLoan
FROM loans

SELECT SUM(Amount) AS TotalFinesCollected 
FROM Payment;

--part B--


SELECT 
    gerne, 
    COUNT(*) AS BookCount
FROM book1
GROUP BY gerne;

SELECT lib_ID, COUNT(*) AS StaffCount
FROM staff 
GROUP BY lib_ID ;


SELECT Status, COUNT(*) AS LoanCount 
FROM loans 
GROUP BY Status;


SELECT gerne, AVG(Price) AS AveragePrice 
FROM book1 
GROUP BY gerne;

SELECT gerne, SUM(Price) AS TotalPrice
FROM book1 
GROUP BY gerne;

SELECT gerne, MAX(Price) AS MostExpensiveBook
FROM book1 GROUP BY gerne;

SELECT gerne, SUM(Price) AS TotalPrice
FROM Book1
GROUP BY gerne;

SELECT gerne, MAX(Price) AS MostExpensiveBook 
FROM book1
GROUP BY gerne;

SELECT Rating, COUNT(*) AS ReviewCount
FROM review
GROUP BY Rating;

SELECT libID, COUNT(*) AS BookCount 
FROM book1 
GROUP BY libID;

SELECT Mem_ID, COUNT(*) AS LoanCount
FROM loans 
GROUP BY Mem_ID;


SELECT gerne, MIN(Price) AS CheapestBook 
FROM book1
GROUP BY gerne;

--Part 2:A

SELECT gerne, COUNT(*) AS BookCount
FROM book1 
GROUP BY gerne;


SELECT lib_ID, COUNT(*) AS StaffCount 
FROM Staff
GROUP BY lib_ID;


SELECT Status, COUNT(*) AS LoanCount
FROM loans
GROUP BY Status;

SELECT gerne, AVG(Price) AS AveragePrice
FROM book1 
GROUP BY gerne;

SELECT gerne, SUM(Price) AS TotalPrice
FROM book1 
GROUP BY gerne;


SELECT gerne, MAX(Price) AS MaxPrice 
FROM book1
GROUP BY gerne;


SELECT rating, COUNT(*) AS reviewCount 
FROM review 
GROUP BY rating;

SELECT LibID, COUNT(*) AS BookCount 
FROM book1 
GROUP BY libID;

SELECT Mem_ID, COUNT(*) AS LoanCount
FROM loans 
GROUP BY Mem_ID;


SELECT gerne, MIN(Price) AS CheapestBook 
FROM book1
GROUP BY gerne;


--Part2,B--


SELECT gerne, COUNT(*) AS BookCount
FROM book1
GROUP BY gerne
ORDER BY BookCount DESC;




SELECT gerne, AVG(Price) AS AveragePrice 
FROM book1
GROUP BY gerne
ORDER BY AveragePrice ASC;


SELECT status, COUNT(*) AS LoanCount 
FROM loans
GROUP BY Status 
ORDER BY Status ASC;

SELECT method, SUM(amount) AS TotalCollected
FROM Payment 
GROUP BY method
ORDER BY TotalCollected DESC;


SELECT Book_id, COUNT(*) AS ReviewCount 
FROM review 
GROUP BY Book_id
ORDER BY ReviewCount DESC;


--Part3-A--

SELECT gerne, COUNT(book_ID) AS BookCount 
FROM book1
GROUP BY gerne 
HAVING COUNT(book_ID) > 2;


SELECT lib_ID, COUNT(lib_ID) AS StaffCount 
FROM Staff 
GROUP BY lib_ID
HAVING COUNT(lib_ID) >= 1;

SELECT mem_ID, COUNT(*) AS LoanCount
FROM loans 
GROUP BY mem_ID HAVING COUNT(*) > 1;

SELECT gerne, AVG(Price) AS AveragePrice
FROM book1 
GROUP BY gerne 
HAVING AVG(Price) > 10;



SELECT book_ID, COUNT(*) AS ReviewCount 
FROM review 
GROUP BY book_ID HAVING COUNT(*) >= 2;


SELECT gerne, SUM(Price) AS TotalPrice 
FROM book1 GROUP BY gerne 
HAVING SUM(Price) > 10

SELECT method, SUM(amount) AS TotalCollected 
FROM Payment
GROUP BY method 
HAVING SUM(amount) > 3;


SELECT status, COUNT(*) AS StatusCount 
FROM Loans
GROUP BY Status 
HAVING COUNT(*) > 3;

SELECT mem_ID, COUNT(*) AS ReviewCount 
FROM Review
GROUP BY mem_ID
HAVING COUNT(*) >= 2;


SELECT LibID, COUNT(*) AS bookCount
FROM book1
GROUP BY libID 
HAVING COUNT(*) > 2;

--Part 3-B--

SELECT gerne, COUNT(*) AS AvailableCount 
FROM book1
WHERE alia_sta ='true'
GROUP BY gerne 
HAVING COUNT(*) > 1;


SELECT gerne, AVG(Price) AS AvgPrice
FROM book1
WHERE gerne IN ('Fiction', 'Children') 
GROUP BY gerne
HAVING AVG(Price) > 10;

SELECT mem_ID, COUNT(*) AS ActiveLoans
FROM Loans
WHERE Status IN ('Overdue', 'Issued')
GROUP BY mem_ID
HAVING COUNT(*) > 1;


SELECT book_id, COUNT(*) AS GoodReviews 
FROM review 
WHERE rating >= 3 
GROUP BY book_id 
HAVING COUNT(*) >= 2;


SELECT gerne, COUNT(*) AS BooksBelow20
FROM book1
WHERE Price < 20 
GROUP BY gerne
HAVING COUNT(*) > 1;





select *from book1











SELECT *from library
