Create Database HospitalSystem
USE HospitalSystem


--create department table--

create table departments 
(
Dept_ID int identity(1,1)  Primary Key ,
Dept_name varchar(100) not null unique,
Location varchar(100) not null,
No_of_doctors int,
Contact_number varchar(15)not null,
Manager_ID int null
);

alter table department
ADD CONSTRAINT FK_doctor_Manager
foreign key (Manager_ID) references doctor(Doctor_ID);



--create doctor table--


create table doctors 
(
Doctor_ID int Primary Key identity(1,1),
Name varchar(100)not null,
Specialization varchar(100)not null,
Phone_no varchar(15) not null unique,
Email varchar(100) not null unique,
License_no  varchar(50) not null unique,
Qualification varchar(200) not null,
Years_of_experience int CHECK (Years_of_experience >=0),

Dept_ID int,
Supervisor_ID int null,

foreign key (Dept_ID) references department(Dept_ID) ,         

foreign key (Supervisor_ID) references doctor(Doctor_ID)   
);

--create patient table--

create table patient
(
Patient_ID int Primary Key identity(1,1),
F_name varchar(50) not null,
L_name varchar(50)not null,
Phone_no varchar(15) not null unique,
Email varchar(100) not null unique,
Address varchar(255), 
DOB DATE CONSTRAINT chk_DOB CHECK (DOB <= GETDATE()),
Age AS (YEAR(GETDATE()) - YEAR(DOB)),
Blood_group VARCHAR(5) CHECK (Blood_group IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
Gender char(1) not null CHECK (Gender IN ('M','F','O'))
);

--create appointment table--

create table appointment
(
APPT_ID int Primary Key identity(1,1),
Date DATE not null,
Time TIME not null,
Status varchar(20) NOT NULL DEFAULT CHECK Status IN ('Scheduled','Completed','Cancelled','NO_Show'),

Appointment_type NOT NULL CHECK ('Consultation', 'Follow-up','Emergency', 'Routine'),

Reason varchar(500),

Patient_ID int,

Doctor_ID int,

foreign key (Patient_ID) references patient (Patient_ID) ,

foreign key (Doctor_ID) references doctor(Doctor_ID) 

);

--create service table--

create table service
(
Service_ID int Primary Key identity(1,1),
Service_name varchar(100) not null,
Service_type varchar(50) CHECK (Service_type IN ('Consultation', 'Lab Test', 'X-Ray', 'MRI','CT Scan', 'Surgery', 'Treatment','Therapy')),
Unit_price DECIMAL(10,2) NOT NULL CHECK (Unit_price >= 0),
Description TEXT,
Dept_ID int,
foreign key (Dept_ID) references department(Dept_ID)
);


--create medical table--

create table Medical
(
Med_ID  int Primary Key identity(1,1), 
APPTs_ID int,
foreign key (APPTs_ID) 
references appointment(APPT_ID),
Visit_date Date,
Diagnosis TEXT,
Treatment_plan TEXT,
Prescribed_medications TEXT,
Doctor_notes TEXT,
Follow_up_required char NOT NULL, DEFAULT 'FAlSE'
);

--create billing table--

create table Billing
(
Bill_ID int Primary Key identity(1,1), 
APPT_ID int unique,
Patient_ID int,
foreign key (AAPT_ID) references appointment(AAPT_ID),

foreign key (Patient_ID) references patient (Patient_ID) ,
Bill_date DATENOT NULL, DEFAUL Current date
Total_amount DECIMAL(10,2),
Payment_status varchar(20)  DEFAULT CHECK (Payment_status IN ('Paid','Pending', 'Partial', 'Overdue')),
Payment_method varchar(30), CHECK (Payment_method IN ('Cash', 'Card', 'Insurance', 'Bank,Transfer', 'Online') )

Payment_method varchar(30),
Due_date DATE CHECK (Due_date >=Bill_date) 

);


--create AAP_Service--

create table AAP_Service
(
AAPT_ID int,
Service_ID int,
foreign key (AAPT_ID) references appointment(AAPT_ID),

foreign key (Service_ID) references service(Service_ID),
Quantity int NOT NULL, DEFAULT 1 CHECK (Quantity >0),
Subtotal DECIMAL(10,2) not null,
Subtotal AS (Quantity * Unit_price) PERSISTED CHECK (Subtotal >= 0) )
Unit_price DECIMAL(10,2) NOT NULL,

);
