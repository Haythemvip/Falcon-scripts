

 

UPDATE dbo.emp SET StatusCaseID = 1 WHERE empState = '����� �� �����'
UPDATE dbo.emp SET StatusCaseID = 2 WHERE empState = '���� �����'
UPDATE dbo.emp SET StatusCaseID = 3 WHERE empState = '��� �����'
UPDATE dbo.emp SET StatusCaseID = 4 WHERE empState = '������ ���� �����'
UPDATE dbo.emp SET StatusCaseID = 5 WHERE empState = '����'
UPDATE dbo.emp SET StatusCaseID = 6 WHERE empState = '�����'
UPDATE dbo.emp SET StatusCaseID = 7 WHERE flag = 0 AND StatusCaseID NOT IN (1,2,3,4,5,6)
