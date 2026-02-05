#1  Employee Master Report

SELECT e.EmpID, e.EmpName, d.DeptName, e.Salary, e.JoinDate
FROM Employees e
JOIN Departments d 
ON e.DeptID = d.DeptID;


#2 Department-wise Headcount

SELECT d.DeptName, COUNT(e.EmpID) AS TotalEmployees
FROM Departments d
LEFT JOIN Employees e ON d.DeptID = e.DeptID
GROUP BY d.DeptName;


#3 Average Salary by Department

SELECT d.DeptName, AVG(e.Salary) AS AvgSalary
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
GROUP BY d.DeptName;


#4 Top 3 Highest Paid Employees

SELECT TOP 3 EmpName, Salary
FROM Employees
ORDER BY Salary DESC;


#5 Attendance % per Employee

SELECT 
    e.EmpName,
    COUNT(a.AttendanceID) AS TotalDays,
    CAST(
        SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) * 100.0 / COUNT(a.AttendanceID) AS INT) AS AttendancePercent
FROM Employees e
JOIN Attendance a ON e.EmpID = a.EmpID
GROUP BY e.EmpName
ORDER BY e.EmpName;


#6 Employees with More Than 2 Absents

SELECT e.EmpName, COUNT(*) AS AbsentDays
FROM Employees e
JOIN Attendance a 
ON e.EmpID = a.EmpID
WHERE a.Status='Absent'
GROUP BY e.EmpName
HAVING COUNT(*) > 1;


#7 Payroll Cost (Company Level)

SELECT SUM(e.Salary + p.Bonus - p.Deductions) AS TotalPayrollCost
FROM Employees e
JOIN Payroll p 
ON e.EmpID = p.EmpID;


#8 Net Salary per Employee

SELECT e.EmpName, e.Salary + p.Bonus - p.Deductions AS NetSalary
FROM Employees e
JOIN Payroll p 
ON e.EmpID = p.EmpID;


#9 Department-wise Payroll Cost

SELECT d.DeptName,SUM(e.Salary + p.Bonus - p.Deductions) AS DeptCost
FROM Employees e
JOIN Departments d 
ON e.DeptID = d.DeptID
JOIN Payroll p 
ON e.EmpID = p.EmpID
GROUP BY d.DeptName;


#10 Employees Joined After 2021

SELECT EmpName, JoinDate
FROM Employees
WHERE JoinDate > '2021-01-01';


#11 Employees with No Attendance Records

SELECT e.EmpName
FROM Employees e
LEFT JOIN Attendance a 
ON e.EmpID = a.EmpID
WHERE a.EmpID IS NULL;


#12 Rank Employees by Salary 

SELECT EmpName,Salary,
RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;


#13 Most Absent Employee

SELECT TOP 1 e.EmpName, COUNT(*) AS AbsentCount
FROM Employees e
JOIN Attendance a 
ON e.EmpID = a.EmpID
WHERE a.Status='Absent'
GROUP BY e.EmpName
ORDER BY AbsentCount DESC;


#14 Department with Highest Avg Salary

SELECT TOP 1 d.DeptName, AVG(e.Salary) AS AvgSalary
FROM Employees e
JOIN Departments d 
ON e.DeptID = d.DeptID
GROUP BY d.DeptName
ORDER BY AvgSalary DESC;


#15 KPI Dashboard Query 

SELECT
COUNT(DISTINCT e.EmpID) AS TotalEmployees,
AVG(e.Salary) AS AvgSalary,
SUM(CASE WHEN a.Status='Absent' THEN 1 ELSE 0 END) AS TotalAbsents,
SUM(e.Salary + p.Bonus - p.Deductions) AS TotalPayroll
FROM Employees e
JOIN Attendance a ON e.EmpID = a.EmpID
JOIN Payroll p ON e.EmpID = p.EmpID;







DROP DATABASE HR;
CREATE DATABASE HR;
USE HR;
