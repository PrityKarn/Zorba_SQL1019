
select * from dimsubcategory
ROW_ID,ORDER_ID,(ORDER_DATE_ ID ,SHIPDATE_ID),SHIP_MODEID,CUSTOMER_ID,
	SEGMENT_ID,ADRESS_ID,SUB_CATEGORY_ID,PRODUCT_ID,SALES,QUANTITY,DISCOUNT,PROFIT
	SELECT * FROM DIMCALENDAR
	select [order date] into factdbpract from orders
	select * from factdbpract
	alter table factdbpract add categoryid int
SELECT ROW_NUMBER() OVER(ORDER BY [Ship Date])AS SHIPDATEID, [Ship Date] INTO DIMSHIPDATE FROM(SELECT DISTINCT[Ship Date] FROM Orders)AS TBL7
select * from dimorderdate
select * from Dimcalendar

	update f set categoryid=dc.id
	from factdbpract as f
	join orders as o
	on f.[order id]=o.[order id]
	join dimcategory as dc
	on dc.category=o.category
	select * from Dimcalendar
	select * from factdbpract
	-----
	select * from factdbpract
	select * from dimproduct
	alter table factdbpract add SHIPMODEID int
	update factdbpract 
	set subcategoryid=dsc.id
	from factdbpract as f
	join orders as o
	on f.[Order ID]=o.[Order ID]
	join dimsubcategory as dsc
	on dsc.[sub-category]=o.[sub-category]
	and f.categoryid=dsc.categoryid
	-------------
	alter table factdbpract add calendarid int
alter table factdbpract add ADDRESSID int
select * from DIMSHIPMODE
select * from factdbpract
------------
UPDATE FACTDBPRACT SET SHIPMODEID=DS.ID
FROM FACTDBPRACT AS F
JOIN ORDERS AS O
ON F.[ORDER ID]=O.[ORDER ID]
JOIN DIMSHIPMODE AS DS
ON DS.[SHIP MODE]=O.[SHIP MODE]
SELECT * FROM DIMADDRESS



UPDATE FACTDBPRACT SET  ADDRESSID=DA.ID

FROM FACTDBPRACT AS F
JOIN ORDERS AS O
ON F.[ORDER ID]= O.[ORDER ID]
JOIN DIMADDRESS AS DA
ON 
 DA.STATE=O.[STATE] --AND DA.COUNTRY]=O.[COUNTRY]

SELECT DISTINCT[PRODUCT ID],[PRODUCT NAME] FROM ORDERSALTER TABLE DIMPRODUCT ADD ID INT IDENTITY




	SELECT * FROM factdbpract
	---------------------
	SELECT A.CATEGORYID,A.CATEGORY,A.SUBCATEGORYID,A.[SUB-CATEGORY],A.SEGMENTID,A.SEGMENT,A.PRODUCTID,A.[PRODUCT NAME],
	A.ORDERDATEID,A.[ORDER DATE],A.SHIPDATEID,A.[SHIP DATE],A.CUSTMERID,A.[CUSTOMER NAME],A.SHIPMODEID,A.[SHIP MODE],
	A.ADDRESSID,A.COUNTRY,A.REGION,
	A.STATE,A.[POSTAL CODE] ,B.SALES,B.PROFIT,B.QUANTITY,B.DISCOUNT
	FROM factdbpract AS A 
	JOIN ORDERS AS B
	ON A.[ORDER ID]=B.[ORDER ID]

	alter table factDBPRACT add [POSTAL CODE] VARCHAR(100)update fset [POSTAL CODE]=o.[POSTAL CODE]from Orders as ojoin FactDBPRACT as fon f.[order Id]=o.[Order ID]
SELECT * FROM FACTDBPRACT
SELECT * FROM DIMADDRESS
ALTER TABLE FACTDBPRACT DROP COLUMN [POSTAL CODE]

SELECT *
FROM DIMSUBCATEGORY 
'Sofa'

-- Merge 
--it is use for performing UPSERT 
--Update + INSERT 
--update existing records & insert new records
-- Step1 
--1. Find the target that values are going to update or insert 
--2. find the source that value are going copy 
--3. when matched the UPDATE 
--4. when no matched then insert 



MERGE DIMSUBCATEGORY AS [Target]
USING (SELECT DISTINCT [sub-category] FROM orders) AS [Source] 
    ON [Target].[Sub-Category] = [Source].[Sub-Category] 
	--- specifies the condition
WHEN MATCHED THEN
  UPDATE SET [Target].[Sub-Category]=[Source].[Sub-Category]  --UPDATE STATEMENT
WHEN NOT MATCHED THEN
  INSERT (categoryID, [Sub-Category])
  VALUES SELECT 1,[Sub-Category] FROM SOURCE; --INSERT STATEMENT



  price master 
  A 1 jan 2022 - 31 jan 2022 12
  A 1 feb 2022 - 29 fab 2022 13
  A  1 mar 2022 -     14

  update P SET endDate=GETDATE() from DimPrice  AS P 
  JOIN Orders
   AS o
   ON p.product=o.product AND p.endDate IS NULL
   INSERT INTO DIMPRICE (PRODUCT_NAME,STARTDATE)VALUES('IPHONE','10/21/22')

   ---------------TEMPORAL TABLE IS SYSTEM VERSON TABLE UNDERNEATH OF TEMPORAL TABLE WE HAVE HISTORY TABLE
   CREATE TABLE DBO.PRICELIST(
PRODUCT_ID INT NOT NULL PRIMARY KEY CLUSTERED,
LISTPRICE MONEY NOT NULL,
ROWSTART DATETIME2(7) GENERATED ALWAYS AS ROW START,
ROWEND DATETIME2(7) GENERATED ALWAYS AS ROW END,
PERIOD FOR SYSTEM_TIME(ROWSTART,ROWEND)
)WITH (SYSTEM_VERSIONING=ON(HISTORY_TABLE=DBO.PRICELIST_HISTORY))




