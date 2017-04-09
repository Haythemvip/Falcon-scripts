 

-- Create the data type
CREATE TYPE  System_Menu_Users_Type  AS TABLE 
(
MenuID BIGINT NULL,
SSave BIT NULL,
SEdit BIT NULL,
SDelte BIT NULL,
SPrint BIT NULL,
SView BIT NULL
)
GO
