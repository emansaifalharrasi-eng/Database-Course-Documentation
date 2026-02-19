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


--session3: left join--

SELECT b.book_ID, b.title, b.gerne, r.comment, r.rating 
FROM book1 b 
LEFT JOIN review r ON b.book_ID = r.Book_id
ORDER BY b.title;



SELECT m. f_name AS f_name, mem_email, l.date_loan, l.date_due, l.Status AS StatusDisplay
FROM members1 m
LEFT JOIN Loans l ON m.mem_ID = l.Mem_ID
ORDER BY m.f_name;


SELECT l.date_loan, l.Mem_ID, l.date_due, l.status, p.pay_date, p.method, p.amount
FROM Loans l 
LEFT JOIN payment p ON l.date_loan = p.Date_loan
ORDER BY l.date_due;



SELECT l. lib_name, l.Loction,  s.f_name, s.position 
FROM Library l
LEFT JOIN staff s 
ON   s.lib_ID =l.lib_ID
ORDER BY l.lib_name;


SELECT m.mem_ID, m.f_name, m.mem_email
FROM members1 m 
LEFT JOIN Loans l
ON m.Mem_ID = l.Mem_ID 
WHERE l.date_loan IS NULL 
ORDER BY m.f_name;


SELECT  b.title , b.gerne, b.price 
FROM book1 b    
LEFT JOIN review r
    ON b.book_ID = r.Book_id
WHERE r.review_ID IS NULL
ORDER BY b.title;

SELECT b.title, m.f_name,r.rating,r.comment
FROM book1 b
LEFT JOIN review r
ON b.book_ID = r.Book_id 
LEFT JOIN members1 m 
ON r.mem_id= m.mem_ID 
ORDER BY b.title, m.f_name;



--session 4--Right join

SELECT b.title, b.gerne, b.price, r.review_ID 
FROM book1 b
RIGHT JOIN review r
ON b.book_ID = r.Book_id;



SELECT m.f_name , m.mem_email, l.date_loan, l.date_due, l.status 
FROM members1 m
RIGHT JOIN loans l 
ON  m.mem_ID = l.Mem_ID
ORDER BY m.f_name;



SELECT lib_name, b.title , b.gerne
FROM Library l
RIGHT JOIN book1 b 
ON b.LibID= l.lib_ID 
ORDER BY  b.title;

SELECT s.f_name , s.position, l.lib_name
FROM staff s 
LEFT JOIN library l
ON s.lib_ID = l.lib_ID
ORDER BY s.f_name;

SELECT s.f_name, s.position, l.lib_name 
FROM Library l 
RIGHT JOIN staff s
ON s.lib_ID = l.lib_ID 
ORDER BY s.f_name;

SELECT title,rating,comment
FROM book1 b
FULL OUTER JOIN review r
ON  b.book_ID = r.Book_id
ORDER BY b.title

SELECT l.date_loan, date_due, p.pay_date, amount
FROM loans l
FULL OUTER JOIN payment p
ON l.date_loan =p. Date_loan 
ORDER BY l.date_loan;


SELECT f_name, title, date_loan, date_due 
FROM members1 m 
FULL OUTER JOIN loans l
ON m.mem_ID = l.mem_ID
FULL OUTER JOIN book1 b 
ON l.book_ID = b.book_ID 
ORDER BY m.f_name;

--Mixed JOINs--

SELECT f_name , date_due , status , pay_date, amount 
FROM loans l
INNER JOIN members1 m 
ON l.Mem_ID = m.mem_ID
LEFT JOIN Payment p 
ON l.date_loan = p.Date_loan
WHERE l.status = 'ACTIVE';

SELECT f_name, title, lib_name,date_loan, date_return
FROM library lb inner join book1 b
on b.LibID =lb.lib_ID inner join members1 m
on b.mem_ID=m.mem_ID inner join loans l
on l.Mem_ID=m.mem_ID 

--session 7--


SELECT lb.lib_name ,COUNT(b.book_ID) AS Total_book, 
 COUNT(s.staff_ID) AS Total_staff, 
 COUNT(l.date_loan) AS Total_loan
FROM Library lb
LEFT JOIN book1 b ON b.LibID=lb.lib_ID
LEFT JOIN staff s ON s.lib_ID=lb.lib_
LEFT JOIN loans l ON lb.lib_id = l.lib_ID
GROUP BY lb.lib_name;
--there is no relation betwenn library table and staff table

SELECT m.f_name, m.mem_email,
COUNT(lo.date_loan) AS Totalloans,
COUNT(r.review_ID) AS Totalreview
FROM members1 m
LEFT JOIN Loans lo ON m.mem_ID = lo.Mem_ID 
LEFT JOIN review r ON m.mem_ID = r.mem_id 
GROUP BY m.f_name, m.mem_email;


