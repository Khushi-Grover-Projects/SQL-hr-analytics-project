CREATE DATABASE HR;
USE HR;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(40),
    Location VARCHAR(30)
);
INSERT INTO Departments VALUES
(1,'IT','Bangalore'),
(2,'HR','Delhi'),
(3,'Finance','Mumbai'),
(4,'Sales','Pune'),
(5,'Operations','Chennai');


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    JoinDate DATE,
    Salary INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);
INSERT INTO Employees VALUES
(101,'Rahul Sharma',1,'2020-01-10',60000),
(102,'Neha Verma',2,'2019-03-15',45000),
(103,'Amit Singh',1,'2021-06-20',70000),
(104,'Pooja Mehta',3,'2018-09-12',80000),
(105,'Ravi Kumar',4,'2022-02-05',50000),
(106,'Anjali Jain',2,'2020-11-01',48000),
(107,'Karan Patel',4,'2019-07-18',55000),
(108,'Simran Kaur',5,'2021-01-25',52000),
(109,'Mohit Aggarwal',3,'2017-05-30',90000),
(110,'Nisha Gupta',1,'2023-04-10',65000);


CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmpID INT,
    AttDate DATE,
    Status VARCHAR(10),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);
INSERT INTO Attendance VALUES
(1,101,'2024-01-01','Present'),
(2,101,'2024-01-02','Present'),
(3,101,'2024-01-03','Absent'),
(4,102,'2024-01-01','Present'),
(5,102,'2024-01-02','Absent'),
(6,103,'2024-01-01','Present'),
(7,103,'2024-01-02','Present'),
(8,103,'2024-01-03','Present'),
(9,104,'2024-01-01','Present'),
(10,104,'2024-01-02','Present'),
(11,105,'2024-01-01','Absent'),
(12,105,'2024-01-02','Present'),
(13,106,'2024-01-01','Present'),
(14,107,'2024-01-01','Present'),
(15,108,'2024-01-01','Absent'),
(16,109,'2024-01-01','Present'),
(17,110,'2024-01-01','Present'),
(18,110,'2024-01-02','Present'),
(19,101,'2024-01-04','Present'),
(20,102,'2024-01-03','Present'),
(21,103,'2024-01-04','Absent'),
(22,104,'2024-01-03','Present'),
(23,105,'2024-01-03','Present'),
(24,106,'2024-01-02','Present'),
(25,107,'2024-01-02','Absent'),
(26,108,'2024-01-02','Present'),
(27,109,'2024-01-02','Present'),
(28,110,'2024-01-03','Absent'),
(29,101,'2024-01-05','Present'),
(30,102,'2024-01-04','Present');


CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY,
    EmpID INT,
    PayMonth VARCHAR(15),
    Bonus INT,
    Deductions INT,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);
INSERT INTO Payroll VALUES
(1,101,'Jan-2024',5000,2000),
(2,102,'Jan-2024',3000,1000),
(3,103,'Jan-2024',7000,2500),
(4,104,'Jan-2024',10000,3000),
(5,105,'Jan-2024',4000,1500),
(6,106,'Jan-2024',3500,1200),
(7,107,'Jan-2024',4500,1800),
(8,108,'Jan-2024',3800,1600),
(9,109,'Jan-2024',12000,4000),
(10,110,'Jan-2024',6000,2000);





