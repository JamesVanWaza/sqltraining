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
