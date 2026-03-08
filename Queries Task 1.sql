-- ============================================
-- Hospital Management System - SQL Assessment
-- 20 Practical Scenarios
-- ============================================

USE HospitalManagementSystem;
GO

-- ============================================
-- INSTRUCTIONS FOR solving
-- ============================================
-- Write SQL queries to solve each scenario below.
-- Test your queries to ensure they work correctly.
-- Each scenario describes a real-world task you need to accomplish.
-- ============================================


-- SCENARIO 1
-- A new patient named "Yasmin Khaled" needs to be registered in the system.
-- Her phone number is 0121111111, email is yasmin.khaled@email.com
-- She was born on 1997-06-15, has blood group AB+, and is female.
-- Address: "888 Helwan St, Cairo"
-- Write a query to add this patient to the database.

insert into patient (  F_name,  Phone_no, email, DOB, blood_group, gender, address )
values              ( 'Yasmin Khaled', '0121111111', 'yasmin.khaled@email.com', '1997-06-15', 'AB+', 'Female', '888 Helwan St, Cairo' );
------------------------------------------------------------------------------------------------

-- SCENARIO 2
-- The hospital is opening a new department called "Dermatology"
-- Location: "Building E - Floor 2"
-- Contact number: 0221234572
-- Initially it will have 0 doctors and no manager yet
-- Write a query to add this new department.

insert into department (  Dept_name, location, contact_number, No_of_doctors, manager_id ) 
values ( 'Dermatology', 'Building E - Floor 2', '0221234572', 0, NULL );
------------------------------------------------------------------------------------------------------

-- SCENARIO 3
-- Patient with ID 8 has changed their phone number to 0188888888
-- Write a query to update this patient's phone number.

update  patient
set  phone_no = '0188888888' 
WHERE patient_id = 8;
---------------------------------------------------------------------------------------------------------------

-- SCENARIO 4
-- All appointments scheduled for Doctor ID 3 on 2024-03-02 
-- need to be rescheduled to 2024-03-09 (same time, same patients)
-- Write a query to update these appointments.

update appointment 
set date = '2024-03-09'
WHERE doctor_id = 3 AND date = '2024-03-02';

--------------------------------------------------------------------------------------------
-- SCENARIO 5
-- The Cardiology department (Dept_ID = 1) wants to increase 
-- all their service prices by 15% due to new equipment costs.
-- Write a query to update all service prices for this department.

UPDATE service 
SET Unit_price =Unit_price * 1.15
WHERE dept_id = 1;
---------------------------------------------------------------------------------------------

-- SCENARIO 6
-- Generate a report showing all scheduled appointments with:
-- - Appointment ID
-- - Appointment date and time
-- - Patient full name (first name + last name)
-- - Patient phone number
-- - Doctor name
-- - Doctor specialization
-- Order the results by appointment date and time.

SELECT APPT_ID,
date,
Time,
CONCAT(F_name, ' ', L_name) AS full_name,
p.Phone_no, 
Name AS doctor_name,
specialization 
FROM APPOINTMENT a
JOIN Patient p ON a.Patient_ID = p.patient_id    
JOIN DOCTOR d  ON a.Doctor_ID = d.doctor_id

 WHERE A.Status='Scheduled'  
ORDER BY A.Date,A.Time;
------------------------------------------------------------------------------------------

-- SCENARIO 7
-- The hospital needs a list of all doctors showing:
-- - Doctor name
-- - Their department name
-- - Their department manager's name
-- - Number of appointments they have handled
-- Only include doctors who have at least one appointment.
-- Order by number of appointments (highest first).

SELECT d.Name,  Dept_name ,   Manager_ID  AS department_manager,
COUNT(a.APPT_ID) AS appointment_count
FROM DOCTOR d 
JOIN department dept ON d.dept_id = dept.dept_id 
JOIN APPOINTMENT a ON d.doctor_id = a.doctor_id 
GROUP BY d.Name, Dept_name,  Manager_ID 
HAVING COUNT(a.APPT_ID) > 0
ORDER BY appointment_count DESC;
---------------------------------------------------------------------------------

-- SCENARIO 8
-- Create a financial summary report showing:
-- - Department name
-- - Total number of completed appointments in that department
-- - Total revenue from paid bills in that department
-- - Average bill amount in that department
-- Only include departments that have generated revenue.
-- Order by total revenue (highest first).

SELECT Dept_name , 
COUNT(a.APPT_ID) AS total_completed_appointments,
SUM(b.Total_amount) AS total_revenue,
AVG(b.Total_amount) AS average_bill_amount 
FROM department dept
JOIN DOCTOR d ON dept.Dept_ID = d.Dept_ID
JOIN appointment a ON d.doctor_ID = a.doctor_ID 
JOIN BILLING b ON a.APPT_ID = b.APPT_ID
WHERE a.status = 'Completed'AND b.Payment_status = 'Paid' 

GROUP BY dept.Dept_name 

HAVING SUM(b.Total_amount) > 0 
ORDER BY total_revenue DESC;
-----------------------------------------------------------------------------------------

