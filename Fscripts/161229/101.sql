 
 
ALTER PROCEDURE [dbo].[Projects_Analasys] @project_Code BIGINT
AS
    BEGIN


        CREATE TABLE #Result
            (
              GroupName NVARCHAR(MAX) ,
              FirstBudjet FLOAT ,
              Budjet FLOAT ,
              Percenteg FLOAT ,
              Monsaref FLOAT ,
              Monsaref_Percent FLOAT ,
              Still FLOAT ,
              Still_Pecnt FLOAT ,
              Diffrent_Pecnt FLOAT ,
              supGroupID INT,
			  ProjectName NVARCHAR(MAX) ,
			  ProjectID BIGINT 
            );



        INSERT  INTO #Result
                ( GroupName ,
                  FirstBudjet ,
                  Budjet ,
                  Percenteg ,
                  Monsaref ,
                  Monsaref_Percent ,
                  Still ,
                  Still_Pecnt ,
                  Diffrent_Pecnt ,
                  supGroupID,
				   ProjectName   ,
			       ProjectID   
			    )
                SELECT  subname , -- GroupName - nvarchar(max)
                        0.0 , -- FirstBudjet - float
                        Budget , -- Budjet - float
                        0.0 , -- Percenteg - float
                        0.0 , -- Monsaref - float
                        0.0 , -- Monsaref_Percent - float
                        0.0 , -- Still - float
                        0.0 , -- Still_Pecnt - float
                        0.0 ,-- Diffrent_Pecnt - float
                        SupID,
						TheName, ID
                FROM    dbo.CostItemsBudget
                        INNER JOIN dbo.Groups_Sub ON Groups_Sub.subid = CostItemsBudget.SupID
						INNER JOIN dbo.Tenders_Add ON Tenders_Add.ID = CostItemsBudget.CostID
                WHERE   (@project_Code = 0 OR CostID = @project_Code) 



        UPDATE  #Result
        SET     FirstBudjet = ( SELECT TOP 1
                                        Budget
                                FROM    CostItemsBudget_History
                                WHERE   CostID = ProjectID
                              );


        DECLARE @total FLOAT; 

        SET @total = ( SELECT   SUM(Budjet)
                       FROM     #Result
                     ); 


        UPDATE  #Result
        SET     Percenteg = ROUND(100 * Budjet / @total, 4); 




        UPDATE  #Result
        SET     Monsaref = ( SELECT SUM(Amr_Sheraa_Item.total)
                             FROM   dbo.Amr_Sheraa_Item
                                    INNER JOIN dbo.Amr_Sheraa ON Amr_Sheraa.performa_id = Amr_Sheraa_Item.performa_id
                                    INNER JOIN dbo.Items ON Items.Item_Id = Amr_Sheraa_Item.ItemCode
                                    INNER JOIN dbo.Groups_Sub ON dbo.Items.Item_Gro_Sub_Id = Groups_Sub.subid
                             WHERE  ProjectID = ProjectID
                                    AND Groups_Sub.subid = supGroupID
                           ); 



  UPDATE  #Result
        SET     Monsaref_Percent = ROUND(100 * Monsaref / Budjet, 4); 


		 



		 UPDATE  #Result
        SET     Still = ROUND( Budjet -Monsaref , 4); 


		 UPDATE  #Result

        SET     Still_Pecnt = ROUND(100 * Still / Budjet, 4); 



		 UPDATE  #Result

		 SET     Diffrent_Pecnt = CASE WHEN (ROUND(Monsaref / Budjet , 4))< 1 THEN  (0) ELSE (ROUND(Monsaref / Budjet , 4)) END ; 




        SELECT  *
        FROM    #Result; 
    END;
