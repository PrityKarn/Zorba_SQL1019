---CLEANSING TABLE IN  SQL SERVER
select * from dimcustomer
select customerkey,firstname,yearlyincome,datefirstpurchase from dimcustomer
select * from dimproduct
select productkey,englishproductname,listprice,startdate from dimproduct
-------------
CREATE TABLE ETL_SOURCE
(
EID VARCHAR(300),
E_FNAME VARCHAR(300),
E_LNAME VARCHAR(300),
E_HIREDATE VARCHAR(300),
E_BASERATE VARCHAR(300)
)
----------
insert into ETL_SOURCE
select employeekey,firstname,lastname,hiredate,BaseRATE FROM [AdventureWorksDW2019].dbo.[DimEmployee]
----
select * from ETL_SOURCE
UPDATE ETL_SOURCE SET E_HIREDATE=NULL WHERE EID=4
UPDATE ETL_SOURCE SET E_BASERATE= NULL WHERE EID=5
update ETL_SOURCE set E_FNAME = NULL  where EID =8
update ETL_SOURCE set E_LNAME = NULL  where EID =9
update ETL_SOURCE set Eid = NULL  where EID =10
------------------
update ETL_SOURCE set E_HIREDATE = '200708-31'  where EID =14
update ETL_SOURCE set E_BASERATE = '$13.45'  where EID =15
update ETL_SOURCE set E_FNAME = 'Jo@!^&*()'  where EID =18
update ETL_SOURCE set E_LNAME = 'Hartwig+_)(*&^%$#@!~'  where EID =19
update ETL_SOURCE set Eid = 'SQL SERVER'  where EID =20
update ETL_SOURCE set E_BASERATE = '$@ 13.45'  where EID ='15'
SELECT * FROM ETL_SOURCE
update ETL_SOURCE set E_BASERATE = NULL,E_FNAME = NULL,E_LNAME = NULL,Eid = NULL , E_HIREDATE = NULL  where EID ='5'
----------------
SELECT * FROM ETL_SOURCE
SELECT ISNULL(EID,'123') AS EID FROM ETL_SOURCE
SELECT COALESCE(E_LNAME,'SHYAM') AS E_LNAME FROM ETL_SOURCE
SELECT ISNULL(E_HIREDATE,'11/11/2011') AS E_HIREDATE FROM ETL_SOURCE
SELECT ISNULL(E_BASERATE,'150') AS E_HIREDATE FROM ETL_SOURCE
--------------------------------
SELECT ISNULL(EID,'123') AS EID ,
 COALESCE(E_LNAME,'SHYAM') AS E_LNAME ,
 ISNULL(E_HIREDATE,'11/11/2011') AS E_HIREDATE ,
 ISNULL(E_BASERATE,'150') AS E_BASERATE FROM ETL_SOURCE
 ------------------------------


 SELECT *,
 REPLACE (REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(E_FNAME,'@',''),'!',''),'^',''),'&',''),'*',''),'(',''),')',''),
 CASE 
WHEN ISNUMERIC(EID)= 0 OR EID IS NULL THEN 'INVALID EID RECORD'ELSE
CASE
--WHEN  (CONVERT( VARCHAR(50),E_LNAME,'' ))=0 OR E_LNAME IS NULL THEN 'INVALID ELANME RECORD' ELSE

WHEN ISDATE(E_HIREDATE)=0 OR E_HIREDATE IS NULL THEN 'INVALID EHIREDATE RECORD' ELSE
CASE
WHEN ISNUMERIC(E_BASERATE)=0 OR E_BASERATE IS NULL THEN 'INVALID E_BASERATE RECORD 'ELSE ''
END 
END
END
FROM ETL_SOURCE
-----------------
--concatinated together
SELECT *,  
		CONCAT (COALESCE(EID,'EID is invalid'), ', ', 
		COALESCE(E_FNAME,', E FNAME is invalid'), ', ', 
		COALESCE(E_LNAME,', E LNAME is invalid'), ', ', 
		COALESCE(E_HIREDATE,', E_HIREDATE is invalid'), ', ', 
		COALESCE(E_BASERATE,', E_BASERATE is invalid'))
AS error_messages FROM ETL_SOURCE
------Display invalid values 
--when there is NULL in any field otherwise display blank----

SELECT *,  
		CASE WHEN EID IS NULL OR E_FNAME IS NULL OR E_LNAME IS NULL OR E_HIREDATE IS NULL OR E_BASERATE IS NULL THEN
		CONCAT (COALESCE(EID,'EID is invalid'), ', ', 
		COALESCE(E_FNAME,', E FNAME is invalid'), ', ', 
		COALESCE(E_LNAME,', E LNAME is invalid'), ', ', 
		COALESCE(E_HIREDATE,', E_HIREDATE is invalid'), ', ', 
		COALESCE(E_BASERATE,', E_BASERATE is invalid') )
		ELSE ''
		END
AS error_messages FROM ETL_SOURCE
------------------
-------------------------------




