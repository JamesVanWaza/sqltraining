---- Joins --- Use JamesHomeworkWeek2 ---
SELECT * FROM Employee;
SELECT * FROM Department;

/** Only matching values will show up - Department 6, 7, 8 will not show since they don't match */ 
SELECT
	E.EmpID,
	E.EmpName,
	E.DeptID,
	E.LocID,
	E.Title,
	E.Salary,
	E.HireDate,
	D.DeptName,
	D.HQ
	FROM Employee E
	INNER JOIN Department D
	ON E.DeptID = D.DeptID;

--LEFT JOIN --
SELECT
	E.*,
	D.*
	FROM Employee E
	LEFT JOIN Department D
	ON E.DeptID = D.DeptID;

-- RIGHT JOIN --
SELECT
	E.*,
	D.*
	FROM Employee E
	RIGHT JOIN Department D
	ON E.DeptID = D.DeptID;

-- CROSS JOIN (Rarely used because it does not make sense) --
SELECT E.*, D.*
FROM Department D
CROSS JOIN Employee E

SELECT 
	POD.PurchaseOrderID,
	POD.OrderQty,
	POD.UnitPrice,
	POH.[Status],
	POH.ShipMethodID,
	POH.ShipDate,
	POH.SubTotal
	FROM Purchasing.PurchaseOrderDetail POD
	INNER JOIN Purchasing.PurchaseOrderHeader POH
	ON POD.PurchaseOrderID = POH.PurchaseOrderID;