-- SCENARIO 9
-- Generate a patient activity report showing:
-- - Patient full name
-- - Patient blood group
-- - Total number of appointments they've had
-- - Total amount they've spent (sum of all their bills)
-- - Their payment status distribution (how many paid, pending, etc.)
-- Only include patients who have had more than 2 appointments.
-- Order by total amount spent (highest first).

SELECT P.F_name + ' ' + P.L_name AS full_name, P.Blood_group, 
COUNT(A.APPT_ID) AS Total_appointments, 
SUM(B.Total_amount) AS Total_amount 
FROM PATIENT P JOIN APPOINTMENT A ON A.Patient_ID = P.Patient_ID 
JOIN Billing B ON B.Patient_ID = P.Patient_ID
WHERE B.payment_status IN ('paid','pending')
GROUP BY P.F_name, P.L_name, P.Blood_group 
HAVING COUNT(A.APPT_ID) > 2 
ORDER BY Total_amount DESC;
--------------------------------------------------------------------------------------------------------

-- SCENARIO 10
-- Create a detailed service utilization report showing:
-- - Service name
-- - Service type
-- - Department offering the service
-- - Number of times the service was used
-- - Total quantity of service provided
-- - Total revenue generated from this service
-- Only include services that have been used at least once.
-- Order by total revenue generated (highest first).


SELECT
s.service_name AS ServiceName, 
s.service_type AS ServiceType,
d.department_name AS Department, 
SUM(a.Time) AS TimesUsed
SUM(as.quantity*s.unit_price) AS TotalRevenue, 
FROM Services s 
JOIN Departments d ON s.department_ID= d.department_ID
JOIN Services s ON  s.service_ID = as .service_ID
GROUP BY s.service_name, s.service_type, d.department_name
HAVING COUNT(Time) > 0 
ORDER BY TotaleRvenue DESC;
-----------------------------------------------------------------------------------------------------------------------------

-- SCENARIO 11
-- Find all patients who have spent more than the average 
-- total spending across all patients.
-- Show: Patient ID, Patient name, and their total spending.
-- Order by total spending (highest first).

SELECT p.patient_ID , p.patient_name, 
SUM(b.amount) AS TotalSpending 
FROM Patient p 
JOIN Bills b ON p.patient_ID= b.patient_ID
GROUP BY p.patient_ID, p.patient_name
HAVING SUM(b.amount) > ( AVG(TotalPerPatient) )
SELECT AVG(TotalPerPatient) 
FROM  SELECT SUM(b.amount) AS TotalPerPatient 
FROM BillING b 
GROUP BY b.patient_ID AS PatientTotals 
ORDER BY TotalSpending DESC;
-----------------------------------------------------------------------------------------------

-- SCENARIO 12 

-- Find all doctors who have more appointments than 
-- the doctor with Doctor_ID = 7.
-- Show: Doctor ID, Doctor name, and their appointment count.
-- Order by appointment count (highest first)

SELECT d.Doctor_ID AS DoctorID,
       d.doctor_name AS DoctorName,
	   
	   JOIN APPOINTMENT a ON d.doctor_ID = a.doctor_ID

COUNT(a.APPT_ID) AS AppointmentCount

FROM Doctor d 

GROUP BY d.doctor_ID, d.doctor_name 

