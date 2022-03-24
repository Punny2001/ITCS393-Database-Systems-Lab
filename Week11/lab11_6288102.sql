-- Create a DataStore Table
CREATE TABLE DataStore (
Run INT IDENTITY(1,1) NOT NULL,
KeyID INT NOT NULL,
AccountDesc NVARCHAR(50),
AccountType NVARCHAR(50),
CodeAltKey INT
);

-- Create a DataStore_IDX Table
CREATE TABLE DataStore_IDX (
Run INT IDENTITY(1,1) NOT NULL,
KeyID INT NOT NULL,
AccountDesc NVARCHAR(50),
AccountType NVARCHAR(50),
CodeAltKey INT
);

-- Generate data and insert into the DataStore and DataStore_IDX table
DECLARE @loop INT;
DECLARE @keyID INT, @Description NVARCHAR(50), @Type NVARCHAR(50), @CodeAltKey INT;
SELECT @loop = 0
BEGIN TRAN
WHILE (@loop < 2700000)
BEGIN
-- set value to column --
SELECT @KeyID = CAST(RAND()*10000000 as int);
SELECT @Description = 'accountdesc' + CONVERT(varchar(20), @KeyID);
SELECT @Type = 'AccountType' + CONVERT(varchar(20), @KeyID);
SELECT @CodeAltKey = CAST(RAND()*10000000 as int);
-- insert column into tables
INSERT INTO [DataStore] VALUES (@KeyID, @Description, @Type, @CodeAltKey);
INSERT INTO [DataStore_IDX] VALUES (@KeyID, @Description, @Type, @CodeAltKey);
-- increment loop
SELECT @loop = @loop + 1;
END
COMMIT-- Lab ---- Create small data keyselect KeyID into SmallDataKey
from DataStore_IDX
where KeyID < 500;-- Create large data keyselect KeyID into LargeDataKey
from DataStore_IDX
where KeyID > 500000;

-- Q1
select * from DataStore
where KeyID > 5000000;

-- Q2
select KeyID, AccountDesc, AccountType from DataStore
where KeyID > 5000000;

-- Q3
select sd.KeyID, ds.AccountDesc 
from DataStore ds
inner join SmallDataKey sd on ds.KeyID = sd.KeyID;

-- Q4
select ld.KeyID, ds.AccountDesc 
from DataStore ds
inner join LargeDataKey ld on ds.KeyID = ld.KeyID;

-- Q5
select ld.KeyID, ds.AccountDesc 
from DataStore_IDX ds
left join LargeDataKey ld on ds.KeyID = ld.KeyID;

-- Q6
select ld.KeyID, ds.AccountDesc 
from DataStore_IDX ds
right join LargeDataKey ld on ds.KeyID = ld.KeyID;