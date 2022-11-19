-- SYSTEM FUNCTIONS --
SELECT LEN('Apple') AS 'Character Length';
--Output: 5

SELECT LEFT('Amitabh-Bachan', 7) AS 'First 7 Left Characters';
SELECT RIGHT('Amitabh-Bachan', 6) AS 'Last 6 Right Characters';

SELECT 
	LEFT(Jobtitle, 5),
	RIGHT(LoginID, 5)
		FROM HumanResources.Employee;

SELECT SUBSTRING(JobTitle, 5, 10) AS '5th Postion 10 Characters', JobTitle
	FROM HumanResources.Employee;

SELECT SUBSTRING('Human-Resources', 1, 5) AS '1st Postion 5 Characters';

SELECT CHARINDEX('e', 'Human-Resources', 1) AS 'Find where the first letter e is';

SELECT CHARINDEX('\', LOGINID, 1) AS 'Find where the slash is at', LoginID
	FROM HumanResources.Employee;

/** Find just the loginID **/
SELECT 
	SUBSTRING(LoginID, CHARINDEX('\', LOGINID, 1) + 1, 15) AS 'Find just the Login ID without the slash', 
	LoginID
	FROM HumanResources.Employee;

/** Find just the loginID with the slash **/
SELECT 
	SUBSTRING(LoginID, CHARINDEX('\', LOGINID, 1), 15) AS 'Find just the Login ID with the slash', 
	LoginID
	FROM HumanResources.Employee;

-- LTRIM()
SELECT LTRIM('           Mark      ');
SELECT RTRIM('           Mark      ');

SELECT LTRIM(RTRIM('     Mark      '));

--DatePart()
SELECT 
	DATEPART(DD, '12-01-2000'),
	DATEPART(MM, '12-01-2000'),
	DATEPART(YYYY, '12-01-2000');

-- Employees that started in the year 2007 
SELECT
	BusinessEntityID, 
	DATEPART(YYYY, HireDate) AS 'Year 2007', 
	HireDate AS 'Hire Date'
	FROM HumanResources.Employee
	WHERE DATEPART(YYYY, HireDate) = 2007

--DateAdd
SELECT DATEADD(MM, 5, '01-01-2020') AS 'Add 5 months to Jan 1st 2020';

SELECT
	DATEADD(DD, 5, HireDate) AS 'Add 5 days to Jan 1st 2020',
	HireDate	
	FROM HumanResources.Employee;

--DateDiff
SELECT 
	DATEDIFF(MM, '01-01-2000', '12-31-2022'),
	DATEDIFF(DD, '01-01-2000', '12-31-2022'),
	DATEDIFF(YYYY, '01-01-2000', '12-31-2022');

SELECT 
	DATEDIFF(DD, '01-01-2000', GETDATE());

--ISNumeric
SELECT 
	ISNUMERIC(OrganizationLevel), 
	OrganizationLevel,
	ISNUMERIC(LoginID), 
	LoginID
		FROM HumanResources.Employee;

--ISNULL
SELECT ISNULL(OrganizationLevel, 100), OrganizationLevel 
	FROM HumanResources.Employee;

SELECT 
	ISNULL(Color, 'No Color'), 
	Color 
	FROM Production.Product;

-- SELECT FIRST NAME AND LAST NAME FROM Employee Table -- -- Use JamesHomeworkWeek2 --
SELECT * FROM Employee;

SELECT LEN(EmpName) FROM Employee;
SELECT CHARINDEX('-', EmpName, 1), EmpName FROM Employee;

SELECT EmpName, LEFT(EmpName, CHARINDEX('-', EmpName, 1) - 1) AS FirstName FROM Employee;
SELECT EmpName, SUBSTRING(EmpName, CHARINDEX('-', EmpName, 1) + 1, LEN(EmpName)) AS LastName FROM Employee;

-- First and Last Name Combined 
SELECT 
	EmpName AS 'Employer Name with Hyphen', 
	LEFT(EmpName, CHARINDEX('-', EmpName, 1) - 1) AS 'First Name', 
	SUBSTRING(EmpName, CHARINDEX('-', EmpName, 1) + 1, LEN(EmpName)) AS 'Last Name' 
		FROM Employee;

-- Use AdventureWorks 2019 Table --
--- Combine FirstName, MiddleName, LastName ---
SELECT * FROM Person.Person;

SELECT
	FirstName + '' AS 'First Name',
	MiddleName + ''  AS 'Middle Name', 
	LastName  + '' AS 'Last Name'
	FROM Person.Person
	WHERE MiddleName IS NOT NULL;

SELECT CONCAT(FirstName, ' ',  MiddleName, ' ', LastName) AS 'All Names',
	FirstName AS 'First Name',
	MiddleName AS 'Middle Name', 
	LastName AS 'Last Name'
	FROM Person.Person
	WHERE MiddleName IS NOT NULL;

SELECT 
	CHARINDEX('-', 'Amitabh-Bachan-Sir', 1),
	CHARINDEX('-', 'Amitabh-Bachan-Sir', 9);

--- CAST() --Used as a mistake when there is an error in the datatype. Mostly used to change datatypes --Use JamesHomeworkWeek2 --
SELECT * FROM Employee;
SELECT CAST(Hiredate AS DATE)
	FROM Employee;

--- CONVERT() - Use JamesHomeworkWeek2
/** https://learn.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16 */
SELECT CONVERT(VARCHAR, HireDate, 101) FROM Employee;
SELECT CONVERT(VARCHAR, HireDate, 102) FROM Employee;
SELECT CONVERT(VARCHAR, HireDate, 103) FROM Employee;
SELECT CONVERT(VARCHAR, HireDate, 104) FROM Employee;
SELECT CONVERT(VARCHAR, HireDate, 105) FROM Employee;
SELECT CONVERT(VARCHAR, HireDate, 106) FROM Employee;
SELECT CONVERT(VARCHAR, HireDate, 107) FROM Employee;
SELECT CONVERT(VARCHAR, HireDate, 108) FROM Employee;
SELECT CONVERT(VARCHAR, HireDate, 9) FROM Employee;
SELECT CONVERT(VARCHAR, HireDate, 110) FROM Employee;
SELECT CONVERT(VARCHAR, HireDate, 111) FROM Employee;
SELECT CONVERT(VARCHAR, HireDate, 112) FROM Employee;

/** Display Number of OrderIDs for Orders in 2011 -- Use AdventureWorks2019 DB */
SELECT TOP(25) * FROM Purchasing.PurchaseOrderHeader;

SELECT 
	COUNT(PurchaseOrderID), 
	DATEPART(YYYY, OrderDate) 
		FROM Purchasing.PurchaseOrderHeader
		WHERE DATEPART(YYYY, OrderDate) = 2011
		GROUP BY DATEPART(YYYY, OrderDate);
		
/** Display Total Number of OrderIDs by year, Sum of SubTotal, AVG of TaxAmt WHERE SUM of TotalDue is > 10000 */
SELECT 
	SUM(PurchaseOrderID) AS TotalOrderID,
	SUM(SubTotal) AS SubTotal,
	AVG(TaxAmt) AS 'Tax Amount',
	DATEPART(YYYY, OrderDate) AS YearOrder,
	SUM(TotalDue) AS SumTotalDue
	FROM Purchasing.PurchaseOrderHeader
	GROUP BY 
		DATEPART(YYYY, OrderDate)
	HAVING SUM(TotalDue) > 10000;
