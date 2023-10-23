USE master;
GO
IF DB_ID(N'SchoolServicesMarisol')IS NOT NULL
DROP DATABASE SchoolServicesMarisol;
GO
CREATE DATABASE SchoolServicesMarisol
ON
(NAME = SchoolServicesMarisol_dat,
FILENAME= 'C:\BaseDatos\SchoolServicesMarisol.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME =SchoolServicesMarisol_log,
FILENAME = 'C:\BaseDatos\SchoolServicesMarisol.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE SchoolServicesMarisol;
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
    RFC VARCHAR(13) NOT NULL,
    NSS VARCHAR(15) NOT NULL,
    AdmissionDate DATE NOT NULL,
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
GO
CREATE INDEX IX_InstitutionalScholarship ON InstitutionalScholarship (InstitutionalScholarshipID);
CREATE INDEX IX_InternalScholar ON InternalScholar (InternalScholarID);
CREATE INDEX IX_ExternalScholar ON ExternalScholar (ExternalScholarID);
CREATE INDEX IX_SUBES ON SUBES (SUBESID);
CREATE INDEX IX_Student ON Student (StudentID);

ALTER TABLE InternalScholar
ADD CONSTRAINT FK_InternalScholarStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);
ALTER TABLE InternalScholar
ADD CONSTRAINT FK_InternalScholarInstitutionalScholarship FOREIGN KEY (InstitutionalScholarshipID) REFERENCES InstitutionalScholarship (InstitutionalScholarshipID);

ALTER TABLE ExternalScholar
ADD CONSTRAINT FK_ExternalScholarStudent FOREIGN KEY (StudentID) REFERENCES Student (StudentID);
ALTER TABLE ExternalScholar
ADD CONSTRAINT FK_ExternalScholarSUBES FOREIGN KEY (SUBESID) REFERENCES SUBES (SUBESID);

ALTER TABLE StudyPlan 
ADD CONSTRAINT FK_StudyPlanCareer FOREIGN KEY (CareerID) REFERENCES Career (CareerID);

INSERT INTO Career (Name, Description)
VALUES ('Ingeniería Informática', 'Ingeniería especilizada en computadoras');
INSERT INTO Career (Name, Description)
VALUES ('Ingeniería Mecanica', 'Ingeniería especilizada en mantenimiento de motores');
INSERT INTO Career (Name, Description)
VALUES ('Ingeniería Electronica', 'Ingeniería especilizada en circuitos de corriente y robotica');
INSERT INTO Career (Name, Description)
VALUES ('Ingeniería Gestión Empresarial', 'Ingeniería especilizada en organización de una empresa');
INSERT INTO Career (Name, Description)
VALUES ('Ingeniería Industrial', 'Ingeniería especilizada en conocer varias áreas de una empresa');
INSERT INTO Career (Name, Description)
VALUES ('Ingeniería en Energias Renovables', 'Ingeniería especilizada en cuidar el medio ámbiente con tecnología');

INSERT INTO StudyPlan(Name, Code, Duration, Credits, CareerID)
VALUES ('Ingeniería Informática', 'INFI-2023', 6, 300, 1);
INSERT INTO StudyPlan(Name, Code, Duration, Credits, CareerID)
VALUES ('Ingeniería Mecanica', 'INMC-2023', 6, 310, 2);
INSERT INTO StudyPlan(Name, Code, Duration, Credits, CareerID)
VALUES ('Ingeniería Electronica', 'INEL-2023', 6, 290, 3);
INSERT INTO StudyPlan(Name, Code, Duration, Credits, CareerID)
VALUES ('Ingeniería Gestión Empresarial', 'INGE-2023', 6, 250, 4);
INSERT INTO StudyPlan(Name, Code, Duration, Credits, CareerID)
VALUES ('Ingeniería Industrial', 'INFI-2023', 5, 320, 5);
INSERT INTO StudyPlan(Name, Code, Duration, Credits, CareerID)
VALUES ('Ingeniería en Energías Renovables', 'INER-2023', 6, 300, 6);

INSERT INTO Student(StudyPlanID, RegistrationNumber, FirstName, LastName, MiddleName,PhoneNumber,Email,Address,CURP,RFC,NSS, AdmissionDate)
VALUES (1, 'I20050036','Marisol','Ramos' , 'Reyes', '8661753793','I20050036@monclova.tecnm.mx','Matamoros #351' ,'SDDF3FSD300','45QFV95C3D','243344454','2023-10-23');

INSERT INTO Student(StudyPlanID, RegistrationNumber, FirstName, LastName, MiddleName,PhoneNumber,Email,Address,CURP,RFC,NSS, AdmissionDate)
VALUES (2, 'I20050033','Pablo Armando','Ramirez' , 'Ortiz', '8663458734','I20050033@monclova.tecnm.mx','Constitución #959' ,'3343SFDSFSGG','EFDXDS5345','453534538','2023-10-23');

INSERT INTO Student(StudyPlanID, RegistrationNumber, FirstName, LastName, MiddleName,PhoneNumber,Email,Address,CURP,RFC,NSS, AdmissionDate)
VALUES (3, 'I18003230','Yael Jesús','Reyes' , 'Martinez', '8661283495','I18003230@monclova.tecnm.mx','Serafin Cantu #521' ,'YJRM120600CXDD','45QFV95C3D','7TGD76787T7TGU8','2023-10-23');


INSERT INTO SUBES(ScholarshipName, Amount, PaymentDate)
VALUES ('Tecnologico de Campus Monclova',1300.00 ,'2023-10-31');


INSERT INTO InstitutionalScholarship (Name, Percentage, Requirements)
VALUES ('Beca Institucional', 75.00, 'Para alumnos de promedio igual o mayor de 90');

INSERT INTO InstitutionalScholarship (Name, Percentage, Requirements)
VALUES ('Beca de Ofandad', 50.00, 'Para alumnos que necesiten una beca');

INSERT INTO InstitutionalScholarship (Name, Percentage, Requirements)
VALUES ('Beca por parentesco', 20.00, 'Para los alumnos que tienen un familiar trabajando en la institución ');


INSERT INTO InternalScholar (InstitutionalScholarshipID, StudentID, Semester)
VALUES (1, 1, 1);

INSERT INTO InternalScholar (InstitutionalScholarshipID, StudentID, Semester)
VALUES (2, 2, 2);

INSERT INTO InternalScholar (InstitutionalScholarshipID, StudentID, Semester)
VALUES (3, 3, 3);

INSERT INTO ExternalScholar (StudentID, SUBESID, Institution, Campus, Major, Semester)
VALUES (1, 2, 'Instituto Tecnologico Superior de México', 'Campus Monclova', 'Ing Industrial',7);

INSERT INTO ExternalScholar (StudentID, SUBESID, Institution, Campus, Major, Semester)
VALUES (2, 2, 'Instituto Tecnologico Superior de México', 'Campus Monclova', 'Ing Mecanica',5);

INSERT INTO ExternalScholar (StudentID, SUBESID, Institution, Campus, Major, Semester)
VALUES (3, 2, 'Instituto Tecnologico Superior de México', 'Campus Monclova', 'Ing Informatica', 3);
