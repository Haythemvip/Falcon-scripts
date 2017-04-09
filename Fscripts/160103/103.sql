 
CREATE PROCEDURE _CopyOLD
	 
AS
BEGIN
	
	INSERT  INTO dbo.tblAccTree
        ( AccCode ,
          AccName ,
          ParentID ,
          AccType ,
          AccLevel ,
          ISmain ,
          MezanyaID ,
          ACC_Type_ID ,
          LongCode ,
          AccName_En ,
          AccountGroup_ID ,
          ClassificationId ,
          SortID
        )
        SELECT  AccCode ,
                AccName ,
                ParentID ,
                AccType ,
                AccLevel ,
                ISmain ,
                MezanyaID ,
                ACC_Type_ID ,
                LongCode ,
                AccName_En ,
                AccountGroup_ID ,
                ClassificationId ,
                SortID
        FROM    FALCON.dbo.tblAccTree 
 	 
END
GO
