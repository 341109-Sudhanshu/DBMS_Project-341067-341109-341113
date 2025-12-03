INSERT INTO `department` (`DeptID`, `DeptName`, `HeadDoctorName`) VALUES
('D001', 'Cardiology', 'Dr. Alok Sharma'),
('D002', 'Neurology', 'Dr. Suma Rao'),
('D003', 'Pediatrics', 'Dr. Vinay Kapoor'),
('D004', 'Orthopedics', 'Dr. Meena Iyer'),
('D005', 'Emergency', 'Dr. Rohan Patel');


INSERT INTO `patient` (`PatientID`, `FullName`, `Age`, `Gender`, `Phone`, `City`) VALUES
('P001', 'Arjun Kumar', 45, 'M', '9811122233', 'New Delhi'),
('P002', 'Sneha Desai', 32, 'F', '9822233344', 'Mumbai'),
('P003', 'Rahul Verma', 10, 'M', '9833344455', 'Bangalore'),
('P004', 'Kavita Iyer', 67, 'F', '9844455566', 'Chennai'),
('P005', 'Imran Khan', 28, 'M', '9855566677', 'Hyderabad');


INSERT INTO `room` (`RoomID`, `RoomType`, `CostPerDay`, `Status`) VALUES
('R101', 'Ward', 1500.00, 'Occcupied'),
('R202', 'ICU', 5000.00, 'Available'),
('R301', 'Medical', 2500.00, 'Maintenance'),
('R405', 'Emergency', 3000.00, 'Occcupied'),
('R500', 'Waiting Room', 500.00, 'Available');


INSERT INTO `lab_test` (`TestID`, `TestName`, `Cost`) VALUES
('T001', 'Blood Test', 500.00),
('T002', 'MRI Scan', 3500.00),
('T003', 'X-Ray', 800.00),
('T004', 'CT Scan', 2500.00),
('T005', 'Urine Analysis', 300.00);


INSERT INTO `medicine` (`MedID`, `MedName`, `PricePerUnit`, `StockQuantity`) VALUES
('M001', 'Paracetamol', 5.00, 1000),
('M002', 'Amoxicillin', 15.00, 500),
('M003', 'Ibuprofen', 8.00, 800),
('M004', 'Metformin', 10.00, 600),
('M005', 'Atorvastatin', 25.00, 400);


INSERT INTO `doctor` (`DoctorID`, `FullName`, `Specialization`, `Phone`, `ConsultationFee`, `DeptID`) VALUES
('DR001', 'Dr. Alok Sharma', 'Heart Specialist', '9912345678', 850.00, 'D001'),
('DR002', 'Dr. Suma Rao', 'Brain & Nerves', '9923456789', 900.00, 'D002'),
('DR003', 'Dr. Vinay Kapoor', 'Child Health', '9934567890', 750.00, 'D003'),
('DR004', 'Dr. Maya Singh', 'Bone & Joint', '9945678901', 800.00, 'D004'),
('DR005', 'Dr. Rohan Patel', 'Critical Care', '9956789012', 1000.00, 'D005');



INSERT INTO `staff` (`StaffID`, `FullName`, `Role`, `Shift`, `DeptID`, `Phone`) VALUES
('S001', 'Priya Menon', 'Nurse', 'Morning', 'D001', '8812345678'),
('S002', 'Rajesh Kulkarni', 'Technician', 'Afternoon', 'D002', '8823456789'),
('S003', 'Sonia Gupta', 'Receptionist', 'Morning', 'D005', '8834567890'),
('S004', 'Vikas Reddy', 'Support Staff', 'Night', 'D004', '8845678901'),
('S005', 'Neha Jain', 'Nurse', 'Afternoon', 'D003', '8856789012');



INSERT INTO `admission` (`AdmissionID`, `PatientID`, `RoomID`, `DateAdmitted`, `DateDischarged`) VALUES
('AD001', 'P001', 'R101', '2023-10-01 10:00:00', NULL),
('AD002', 'P004', 'R405', '2023-10-05 14:30:00', NULL),
('AD003', 'P002', 'R202', '2023-09-20 09:00:00', '2023-09-25 11:00:00');



INSERT INTO `patient_bill` (`BillID`, `PatientID`, `BillDate`, `Amount_Consultation`, `Amount_Medicines`, `Amount_Tests`, `Amount_RoomCharge`, `TotalAmount`, `PaymentStatus`) VALUES
('B001', 'P001', '2023-10-06', 850.00, 500.00, 500.00, 1500.00, 3350.00, 'Pending'),
('B002', 'P002', '2023-09-25', 900.00, 200.00, 3500.00, 5000.00, 9600.00, 'Paid'),
('B003', 'P003', '2023-10-02', 750.00, 100.00, 0.00, 0.00, 850.00, 'Paid');



INSERT INTO `appointment` (`ApptID`, `PatientID`, `DoctorID`, `ApptDate`, `ProblemDescription`) VALUES
('AP001', 'P003', 'DR003', '2023-10-10', 'High Fever and Cough'),
('AP002', 'P005', 'DR004', '2023-10-11', 'Knee Pain'),
('AP003', 'P002', 'DR002', '2023-10-12', 'Migraine Headache');



INSERT INTO `test_report` (`ReportID`, `PatientID`, `DoctorID`, `TestID`, `TestDate`, `Result`, `Status`) VALUES
('TR001', 'P001', 'DR001', 'T001', '2023-10-02', 'Normal levels', 'Success'),
('TR002', 'P002', 'DR002', 'T002', '2023-09-21', 'Minor inflammation detected', 'Success'),
('TR003', 'P005', 'DR005', 'T003', '2023-10-11', 'No fractures found', 'Pending');