-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema city_care_hospital
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `city_care_hospital` ;

-- -----------------------------------------------------
-- Schema city_care_hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `city_care_hospital` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `city_care_hospital` ;

-- -----------------------------------------------------
-- Table `city_care_hospital`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city_care_hospital`.`patient` ;

CREATE TABLE IF NOT EXISTS `city_care_hospital`.`patient` (
  `PatientID` VARCHAR(10) NOT NULL,
  `FullName` VARCHAR(20) NOT NULL,
  `Age` INT NOT NULL,
  `Gender` CHAR(1) NOT NULL,
  `Phone` VARCHAR(10) NOT NULL,
  `City` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`PatientID`),
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `city_care_hospital`.`room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city_care_hospital`.`room` ;

CREATE TABLE IF NOT EXISTS `city_care_hospital`.`room` (
  `RoomID` VARCHAR(10) NOT NULL,
  `RoomType` ENUM('Ward', 'Emergency', 'ICU', 'Waiting Room', 'Medical') NULL DEFAULT 'Ward',
  `CostPerDay` DECIMAL(7,2) NULL DEFAULT NULL,
  `Status` ENUM('Available', 'Occcupied', 'Maintenance') NULL DEFAULT 'Available',
  PRIMARY KEY (`RoomID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `city_care_hospital`.`admission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city_care_hospital`.`admission` ;

