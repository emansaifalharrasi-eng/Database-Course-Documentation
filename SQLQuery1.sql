create database company
use company
 
 create table employee1(
 ssn int PRIMARY KEY Identity(1,1),
 dnum int,
 Superid int,
 Firstname varchar(50),
 Lastname varchar(50),
  Gender bit default 0,
  D date,
 Superid   foreign key  references employee(ssn) 
 );
 drop database company
 alter table employee 
 add Dno int  foreign key references department1(Dnum);
 
 alter table employee
 drop column super_id;



 drop table employee1 
 drop table department

 create table employee(
 ssn int PRIMARY KEY Identity(1,1),
 dnum int,

 Firstname varchar(50),
 Lastname varchar(50),
  Gender varchar(10),
  DB date,
 Super_id  int  foreign key  references employee(ssn) 
 );


  

 create table department1(
 Dnum int PRIMARY KEY  identity(1,1),
 Dname varchar,
 Mg_ssn int,
 hiredate date,
 foreign key(Mg_ssn)references Employee(ssn)
 );

 create table project1 (
 Pnum int PRIMARY KEY,
 Pname varchar,
 city varchar,
 loc varchar,
 Dnum  int foreign Key references department(Dnum),
 );

 create table dependent(
 depssn int foreign Key  references employee(ssn),
 deptname varchar PRIMARY KEY,
 Gender bit default 0,
 DB date,
 );
 
 select *  from employee

 create table location(
 location varchar,
 Dnum int foreign Key references department(Dnum),
 );


 create table Mywork1(
 wssn int,
 pnum int,
 Houres int,
 );




 insert into employee (Super_id,firstname,lastname,gender,DB)

  values              (20, 'ahmed' , 'ali','male' ,'1998-10-09'),
                      (30, 'sara' , ' saif','female' ,'1999-07-21'),
		              (40, 'Nada' , 'salim','female' ,'2000-05-09');


 insert into department(dnum,dname,mgssn,hiredate) 

values                (21, 'IT' ,  '1, 26/3/2003')
					  (31 ,'HR'  ,' 2, 3/4/2001' )
					  (41 ,'Eng' , '3, 15/5/2010')



					  insert into project(Pnum,Pname,city,loc,Dnum)
					  values             (11 ,'bb-project' ,'Muscat','park')
					                     (22,'cc-project' ,'Samail','mousqe')
										 (33 ,'dd-project','Ibri','street')


										 insert into dependent(depssn,gender,DB)
										 values               (1,'male','2/3/2001')
										                      (2,'female','22/4/2009')
										                      (3,'male','16/5/1999')


															  
										insert into location(Dnum,loc)
									    values               (21,'Muscat'),
										                     (31,'Nizwa'),
										                     (41 'Ibri');


															 insert into Mywork(wssn,Pnum,hours)
					                                         values            (1,11,5),
															                   (2,22,6),
													                           (3,33,7);
