create database projectt
use projectt

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
foreign key (mem_ID) references members1 (mem_ID)
NO delete cascade
No update cascade

lib_ID int,
foreign Key (lib_ID) references library (lib _id)
NO delete cascade
No update cascade


revi_date int,
foreign Key revidate references review_id
NO delete cascade
No update cascade


BookIs available=True

CHECK (Book Genre IN ('Fiction', 'Non-fiction', 'Reference', 'Children'))
CHECK IN Price must be greater than zero


 



);

alter table book1
add foreign key

--create members table--

create table members1(
mem_ID int Primary key Identity(1,1),
f_name varchar(50),
phone varchar(50),
mem_start_dt Date Not null,
mem_email varchar(50)Unique Not null,
revi_date int,
foreign Key revidate references review_id
NO delete cascade
No update cascade


alter table member1
add mem_estdt Date Not null,

)


--create library table--

create table library(
lib_ID int Primary key Identity(1,1),
lib_name varchar(50) Unique  Not null,
cont_num varchar(50)Not null,
loction varchar(50)Not null,
esta_year varchar(50),
)
book_id int,
foreign Key book_id references book1(book_ id)
NO delete cascade
No update cascade


staff_ID int,
foreign Key staff_id references staff(staff_ID id)
NO delete cascade
No update cascade

)


--create loans--

create table loans(
date_loan DATE Primary Key,
status varchar(50)Not null,
date_due DATE Not null, 
date_return DATE Not null,
)
pay_date int,
foreign Key pay_date references payment(pay_date)
NO delete cascade
No update cascade

loan status='Issued'
CHECK Loan IN (Status: ('Issued', 'Returned', 'Overdue'))
CHECK Return Date  must be greater than or equal to Loan Date
)

--create table staff

create table staff(
staff_ID int Primary key Identity(1,1),
f_name varchar(50),
position varchar(50),
contact_num varchar(50),
)


--create table review--

create table review(
reviw_date DATE Primary key Not null
rating varchar(50)Not null,
comment varchar(50),
book_id int,
foreign Key book_id references book1(book_ id)
NO delete cascade
No update cascade


mem_id int,
foreign Key mem_id references member(mem_ id)
NO delete cascade
No update cascade

Review Rating between 1 and 5


)

--create table payment--

create  table payment(
pay_date DATE Not null
amount varchar(50)Not null,
method varchar(50),

CHECK IN  Payment Amount must be greater than zero

date_loan int,
foreign Key loan_date references loans(loans_date)
NO delete cascade
No update cascade

review comments='No comments' if not provide

);








--create table location--

create table location(
location varchar(50),
lib_ID int 
)

--create bookMemberReview table--
create table book_mem_review(
book_ID int
mem_ID int
date_loan DATE

)



