 
ALTER VIEW [dbo].[VEmp_Comming]
AS
SELECT        TOP (100) PERCENT dbo.Emp_Comming.Emp_Code, dbo.emp.emp_name, dbo.Emp_Comming.emp_datecomming, dbo.Emp_Comming.dayname, dbo.Emp_Comming.Emp_Time_Comming, 
                         dbo.Emp_Comming.Emp_Time_Out, dbo.Emp_Comming.comming, dbo.Emp_Comming.ezn, dbo.Emp_Comming.vacation, dbo.Emp_Comming.out, dbo.Emp_Comming.edafy, dbo.Emp_Comming.maamorya, 
                         dbo.Emp_Comming.svacation, dbo.Emp_Comming.ghyab_bezn, dbo.Emp_Comming.ProunchID, dbo.Emp_Comming.COMP_ID, dbo.Emp_Comming.Emp_Time_Late, dbo.Emp_Comming.Emp_Time_Extra, 
                         dbo.Emp_Comming.ShiftID, dbo.Emp_Comming.Emp_Come_Befor, dbo.Emp_Comming.Emp_Out_Befor, dbo.Emp_Comming.EmpHDiscount, dbo.emp.Planid, dbo.Emp_Comming.MacinComming, 
                         dbo.emp.depart_id, dbo.emp.flag, dbo.Emp_Comming.brakeOut, dbo.Emp_Comming.brakein, dbo.TblCostTree.AccCode, dbo.TblCostTree.AccName, dbo.TblCostTree.ShortCode, dbo.emp.Sec_id, 
                         dbo.Emp_Comming.Extra_HOUR_Rate, dbo.Emp_Comming.Extra_Hours_Values
FROM            dbo.emp INNER JOIN
                         dbo.Emp_Comming ON dbo.emp.emp_code = dbo.Emp_Comming.Emp_Code LEFT OUTER JOIN
                         dbo.TblCostTree ON dbo.Emp_Comming.CostID = dbo.TblCostTree.AccCode
WHERE        (dbo.emp.flag = 1)

GO


