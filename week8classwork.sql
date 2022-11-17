-- AdventureWorks2019 --

/*** SQL ORDER **/

/** 
	SELECT  --COLUMN NAMES, MAX(), MIN(), SUM(), AVG(), COUNT()
	FROM --TABLENAMES
	WHERE  -- COLUMN NAMES NOT IN AGGREGATE FUNCTION FILTER
	GROUP BY -- ALL COLUMN NAMES THAT ARE NOT IN AGGREGATE FUNCTION
	HAVING -- FILTER FOR AGGREGATE FUNCTION
	ORDER BY -- SORT RESULTS BY COLUMN NAMES
*/

--SELECT * FROM Person.Address;

/** How many people living in Monroe */
SELECT * FROM Person.Address WHERE City = 'Monroe';

/** How many people living in Bellevue, Sammamish, Redmond, Chicago */
SELECT * FROM Person.Address WHERE City IN('Bellevue', 'Sammamish', 'Redmond', 'Chicago');

SELECT City FROM Person.Address WHERE City LIKE '%City%'

SELECT City FROM Person.Address WHERE City LIKE 'City%'

SELECT City FROM Person.Address WHERE City LIKE '%City'

/** Show Woodland Hills */
SELECT City FROM Person.Address WHERE City LIKE '%Woodland Hills%';

/** Woodland Hills will not show */
SELECT City FROM Person.Address WHERE City LIKE 'Wood%' AND City NOT LIKE '%Hills%';

/** HAVING Example */
SELECT * FROM Sales.SalesOrderDetail;

SELECT SalesOrderID, 
	SUM(OrderQty) AS TotalOrderQty, 
	SpecialOfferID, 
	SUM(LineTotal) AS TotalLineTotal
	FROM Sales.SalesOrderDetail
	GROUP BY SalesOrderID, SpecialOfferID
	HAVING SUM(OrderQty) > 200;

/* WHERE EXAMPLE */
SELECT SalesOrderID, 
	SUM(OrderQty) AS TotalOrderQty, 
	SpecialOfferID, 
	SUM(LineTotal) AS TotalLineTotal
	FROM Sales.SalesOrderDetail
	WHERE SalesOrderID > 50000
	GROUP BY SalesOrderID, SpecialOfferID
	HAVING SUM(OrderQty) > 200;

/** How many people living in each zipcode */
SELECT * FROM Person.Address;

SELECT COUNT(AddressID) as NumOfPeople, City, PostalCode
	FROM Person.Address
	WHERE City IN ('Saint John', 'Vista', 'Idaho Falls', 'Cedar City', 'Gold Bar')
	GROUP BY City, PostalCode
	ORDER BY NumOfPeople;

/** Where population is greater than 100 */
SELECT COUNT(AddressID) as TotalPopulation, City, PostalCode
	FROM Person.Address
	GROUP BY City, PostalCode
	HAVING COUNT(AddressID) > 100
	ORDER BY City;

/** Person.Address SELECT * FROM Person.Address */

/** Write a query to display Person.Address table in the ascending order of city */
SELECT City FROM Person.Address ORDER BY City ASC;

/** Display the count of Person.Address Table WHERE City is London */
SELECT COUNT(AddressID) as TotalPopulation, City FROM Person.Address 
	WHERE City = 'London'
	GROUP BY City

/** Display total population for people living in address that contains Drive */
SELECT COUNT(AddressLine1) AS TotalPopulation, City, AddressLine1
		FROM Person.Address 
			WHERE AddressLine1 LIKE '%Dr%' 
				GROUP BY City, AddressLine1;

/*******************************************************
Display the distinct cities from [Person].[Address] table
********************************************************/
SELECT DISTINCT City FROM Person.Address;

/*******************************************************
Display [AddressLine1], total population by city for people living
StateProvinceCode 39, 40, 41, 42, 44
********************************************************/
SELECT COUNT(*) as TotalPopulation, City 
	FROM Person.Address
		WHERE StateProvinceID > 50
			GROUP BY City; 

/*******************************************************
Display [AddressLine1], HAVING POPULATION GREATER THAN 50
********************************************************/
SELECT COUNT(*) as TotalPopulation, City 
	FROM Person.Address
		GROUP BY City
			HAVING COUNT(*) > 50
			ORDER BY TotalPopulation; 


/*******************************************************
Provide a list of employee Titles and Gender from [HumanResources].[Employee]
********************************************************/
SELECT JobTitle, Gender FROM HumanResources.Employee;

