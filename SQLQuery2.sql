create database company2
use company2

create table employee(
 ssn int PRIMARY KEY Identity(1,1),

 Firstname varchar(50),
 Lastname varchar(50),
  Gender varchar(50),
  DB date,
 Superid  int foreign key  references employee(ssn)
 
 );
 select * from employee
 alter table employee
 add Dno int foreign key references department1(Dnum)

 create table department1(
 Dnum int PRIMARY KEY  identity(1,1),
 Dname varchar,
 Mg_ssn int,
 hiredate date, 
 );
 alter table department1
 drop column  Mg_ssn;
 alter table department1
drop column Dname
alter table department1
add Dname varchar(50)
 select * from department1

 create table project1 (
 Pnum int PRIMARY KEY,
 Pname varchar,
 city varchar,
 loc varchar,
 DNum  int foreign Key references department1(Dnum)
 );
 alter table project1 
 drop column Pname
 alter table project1
 add  Pname varchar(50)

 alter table project1 
 drop column city
 alter table project1
 add  city varchar(50)
  select * from project1

  alter table project1 
 drop column loc
 alter table project1
 add  loc varchar(50)
  select * from project1



  create table dependent(
 
 deptname varchar PRIMARY KEY,
 Gender varchar,
 DB date,
 depssn int foreign Key  references employee(ssn)
 );
  select * from dependent

  alter table dependent 
 drop column Gender
 alter table dependent
 add  Gender varchar(50)

 
 drop table dependent 


 create table dependentt(
 
 deptname varchar(50)PRIMARY KEY,
 Gender varchar(50),
 DB date,
 depssn int foreign Key  references employee(ssn)
 );
 
 select * from dependentt
 

  create table location(
 location varchar,
 Dnum int foreign Key references department1(Dnum),
 PRIMARY KEY(Dnum,location)
 );

  
 drop table location

  create table locationn(
 location varchar(50)NOT NULL,
 
 Dnum int foreign Key references department1(Dnum),
 PRIMARY KEY(Dnum,location)
 );

 drop table locationn

   create table location2(
 location varchar(50)NOT NULL,
 Dnum int,
 Dno int foreign Key references department1(Dnum),
 PRIMARY KEY(Dnum,location)
 );
 select *from  department1


 create table Mywork1(
 wssn int,
 Pnum int,
 Houres int NOT NULL,
 primary key(wssn,Pnum)
 wssn int foreign key references employee(ssn),
 Pnum int foreign Key references project1(Pnum)
 );

  
 select *from Mywork1

 insert into employee (firstname,lastname,gender,DB,Superid)

  values              ( 'ahmed' , 'ali','male' ,'1998-10-09',NULL),
                      ( 'sara' , ' saif','female' ,'1999-07-21',NULL),
		              ( 'Nada' , 'salim','female' ,'2000-05-09',NULL);


 insert into department1(Dname,hiredate) 

values                ( 'IT' , ' 2003-10-03'),
					  ( 'HR'  , '2001-04-11' ),
					  ('Eng' ,  '2010-03-03') ;


  insert into project1(Pnum,Pname,city,loc)
					  values             (11 ,'bb-project' ,'Muscat','park'),
					                     (22,'cc-project' ,'Samail','mousqe'),
										 (33 ,'dd-project','Ibri','street') ;


 select *from project1


  insert into dependentt(deptname,gender,DB,depssn)
										 values               ('sara','male','2001-10-02',null),
										                      ('shahd','female','2009-11-03',null),
										                      ('ali','male','1999-2-15',null);


										 insert into location2(Dnum,location,Dno)
									    values               (21,'Ibra',4),
										                     (31,'Nizwa',3),
										                     (41 ,'Ibri',5);


															  insert into Mywork1(wssn,Pnum,hours)
					                                         values            (1,11,5),
															                   (2,22,6),
													                           (3,33,7);



