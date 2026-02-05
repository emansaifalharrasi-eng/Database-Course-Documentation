create database COMPANY3

use COMPANY3

--create employee table

create table Employee
(
ssn int primary key Identity (1, 1) not null,
Firstname varchar(50) not null,
Lastname varchar(50),
Gender varchar(50),
DB date,
)

alter table Employee
     add  Superid  int foreign key  references employee(ssn)

select * from Employee

create table Department 
(
Dnum int PRIMARY KEY  identity(1,1) not null,
Dname varchar,
Mg_ssn int,
foreign key (Mg_ssn) references employee(ssn),
hiredate date
)

alter table Department
     drop column  Dname
	 alter table Department
	 add Dname nvarchar(20)

select * from Department

create table Location
(
DNum int,
foreign Key (DNum) references Department(Dnum),
location nvarchar (20),
primary key (DNum , location)
)

drop table Location

create table Location
(
DNum int,
DNo int foreign key references Department(Dnum),
location nvarchar(20),
primary key (DNum , location)
)
select * from Location

create table Project
(
Pnum int PRIMARY KEY identity(1,1) not null,
Pname nvarchar (20),
city nvarchar (20),
loc nvarchar (20),
DNum int,
foreign Key (DNum) references Department(Dnum)
)

select * from Project

create table Depandent
(
deptname varchar PRIMARY KEY,
Gender nvarchar (20),
DB date,
depssn int,
foreign Key (depssn) references employee(ssn)
)
drop table Dependent

create table Depandent3
(
deptname varchar(100) PRIMARY KEY,
Gender nvarchar(20),
DB date,
depssn int,
foreign Key (depssn) references employee(ssn)
)


select * from Depandent

create table Mywork3
(
 wssn int,
 foreign key (wssn) references Employee(ssn),
 Pnum int,
 foreign Key (Pnum) references Project(Pnum),
 Houres int NOT NULL,
 primary key(wssn,Pnum)
)


select * from Mywork3

 insert into employee (firstname,lastname,gender,DB,Superid)

  values              ( 'ahmed' , 'ali','male' ,'1998-10-09',NULL),
                      ( 'sara' , ' saif','female' ,'1999-07-21',NULL),
		              ( 'Nada' , 'salim','female' ,'2000-05-09',NULL);


					  insert into department(Dname,hiredate) 

values                ( 'IT' , ' 2003-10-03'),
					  ( 'HR'  , '2001-04-11' ),
					  ('Eng' ,  '2010-03-03') ;

truncate table  Depandent3
insert into Depandent3(deptname,gender,DB,depssn)
										 values               ('iman','female','2001-10-02',null),
										                      ('shahd','female','2009-11-03',null),
										                      ('saif','male','1999-2-15',null);



insert into project(Pname,city,loc)
					  values             ('bb-project' ,'Muscat','park'),
					                     ('cc-project' ,'Samail','mousqe'),
										 ('dd-project','Ibri','street') ;

truncate table location 
 insert into location(DNum,location,DNo)
									    values               (1,'Ibra',2),
										                     (2,'Nizwa',1),
										                     (3,'Ibri',3);


 insert into Mywork3(wssn,Pnum,Houres)
					                                         values            (1,9,5),
															                   (2,5,6),
													                           (3,4,7);

