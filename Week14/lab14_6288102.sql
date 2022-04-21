USE PremierProduct;

/*  Q0   */
DROP TABLE IF EXISTS BankAccount;
CREATE TABLE BankAccount (
AccountNum INT NOT NULL PRIMARY KEY,
CustomerNum INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerNum), AccountBalance MONEY
)

INSERT INTO Customer (CustomerNum, CustomerName) VALUES 
(997, 'Krissanapong Palakham'),
(998, 'Krittitee Nildam'),
(999, 'Pongsakorn');

SELECT * FROM Customer;

/*  Q1  */
BEGIN TRY
    BEGIN TRANSACTION AddAccounts
        INSERT INTO BankAccount VALUES 
        (117, 997, 1000),
        (118, 998, 2000),
        (119, 999, 500);

    SELECT @@TRANCOUNT AmountTransaction;

    COMMIT
    PRINT 'Successfully inserted data'
END TRY

BEGIN CATCH
    PRINT 'Failed to insert data'
    ROLLBACK
END CATCH

SELECT * FROM BankAccount
Go;


/*  Q2  */
BEGIN TRY
    BEGIN TRANSACTION TransferMoney

        DECLARE @from INT = 117
        DECLARE @to INT = 118
        DECLARE @amount MONEY = 550

        ALTER TABLE BankAccount ADD CONSTRAINT chk_money CHECK (AccountBalance >= 0)
        
        UPDATE BankAccount SET
        AccountBalance = AccountBalance - @amount WHERE AccountNum = @from 
        UPDATE BankAccount SET
        AccountBalance = AccountBalance + @amount WHERE AccountNum = @to

        COMMIT
        PRINT 'SUCCESSFULLY TRANSFERRED'
END TRY

BEGIN CATCH
    PRINT 'INSUFFICIENT BALANCED'
    ROLLBACK TRANSACTION
END CATCH


SELECT * FROM BankAccount
Go;