HAVING COUNT(a.APPT_ID) > 
(

SELECT COUNT(a.APPT_ID)

FROM APPOINTMENT a 
WHERE d.doctor_ID = 7 
ORDER BY AppointmentCount DESC;

---------------------------------------------------------------------------------------------
-- SCENARIO 13
-- Find all services where the unit price is higher than 
-- the average price of services in the same service type.
-- Show: Service name, Service type, Unit price, 
-- and the average price for that service type.
-- Order by service type, then by unit price (highest first).

SELECT service_name, s.Service_type, unit_price, avg_data.avg_price AS average_price_for_type
FROM Service s 
JOIN  SELECT s.Service_type, AVG(unit_price) AS avg_price 
FROM Service
GROUP BY s.Service_type AS (avg_data ON s.service_type = avg_data.service_type )
WHERE unit_price > avg_data.avg_price 
ORDER BY Service_type, unit_price DESC

--------------------------------------------------------------------------------------------------------
-- SCENARIO 14
-- Find patients who have appointments but have never 
-- had a completed appointment (all their appointments are 
-- either scheduled, cancelled, or no-show).
-- Show: Patient ID, Patient name, Phone number.
-- Include a count of how many appointments they have.

SELECT p.Patient_ID, 
CONCAT(p.F_name, ' ', p.L_name) AS PatientName, p.Phone_no, 
COUNT(a.APPT_ID) AS AppointmentCount
FROM Patient p JOIN Appointment a ON p.Patient_ID = a.Patient_ID 
GROUP BY p.Patient_ID, p.F_name, p.L_name, p.Phone_no
HAVING COUNT(a.APPT_ID) > 0 AND SUM(CASE WHEN a.Status = 'Completed' THEN 1 ELSE 0 END) = 0 
ORDER BY AppointmentCount DESC;


---------------------------------------------------------------------------------------
-- SCENARIO 15
-- Find the most expensive bill for each payment status category.
-- Show: Payment status, Bill ID, Total amount, Patient name.
-- Include the department name where the appointment took place.
-- Order by total amount (highest first).

SELECT b.payment_status, 
       b.Bill_ID, b.amount AS TotalAmount, CONCAT(p.F_name, ' ', p.L_name) AS PatientName, 
	   dept.Dept_name AS DepartmentName 
FROM BillING b
JOIN Patient p ON b.patient_id = p.patient_id 
JOIN Appointment a ON b.appointment_id = a.appointment_id 
JOIN Department dept ON a.dept_id = dept.dept_id
WHERE b.amount = ( SELECT MAX(b2.amount)) 
FROM BilLING b 
WHERE b.payment_status = b.payment_status 
ORDER BY TotalAmount DESC;
-------------------------------------------------------------------------------
-- SCENARIO 16
-- Rank all doctors within their department based on years of experience.
-- Show: Department name, Doctor name, Years of experience, and their rank.
-- The most experienced doctor in each department should have rank 1.
-- Order by department name, then by rank.


SELECT Dept_name,Name,years_of_experience,
 RANK() OVER (PARTITION BY d.Dept_ID ORDER BY d.Years_of_experience DESC) AS Rank_In_Department
FROM DOCTOR d
 JOIN DEPARTMENT dept ON d.Dept_ID = dept.Dept_ID
ORDER BY dept.Dept_name, Rank_In_Department;

GO

--------------------------------------------------------------------
-- SCENARIO 17
-- Create a ranking of patients based on their total spending.
-- Show: Patient name, Total amount spent, and their spending rank.
-- Include only patients who have at least one bill.
-- Use a ranking method that doesn't skip numbers (dense ranking).
-- Order by rank.

SELECT CONCAT(p.F_name, ' ', p.L_name) AS PatientName 
SUM(b.Total_amount) AS TotalAmountSpent, 
DENSE_RANK() OVER (ORDER BY SUM(b.Total_amount) DESC) AS SpendingRank 
FROM Patient p 
JOIN BILLING b ON p.Patient_ID = b.Patient_ID 
GROUP BY p.Name 
ORDER BY SpendingRank;

---------------------------------------------------------------------------------------------------

-- SCENARIO 18
-- Rank all services by their utilization (how many times they've been used).
-- Show: Service name, Department name, Times used, and rank.
-- Partition the ranking by department (rank within each department).
-- Show all services, even those never used (times used = 0).
-- Order by department name, then by rank.

SELECT s.service_name, d.Dept_name, 
COALESCE(COUNT(u.UsageID), 0) AS TimesUsed, 
DENSE_RANK() OVER ( PARTITION BY d.DepartmentName 
ORDER BY COALESCE(COUNT(u.UsageID), 0) DESC ) AS ServiceRank 
FROM Service s 
JOIN Department d ON s.Dept_ID = d.Dept_ID 
JOIN Usage u ON s.Service_ID = a.service__ID 
GROUP BY s.Service_name, d.Dept_name 
ORDER BY d.Dept_name, ServiceRank;
-----------------------------------------------------------------------------------------

-- SCENARIO 19
-- A patient (Patient_ID = 12) is booking a new appointment with Doctor_ID = 4
-- for 2024-03-28 at 16:00:00. The appointment is for a "Routine" checkup
-- with reason "Annual physical examination", and status should be "Scheduled".
-- At the same time, create a bill for this appointment with:
-- - Bill amount: 500.00
-- - Payment status: Pending
-- - Due date: 2024-04-15
-- Write a transaction that creates both the appointment and the bill together.
-- Make sure both are saved or both are cancelled if there's an error.

BEGIN TRANSACTION

INSERT INTO Appointment ( Patient_ID, Doctor_ID, Date        , Time,       Appointment_type     ,    Reason                        , Status )
 
      VALUES  ( 12        , 4     , '2024-03-28',  '16:00',  'Routine',  'Annual physical examination',  'Scheduled');

INSERT INTO BILLING( APPT_ID, Total_amount, Payment_status, Due_date)
      VALUES    ( 5,         300.00   ,       'Pending'   ,   '2024-04-15' ); 


COMMIT TRANSACTION;

ROLLBACK TRANSACTION;

PRINT 'Transaction 1: Appointment and bill created successfully'  
----------------------------------------------------------------------------

-- SCENARIO 20
-- The hospital needs to cancel an appointment and all related records.
-- For Appointment_ID = 30:
-- - First, delete any services linked to this appointment (from APP_SERVICE)
-- - Then update the appointment status to 'Cancelled'
-- - Then update the corresponding bill's payment status to 'Cancelled'
-- Write a transaction that performs all three operations together.
-- All changes should be committed together or rolled back if any step fails.

DELETE FROM APP_SERVICE
WHERE APPT_ID= 30;

UPDATE APPOINTMENT 
SET Status = 'Cancelled' 
WHERE APPT_ID = 30;

UPDATE BILLING
SET Payment_status = 'Cancelled'
WHERE APPT_ID = 30; 

COMMIT TRANSACTION;


-- ============================================
-- END OF ASSESSMENT
-- ============================================
