


TRUNCATE TABLE  dbo.FinalBalanceForms 

TRUNCATE TABLE  dbo.FinalbalanceGroup 

TRUNCATE TABLE  dbo.[FinalMenuSittings] 



GO
SET IDENTITY_INSERT [dbo].[FinalbalanceGroup] ON 

GO
INSERT [dbo].[FinalbalanceGroup] ([GroupId], [GroupName]) VALUES (1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalbalanceGroup] ([GroupId], [GroupName]) VALUES (2, N'شركة مقاولات')
GO
INSERT [dbo].[FinalbalanceGroup] ([GroupId], [GroupName]) VALUES (3, N'شركة مساهمة')
 
SET IDENTITY_INSERT [dbo].[FinalbalanceGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[FinalMenuSittings] ON 

GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (1, 1, N'موجودات متداولة', N'موجودات متداولة', 1, 1, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (2, 1, N'النقدية بالصندوق ولدى البنوك', N'النقدية بالصندوق ولدى البنوك', 2, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (3, 1, N'مدينون تجاريون', N'مدينون تجاريون', 3, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (4, 1, N'مدينون متنوعون', N'مدينون متنوعون', 4, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (5, 1, N'مدينون اطراف ذات علقة', N'مدينون اطراف ذات علقة', 5, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (6, 1, N'مخزون', N'مخزون', 6, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (7, 1, N'اجمالى موجودات متداولة', N'اجمالى موجودات متداولة', 7, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (8, 1, N'موجودات ثابتة', N'موجودات ثابتة', 8, 1, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (9, 1, N'اجمالى موجودات ثابتة', N'اجمالى موجودات ثابتة', 9, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (10, 1, N'الموجودات الثابتة بالصافى', N'الموجودات الثابتة بالصافى', 10, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (11, 1, N'مجموع الموجودات', N'مجموع الموجودات', 11, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (12, 1, N'المطلوبات وحقوق الشركاء', N'المطلوبات وحقوق الشركاء', 12, 1, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (13, 1, N'مطلوبات متداولة', N'مطلوبات متداولة', 13, 1, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (14, 1, N'مطلوبات للبنوك', N'مطلوبات للبنوك', 14, 1, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (15, 1, N'دائنون وأرصدة دائنة', N'دائنون وأرصدة دائنة', 15, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (16, 1, N'مخصص الزكاة الشرعية', N'مخصص الزكاة الشرعية', 16, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (17, 1, N'مخصصات', N'مخصصات', 17, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (18, 1, N'مجمع الهلك السنوى', N'مجمع الهلك السنوى', 18, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (19, 1, N'مجموع مطلوبات متداولة', N'مجموع مطلوبات متداولة', 19, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (20, 1, N'مخصص ترك الخدمة', N'مخصص ترك الخدمة', 20, 1, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (21, 1, N'مجموع المطلوبات', N'مجموع المطلوبات', 21, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (22, 1, N'ارباح أو خسائر العام قبل التوزريع', N'ارباح أو خسائر العام قبل التوزريع', 22, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (23, 1, N'حقوق الشركاء', N'حقوق الشركاء', 23, 1, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (24, 1, N'رأس المال', N'رأس المال', 24, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (25, 1, N'احتياطى نظامى', N'احتياطى نظامى', 25, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (26, 1, N'أرباح مبقاة', N'أرباح مبقاة', 26, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (27, 1, N'دعم مالى واضافى من الشركاء', N'دعم مالى واضافى من الشركاء', 27, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (28, 1, N'مجموع حقوق الشركاء', N'مجموع حقوق الشركاء', 28, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (29, 1, N'مجموع المطلوبات وحقوق الشركاء', N'مجموع المطلوبات وحقوق الشركاء', 29, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (30, 2, N'الايرادات', N'الايرادات', 1, 1, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (31, 2, N'تكلفة الايرادات', N'تكلفة الايرادات', 2, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (32, 2, N'مجمل الدخل', N'مجمل الدخل', 3, 1, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (33, 2, N'المصروفات والأعباء', N'المصروفات والأعباء', 4, 1, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (34, 2, N'مصروفات عمومية وادارية', N'مصروفات عمومية وادارية', 5, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (35, 2, N'مخصص مكافاة ترك الخدمة', N'مخصص مكافاة ترك الخدمة', 6, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (36, 2, N'استهلاك موجودات ثابتة', N'استهلاك موجودات ثابتة', 7, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (37, 2, N'مجموع المصروفات والاعباء', N'مجموع المصروفات والاعباء', 8, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (38, 2, N'دخل النشاط', N'دخل النشاط', 9, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (39, 2, N'ايرادات مصروفات اخري', N'ايرادات مصروفات اخري', 10, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (40, 2, N'ايرادت متنوعه', N'ايرادت متنوعه', 11, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (41, 2, N'مصروفات تمويلة وخدمات بنكية', N'مصروفات تمويلة وخدمات بنكية', 12, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (42, 2, N'صافى دخل الفترة قبل الزكاة الشرعية', N'صافى دخل الفترة قبل الزكاة الشرعية', 13, 1, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (43, 2, N'مخصص زكاة شرعية', N'مخصص زكاة شرعية', 14, 0, 1, N'شركة اعاشة')
GO
INSERT [dbo].[FinalMenuSittings] ([ID], [FainalMenuID], [Name_Ar], [Name_En], [SortID], [isTitle], [GroupId], [GroupName]) VALUES (44, 2, N'صافى دخل الفترة / السنة', N'صافى دخل الفترة / السنة', 15, 1, 1, N'شركة اعاشة')
GO
SET IDENTITY_INSERT [dbo].[FinalMenuSittings] OFF
GO
