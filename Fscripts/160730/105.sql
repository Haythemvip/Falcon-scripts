
UPDATE  customer_account
SET     IsStartedBalance = 0
UPDATE  dbo.venderaccount
SET     IsStartedBalance = 0
UPDATE  dbo.Emp_Account
SET     IsStartedBalance = 0
UPDATE  dbo.Bank_Accounts
SET     IsStartedBalance = 0
UPDATE  dbo.Box_Moves
SET     IsStartedBalance = 0


UPDATE  customer_account
SET     IsStartedBalance = 1
WHERE   actionname = '���� ��� �����'
UPDATE  dbo.venderaccount
SET     IsStartedBalance = 1
WHERE   actionname = '���� ��� �����'
UPDATE  dbo.Emp_Account
SET     IsStartedBalance = 1
WHERE   actionname = '���� ��� �����'
UPDATE  dbo.Bank_Accounts
SET     IsStartedBalance = 1
WHERE   actionname = '���� ��� �����'
UPDATE  dbo.Box_Moves
SET     IsStartedBalance = 1
WHERE   account_name = '������ ���������'

 