

ALTER VIEW [dbo].[VEmp]
AS
SELECT dbo.emp.emp_code, dbo.emp.BarCode, dbo.emp.emp_name, dbo.emp.emp_add, dbo.emp.emp_tel, dbo.emp.emp_mob, dbo.emp.emp_mail, dbo.emp.emp_den, dbo.emp.emp_kinde, dbo.emp.emp_state, dbo.emp.emp_pic, 
                  dbo.emp.emp_pirth, dbo.jobs.jname, dbo.departments.depart_name, dbo.emp.emp_jopdate, dbo.emp.emp_tamen_no, dbo.emp.emp_helth_no, dbo.emp.helthfrom, dbo.emp.helthdatestart, dbo.emp.helthdateend, 
                  dbo.emp.helthrayaNO, dbo.emp.helthrayaFrom, dbo.emp.helthrayaDateStart, dbo.emp.helthrayaDateEnd, dbo.emp.emp_learn, dbo.emp.emp_meltary, dbo.emp.emp_idc, dbo.emp.emp_idc_from, dbo.emp.emp_idc_date, 
                  dbo.emp.emp_idc_dateend, dbo.emp.emp_lwork_no, dbo.emp.emp_lworkfrom, dbo.emp.emp_lwork_date, dbo.emp.emp_lwork_enddate, dbo.emp.emp_tamensallery, dbo.emp.emp_sallery, dbo.emp.emp_Take_Home, 
                  dbo.emp.emp_Take_Bus, dbo.emp.emp_Take_Food, dbo.emp.emp_Take_other, dbo.emp.RayaDescount, dbo.emp.anohterDescount, dbo.emp.EmpBoxDescount, dbo.emp.previousJob, dbo.emp.previousJopPlace, 
                  dbo.emp.WhyLivPrviousJop, dbo.emp.dateliv, dbo.emp.hasbendJop, dbo.emp.hasbendphne, dbo.emp.jophasbendplace, dbo.emp.OrignalContry, dbo.emp.VacationAdress, dbo.emp.VacPhone, dbo.emp.RelativeName, 
                  dbo.emp.RelativePhone, dbo.emp.SonCont, dbo.emp.Notes, dbo.emp.ProunchID, dbo.emp.COMP_ID, dbo.emp.flag, dbo.emp.ShiftID, dbo.emp.Planid, dbo.emp.jobid, dbo.emp.depart_id, dbo.Shift.ShiftName, 
                  dbo.workPlan.planName, dbo.CountDayHour.dayhour, dbo.CountDayHour.daymonth, dbo.CountDayHour.dayweek, dbo.CountDayHour.worksystem, dbo.emp.emp_tamensalleryCanged, dbo.emp.HavezEntetzam, 
                  dbo.emp.NationalityID, dbo.Nationality.Nationality, dbo.emp.PassportID, dbo.emp.IqamaID, dbo.emp.Certified, dbo.emp.EmploymentCode, dbo.emp.EmploymentGDS, dbo.emp.SocialTitle, dbo.emp.Zip, dbo.emp.City, 
                  dbo.emp.GalileoSign, dbo.emp.AmadeusSign, dbo.emp.datehalthstart2, dbo.emp.NationalityCity, dbo.emp.datehelthend2, dbo.emp.datehelthrayaStart2, dbo.emp.DateHelthrayaEnd2, dbo.emp.dtbidc2, 
                  dbo.emp.dtbidcend2, dbo.emp.dtblwork2, dbo.emp.dtblworkend2, dbo.emp.CountryID, dbo.emp.Dengers, dbo.emp.date_driver_2, dbo.emp.driver_1, dbo.emp.driver_2, dbo.emp.empState, dbo.emp.Statenotes, 
                  dbo.emp.Mohafzet_Badal, dbo.emp.DateTakharog, dbo.emp.DateMaash, dbo.emp.MawkefTameny, dbo.emp.MokefWazefy, dbo.emp.ShortName, dbo.emp.date_driver1, dbo.emp.driver_from, dbo.emp.driver_no, 
                  dbo.emp.coname, dbo.emp.co_no, dbo.emp.hdodno, dbo.emp.officno, dbo.emp.datein, dbo.Country.CountryName, dbo.emp.SalaryType, dbo.emp.Sec_id, dbo.emp.BankNo, dbo.emp.emp_Sigen, dbo.emp.contract_period, 
                  dbo.emp.YaerlyVacation, dbo.emp.YearlyTiket, dbo.emp.Jop_Eqama, dbo.emp.Last_Month_DayCount, dbo.emp.TamenValue, dbo.emp.VacPrevious, dbo.emp.PastY1, dbo.emp.PastY2, dbo.emp.PastY3, dbo.emp.PastY4, 
                  dbo.emp.PastY5, dbo.emp.CostID, dbo.emp.ShowInSolfa, dbo.emp.ShowInOhda, dbo.Kafeel.KafeelName, dbo.TblCostTree.AccName AS CostName, dbo.emp.SecondName, dbo.emp.ShowIn_Badal_Sakan, 
                  dbo.emp.KafeelID, dbo.emp.Take_Schole, dbo.emp.Take_Percent, dbo.emp.StatusDate
FROM     dbo.emp LEFT OUTER JOIN
                  dbo.TblCostTree ON dbo.emp.CostID = dbo.TblCostTree.AccCode LEFT OUTER JOIN
                  dbo.Kafeel ON dbo.emp.KafeelID = dbo.Kafeel.KafeelID LEFT OUTER JOIN
                  dbo.Country ON dbo.emp.CountryID = dbo.Country.CountryID LEFT OUTER JOIN
                  dbo.Nationality ON dbo.emp.NationalityID = dbo.Nationality.NationalityID LEFT OUTER JOIN
                  dbo.jobs ON dbo.emp.jobid = dbo.jobs.jobid LEFT OUTER JOIN
                  dbo.Shift ON dbo.emp.ShiftID = dbo.Shift.ShiftID LEFT OUTER JOIN
                  dbo.CountDayHour ON dbo.emp.Planid = dbo.CountDayHour.planID LEFT OUTER JOIN
                  dbo.workPlan ON dbo.emp.Planid = dbo.workPlan.Planid LEFT OUTER JOIN
                  dbo.departments ON dbo.emp.depart_id = dbo.departments.depart_id

GO


