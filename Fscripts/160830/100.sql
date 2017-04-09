
CREATE  PROCEDURE _set_Mezanya_Dakhl
AS
    BEGIN

        DELETE  FROM Mezanya


        INSERT  INTO dbo.Mezanya
                ( MezanyaID ,
                  Mezanya_Name ,
                  flag ,
                  Mezanya_Name_En
                )
        VALUES  ( 1 , -- MezanyaID - int
                  '����� ������ ������' , -- Mezanya_Name - varchar(50)
                  1 , -- flag - bit
                  N'Balance Sheet'  -- Mezanya_Name_En - nvarchar(50)
                )



        INSERT  INTO dbo.Mezanya
                ( MezanyaID ,
                  Mezanya_Name ,
                  flag ,
                  Mezanya_Name_En
                )
        VALUES  ( 2 , -- MezanyaID - int
                  '����� ����� ' , -- Mezanya_Name - varchar(50)
                  1 , -- flag - bit
                  N'Income Statement'  -- Mezanya_Name_En - nvarchar(50)
                )





        DELETE  FROM FinalBalanceTypes


        INSERT  [dbo].[FinalBalanceTypes]
                ( [ClassificationId] ,
                  [ClassificationName]
                )
        VALUES  ( 1 ,
                  N'������'
                )

        INSERT  [dbo].[FinalBalanceTypes]
                ( [ClassificationId] ,
                  [ClassificationName]
                )
        VALUES  ( 2 ,
                  N'������'
                )

        INSERT  [dbo].[FinalBalanceTypes]
                ( [ClassificationId] ,
                  [ClassificationName]
                )
        VALUES  ( 3 ,
                  N'���������'
                )

        INSERT  [dbo].[FinalBalanceTypes]
                ( [ClassificationId] ,
                  [ClassificationName]
                )
        VALUES  ( 4 ,
                  N'���������'
                )





        DELETE  FROM Acc_Type_tree



 
        INSERT  [dbo].[Acc_Type_tree]
                ( [ACC_Type_ID] ,
                  [Type_Name] ,
                  [flag] ,
                  [ClassificationId]
                )
        VALUES  ( 1 ,
                  N'������ ����� �����' ,
                  1 ,
                  1
                )

        INSERT  [dbo].[Acc_Type_tree]
                ( [ACC_Type_ID] ,
                  [Type_Name] ,
                  [flag] ,
                  [ClassificationId]
                )
        VALUES  ( 2 ,
                  N'������ ���������' ,
                  1 ,
                  1
                )

        INSERT  [dbo].[Acc_Type_tree]
                ( [ACC_Type_ID] ,
                  [Type_Name] ,
                  [flag] ,
                  [ClassificationId]
                )
        VALUES  ( 3 ,
                  N'���������� ���������' ,
                  1 ,
                  2
                )

        INSERT  [dbo].[Acc_Type_tree]
                ( [ACC_Type_ID] ,
                  [Type_Name] ,
                  [flag] ,
                  [ClassificationId]
                )
        VALUES  ( 4 ,
                  N'���� �������' ,
                  1 ,
                  2
                )

        INSERT  [dbo].[Acc_Type_tree]
                ( [ACC_Type_ID] ,
                  [Type_Name] ,
                  [flag] ,
                  [ClassificationId]
                )
        VALUES  ( 5 ,
                  N'���������� ����� �����' ,
                  1 ,
                  2
                )

        INSERT  [dbo].[Acc_Type_tree]
                ( [ACC_Type_ID] ,
                  [Type_Name] ,
                  [flag] ,
                  [ClassificationId]
                )
        VALUES  ( 6 ,
                  N'������� ������' ,
                  1 ,
                  3
                )

        INSERT  [dbo].[Acc_Type_tree]
                ( [ACC_Type_ID] ,
                  [Type_Name] ,
                  [flag] ,
                  [ClassificationId]
                )
        VALUES  ( 7 ,
                  N'���� ������� ��������' ,
                  1 ,
                  3
                )

        INSERT  [dbo].[Acc_Type_tree]
                ( [ACC_Type_ID] ,
                  [Type_Name] ,
                  [flag] ,
                  [ClassificationId]
                )
        VALUES  ( 8 ,
                  N'����� ��������' ,
                  1 ,
                  4
                )

        INSERT  [dbo].[Acc_Type_tree]
                ( [ACC_Type_ID] ,
                  [Type_Name] ,
                  [flag] ,
                  [ClassificationId]
                )
        VALUES  ( 9 ,
                  N'���� �� ���� �������' ,
                  1 ,
                  4
                )



        DELETE  FROM [Account_Group]


        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 1 ,
                  1 ,
                  1 ,
                  N'���� ����� �������' ,
                  1
                )

        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 2 ,
                  1 ,
                  1 ,
                  N'��������� �� ����� �����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 3 ,
                  1 ,
                  1 ,
                  N'������� ��� �������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 4 ,
                  1 ,
                  1 ,
                  N'����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 5 ,
                  2 ,
                  1 ,
                  N'������� ����� �����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 6 ,
                  2 ,
                  1 ,
                  N'�����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 7 ,
                  2 ,
                  1 ,
                  N'����� �����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 8 ,
                  2 ,
                  1 ,
                  N'������ ������ ���' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 9 ,
                  2 ,
                  1 ,
                  N'�������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 10 ,
                  3 ,
                  2 ,
                  N'��������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 11 ,
                  3 ,
                  2 ,
                  N'������ ��� ��� �������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 12 ,
                  3 ,
                  2 ,
                  N'���� ����� �����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 13 ,
                  3 ,
                  2 ,
                  N'������� ���� ��� �� ������ ����� �����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 14 ,
                  3 ,
                  2 ,
                  N'����� ����� ���� ������ ���' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 15 ,
                  3 ,
                  2 ,
                  N'��������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 16 ,
                  4 ,
                  2 ,
                  N'��� ����� �������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 17 ,
                  4 ,
                  2 ,
                  N'�����������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 18 ,
                  4 ,
                  2 ,
                  N'����� ������ �����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 20 ,
                  5 ,
                  2 ,
                  N'���� ����� �����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 21 ,
                  5 ,
                  2 ,
                  N'���� �� ����� ����� ������ ������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 22 ,
                  5 ,
                  2 ,
                  N'�������� ����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 23 ,
                  6 ,
                  3 ,
                  N'������ ������ ' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 24 ,
                  6 ,
                  3 ,
                  N'������ ���� 2' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 25 ,
                  6 ,
                  3 ,
                  N'��������� ������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 26 ,
                  8 ,
                  4 ,
                  N'���� ����� ������� ' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 27 ,
                  8 ,
                  4 ,
                  N'���� ����� ����� ��� �������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 28 ,
                  8 ,
                  4 ,
                  N' ���� ���������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 29 ,
                  8 ,
                  4 ,
                  N' ������� ����� ����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 30 ,
                  8 ,
                  4 ,
                  N'������� ������ ������ �������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 31 ,
                  8 ,
                  4 ,
                  N' ����� ������� ���� �����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 32 ,
                  8 ,
                  4 ,
                  N' ������ �����' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 33 ,
                  8 ,
                  4 ,
                  N' ���� ���� ��������� ��������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 34 ,
                  8 ,
                  4 ,
                  N' ������ ������ �������� ' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 35 ,
                  9 ,
                  4 ,
                  N'������ ��������� ��������� (����� ��������) ' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 36 ,
                  9 ,
                  4 ,
                  N'������ ����������� �������� ��������� ����������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 37 ,
                  9 ,
                  4 ,
                  N'�������� ����� ���� �������' ,
                  1
                )
 
        INSERT  [dbo].[Account_Group]
                ( [AccountGroup_ID] ,
                  [ACC_Type_ID] ,
                  [ClassificationId] ,
                  [AccountGroup_Name] ,
                  [flag]
                )
        VALUES  ( 38 ,
                  7 ,
                  3 ,
                  N'������� �������� ���� 1' ,
                  1
                )
 


	
    END
GO
