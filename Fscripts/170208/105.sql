

 

UPDATE dbo.emp SET StatusCaseID = 1 WHERE empState = '„ €Ì» ⁄‰ «·⁄„·'
UPDATE dbo.emp SET StatusCaseID = 2 WHERE empState = 'Œ—ÊÃ ‰Â«∆Ï'
UPDATE dbo.emp SET StatusCaseID = 3 WHERE empState = '‰ﬁ· ﬂ›«·…'
UPDATE dbo.emp SET StatusCaseID = 4 WHERE empState = ' «‘Ì—… Œ—ÊÃ Ê⁄ÊœÂ'
UPDATE dbo.emp SET StatusCaseID = 5 WHERE empState = 'Â—Ê»'
UPDATE dbo.emp SET StatusCaseID = 6 WHERE empState = '√Ã«“…'
UPDATE dbo.emp SET StatusCaseID = 7 WHERE flag = 0 AND StatusCaseID NOT IN (1,2,3,4,5,6)