SELECT b.title AS BookTitle, l.lib_name, 
COUNT(lo.date_loan) AS TimesBorrowed,
AVG(r.rating) AS Averagerating, 
COUNT (r.review_ID) AS TotalReviews 
FROM book1 b JOIN library l ON b.LibID = l.lib_ID 
LEFT JOIN loans lo ON b.book_ID = lo.book_id 
LEFT JOIN review r ON b.book_ID = r.Book_id 
GROUP BY b.Title, l.lib_name;

SELECT m.f_name AS MemberName, m.mem_email, b.title AS BookTitle, l.lib_name,
            
 DATEDIFF(DAY, lo.date_due, GETDATE) AS DaysOverdue
FROM loans lo
JOIN members1 m ON lo.Mem_ID = m.mem_ID
JOIN book1 b ON lo.book_id = b.book_ID
JOIN library l ON b.LibID = l.lib_ID
WHERE lo.date_due < GETDATE()
  AND lo.date_due IS NULL;

SELECT m.mem_name, b.title AS BookTitle, l.lib_name,gerne, loan.date_loan, loan.date_return
DATEDIFF(DAY, loan.date_loan, loan.date_return) AS DaysBorrowed, r.rating 
FROM members1 m
INNER JOIN loans loan ON m.MemberID = loan.MemberID 
INNER JOIN book1 b ON loan.BookID = b.BookID 
INNER JOIN library l ON loan.LibraryID = l.LibraryID 
LEFT JOIN review r ON loan.LoanID = r.LoanID;


SELECT b.title,b.gerne,  b.price, l.lib_name 
FROM books1 b 
INNER JOIN library l ON b.lib_ID = l.library_ID 
LEFT JOIN loans lo ON b.book_ID = lo.book_ID 
WHERE date_loan IS NULL;

SELECT m.mem_name
FROM Members m 
LEFT JOIN loans lo ON m.mem_ID = lo.mem_ID 
LEFT JOIN review r ON m.mem_ID = r.member_ID 
WHERE loan.date_loan IS NULL AND r.review_ID IS NULL;



SELECT s.staff_name, s.position, l.lib_name, 
COUNT( b.book_ID) AS TotalBooks, 
COUNT(lo.date_loan) AS ActiveLoans 
FROM Staff s
INNER JOIN Libraries l ON s.LibraryID = l.LibraryID
LEFT JOIN book1 b ON l.lib_ID = b.Lib_ID 
LEFT JOIN loans lo ON l.lib_ID = lo.lib_ID AND lo.date_return IS NULL
GROUP BY s.staff_name, s.position, l.LibraryName;


 



--Section 4 — Aggregation with join--

SELECT lib_name , 
COUNT(b.book_ID) AS NumberOfBooks 
FROM library lb JOIN book1 b 
ON b.LIBID = lb.lib_ID
GROUP BY lib_ID,lib_name;



SELECT  f_name,
COUNT(l.date_loan) AS TotalLoans 
FROM members1 m
JOIN loans l ON l.Mem_ID  =m.mem_ID 
GROUP BY m.mem_ID, m.f_name;


select * from loans


SELECT B.title AS BookTitle,
COUNT(l.date_loan) AS TimesBorrowed 
FROM book1 b JOIN loans l ON b.book_ID = l.book_id
GROUP BY b.book_ID, b.title;

SELECT b.title AS booktitle, AVG(CAST(r.rating AS DECIMAL(3,2))) AS AvgRating
FROM  book1 b 
JOIN review r ON b.book_ID = R.Book_id
GROUP BY b.book_ID, b.title;


SELECT lb.lib_name,
SUM(b.price) AS Total_Value
FROM Library lb 
JOIN book1 b
ON b.LibID=lb.lib_ID
GROUP BY lb.lib_name;


SELECT lb.lib_name, 
COUNT(s.staff_ID) AS staff_Count
FROM library lb 
JOIN staff s ON lb.lib_ID = s.lib_ID
GROUP BY lb.lib_ID, lib_name;



SELECT f_name 
SUM(p.amount) AS TotalFinesPaid 
FROM members1 m
JOIN loans l ON m.lib_id = l.Mem_ID
JOIN payment p ON l.date_loan = p.Date_loan
GROUP BY  m.f_name;


SELECT gerne,
COUNT(l.Mem_ID) AS DistinctBorrowers
FROM book1 b
JOIN loans l ON b.book_ID = l.book_id 
GROUP BY b.gerne;


