
create PROCEDURE DayleReportAdd
	
	@EmpCode  bigint 
           ,@Action nvarchar(max) 
           ,@Notes  nvarchar(max) 
           ,@ActionDate  date 
           ,@CostID  bigint 
           ,@ProjectID  bigint 
           ,@TimeFrom  char(5) 
           ,@TimeTo  char(5) 
           ,@TotalTime  char(5) 
		   ,@ID bigint 

AS
BEGIN
	

if @ID = 0

begin

	INSERT INTO [dbo].[DaylyReport]
           ([EmpCode]
           ,[Action]
           ,[Notes]
           ,[ActionDate]
           ,[CostID]
           ,[ProjectID]
           ,[TimeFrom]
           ,[TimeTo]
           ,[TotalTime])
     VALUES
           (@EmpCode 
           ,@Action 
           ,@Notes 
           ,@ActionDate 
           ,@CostID 
           ,@ProjectID 
           ,@TimeFrom 
           ,@TimeTo 
           ,@TotalTime )
 end



  if @ID > 0

begin

	Update DaylyReport set
           EmpCode =		   @EmpCode ,
           Action =		   @Action ,
           Notes =		   @Notes ,
           ActionDate =	   @ActionDate,
           CostID =		   @CostID ,
           ProjectID =	   @ProjectID ,
           TimeFrom =	   @TimeFrom ,
           TimeTo =		   @TimeTo ,
           TotalTime = 	   @TotalTime 

		   Where ID = @ID
    
 end


end


GO
