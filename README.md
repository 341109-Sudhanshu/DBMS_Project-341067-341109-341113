# DBMS-Project-341067-341109-341113 (FORE School of Management)
DBMS Project as part of Term - 2 for ETB Subject under guidance of Prof. Ashok Harnal of FORE School of Management, New Delhi

# City Care Hospital Management System (DBMS)

A comprehensive Relational Database Management System (RDBMS) designed to simulate the core operations of a general hospital. This project handles patient registration, doctor appointments, inpatient admissions, pharmacy inventory, lab reporting, and automated billing.

## Project Overview
This project demonstrates the practical application of DBMS concepts. It models a real-world scenario where patients interact with doctors, labs, etc.

## Database Schema
The database is structured into four logical modules:

### 1. Infrastructure & Inventory
- **Department:** Medical units (e.g., Orthopedics, General Medicine).
- **Room:** Ward management with status tracking ('Available'/'Occupied').
- **Medicine:** Pharmacy stock and pricing.
- **Lab_Test:** Catalog of available diagnostic tests.

### 2. Personnel
- **Doctor:** Linked to specific departments and consultation fees.
- **Staff:** Nurses, technicians, and receptionists.
- **Patient:** Core demographics and medical history.

### 3. OPD (Out-Patient) & IPD (In-Patient)
- **Appointment:** Walk-in doctor visits.
- **Admission:** Managing room allocation and discharge dates.

### 4. Billing & Reporting
- **Test_Report:** Links Patients, Doctors, and Tests (M:N Relationship).
- **Patient_Bill:** Consolidated financial record.

## Group 13 (Section B, PGDM-34)
* 341067 - Arjun M Nair
* 341109 - Sudhanshu Singh
* 341113 - Utkarsh Maheshwari