SELECT b.title AS BookTitle, 
COUNT(l.date_loan) AS TimesBorrowed,
AVG(CAST(r.rating AS DECIMAL(3,2))) AS AvgRating
FROM book1 b 
LEFT JOIN loans l ON  l.book_id=b.book_ID  
LEFT JOIN review r ON b.book_ID = r.Book_id
GROUP BY b.book_ID, b.title;

SELECT gerne,
    COUNT(book_ID) AS Total_Books
    SUM(CASE WHEN IsAvailable = 1 THEN 1 ELSE 0 END) AS AvailableBooks
    AVG(price) AS Avg_Price
FROM book1
GROUP BY gerne; 

SELECT lib_name AS LibraryName, 
COUNT(b.book_ID) AS NumberOfBooks 
FROM library l
JOIN book1 b ON l.Lib_ID = b.LibID
GROUP BY l.lib_ID, lib_name
HAVING COUNT(b.book_id) > 2;

    SELECT f_name AS FullName, 
	COUNT(l.date_loan) AS TotalLoans
	FROM members1 m 
	JOIN loans l ON m.mem_ID = l.Mem_ID
	GROUP BY m.mem_ID, m. f_name
	HAVING COUNT(l.date_loan) > '2026-01-02';


SELECT b.title AS BookTitle, 
AVG(CAST(r.rating AS DECIMAL(3,2))) AS AvgRating 
FROM book1 b 
JOIN review r ON b.book_ID = r.Book_id 
GROUP BY b.book_ID, b.title 
HAVING AVG(CAST(r.rating AS DECIMAL(3,2))) > 4;


SELECT gerne, 
COUNT(l.date_loan) AS TotalLoans 
FROM book1 b
JOIN loans l ON b.book_ID = L.book_ID 
GROUP BY B.Genre HAVING COUNTl.date_loan) > '2026-01-02';


select lib_name AS LibraryName,
SUM(p.amount) AS TotalFinesCollected
FROM 
    library l
JOIN 
    book1 b ON L.lib_ID = b.LibID
JOIN 
    loans lo ON b.book_id = lo.book_id
JOIN 
    payment p ON lo.date_loan = p.Date_loan
GROUP BY 
    l.lib_ID, lib_name
HAVING 
    SUM(p.amount) > 3;


--aggregation  task5--

	SELECT gerne ,COUNT(*) AS AvailableBooks 
	FROM book1
	WHERE alia_sta= 1
	GROUP BY gerne
	HAVING COUNT(*) > 1 
	ORDER BY AvailableBooks DESC;

	select *from loans


	SELECT lb.lib_name, 
	COUNT(lo.date_loan) AS TotalLoans 
	FROM library  
	JOIN book1 b ON l.LibID = b.lib_ID
	JOIN loans lo ON b.book_ID = lo.book_id
	GROUP BY lb.lib_name 
	HAVING COUNT(lo.date_loan) > 2 
	ORDER BY TotalLoans DESC;

	SELECT m.mem_name,
	COUNT(lo.date_loan AS OverdueLoans 
	FROM members1  
	JOIN loan lo ON m.mem_ID = lo.mem_ID 
	WHERE lo.status = 'Overdue' 
	GROUP BY m.mem_name
	HAVING COUNT(lo.date_loan) >= 1
	ORDER BY m.mem_name ASC;


	SELECT title, 
	COUNT(lo.date_loan) AS TotalBorrows
	AVG r.rating
	FROM book1 b
	LEFT JOIN loans l ON b.Bting) AS AvgbookID = l.Book_ID
	LEFT JOIN review r ON b.book_ID = r.book_ID 
	GROUP BY b.title 
	HAVING COUNT(lo.date_loan) >= 1 AND AVG(r.rating) > 3 
	ORDER BY AvgRating DESC;


	SELECT gerne, COUNT(*) AS TotalBooks
	AVG(price) AS AvgPrice, MIN(Price) AS CheapestPrice 
	FROM book1 GROUP BY gerne
	HAVING AVG(price) BETWEEN 15 AND 50 
	ORDER BY AvgPrice ASC;


	SELECT lb.lib_name, l.loction AS City,
	COUNT(DISTINCT b.book_ID) AS TotalBooks,
	COUNT(DISTINCT s.staff_ID) AS TotalStaff,
	COUNT(DISTINCT lo.date_loan) AS TotalLoans, COALESCE(SUM(p.amount), 0) AS TotalFines
	FROM library l
	LEFT JOIN book1 = s.lib_ID 
	LEFT JOIN loan lo ON l.lib_id = lo.lib_ID
	LEFT JOIN payment p ON l.lib_ID = p.lib_ID 
	GROUP BY lb.lib_name, l.Location
	HAVING COUNT(DISTINCT lo.date_loan) >= 1 
	ORDER BY TotalLoans DESC;




select * from payment

