USE ClinicDB;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Email VARCHAR(100),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Departments (DepartmentName)
VALUES
('Cardiology'),
('Dermatology'),
('General Medicine');

INSERT INTO Doctors (FirstName, LastName, DepartmentID, Email)
VALUES
('John','Smith',1,'john.smith@clinic.com'),
('Sarah','Jones',2,'sarah.jones@clinic.com');

INSERT INTO Patients (FirstName, LastName, DateOfBirth, PhoneNumber)
VALUES
('Michael','Nkosi','1995-04-12','0712345678'),
('Nomsa','Dlamini','2000-09-23','0723456789');

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime)
VALUES
(1,1,'2026-04-10','10:00'),
(2,2,'2026-04-11','11:30');

SELECT 
Patients.FirstName AS Patient,
Doctors.FirstName AS Doctor,
AppointmentDate,
AppointmentTime
FROM Appointments
JOIN Patients ON Appointments.PatientID = Patients.PatientID
JOIN Doctors ON Appointments.DoctorID = Doctors.DoctorID;