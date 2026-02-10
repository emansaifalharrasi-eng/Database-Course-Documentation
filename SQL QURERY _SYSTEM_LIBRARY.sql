create database ProjectLibrary
use ProjectLibrary

--create library table--

create table library(
lib_ID int Primary key Identity(1,1),
lib_name varchar(50) Unique  Not null,
cont_num varchar(50)Not null,
loction varchar(50)Not null,
esta_year varchar(50),

)


--create table staff

create table staff(
staff_ID int Primary key Identity(1,1),
f_name varchar(50),
position varchar(50),
contact_num varchar(50),


stafflib_ID int, 

    Foreign Key (stafflib_ID)
    References library(lib_ID)
    ON DELETE Cascade
    ON UPDATE Cascade
)
--create members table--

create table members1(
mem_ID int Primary key Identity(1,1),
f_name varchar(50),
phone varchar(50),
mem_start_dt Date Not null,
mem_email varchar(100)Unique Not null,

revi_date int,
foreign Key (revi_date) references review(revi_date)
NO DELETE Cascade
NO UPDATE Cascade


alter table members1
add int review foreign key

)



--create Book table--

create table book1(

book_ID int Primary key Identity(1,1),
self_location varchar(50)Not null,
ISBN varchar(50)Unique Not null,
gerne varchar(50)Not null,
title varchar(50)Not null,
price varchar(50)Not null,
alia_sta varchar(50),


mem_ID int,
foreign key (book_mem_ID) references members1 (mem_ID)
NO DELETE Cascade
NO UPDATE Cascade

lib_ID int,
foreign Key (book_lib_ID) references library(lib _ID)
NO DEIETE Cascade
NO UPDATE Cascade

revi_date int,
foreign Key revidate references review_id
NO delete cascade
No update cascade



)
alter table members1
add foreign key 

--create loans--

create table loans(
date_loan DATE Primary Key,
status varchar(50)Not null,
date_due DATE Not null, 
date_return DATE Not null,

pay_date int,
foreign Key pay_date references payment(pay_date)
NO DEIETE Cascade
NO UPDATE Cascade

loan status='Issued'
CHECK Loan IN (Status: ('Issued', 'Returned', 'Overdue'))
CHECK (date_return>=Loan_date)
review comments='No comments' if not provide

alter table loans
add foreign key
--create table review--

create table review(
reviw_date DATE Primary key Not null
rating varchar(50)Not null,
comment varchar(50),

book_id int,
foreign Key book_id references book1(book_ id)
NO DELETE Cascade
NO UPDATE Cascade


mem_id int,
foreign Key mem_id references members1(mem_ id)
NO DEIETE Cascade
NO UPDATE Cascade

Review Rating between 1 and 5
)

--create table payment--

create  table payment(
pay_date DATE Not null
amount varchar(50)Not null,
method varchar(50),

CHECK (amount>=0)

date_loan int,
foreign Key loan_date references loans(loan_date)
NO DELET Cascade
NO UPDATE Cascade





--create table location--

create table locations(
location varchar(50),
lib_ID int,
foreign keY(loc_lib_ID ) references library(lib_ID)
)
