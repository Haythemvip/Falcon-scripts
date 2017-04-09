 
 
 
ALTER PROC [dbo].[_SalaryShit_Update]
    @code BIGINT ,
    @month INT ,
    @year INT ,
    @gaza NUMERIC ,
    @ins NUMERIC ,
    @totalkh NUMERIC ,
    @safy NUMERIC ,
    @Salary NUMERIC ,
    @ed_agaza NUMERIC ,
    @solfa_cut NUMERIC ,
    @daygazaa NUMERIC ,
    @nafaa NUMERIC ,
    @other_add NUMERIC ,
    @Day NUMERIC ,
    @Tel NUMERIC ,
    @moneytakher NUMERIC ,
    @moneygyab NUMERIC ,
    @Take_Percent NUMERIC,
	@Notes NVARCHAR(max)
AS
    UPDATE  [dbo].[SalaryReport]
    SET     [gaza] = @gaza ,
            [ins] = @ins ,
            [totalkh] = @totalkh ,
            [safy] = @safy ,
            [solfa_cut] = @solfa_cut ,
            [Salary] = @Salary ,
            [ed_agaza] = @ed_agaza ,
            [daygazaa] = @daygazaa ,
            [nafaa] = @nafaa ,
            [other_add] = @other_add ,
            [Day] = @Day ,
            [Tel] = @Tel ,
            [moneytakher] = @moneytakher ,
            [moneygyab] = @moneygyab ,
            [Take_Percent] = @Take_Percent,
			[Notes]= @Notes
    WHERE   code = @code
            AND month = @month
            AND year = @year 


