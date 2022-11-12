---DROP table Items

CREATE TABLE Items
(ItemID int identity(100,1) not null,
ItemName varchar(50) null,
ItemType varchar(50) not null,
Cost money null,
Price money null,
WeeklySales int null,
MonthlySales int null,
YearlySales int null);

TRUNCATE Table Items

Select * from Items
order by ItemID

INSERT INTO [dbo].[Items]

  SELECT 'Motorola', 'Mobile', 1000 , 1500 , 5000 , 100000 , 100000
  Union All
  SELECT 'Box', 'Steel', 10 , 20 , 200 , 400 , 5000
  Union All
  SELECT 'Dell', 'Laptop', 1500 , 3000 , 50000 , 200000 , 1000000
  Union All
  SELECT 'Calvin Klein', 'Wallet', 15 , 30 , 7000 , 2000 , 5000
  Union All
  SELECT 'Fossil', 'Watch', 50 , 150 , 2000 , 5000 , 10000
  Union All
  SELECT 'Sony', 'Earphones', 40 , 100 , 1000 , 7000 , 15000
  Union All
  SELECT 'Dell', 'Mouse', 20 , 60 , 1000 , 5000 , 14000
  Union All
  SELECT 'Apple', 'Charger', 30 , 50 , 1200 , 4000 , 30000
  Union All
  SELECT 'Aldo', 'Footwear', 35 , 75 , 1200 , 6200 , 23000
  Union All
  SELECT 'Hollister', 'CasualShirt', 40 , 100 , 1500 , 3000 , 45000
  Union All
  SELECT 'Global', 'Fan', 20 , 50 , 150 , 5000 , 30000
  Union All
  SELECT 'Samsung', 'TV', 500 , 1700 , 5000 , 15000 , 754200
  Union All
  SELECT 'Body Shop', 'Perfumes', 5 , 12 , 1200 , 5200 , 23000
  Union All
  SELECT 'Under Armour', 'Shoes', 50 , 170 , 3000 , 25000 , 250000
  Union All
  SELECT 'HP', 'Printer', 250 , 650 , 7000 , 35000 , 850000
  Union All
 
  SELECT 'Motorola', 'Mobile', 1000 , 1500 , 5000 , 100000 , 100000
  Union All
  SELECT 'Box', 'Steel', 10 , 20 , 200 , 400 , 5000
  Union All
  SELECT 'Dell', 'Laptop', 1500 , 3000 , 50000 , 200000 , 1000000
  Union All
  SELECT 'Calvin Klein', 'Wallet', 15 , 30 , 7000 , 2000 , 5000
  Union All
  SELECT 'Fossil', 'Watch', 50 , 150 , 2000 , 5000 , 10000
  Union All
  SELECT 'Sony', 'Earphones', 40 , 100 , 1000 , 7000 , 15000
  Union All
  SELECT 'Dell', 'Mouse', 20 , 60 , 1000 , 5000 , 14000
  Union All
  SELECT 'Apple', 'Charger', 30 , 50 , 1200 , 4000 , 30000
  Union All
  SELECT 'Aldo', 'Footwear', 35 , 75 , 1200 , 6200 , 23000
  Union All
  SELECT 'Hollister', 'CasualShirt', 40 , 100 , 1500 , 3000 , 45000
  Union All
  SELECT 'Global', 'Fan', 20 , 50 , 150 , 5000 , 30000
  Union All
  SELECT 'Samsung', 'TV', 500 , 1700 , 5000 , 15000 , 754200
  Union All
  SELECT 'Body Shop', 'Perfumes', 5 , 12 , 1200 , 5200 , 23000
  Union All
  SELECT 'Under Armour', 'Shoes', 50 , 170 , 3000 , 25000 , 250000
  Union All
  SELECT 'HP', 'Printer', 250 , 650 , 7000 , 35000 , 850000


  Select * from Items

  ---Update price for Dell to 80.00, for Mouse

  Select Price, ItemName, *
  from Items
  where ItemName = 'Dell'
  and Itemtype = 'Mouse'

  Update Items
  set Price = 80.00
   where ItemName = 'Dell'
  and Itemtype = 'Mouse'


  ---Retrieve Products whose Yearsales > 75000

  Select *
  from Items
  where YearlySales > 75000


  ---- Retriece total yearlysales for HP products

  Select Sum(YearlySales) as TotalHPSales, ItemName
  from Items
  ---where ItemName = 'HP'
  group by ItemName

  --- Top 5 highest yearlysales by Itemtype

    Select top 5 Sum(YearlySales) as TotalHPSales, ItemName
  from Items
  ---where ItemName = 'HP'
  group by ItemName
  order by Sum(YearlySales)  desc

  --- Bottom 5 in total yearlysales by ItemType

  Select top 5 SUM(Yearlysales) as TotalYearsales , ItemName
  from Items
  group by ItemName
  order by SUM(Yearlysales)

  select * from Items


  ----Retrieve ItemName,  AvgMonthlysales , TotalWeeklySales,
  ----TotalYearlysales
  ---- AvgMonthlysales between 10000, 20000
  ---- TotalWeeklySales between 5000, 25000
  ---- TotalYearlysales between

  select ItemName, Avg(MonthlySales) as AvgMothlySales,
            Sum(WeeklySales) as TotalWeeklySales,
            SUM(YearlySales) as TotalYearlySales
  from Items
  group by ItemName
  having Avg(MonthlySales) between 10000 and 20000
    OR Sum(WeeklySales) between 5000 and 25000
    OR SUM(YearlySales) between 10000 and 25000
