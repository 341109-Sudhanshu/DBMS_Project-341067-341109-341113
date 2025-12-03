-- Set the database context
USE city_care_hospital;

-- ==========================================
-- 1. BASIC DATA RETRIEVAL
-- ==========================================

-- A. List all Doctors, their specialization, and contact info
-- Helps directory services or receptionists find doctors quickly.
SELECT DoctorID, FullName, Specialization, Phone 
FROM doctor;

-- B. Find all "Available" Rooms
-- Critical for checking current hospital capacity.
SELECT RoomID, RoomType, CostPerDay 
FROM room 
WHERE Status = 'Available';

-- C. List Medicines with Low Stock
-- Identifies medicines that need re-ordering (threshold < 500).
SELECT MedName, StockQuantity, PricePerUnit 
FROM medicine 
WHERE StockQuantity < 500;

-- ==========================================
-- 2. RELATIONAL QUERIES (JOINS)
-- ==========================================

-- A. View Appointment Schedule (Human-readable)
-- Replaces IDs with actual Patient and Doctor names using Inner Joins.
SELECT 
    a.ApptID,
    a.ApptDate,
    p.FullName AS PatientName,
    d.FullName AS DoctorName,
    a.ProblemDescription
FROM appointment a
JOIN patient p ON a.PatientID = p.PatientID
JOIN doctor d ON a.DoctorID = d.DoctorID
ORDER BY a.ApptDate DESC;

-- B. List Staff Members and their Department Names
-- Matches staff to the department they work in.
SELECT 
    s.FullName AS StaffName,
    s.Role,
    s.Shift,
    dept.DeptName
FROM staff s
JOIN department dept ON s.DeptID = dept.DeptID;

-- C. Current Admissions (Active Inpatients)
-- Shows patients currently occupying a room (DateDischarged is NULL).
SELECT 
    p.FullName AS PatientName,
    r.RoomID,
    r.RoomType,
    adm.DateAdmitted
FROM admission adm
JOIN patient p ON adm.PatientID = p.PatientID
JOIN room r ON adm.RoomID = r.RoomID
WHERE adm.DateDischarged IS NULL;

-- ==========================================
-- 3. AGGREGATION & FINANCIAL QUERIES
-- ==========================================

-- A. Total Unpaid Bills (Pending Payments)
-- Retrieves billing details for patients who haven't paid yet.
SELECT 
    p.FullName,
    b.BillDate,
    b.TotalAmount
FROM patient_bill b
JOIN patient p ON b.PatientID = p.PatientID
WHERE b.PaymentStatus = 'Pending';

-- B. Count of Doctors per Department
-- Statistical query to see resource distribution across departments.
SELECT 
    dept.DeptName,
    COUNT(d.DoctorID) AS NumberOfDoctors
FROM department dept
LEFT JOIN doctor d ON dept.DeptID = d.DeptID
GROUP BY dept.DeptName;

-- C. Specific Patient's Test Results
-- Retrieval of medical records for a specific person (e.g., Arjun Kumar).
SELECT 
    p.FullName AS Patient,
    t.TestName,
    tr.Result,
    tr.Status
FROM test_report tr
JOIN patient p ON tr.PatientID = p.PatientID
JOIN lab_test t ON tr.TestID = t.TestID
WHERE p.FullName = 'Arjun Kumar';