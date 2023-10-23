USE master;
GO
IF DB_ID(N'School services')IS NOT NULL
DROP DATABASE SchoolServices;
GO
CREATE DATABASE SchoolServices
ON
(NAME = SchoolServices_dat,
FILENAME= 'C:\BaseDatos\School services.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME =SchoolServices_log,
FILENAME = 'C:\BaseDatos\School services.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE SchoolServices;
GO
-- Student
CREATE TABLE Student (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    StudyPlanID INT NOT NULL,
    RegistrationNumber VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    CURP VARCHAR(18) NOT NULL,
    AffiliationNumber VARCHAR(20) NOT NULL,
    RFC VARCHAR(13) NOT NULL,
    NSS VARCHAR(15) NOT NULL,
    AdmissionDate DATE NOT NULL,
    StudyCertificateID INT NOT NULL,
    ExternalScholarID INT NOT NULL,
    TitleID INT NOT NULL,
    LifeInsuranceID INT NOT NULL,
    EducationID INT NOT NULL,
    CertificateID INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Employee
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address VARCHAR(100) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL,
    RFC VARCHAR(13) NOT NULL,
    SocialSecurity VARCHAR(15) NOT NULL,
    EmployeeTypeID INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- EmployeeType
CREATE TABLE EmployeeType (
    EmployeeTypeID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    BaseSalary DECIMAL(10, 2) NOT NULL,
    Hours INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Career
CREATE TABLE Career (
    CareerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- StudyPlan
CREATE TABLE StudyPlan (
    StudyPlanID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Code VARCHAR(10) NOT NULL,
    Duration INT NOT NULL,
    Credits INT NOT NULL,
    CareerID INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Course
CREATE TABLE Course (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Credits INT NOT NULL,
    Code VARCHAR(20) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Class
CREATE TABLE Class (
    ClassID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    CourseID INT NOT NULL,
    PeriodID INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Kardex
CREATE TABLE Kardex (
    KardexID INT PRIMARY KEY IDENTITY(1,1),
    ClassID INT NOT NULL,
    OpportunityID INT NOT NULL,
    StudentID INT NOT NULL,
    Grade DECIMAL(5, 2) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- CareerService
CREATE TABLE CareerService (
    CareerServiceID INT PRIMARY KEY IDENTITY(1,1),
    CareerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    ServiceDate DATE NOT NULL,
    Description VARCHAR(100) NOT NULL,
    State VARCHAR(20) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Opportunity
CREATE TABLE Opportunity (
    OpportunityID INT PRIMARY KEY IDENTITY(1,1),
    Number INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- DocumentRequest
CREATE TABLE DocumentRequest (
    DocumentRequestID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    DocumentTypeID INT NOT NULL,
    EmployeeID INT NOT NULL,
    RequestDate DATE NOT NULL
);

-- DocumentType
CREATE TABLE DocumentType (
    DocumentTypeID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- InstitutionalScholarship
CREATE TABLE InstitutionalScholarship (
    InstitutionalScholarshipID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    Percentage DECIMAL(5, 2) NOT NULL,
    Requirements VARCHAR(100) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- InternalScholar
CREATE TABLE InternalScholar (
    InternalScholarID INT PRIMARY KEY IDENTITY(1,1),
    InstitutionalScholarshipID INT NOT NULL,
    StudentID INT NOT NULL,
    Semester INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- ExternalScholar
CREATE TABLE ExternalScholar (
    ExternalScholarID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    SUBESID INT NOT NULL,
    Institution VARCHAR(50) NOT NULL,
    Campus VARCHAR(50) NOT NULL,
    Major VARCHAR(50) NOT NULL,
    Semester INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- SUBES
CREATE TABLE SUBES (
    SUBESID INT PRIMARY KEY IDENTITY(1,1),
    ScholarshipName VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- FamilyData
CREATE TABLE FamilyData (
    FamilyDataID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50) NOT NULL,
    Relationship VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Enrollment
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    PeriodID INT NOT NULL,
    NumericalReference INT NOT NULL,
    TotalPayment DECIMAL(10, 2) NOT NULL,
    Matriculation VARCHAR(50) NOT NULL,
    DueDate DATE NOT NULL,
    Semester INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- LifeInsurance
CREATE TABLE LifeInsurance (
    LifeInsuranceID INT PRIMARY KEY IDENTITY(1,1),
    PolicyNumber VARCHAR(20) NOT NULL,
    InsuranceCompany VARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Beneficiary VARCHAR(50) NOT NULL,
    DeathCoverage DECIMAL(10, 2) NOT NULL,
    DisabilityCoverage DECIMAL(10, 2) NOT NULL,
    InsurancePayment DECIMAL(10, 2) NOT NULL,
    PaymentPeriod INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Period
CREATE TABLE Period (
    PeriodID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Duration INT NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Education
CREATE TABLE Education (
    EducationID INT PRIMARY KEY IDENTITY(1,1),
    EducationLevel VARCHAR(50) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- StudyCertificate
CREATE TABLE StudyCertificate (
    StudyCertificateID INT PRIMARY KEY IDENTITY(1,1),
    IssuanceDate DATE NOT NULL,
    RegistrationDate DATE NOT NULL,
    Information VARCHAR(100) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Title
CREATE TABLE Title (
    TitleID INT PRIMARY KEY IDENTITY(1,1),
    GraduationDate DATE NOT NULL,
    ObtainedTitle VARCHAR(50) NOT NULL,
    RegistrationNumber VARCHAR(20) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Reticule
CREATE TABLE Reticule (
    ReticuleID INT PRIMARY KEY IDENTITY(1,1),
    Description VARCHAR(100) NOT NULL,
    CourseID INT NOT NULL,
    ContactInformation VARCHAR(100) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- GraduateInformation
CREATE TABLE GraduateInformation (
    GraduateInformationID INT PRIMARY KEY IDENTITY(1,1),
    GraduationDate DATE NOT NULL,
    CurrentJob VARCHAR(50) NOT NULL,
    CurrentPosition VARCHAR(50) NOT NULL,
    Status BIT DEFAULT 1 NOT NULL
);

-- Foreign Keys
-- Employee
ALTER TABLE Employee
ADD CONSTRAINT FK_EmployeeEmployeeType FOREIGN KEY (EmployeeTypeID) REFERENCES EmployeeType (EmployeeTypeID);

-- StudyPlan
ALTER TABLE StudyPlan
ADD CONSTRAINT FK_StudyPlanCareer FOREIGN KEY (CareerID) REFERENCES Career (CareerID);

-- Class
ALTER TABLE Class
ADD CONSTRAINT FK_ClassEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

ALTER TABLE Class
ADD CONSTRAINT FK_ClassCourse FOREIGN KEY (CourseID) REFERENCES Course (CourseID);

ALTER TABLE Class
ADD CONSTRAINT FK_ClassPeriod FOREIGN KEY (PeriodID) REFERENCES Period (PeriodID);

-- Kardex
ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexClass FOREIGN KEY (ClassID) REFERENCES Class (ClassID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexOpportunity FOREIGN KEY (OpportunityID) REFERENCES Opportunity (OpportunityID);

ALTER TABLE Kardex
ADD CONSTRAINT FK_KardexStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

-- CareerService
ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceCareer FOREIGN KEY (CareerID) REFERENCES Career (CareerID);

ALTER TABLE CareerService
ADD CONSTRAINT FK_CareerServiceEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

-- DocumentRequest
ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestDocumentType FOREIGN KEY (DocumentTypeID) REFERENCES DocumentType (DocumentTypeID);

ALTER TABLE DocumentRequest
ADD CONSTRAINT FK_DocumentRequestEmployee FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

-- InstitutionalScholar
ALTER TABLE InternalScholar
ADD CONSTRAINT FK_InternalScholarInstitutionalScholar FOREIGN KEY (InstitutionalScholarshipID) REFERENCES InstitutionalScholarship (InstitutionalScholarshipID);

ALTER TABLE InternalScholar
ADD CONSTRAINT FK_InternalScholarStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

-- ExternalScholar
ALTER TABLE ExternalScholar
ADD CONSTRAINT FK_ExternalScholarStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE ExternalScholar
ADD CONSTRAINT FK_ExternalScholarSUBES FOREIGN KEY (SUBESID) REFERENCES SUBES (SUBESID);


-- Enrollment
ALTER TABLE Enrollment
ADD CONSTRAINT FK_EnrollmentStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);

ALTER TABLE Enrollment
ADD CONSTRAINT FK_EnrollmentPeriod FOREIGN KEY (PeriodID) REFERENCES Period (PeriodID);


-- Reticule
ALTER TABLE Reticule
ADD CONSTRAINT FK_ReticuleCourse FOREIGN KEY (CourseID) REFERENCES Course (CourseID);

-- Student
ALTER TABLE Student
ADD CONSTRAINT FK_StudentStudyPlan FOREIGN KEY (StudyPlanID) REFERENCES StudyPlan (StudyPlanID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentStudyCertificate FOREIGN KEY (StudyCertificateID) REFERENCES StudyCertificate (StudyCertificateID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentTitle FOREIGN KEY (TitleID) REFERENCES Title (TitleID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentLifeInsurance FOREIGN KEY (LifeInsuranceID) REFERENCES LifeInsurance (LifeInsuranceID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentEducation FOREIGN KEY (EducationID) REFERENCES Education (EducationID);

ALTER TABLE Student
ADD CONSTRAINT FK_StudentCertificate FOREIGN KEY (CertificateID) REFERENCES StudyCertificate (StudyCertificateID);

CREATE INDEX IX_Student ON Student (StudentID);
CREATE INDEX IX_Employee ON Employee (EmployeeID);
CREATE INDEX IX_EmployeeType ON EmployeeType (EmployeeTypeID);
CREATE INDEX IX_Career ON Career (CareerID);
CREATE INDEX IX_StudyPlan ON StudyPlan (StudyPlanID);
CREATE INDEX IX_Course ON Course (CourseID);
CREATE INDEX IX_Class ON Class (ClassID);
CREATE INDEX IX_Kardex ON Kardex (KardexID);
CREATE INDEX IX_CareerService ON CareerService (CareerServiceID);
CREATE INDEX IX_Opportunity ON Opportunity (OpportunityID);
CREATE INDEX IX_DocumentRequest ON DocumentRequest (DocumentRequestID);
CREATE INDEX IX_DocumentType ON DocumentType (DocumentTypeID);
CREATE INDEX IX_InstitutionalScholarship ON InstitutionalScholarship (InstitutionalScholarshipID);
CREATE INDEX IX_InternalScholar ON InternalScholar (InternalScholarID);
CREATE INDEX IX_ExternalScholar ON ExternalScholar (ExternalScholarID);
CREATE INDEX IX_SUBES ON SUBES (SUBESID);
CREATE INDEX IX_FamilyData ON FamilyData (FamilyDataID);
CREATE INDEX IX_Enrollment ON Enrollment (EnrollmentID);
CREATE INDEX IX_LifeInsurance ON LifeInsurance (LifeInsuranceID);
CREATE INDEX IX_Period ON Period (PeriodID);
CREATE INDEX IX_Education ON Education (EducationID);
CREATE INDEX IX_StudyCertificate ON StudyCertificate (StudyCertificateID);
CREATE INDEX IX_Title ON Title (TitleID);
CREATE INDEX IX_Reticule ON Reticule (ReticuleID);
CREATE INDEX IX_GraduateInformation ON GraduateInformation (GraduateInformationID);

INSERT INTO EmployeeType (Name, BaseSalary, Hours)
VALUES ('Full-Time', 50000.00, 40);

INSERT INTO EmployeeType (Name, BaseSalary, Hours)
VALUES ('Part-Time', 25000.00, 20);

INSERT INTO EmployeeType (Name, BaseSalary, Hours)
VALUES ('Contract', 35000.00, 30);

INSERT INTO Employee (FirstName, LastName, MiddleName, PhoneNumber, Email, Gender, Position, Salary, DateOfBirth, Address, ZipCode, RFC, SocialSecurity, EmployeeTypeID)
VALUES ('John', 'Doe', 'A', '123-456-7890', 'john.doe@email.com', 'M', 'Manager', 60000.00, '1990-05-15', '123 Main St', '12345', 'ABC123456DEF', '123-45-6789', 1);

INSERT INTO Employee (FirstName, LastName, MiddleName, PhoneNumber, Email, Gender, Position, Salary, DateOfBirth, Address, ZipCode, RFC, SocialSecurity, EmployeeTypeID)
VALUES ('Jane', 'Smith', 'B', '987-654-3210', 'jane.smith@email.com', 'F', 'Assistant', 40000.00, '1995-09-20', '456 Elm St', '54321', 'XYZ987654ABC', '987-65-4321', 2);

INSERT INTO Employee (FirstName, LastName, MiddleName, PhoneNumber, Email, Gender, Position, Salary, DateOfBirth, Address, ZipCode, RFC, SocialSecurity, EmployeeTypeID)
VALUES ('David', 'Williams', 'C', '555-123-9876', 'david.williams@email.com', 'M', 'Developer', 55000.00, '1988-03-10', '789 Oak St', '67890', 'PQR555123XYZ', '555-12-3987', 1);


INSERT INTO Career (Name, Description)
VALUES ('Computer Science', 'Programs for the computer science field.');

INSERT INTO Career (Name, Description)
VALUES ('Business Administration', 'Programs for business management.');

INSERT INTO Career (Name, Description)
VALUES ('Mechanical Engineering', 'Programs for mechanical engineering.');


INSERT INTO StudyPlan (Name, Code, Duration, Credits, CareerID)
VALUES ('Computer Science - Bachelor', 'CS-B', 4, 120, 1);

INSERT INTO StudyPlan (Name, Code, Duration, Credits, CareerID)
VALUES ('Business Administration - Bachelor', 'BA-B', 4, 130, 2);

INSERT INTO StudyPlan (Name, Code, Duration, Credits, CareerID)
VALUES ('Mechanical Engineering - Bachelor', 'ME-B', 5, 150, 3);


INSERT INTO Course (Name, Credits, Code)
VALUES ('Introduction to Programming', 3, 'PROG101');

INSERT INTO Course (Name, Credits, Code)
VALUES ('Business Ethics', 2, 'ETHICS201');

INSERT INTO Course (Name, Credits, Code)
VALUES ('Advanced Calculus', 4, 'MATH301');

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State)
VALUES (1, 1, '2023-04-15', 'Career counseling', 'Active');

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State)
VALUES (2, 2, '2023-05-20', 'Job placement assistance', 'Active');

INSERT INTO CareerService (CareerID, EmployeeID, ServiceDate, Description, State)
VALUES (3, 3, '2023-06-10', 'Resume review', 'Active');

INSERT INTO Opportunity (Number, Name)
VALUES (1, 'Internship Opportunity at Company A');

INSERT INTO Opportunity (Number, Name)
VALUES (2, 'Scholarship Opportunity for STEM Students');

INSERT INTO Opportunity (Number, Name)
VALUES (3, 'Job Fair - Spring 2023');

INSERT INTO DocumentType (Name, Description)
VALUES ('Transcript', 'Academic transcript document.');

INSERT INTO DocumentType (Name, Description)
VALUES ('Diploma', 'Certificate of completion.');

INSERT INTO DocumentType (Name, Description)
VALUES ('Recommendation Letter', 'Letter of recommendation.');

INSERT INTO InstitutionalScholarship (Name, Percentage, Requirements)
VALUES ('Merit Scholarship', 25.00, 'Minimum GPA of 3.5 and active student.');

INSERT INTO InstitutionalScholarship (Name, Percentage, Requirements)
VALUES ('Financial Aid Scholarship', 50.00, 'Demonstrated financial need and enrollment in eligible programs.');

INSERT INTO InstitutionalScholarship (Name, Percentage, Requirements)
VALUES ('Leadership Scholarship', 20.00, 'Active involvement in extracurricular activities and leadership roles.');

INSERT INTO SUBES (ScholarshipName, Amount, PaymentDate)
VALUES ('Federal Scholarship Program', 1500.00, '2023-04-01');

INSERT INTO SUBES (ScholarshipName, Amount, PaymentDate)
VALUES ('National Student Support Program', 1000.00, '2023-04-15');

INSERT INTO SUBES (ScholarshipName, Amount, PaymentDate)
VALUES ('Educational Excellence Scholarship', 2000.00, '2023-05-01');

INSERT INTO FamilyData (FirstName, LastName, MiddleName, Relationship, PhoneNumber, Email, Address)
VALUES ('John', 'Doe', 'Sr.', 'Father', '123-456-7890', 'john@example.com', '123 Main St');

INSERT INTO FamilyData (FirstName, LastName, MiddleName, Relationship, PhoneNumber, Email, Address)
VALUES ('Jane', 'Smith', 'Jr.', 'Mother', '987-654-3210', 'jane@example.com', '456 Elm St');

INSERT INTO FamilyData (FirstName, LastName, MiddleName, Relationship, PhoneNumber, Email, Address)
VALUES ('David', 'Doe', 'None', 'Brother', '555-123-4567', 'david@example.com', '789 Oak St');

INSERT INTO LifeInsurance (PolicyNumber, InsuranceCompany, StartDate, EndDate, Beneficiary, DeathCoverage, DisabilityCoverage, InsurancePayment, PaymentPeriod)
VALUES ('LI-001', 'XYZ Insurance', '2023-01-15', '2028-01-14', 'John Doe', 500000.00, 250000.00, 150.00, 12);

INSERT INTO LifeInsurance (PolicyNumber, InsuranceCompany, StartDate, EndDate, Beneficiary, DeathCoverage, DisabilityCoverage, InsurancePayment, PaymentPeriod)
VALUES ('LI-002', 'ABC Insurance', '2023-02-20', '2027-02-19', 'Jane Smith', 300000.00, 150000.00, 100.00, 6);

INSERT INTO LifeInsurance (PolicyNumber, InsuranceCompany, StartDate, EndDate, Beneficiary, DeathCoverage, DisabilityCoverage, InsurancePayment, PaymentPeriod)
VALUES ('LI-003', '123 Insure', '2023-03-10', '2028-03-09', 'David Johnson', 750000.00, 300000.00, 200.00, 12);

INSERT INTO Period (Name, StartDate, EndDate, Duration)
VALUES ('Fall 2023', '2023-09-01', '2023-12-15', 106);

INSERT INTO Period (Name, StartDate, EndDate, Duration)
VALUES ('Spring 2024', '2024-01-15', '2024-05-30', 137);

INSERT INTO Period (Name, StartDate, EndDate, Duration)
VALUES ('Summer 2024', '2024-06-15', '2024-08-31', 78);


INSERT INTO Education (EducationLevel, StartDate, EndDate)
VALUES ('High School', '2018-09-01', '2021-06-30');

INSERT INTO Education (EducationLevel, StartDate, EndDate)
VALUES ('Bachelor Degree', '2021-09-01', '2025-06-30');

INSERT INTO Education (EducationLevel, StartDate, EndDate)
VALUES ('Masters Degree', '2025-09-01', '2027-06-30');

INSERT INTO StudyCertificate (IssuanceDate, RegistrationDate, Information)
VALUES ('2022-06-15', '2022-06-16', 'Bachelor of Science in Computer Science');

INSERT INTO StudyCertificate (IssuanceDate, RegistrationDate, Information)
VALUES ('2021-05-20', '2021-05-21', 'Master of Business Administration');

INSERT INTO StudyCertificate (IssuanceDate, RegistrationDate, Information)
VALUES ('2019-12-10', '2019-12-11', 'High School Diploma');

INSERT INTO Title (GraduationDate, ObtainedTitle, RegistrationNumber)
VALUES ('2023-06-30', 'Bachelor of Arts', 'T12345');

INSERT INTO Title (GraduationDate, ObtainedTitle, RegistrationNumber)
VALUES ('2022-12-15', 'Master of Science', 'M67890');

INSERT INTO Title (GraduationDate, ObtainedTitle, RegistrationNumber)
VALUES ('2021-05-25', 'Doctor of Philosophy', 'D54321');

INSERT INTO Reticule (Description, CourseID, ContactInformation)
VALUES ('Computer Science Reticule', 4, 'Contact: professor@example.com');

INSERT INTO Reticule (Description, CourseID, ContactInformation)
VALUES ('Business Administration Reticule', 5, 'Contact: business-dept@example.com');

INSERT INTO Reticule (Description, CourseID, ContactInformation)
VALUES ('Physics Reticule', 6, 'Contact: physics-dept@example.com');

INSERT INTO GraduateInformation (GraduationDate, CurrentJob, CurrentPosition)
VALUES ('2022-06-15', 'Software Engineer', 'Senior Developer');

INSERT INTO GraduateInformation (GraduationDate, CurrentJob, CurrentPosition)
VALUES ('2021-05-20', 'Marketing Manager', 'Digital Marketing Specialist');

INSERT INTO GraduateInformation (GraduationDate, CurrentJob, CurrentPosition)
VALUES ('2019-12-10', 'Data Analyst', 'Business Intelligence Analyst');

INSERT INTO Student (StudyPlanID, RegistrationNumber, FirstName, LastName, MiddleName, PhoneNumber, Email, Address, CURP, AffiliationNumber, RFC, NSS, AdmissionDate, StudyCertificateID, ExternalScholarID, TitleID, LifeInsuranceID, EducationID, CertificateID)
VALUES (1, 'ST12345', 'John', 'Doe', 'M.', '555-123-4567', 'john.doe@example.com', '123 Main St, City', 'RAOP03', 'Aff123', 'RFC12345', 'NSS12345', '2022-08-15', 1, 1, 1, 1, 1, 1);

INSERT INTO Student (StudyPlanID, RegistrationNumber, FirstName, LastName, MiddleName, PhoneNumber, Email, Address, CURP, AffiliationNumber, RFC, NSS, AdmissionDate, StudyCertificateID, ExternalScholarID, TitleID, LifeInsuranceID, EducationID, CertificateID)
VALUES (2, 'ST67890', 'Alice', 'Smith', 'L.', '555-987-6543', 'alice.smith@example.com', '456 Elm St, Town', 'CURP', 'Aff456', 'RFC67890', 'NSS67890', '2021-09-20', 2, 2, 2, 2, 2, 2);

INSERT INTO Student (StudyPlanID, RegistrationNumber, FirstName, LastName, MiddleName, PhoneNumber, Email, Address, CURP, AffiliationNumber, RFC, NSS, AdmissionDate, StudyCertificateID, ExternalScholarID, TitleID, LifeInsuranceID, EducationID, CertificateID)
VALUES (3, 'ST13579', 'Ella', 'Johnson', 'K.', '555-234-5678', 'ella.johnson@example.com', '789 Oak St, Village', 'CURP1F', 'Aff789', 'RFC13579', 'NSS13579', '2020-12-05', 3, 3, 3, 3, 3, 3);

INSERT INTO Class (EmployeeID, CourseID, PeriodID)
VALUES (1, 1, 1);

INSERT INTO Class (EmployeeID, CourseID, PeriodID)
VALUES (2, 2, 2);

INSERT INTO Class (EmployeeID, CourseID, PeriodID)
VALUES (3, 3, 3);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade)
VALUES (1, 1, 1, 95.5);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade)
VALUES (2, 2, 2, 88.0);

INSERT INTO Kardex (ClassID, OpportunityID, StudentID, Grade)
VALUES (3, 3, 3, 76.5);

INSERT INTO DocumentRequest (StudentID, DocumentTypeID, EmployeeID, RequestDate)
VALUES (1, 1, 1, '2023-10-15');

INSERT INTO DocumentRequest (StudentID, DocumentTypeID, EmployeeID, RequestDate)
VALUES (2, 2, 2, '2023-10-16');

INSERT INTO DocumentRequest (StudentID, DocumentTypeID, EmployeeID, RequestDate)
VALUES (3, 3, 3, '2023-10-17');

INSERT INTO InternalScholar (InstitutionalScholarshipID, StudentID, Semester)
VALUES (1, 1, 1);

INSERT INTO InternalScholar (InstitutionalScholarshipID, StudentID, Semester)
VALUES (2, 2, 2);

INSERT INTO InternalScholar (InstitutionalScholarshipID, StudentID, Semester)
VALUES (3, 3, 3);

INSERT INTO ExternalScholar (StudentID, SUBESID, Institution, Campus, Major, Semester)
VALUES (1, 1, 'ABC University', 'Main Campus', 'Computer Science', 1);

INSERT INTO ExternalScholar (StudentID, SUBESID, Institution, Campus, Major, Semester)
VALUES (2, 2, 'XYZ College', 'Downtown Campus', 'Engineering', 2);

INSERT INTO ExternalScholar (StudentID, SUBESID, Institution, Campus, Major, Semester)
VALUES (3, 3, '123 Institute', 'West Campus', 'Business Administration', 3);

INSERT INTO Enrollment (StudentID, PeriodID, NumericalReference, TotalPayment, Matriculation, DueDate, Semester)
VALUES (1, 1, 20231001, 1500.00, 'MAT20231001', '2023-09-15', 1);

INSERT INTO Enrollment (StudentID, PeriodID, NumericalReference, TotalPayment, Matriculation, DueDate, Semester)
VALUES (2, 1, 20231002, 1600.00, 'MAT20231002', '2023-09-15', 1);

INSERT INTO Enrollment (StudentID, PeriodID, NumericalReference, TotalPayment, Matriculation, DueDate, Semester)
VALUES (3, 2, 20231003, 1550.00, 'MAT20231003', '2023-09-15', 1);