CREATE TABLE IF NOT EXISTS `city_care_hospital`.`admission` (
  `AdmissionID` VARCHAR(10) NOT NULL,
  `PatientID` VARCHAR(10) NULL DEFAULT NULL,
  `RoomID` VARCHAR(10) NULL DEFAULT NULL,
  `DateAdmitted` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `DateDischarged` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`AdmissionID`),
  INDEX `PatientID` (`PatientID` ASC) VISIBLE,
  INDEX `RoomID` (`RoomID` ASC) VISIBLE,
  CONSTRAINT `admission_ibfk_1`
    FOREIGN KEY (`PatientID`)
    REFERENCES `city_care_hospital`.`patient` (`PatientID`),
  CONSTRAINT `admission_ibfk_2`
    FOREIGN KEY (`RoomID`)
    REFERENCES `city_care_hospital`.`room` (`RoomID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `city_care_hospital`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city_care_hospital`.`department` ;

CREATE TABLE IF NOT EXISTS `city_care_hospital`.`department` (
  `DeptID` VARCHAR(10) NOT NULL,
  `DeptName` VARCHAR(20) NOT NULL,
  `HeadDoctorName` VARCHAR(20) NULL,
  PRIMARY KEY (`DeptID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `city_care_hospital`.`doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city_care_hospital`.`doctor` ;

CREATE TABLE IF NOT EXISTS `city_care_hospital`.`doctor` (
  `DoctorID` VARCHAR(10) NOT NULL,
  `FullName` VARCHAR(20) NOT NULL,
  `Specialization` VARCHAR(50) NULL,
  `Phone` VARCHAR(10) NOT NULL,
  `ConsultationFee` DECIMAL(7,2) NULL,
  `DeptID` VARCHAR(10) NULL,
  PRIMARY KEY (`DoctorID`),
  INDEX `DeptID` (`DeptID` ASC) VISIBLE,
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC) VISIBLE,
  CONSTRAINT `doctor_ibfk_1`
    FOREIGN KEY (`DeptID`)
    REFERENCES `city_care_hospital`.`department` (`DeptID`)
    ON DELETE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `city_care_hospital`.`appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city_care_hospital`.`appointment` ;

CREATE TABLE IF NOT EXISTS `city_care_hospital`.`appointment` (
  `ApptID` VARCHAR(10) NOT NULL,
  `PatientID` VARCHAR(10) NOT NULL,
  `DoctorID` VARCHAR(10) NOT NULL,
  `ApptDate` DATE NOT NULL,
  `ProblemDescription` VARCHAR(100) NULL,
  PRIMARY KEY (`ApptID`),
  INDEX `PatientID` (`PatientID` ASC) VISIBLE,
  INDEX `DoctorID` (`DoctorID` ASC) VISIBLE,
  UNIQUE INDEX `PatientID_UNIQUE` (`PatientID` ASC) VISIBLE,
  UNIQUE INDEX `DoctorID_UNIQUE` (`DoctorID` ASC) VISIBLE,
  CONSTRAINT `appointment_ibfk_1`
    FOREIGN KEY (`PatientID`)
    REFERENCES `city_care_hospital`.`patient` (`PatientID`),
  CONSTRAINT `appointment_ibfk_2`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `city_care_hospital`.`doctor` (`DoctorID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `city_care_hospital`.`lab_test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city_care_hospital`.`lab_test` ;

CREATE TABLE IF NOT EXISTS `city_care_hospital`.`lab_test` (
  `TestID` VARCHAR(10) NOT NULL,
  `TestName` VARCHAR(20) NOT NULL,
  `Cost` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`TestID`),
  UNIQUE INDEX `TestName_UNIQUE` (`TestName` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `city_care_hospital`.`medicine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city_care_hospital`.`medicine` ;

CREATE TABLE IF NOT EXISTS `city_care_hospital`.`medicine` (
  `MedID` VARCHAR(10) NOT NULL,
  `MedName` VARCHAR(50) NOT NULL,
  `PricePerUnit` DECIMAL(7,2) NOT NULL,
  `StockQuantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`MedID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `city_care_hospital`.`patient_bill`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city_care_hospital`.`patient_bill` ;

CREATE TABLE IF NOT EXISTS `city_care_hospital`.`patient_bill` (
  `BillID` VARCHAR(10) NOT NULL,
  `PatientID` VARCHAR(10) NOT NULL,
  `BillDate` DATE NULL,
  `Amount_Consultation` DECIMAL(7,2) NOT NULL DEFAULT '0.00',
  `Amount_Medicines` DECIMAL(7,2) NOT NULL DEFAULT '0.00',
  `Amount_Tests` DECIMAL(7,2) NOT NULL DEFAULT '0.00',
  `Amount_RoomCharge` DECIMAL(7,2) NOT NULL DEFAULT '0.00',
  `TotalAmount` DECIMAL(7,2) NOT NULL,
  `PaymentStatus` ENUM('Paid', 'Pending') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`BillID`),
  INDEX `PatientID` (`PatientID` ASC) VISIBLE,
  UNIQUE INDEX `PatientID_UNIQUE` (`PatientID` ASC) VISIBLE,
  CONSTRAINT `patient_bill_ibfk_1`
    FOREIGN KEY (`PatientID`)
    REFERENCES `city_care_hospital`.`patient` (`PatientID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `city_care_hospital`.`staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city_care_hospital`.`staff` ;

CREATE TABLE IF NOT EXISTS `city_care_hospital`.`staff` (
  `StaffID` VARCHAR(10) NOT NULL,
  `FullName` VARCHAR(20) NOT NULL,
  `Role` VARCHAR(20) NOT NULL,
  `Shift` ENUM('Morning', 'Afternoon', 'Night') NOT NULL,
  `DeptID` VARCHAR(10) NOT NULL,
  `Phone` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `DeptID` (`DeptID` ASC) VISIBLE,
  CONSTRAINT `staff_ibfk_1`
    FOREIGN KEY (`DeptID`)
    REFERENCES `city_care_hospital`.`department` (`DeptID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `city_care_hospital`.`test_report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `city_care_hospital`.`test_report` ;

CREATE TABLE IF NOT EXISTS `city_care_hospital`.`test_report` (
  `ReportID` VARCHAR(10) NOT NULL,
  `PatientID` VARCHAR(10) NOT NULL,
  `DoctorID` VARCHAR(10) NOT NULL,
  `TestID` VARCHAR(10) NOT NULL,
  `TestDate` DATE NULL DEFAULT NULL,
  `Result` TEXT(200) NULL DEFAULT NULL,
  `Status` ENUM('Success', 'Failed', 'Pending') NULL DEFAULT 'Pending',
  PRIMARY KEY (`ReportID`),
  INDEX `PatientID` (`PatientID` ASC) VISIBLE,
  INDEX `DoctorID` (`DoctorID` ASC) VISIBLE,
  INDEX `TestID` (`TestID` ASC) VISIBLE,
  UNIQUE INDEX `DoctorID_UNIQUE` (`DoctorID` ASC) VISIBLE,
  UNIQUE INDEX `PatientID_UNIQUE` (`PatientID` ASC) VISIBLE,
  UNIQUE INDEX `TestID_UNIQUE` (`TestID` ASC) VISIBLE,
  CONSTRAINT `test_report_ibfk_1`
    FOREIGN KEY (`PatientID`)
    REFERENCES `city_care_hospital`.`patient` (`PatientID`),
  CONSTRAINT `test_report_ibfk_2`
    FOREIGN KEY (`DoctorID`)
    REFERENCES `city_care_hospital`.`doctor` (`DoctorID`),
  CONSTRAINT `test_report_ibfk_3`
    FOREIGN KEY (`TestID`)
    REFERENCES `city_care_hospital`.`lab_test` (`TestID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
