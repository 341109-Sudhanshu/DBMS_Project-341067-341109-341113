-- 1. Insert Departments
INSERT INTO Department (DeptID, DeptName, HeadDoctorName) VALUES 
(1, 'General Medicine', 'Dr. A. Gupta'),
(2, 'Orthopedics', 'Dr. R. Singh'),
(3, 'Cardiology', 'Dr. P. Sharma'),
(4, 'Pediatrics', 'Dr. S. Khan');

-- 2. Insert Rooms (Wards)
INSERT INTO Room (RoomID, RoomType, CostPerDay, Status) VALUES 
(101, 'General', 500.00, 'Not Available'),
(102, 'General', 500.00, 'Available'),
(201, 'Private', 2500.00, 'Available'),
(202, 'Private', 2500.00, 'Not Available'),
(301, 'ICU', 6000.00, 'Available');

-- 3. Insert Lab Tests (The Menu)
INSERT INTO Lab_Test (TestID, TestName, Cost) VALUES 
(901, 'CBC Blood Test', 350.00),
(902, 'Chest X-Ray', 600.00),
(903, 'MRI Scan', 4500.00),
(904, 'Diabetes Check', 200.00);

-- 4. Insert Medicines (Pharmacy Inventory)
INSERT INTO Medicine (MedID, MedName, PricePerUnit, StockQuantity) VALUES 
(501, 'Paracetamol 500mg', 20.00, 500),
(502, 'Amoxicillin', 85.00, 200),
(503, 'Ibuprofen', 40.00, 300),
(504, 'Cough Syrup', 110.00, 150);

-- 5. Insert Doctors
-- Note: DeptID must match the Departments inserted in Step 1
INSERT INTO Doctor (DoctorID, FullName, Specialization, Phone, ConsultationFee, DeptID) VALUES 
(1001, 'Dr. Anil Gupta', 'Physician', '9876543210', 500.00, 1),
(1002, 'Dr. Ravi Singh', 'Ortho Surgeon', '9123456780', 800.00, 2),
(1003, 'Dr. Priya Sharma', 'Cardiologist', '9988776655', 1200.00, 3),
(1004, 'Dr. Salman Khan', 'Pediatrician', '8877665544', 600.00, 4);

-- 6. Insert Staff (Nurses/Reception)
INSERT INTO Staff (StaffID, FullName, Role, Shift, Phone, DeptID) VALUES 
(2001, 'Sister Mary', 'Nurse', 'Day', '1112223333', 1),
(2002, 'Rajesh Kumar', 'Technician', 'Night', '4445556666', 2),
(2003, 'Anita Desai', 'Receptionist', 'Day', '7778889999', 1);

-- 7. Insert Patients
INSERT INTO Patient (PatientID, FullName, Age, Gender, Phone, City) VALUES 
(3001, 'Rahul Verma', 35, 'M', '9811122233', 'Delhi'),
(3002, 'Suman Das', 28, 'F', '9844455566', 'Noida'),
(3003, 'Vikram Malhotra', 55, 'M', '9877788899', 'Gurgaon'),
(3004, 'Pooja Reddy', 7, 'F', '9800011122', 'Delhi');

-- 8. Insert Appointments (OPD Visits)
INSERT INTO Appointment (ApptID, PatientID, DoctorID, ApptDate, ProblemDescription) VALUES 
(4001, 3001, 1001, '2023-11-20', 'High Fever and Headache'),
(4002, 3002, 1002, '2023-11-21', 'Knee Pain'),
(4003, 3004, 1004, '2023-11-22', 'Stomach Ache');

-- 9. Insert Admissions (IPD Stays)
-- Note: Linking Patients to Rooms
INSERT INTO Admission (AdmissionID, PatientID, RoomID, DateAdmitted, DateDischarged) VALUES 
(5001, 3003, 301, '2023-11-25 10:00:00', NULL), -- Still in ICU
(5002, 3001, 101, '2023-11-20 09:00:00', '2023-11-22 18:00:00'); -- Discharged

-- 10. Insert Test Reports (Labs)
-- Linking Patient + Doctor + Test Catalog
INSERT INTO Test_Report (ReportID, PatientID, DoctorID, TestID, TestDate, Result, Status) VALUES 
(6001, 3001, 1001, 901, '2023-11-20', 'Hemoglobin 11.5 - Low', 'Completed'),
(6002, 3002, 1002, 902, '2023-11-21', 'No Fracture Detected', 'Completed'),
(6003, 3003, 1003, 904, '2023-11-25', 'Blood Sugar 250 - High', 'Completed');

-- 11. Insert Patient Bills
-- If you used the TRIGGER I gave you earlier, the 'TotalAmount' will calculate itself. 
-- If not, you must manually sum the amounts. Here is the manual version:
INSERT INTO Patient_Bill (BillID, PatientID, BillDate, Amount_Consultation, Amount_Medicines, Amount_Tests, Amount_RoomCharge, TotalAmount, PaymentStatus) VALUES 
(7001, 3001, '2023-11-22', 500.00, 200.00, 350.00, 1000.00, 2050.00, 'Paid'),
(7002, 3002, '2023-11-21', 800.00, 50.00, 600.00, 0.00, 1450.00, 'Pending');