/*******************************************************
For each Title include the average vacation hours for all employees of each
gender. Also provide an additional subtotal for each title that includes
the average vacation hours for all employees of that title.
********************************************************/
SELECT JobTitle AS 'Job Title', Gender, SUM(VacationHours) AS 'Vacation Hours' 
	FROM HumanResources.Employee
		GROUP BY Gender, JobTitle
		ORDER BY JobTitle;

/** Who is taking more than 100 hours of vacation */
SELECT JobTitle AS 'Job Title', Gender, SUM(VacationHours) AS 'Vacation Hours' 
	FROM HumanResources.Employee
		GROUP BY Gender, JobTitle
		HAVING SUM(VacationHours) > 100
		ORDER BY JobTitle;

/** Who is taking less than 100 hours of vacation */
SELECT JobTitle AS 'Job Title', Gender, SUM(VacationHours) AS 'Vacation Hours' 
	FROM HumanResources.Employee
		GROUP BY Gender, JobTitle
		HAVING SUM(VacationHours) < 100
		ORDER BY JobTitle;

/** Find managers vacation hours */
SELECT JobTitle AS 'Job Title', Gender, SUM(VacationHours) AS 'Vacation Hours' 
	FROM HumanResources.Employee
		WHERE JobTitle LIKE '%Manager%'
		GROUP BY Gender, JobTitle
		ORDER BY JobTitle;

/** Display the address where PostalCode is not having Numeric values */
SELECT PostalCode 
	FROM Person.Address
		WHERE ISNUMERIC(PostalCode) <> 1;

/** Find all cities starting with a and ending with a */
SELECT * FROM Person.StateProvince 
	WHERE NAME LIKE 'a%' AND NAME LIKE '%a';

/** Display LoginID where the Vacation Hours = 8 and order the data by the HireDate in Asc */
SELECT * FROM HumanResources.Employee
	WHERE VacationHours = 8
	ORDER BY HireDate;

/** Employee Pay History */
SELECT * FROM HumanResources.EmployeePayHistory;

/** Find what are different shifts */
SELECT DISTINCT ShiftID FROM HumanResources.EmployeeDepartmentHistory;

/** Find how many people are working in each shift */
SELECT COUNT(BusinessEntityID) as 'Count of Employees', ShiftID, DepartmentID 
	FROM HumanResources.EmployeeDepartmentHistory
		GROUP BY ShiftID, DepartmentID
		ORDER BY ShiftID;

/** Find how many people are working in each shift where count of employees is the highest */
SELECT COUNT(BusinessEntityID) as 'Count of Employees', ShiftID, DepartmentID 
	FROM HumanResources.EmployeeDepartmentHistory
		GROUP BY ShiftID, DepartmentID
		ORDER BY COUNT(BusinessEntityID) DESC;

/** Display all Columns from [HumanResources.Employee] */
SELECT * FROM 
	HumanResources.Employee
		ORDER BY 
			HireDate ASC, 
			LoginID DESC;

/** Display the Name and Color of the Product with Maximum Weight */
SELECT [Name], Color, 
		MAX([Weight]) AS 'Maximum Weight'
			FROM Production.Product
				GROUP BY [Name], Color
				ORDER BY MAX([Weight]) DESC;

/**
Select ProductID, Name, Color, StandardCost, SellStartDate, SellEndDate [Production.Product]
Find Total StandardCost by Color 
For Only Chainring and Bearing Products
*/
SELECT 
	ProductID, 
	[Name], 
	Color, 
	SUM(StandardCost) AS 'Standard Cost', 
	SellStartDate, 
	SellEndDate
		FROM Production.Product
		WHERE [Name] LIKE '%Chainring%' OR [Name] LIKE '%Bearing%'
		GROUP BY ProductID, [Name], Color, SellStartDate, SellEndDate;

--- Display Login from [HumanResources.Employee] Where Organisation Level is 3 and order the HireDate in ASC */
SELECT * FROM HumanResources.Employee;

SELECT * 
	FROM HumanResources.Employee
		WHERE OrganizationLevel = 3
		ORDER BY HireDate ASC;

/** Display BusinessEntityID,  */
SELECT 
	Gender, 
	SUM(VacationHours) AS 'Total Vacation Hours', 
	JobTitle 
	FROM HumanResources.Employee
		GROUP BY JobTitle, Gender
		ORDER BY JobTitle;

/** Display Total Vacation Hours for Male and Female by JobTitle */
SELECT 
	Gender, 
	SUM(VacationHours) AS 'Total Vacation Hours', 
	JobTitle 
	FROM HumanResources.Employee
		GROUP BY JobTitle, Gender
		ORDER BY JobTitle;
