

 --PO Report
 
INSERT [dbo].[ReportDesign] ([ID], [DesignName], [Printer], [PageHeight], [PageWidth], [TopMarign], [BottomMargin], [RightMargin], [LeftMargin], [ReportXML], [IsRoll], [TAGID]) VALUES ((SELECT MAX(id)FROM dbo.ReportDesign )+1, N'«„— ‘—«¡ —ﬁ„ 1', N'', CAST(2794.00 AS Decimal(18, 2)), CAST(2159.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(56.00 AS Decimal(18, 2)), CAST(56.00 AS Decimal(18, 2)), CAST(61.00 AS Decimal(18, 2)), N'/// <XRTypeInfo>
///   <AssemblyFullName>falcon, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null</AssemblyFullName>
///   <AssemblyLocation>C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\falcon.exe</AssemblyLocation>
///   <TypeName>valley.XtraReportForm</TypeName>
///   <Localization>ar</Localization>
///   <Version>16.2</Version>
///   <References>
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\falcon.exe" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System\v4.0_4.0.0.0__b77a5c561934e089\System.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Configuration\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Configuration.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Xml\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Data.SqlXml\v4.0_4.0.0.0__b77a5c561934e089\System.Data.SqlXml.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Security\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Security.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Core\v4.0_4.0.0.0__b77a5c561934e089\System.Core.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Numerics\v4.0_4.0.0.0__b77a5c561934e089\System.Numerics.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\Microsoft.VisualBasic\v4.0_10.0.0.0__b03f5f7f11d50a3a\Microsoft.VisualBasic.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Windows.Forms\v4.0_4.0.0.0__b77a5c561934e089\System.Windows.Forms.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Drawing\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Drawing.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\Accessibility\v4.0_4.0.0.0__b03f5f7f11d50a3a\Accessibility.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Deployment\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Deployment.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Serialization.Formatters.Soap\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Runtime.Serialization.Formatters.Soap.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Management\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Management.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Configuration.Install\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Configuration.Install.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Serialization\v4.0_4.0.0.0__b77a5c561934e089\System.Runtime.Serialization.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.ServiceModel.Internals\v4.0_4.0.0.0__31bf3856ad364e35\System.ServiceModel.Internals.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\SMDiagnostics\v4.0_4.0.0.0__b77a5c561934e089\SMDiagnostics.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\Microsoft.JScript\v4.0_10.0.0.0__b03f5f7f11d50a3a\Microsoft.JScript.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Xml.Linq\v4.0_4.0.0.0__b77a5c561934e089\System.Xml.Linq.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Remoting\v4.0_4.0.0.0__b77a5c561934e089\System.Runtime.Remoting.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_32\System.Web\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_32\System.Data\v4.0_4.0.0.0__b77a5c561934e089\System.Data.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_32\System.Transactions\v4.0_4.0.0.0__b77a5c561934e089\System.Transactions.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_32\System.EnterpriseServices\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.EnterpriseServices.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.DirectoryServices\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.DirectoryServices.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Runtime.Caching\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Runtime.Caching.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Web.RegularExpressions\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.RegularExpressions.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Design\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Design.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_32\System.Data.OracleClient\v4.0_4.0.0.0__b77a5c561934e089\System.Data.OracleClient.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Drawing.Design\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Drawing.Design.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Web.ApplicationServices\v4.0_4.0.0.0__31bf3856ad364e35\System.Web.ApplicationServices.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.ComponentModel.DataAnnotations\v4.0_4.0.0.0__31bf3856ad364e35\System.ComponentModel.DataAnnotations.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.DirectoryServices.Protocols\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.DirectoryServices.Protocols.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.ServiceProcess\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.ServiceProcess.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Web.Services\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Web.Services.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\Microsoft.Build.Utilities.v4.0\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.Build.Utilities.v4.0.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\Microsoft.Build.Framework\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.Build.Framework.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Xaml\v4.0_4.0.0.0__b77a5c561934e089\System.Xaml.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\Microsoft.Build.Tasks.v4.0\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.Build.Tasks.v4.0.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.Shared\13.0.2000.0__692fbea5521e1304\CrystalDecisions.Shared.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_32\log4net\1.2.10.0__692fbea5521e1304\log4net.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.Controllers\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.Controllers.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.ReportDefModel\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.ReportDefModel.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC\stdole\7.0.3300.0__b03f5f7f11d50a3a\stdole.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.DataDefModel\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.DataDefModel.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.CommonObjectModel\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.CommonObjectModel.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.CubeDefModel\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.CubeDefModel.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.CommLayer\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.CommLayer.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraGrid.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.Utils.v16.2.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_32\PresentationCore\v4.0_4.0.0.0__31bf3856ad364e35\PresentationCore.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\WindowsBase\v4.0_4.0.0.0__31bf3856ad364e35\WindowsBase.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\UIAutomationTypes\v4.0_4.0.0.0__31bf3856ad364e35\UIAutomationTypes.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Windows.Input.Manipulations\v4.0_4.0.0.0__b77a5c561934e089\System.Windows.Input.Manipulations.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\UIAutomationProvider\v4.0_4.0.0.0__31bf3856ad364e35\UIAutomationProvider.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\UIAutomationClient\v4.0_4.0.0.0__31bf3856ad364e35\UIAutomationClient.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraEditors.v16.2.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Data.Linq\v4.0_4.0.0.0__b77a5c561934e089\System.Data.Linq.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraPrinting.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraBars.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraTreeList.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraLayout.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\FalconDate.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\HijriDate.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.CrystalReports.Engine\13.0.2000.0__692fbea5521e1304\CrystalDecisions.CrystalReports.Engine.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.ClientDoc\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.ClientDoc.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.CommonControls\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.CommonControls.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.DataSetConversion\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.DataSetConversion.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.XmlSerialize\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.XmlSerialize.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.ObjectFactory\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.ObjectFactory.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportAppServer.Prompting\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportAppServer.Prompting.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC\Microsoft.mshtml\7.0.3300.0__b03f5f7f11d50a3a\Microsoft.mshtml.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraReports.v16.2.Extensions.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.Utils.v16.2.UI.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraRichEdit.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.Pdf.v16.2.Core.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraVerticalGrid.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.DataAccess.v16.2.UI.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.Diagram.v16.2.Core.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraDiagram.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.CodeParser.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraCharts.v16.2.Extensions.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraCharts.v16.2.Wizard.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraNavBar.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraPivotGrid.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\Falcon_Class_BLL.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\Falcon_Class_DAL.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\EntityFramework.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\Microsoft.CSharp\v4.0_4.0.0.0__b03f5f7f11d50a3a\Microsoft.CSharp.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Dynamic\v4.0_4.0.0.0__b03f5f7f11d50a3a\System.Dynamic.dll" />
///     <Reference Path="C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\System.Data.DataSetExtensions\v4.0_4.0.0.0__b77a5c561934e089\System.Data.DataSetExtensions.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.ReportSource\13.0.2000.0__692fbea5521e1304\CrystalDecisions.ReportSource.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraRichEdit.v16.2.Extensions.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\FalconReports.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraCharts.v16.2.UI.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraGauges.v16.2.Win.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\CustomerDisplay.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\FalconGrid.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\Microsoft.SqlServer.ConnectionInfo\12.0.0.0__89845dcd8080cc91\Microsoft.SqlServer.ConnectionInfo.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\Microsoft.SqlServer.SqlClrProvider\12.0.0.0__89845dcd8080cc91\Microsoft.SqlServer.SqlClrProvider.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\Microsoft.SqlServer.Smo\12.0.0.0__89845dcd8080cc91\Microsoft.SqlServer.Smo.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\Microsoft.SqlServer.Management.Sdk.Sfc\12.0.0.0__89845dcd8080cc91\Microsoft.SqlServer.Management.Sdk.Sfc.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\Microsoft.SqlServer.SqlEnum\12.0.0.0__89845dcd8080cc91\Microsoft.SqlServer.SqlEnum.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\Microsoft.SqlServer.Dmf\12.0.0.0__89845dcd8080cc91\Microsoft.SqlServer.Dmf.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\Microsoft.SqlServer.Diagnostics.STrace\12.0.0.0__89845dcd8080cc91\Microsoft.SqlServer.Diagnostics.STrace.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\Microsoft.SqlServer.ServiceBrokerEnum\12.0.0.0__89845dcd8080cc91\Microsoft.SqlServer.ServiceBrokerEnum.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\Microsoft.SqlServer.Management.SmoMetadataProvider\12.0.0.0__89845dcd8080cc91\Microsoft.SqlServer.Management.SmoMetadataProvider.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\Microsoft.SqlServer.Management.SqlParser\12.0.0.0__89845dcd8080cc91\Microsoft.SqlServer.Management.SqlParser.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.Dashboard.v16.2.Win.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.Dashboard.v16.2.Core.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.Map.v16.2.Core.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraMap.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraTreeMap.v16.2.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.TreeMap.v16.2.Core.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.XtraGauges.v16.2.Presets.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC_MSIL\CrystalDecisions.Windows.Forms\13.0.2000.0__692fbea5521e1304\CrystalDecisions.Windows.Forms.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC\FlashControlV71\1.0.3187.32366__692fbea5521e1304\FlashControlV71.dll" />
///     <Reference Path="C:\WINDOWS\assembly\GAC\ShockwaveFlashObjects\1.0.0.0__692fbea5521e1304\ShockwaveFlashObjects.dll" />
///     <Reference Path="C:\Program Files (x86)\Falcon Valley\Falcon ERP V16.05\DevExpress.BonusSkins.v16.2.dll" />
///   </References>
///   <Resources>
///     <Resource Name="XtraReportSerialization.XtraReportForm">
/// zsrvvgEAAACRAAAAbFN5c3RlbS5SZXNvdXJjZXMuUmVzb3VyY2VSZWFkZXIsIG1zY29ybGliLCBWZXJzaW9uPTQuMC4wLjAsIEN1bHR1cmU9bmV1dHJhbCwgUHVibGljS2V5VG9rZW49Yjc3YTVjNTYxOTM0ZTA4OSNTeXN0ZW0uUmVzb3VyY2VzLlJ1bnRpbWVSZXNvdXJjZVNldAIAAAADAAAAAAAAAFBBRFBBRFBbWo+wIPPfB0Nv4EqiAAAAAAAAAFEAAADBAQAATHAAaQBjAHQAdQByAGUAQgBvAHgAMQAuAEkAbQBhAGcAZQAmAFMAeQBzAHQAZQBtAC4ARAByAGEAdwBpAG4AZwAuAEkAbQBhAGcAZQAAAAAATHAAaQBjAHQAdQByAGUAQgBvAHgAMgAuAEkAbQBhAGcAZQAmAFMAeQBzAHQAZQBtAC4ARAByAGEAdwBpAG4AZwAuAEkAbQBhAGcAZQArMwAATnMAcQBsAEQA
/// YQB0AGEAUwBvAHUAcgBjAGUAMgAuAFIAZQBzAHUAbAB0AFMAYwBoAGUAbQBhAFMAZQByAGkAYQBsAGkAegBhAGIAbABlAIGMAAAgJjMAAP/Y/+AAEEpGSUYAAQEBAHgAeAAA/+EAyEV4aWYAAE1NACoAAAAIAAMBOwACAAAADwAAADKHaQAEAAAAAQAAAEKcnQABAAAAHgAAAKIAAAAAbW9oYW1lZCBlbGRnd3kAAAAEkAMAAgAAABQAAAB4kAQAAgAAABQAAACMkpEAAgAAAAM5MAAAkpIAAgAAAAM5MAAAAAAAADIwMTc6MDE6MDkgMTA6NDI6MDMAMjAxNzowMTowOSAxMDo0MjowMwAAAG0AbwBoAGEAbQBlAGQAIABlAGwAZABnAHcAeQAAAP/bAEMABwUFBgUEBwYFBggHBwgKEQsKCQkKFQ8QDBEYFRoZGBUYFxseJyEbHSUdFxgiLiIlKCkrLCsaIC8zLyoyJyorKv/bAEMB
/// BwgICgkKFAsLFCocGBwqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKv/AABEIAFUD1AMBIgACEQEDEQH/xAAfAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEBAQEBAAAAAAAAAQIDBAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgU
/// QpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APav+Ff6H6Xn/gW/+NH/AAr/AEP0vP8AwLf/ABrp6KAOY/4V/ofpef8AgW/+NH/Cv9D9Lz/wLf8Axrp6yJPFOjRayNKkvUF4Tt8vB6+melAGf/wr/Q/S8/8AAt/8aP8AhX+h+l5/4Fv/AI109Zqa/psmuSaQlwDfRjLRbTwMZ69KAsZX/Cv9D9Lz/wAC3/xo/wCFf6H6Xn/gW/8AjXT0UAcx/wAK/wBD9Lz/AMC3/wAaP+Ff6H6Xn/gW/wDjWvPrmn22rR6bNOFu5FDLHtPIrQoA5j/hX+h+l5/4Fv8A
/// 40f8K/0P0vP/AALf/Gtay1/TtQ1O50+0uN9zanEqbSNv41Y1HUbXSrGS8v5RDBGPmc9qLjszB/4V/ofpef8AgW/+NH/Cv9D9Lz/wLf8AxrU0bxFpevxs+lXSzhTgjBBH4Grt3dw2NpJc3T7Io13M2OgoCzvY57/hX+h+l5/4Fv8A40f8K/0P0vP/AALf/Gpl8c6A67o7xnX+8sTEfyq3pvijR9WmMNjfRySj+A8N+RpXQcrXQzv+Ff6H6Xn/AIFv/jR/wr/Q/S8/8C3/AMa2L/WrHTLm3gvZvLkuSREu0ndjr0pmreIdM0NYm1O5EAl+5lSc/lTCzZlf8K/0P0vP/At/8aP+Ff6H6Xn/AIFv/jUx8daAq5N24Hr5L4/lWrp2rWOrW4m0+5SdPVT0+opXQcrRif8ACv8AQ/S8/wDAt/8AGj/hX+h+l5/4Fv8A4109UdS1rTtJXOoXccJIyFY/MfoOppi3Mb/hX+h+l5/4Fv8A40f8K/0P
/// 0vP/AALf/GrB8aaOq73kuET++1s4X88Vr2V/a6jbiexnSeM/xIc0rodmjA/4V/ofpef+Bb/40f8ACv8AQ/S8/wDAt/8AGtTUfEelaVII727RJGOBGvzN+Q5qg3jrQ4sGeaaFScbpLd1X8yKLoOVsi/4V/ofpef8AgW/+NH/Cv9D9Lz/wLf8AxroLO9ttQtluLKZJom6OhyDWSnjPQ5Na/soXmLvzPL2FGHzemcYougSb2Kv/AAr/AEP0vP8AwLf/ABo/4V/ofpef+Bb/AONdPWNN4r0iDWl0p7r/AExiFEYQnk++MUwSb2KP/Cv9D9Lz/wAC3/xo/wCFf6H6Xn/gW/8AjV/V/FOk6HdRW+pXBjllGUUIzFvyFV28b6Kh+eWdR6tbOAPxxSuh8rtexB/wr/Q/S8/8C3/xo/4V/ofpef8AgW/+Nbem6vY6xbifTrlJ4/VT0+oqhqPjDQ9K1IWF9erFcEgbdpOM9MntRdCs2U/+Ff6H6Xn/
/// AIFv/jR/wr/Q/S8/8C3/AMa6WORJolkiYMjDKsOhFZWo+KNI0rU4rC/uhDcSgFVKnGCcDnpRdIEm9jP/AOFf6H6Xn/gW/wDjR/wr/Q/S8/8AAt/8a6ZWDKCpyD0IrNtPEGnX2oXNlazF7i1/1qbD8v8AjTCzMv8A4V/ofpef+Bb/AONH/Cv9D9Lz/wAC3/xrT0rxHpms3E0Fhcb5of8AWRshVh+Bq9eXlvYWr3F5KsMKDLOxwBQI57/hX+h+l5/4Fv8A40f8K/0P0vP/AALf/GtjSdZs9atvtGns7xdnKFQfpnrV+gDmP+Ff6H6Xn/gW/wDjR/wr/Q/S8/8AAt/8a6eigDmP+Ff6H6Xn/gW/+NH/AAr/AEP0vP8AwLf/ABrp6KAOY/4V/ofpef8AgW/+NH/Cv9D9Lz/wLf8Axrp6KAOY/wCFf6H6Xn/gW/8AjR/wr/Q/S8/8C3/xrp6KAOY/4V/ofpef+Bb/AONH/Cv9D9Lz/wAC3/xr
/// p6KAOY/4V/ofpef+Bb/40f8ACv8AQ/S8/wDAt/8AGunqOe4htYWmuZFijXq7nAFAHOf8K/0P0vP/AALf/Gj/AIV/ofpef+Bb/wCNU9Y+J+g6cpW2la8lBxiJeB+J4rkpfiT4o1R2Gj2AERb5GSIs2P5VDnFdTRUpPodz/wAK/wBD9Lz/AMC3/wAaP+Ff6H6Xn/gW/wDjXCrqfxHvFIRLhQf+mSL/ADFRGT4kQuJP9KyOnCH9KXtPJlex80d//wAK/wBD9Lz/AMC3/wAaP+Ff6H6Xn/gW/wDjXncnizx7Z/NcLcYHXdbDH8qtab8XdSjmCapaxOgx/q1w1HtI9Q9jLpqd1/wr/Q/S8/8AAt/8aP8AhX+h+l5/4Fv/AI0mi/EHQtZkESXH2eY/8s5ht/XpXUAggEHIPQ1aaexk01ozmP8AhX+h+l5/4Fv/AI0f8K/0P0vP/At/8a6eimI5j/hX+h+l5/4Fv/jR/wAK/wBD9Lz/AMC3/wAa
/// 6eigDmP+Ff6H6Xn/AIFv/jR/wr/Q/S8/8C3/AMa6eigDmP8AhX+h+l5/4Fv/AI0f8K/0P0vP/At/8a6eigDmP+Ff6H6Xn/gW/wDjR/wr/Q/S8/8AAt/8a6eigDmP+Ff6H6Xn/gW/+NH/AAr/AEP0vP8AwLf/ABrp6KAOY/4V/ofpef8AgW/+NH/Cv9D9Lz/wLf8Axrp6KAOY/wCFf6H6Xn/gW/8AjR/wr/Q/S8/8C3/xrp6KAOY/4V/ofpef+Bb/AONH/Cv9D9Lz/wAC3/xrp6KAOY/4V/ofpef+Bb/40f8ACv8AQ/S8/wDAt/8AGumJC9TiloA5j/hX+h+l5/4Fv/jR/wAK/wBD9Lz/AMC3/wAa6ekDKWKggkdR6UAcz/wr/Q/S8/8AAt/8aP8AhX+h+l5/4Fv/AI109FAHMf8ACv8AQ/S8/wDAt/8AGj/hX+h+l5/4Fv8A4109JuG4jPI7UAcz/wAK/wBD9Lz/AMC3/wAaP+Ff6H6X
/// n/gW/wDjXT0dKAOY/wCFf6H6Xn/gW/8AjR/wr/Q/S8/8C3/xrplYOoZSCCMgjvSkgAk8AUAcx/wr/Q/S8/8AAt/8aP8AhX+h+l5/4Fv/AI1qL4j0d5zCupWxkU4K+YOtaMcqSoHicOp6EHNFx2ZzX/Cv9D9Lz/wLf/Gj/hX+h+l5/wCBb/4109cHq3xAuNE8YNp15YyNbMq+UEXLsT3FJtLcFFvY1f8AhX+h+l5/4Fv/AI0f8K/0P0vP/At/8a1tR1q30zRW1G7DxoE3bSuT0zimaBqy65okN4h2mRecDocUXV7BZ2uZn/Cv9D9Lz/wLf/Gj/hX+h+l5/wCBb/40610HWo57vz9enMchPlbVQlfzFJpOqJpeowaBf6jJe6jJlvmUfKuM9cUXC3YT/hX+h+l5/wCBb/40f8K/0P0vP/At/wDGunopiOY/4V/ofpef+Bb/AONH/Cv9D9Lz/wAC3/xqTxn4rj8L6T5o2tdScQxsDhj71zGm
/// 6r478SQCaxm062j65Rg3XseuDUuSTsWoNq50f/Cv9D9Lz/wLf/Gj/hX+h+l5/wCBb/41oeHLHU7GwYa3eC7unfcXHQD0Fa9UQcx/wr/Q/S8/8C3/AMaP+Ff6H6Xn/gW/+NdPRQBzH/Cv9D9Lz/wLf/Gj/hX+h+l5/wCBb/4109NkLLExRdzAHA9TQBy7+BfD6OqO90rN90G8fJ/Wn/8ACv8AQ/S8/wDAt/8AGsi7sdf1i4a8vdNkhurPP2YRT4STuAw3V0Phq91y8hl/t+wS0dThdrA7v1NTzalOOhV/4V/ofpef+Bb/AONH/Cv9D9Lz/wAC3/xrp6Kok5j/AIV/ofpef+Bb/wCNH/Cv9D9Lz/wLf/GunooA5j/hX+h+l5/4Fv8A40f8K/0P0vP/AALf/GunooA5j/hX+h+l5/4Fv/jR/wAK/wBD9Lz/AMC3/wAa6eigDmP+Ff6H6Xn/AIFv/jR/wr/Q/S8/8C3/AMa6eigDmP8AhX+h
/// +l5/4Fv/AI0V09FABRRRQBk+JNet/D2jSXlwefuxqOrMewryeGztbvR77VLqeddduJBPFmJ/3ZByAMDuK9L1rwxLrutWs97dL9itjuWBU5Y47mt8QRKoAjTgY+6KhxuzSMlFaHOeB/EseuaLFFcSj7fCu2aNuG474rnNPXHx01EnvCMf98Cuifwe0PjQa/p12sBdds0JTIcdPwqvdeDr7/hMZ9f07Uo4JZUCiOSIsBxj1pNPQpON35o7CiufFh4myN2r2ZHfFsf/AIqt9QQo3HJxyRWhk1Y8y8Wy3MHxRsnsoPPlFuuEyBn5veuk/tnxR/0AG/7+J/8AFVNqPhM33i+31v7SFEKBPK29cHPWukqbO5basjzLwBJNL8QdekuovJlbloyQdpz7UnjfXF1jxFDoCl20+Fw148UbN0528Z9vxrqNN8Jy6Z4i1LVYbwM18DhGT7hzVrw54aj0OGdpZBc3VxK0sspXGST6VKTtYrmjfmPORe2X
/// hXxjDqWimddKdBHco8Drt7Z5H0NegeJryG/8A313ZuJIpLVnRh3GK1dU0u31XTJ7KdAEmQqSByPesOw8IzWXg+60A3/mRSK6RSFOUVux9admtBcydm9zjfAtxqS+EYBY+Hlv4gx/fEp83Puc1G6iDx3aXXiO0OgICPI8gDExz0YrkV1Wh+Dtb8P6Wmn6frsYgQkqGt8kZ/GpbnwNJrN5BP4j1OS8FucxxxoEUfX8qnlfKkVzRTbKfjs58TeHGB+UvJ+PArM+MLItppWfvebwOxFdb4j8Ltrl7p1xDd/ZzYsxA253Zx/hUHjDwafFUdoouxbm2OclN2abT1FCSTjcyfP1prFVi8HxvlBgsY8H/wAeqt8O/slprV9DdyNbatI7F7DBCIOvHauiTRvEyRqi69CAowP9H/8Ar0uh+DYdL1mbWLq6kvNQmGHkYAD8BRZ3Qcys0dKeAcV53pdrb698RNSfXU3y2mz7NBIeFGPToa9ErndV8H29
/// 9rKavaXEtnqCDAkQ5VvqDVNERla5ty2VtNAYZYI2jIwVK8VjaHp+iaOb2DQZkMhy0kKzb9hHtnio5NK8TyoYzrduikY3JbHd/Op/DfhOz8NrM1u8k09wcyyyHJY0+oaJbnH/AA5gtdY1TUr/AFZlutQWTBWXkxDJ6DtXoV5pdhfWrwXltFJEwwVZeK5+58DQx6zJq2i3kun3kpJkKgMj565Bp9z4f1+/hNvda+FgYbX8mDaxH1OalJpWKk1J3TOc8GXMth8QNS0PT5GfSogWVeqoeOh/SsObSJL7W9dv7JW+32Nx50OD12kE8fTNen+HvDNh4btDDYhmdzuklkOWc+pqno/hP+ytev8AUDdeat4WJjK425qeVtK4+dXbRUk8bWs3gwX9tKGvJlMUMI+80vTGPrXEDTZdB8baEdReSS8vMNMxOcsW4/SuwsPhva2PiNNRF0zwxyGRLcjgN61f13wf/bXibTtX+1mI2JB8vbndzmize4c0
/// U9DlPiMxTx5oLiEzFXBEa9X5HHNdNcand3ELxReE7guRx5vl7fx5qfXvCR1rxFp2qfa/K+wsG8vbndznrXS01HV3JclypHnHhiwuvBdnqWs+INlpFOcpaxsCEJPTiuetbXT9btNU1HXftX9oXxY2+LeQiNf4TkDHb8q9E8VeFJPFJtoZ70w2kL72jReXPbmt+G2iggSKNFCooUcdhS5OnQr2nXqcR8O/Evm2q6DqbMt9bAiPehXzEHQ81leMNLi1n4r2FjclhFJZ8lTgg5bB/Out1jwit9r1rrNjc/Zb23wM7cqy+hFLc+FpLrxjZ69JdgNbw+W0QThjzz+tDTasCklLmRhabqmreC7v+z/Ee+401iPJvQN2wHsxqDwNJHN4/wBekhcSI53KwOQRk139/YW+pWMtpdoHilUqwrm/CfgaPwrqNzcQ3bTJOMBGX7v40+V3XYXMmnfcb4l8OTwSHWvDCrBqcf3wDhZV7gjpWPpj6h8RGX+1
/// B5OlQ/fiQ4Mrjjn2616JKnmQumcblIzWJ4W8N/8ACN2clv8AaPPDsWB24xk5/rTcdRKXu67mvaWkFjax21rGscUY2qqjgCpqKKszCiiigAooooAKKKKACiiigAoooJwCT0FAFDV9ZstDsjc6jMsSds9WPoK8b1jxHrnjfUjZaesjQZJSCIYyvq1QePvFMviHWmgTAtrR2SMKch+fvV6J8N/Cv9h6Sb24B+1XahjkY2r2FYSbnLlR0xSpLme5meGfhTawwJN4hHnSkZ8lXwq/lXf2WmWWnxqllbRwqowNi4q1VHV9XtNE057y+lWONRxk/ePoK1UVFaGMpSm9S9RXmEPjrxL4n1KS38M2USW6nBmcZKj1z0/Cm6sPiLp48+Kc3ESrufy0XI9sdTS510K9m07N2PTpYY5lKyorqeoYZrC1HwP4f1PmbT40fGA0XyEflXJ+EviPqeoatDpuq2BdpG2iWNCCv1FemU04zRLUoM8Z8U/DW90k
/// i60TzbqBeqj/AFiH147VL4Q+I0+m3As9elkktgNoZly0Z9++K9hrxv4oeF4dJvE1WyVhHdyESr/CrdeP1rKUeT3om8Jqp7kz2GCeO5gSaBw8cihlYHgin15t8J/EUl3bSaPckf6Ou6Ik8kZ5r0mtYy5lc55xcXZhRRRVEhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBw3j7xFd6Bq2kSKrmx3lrgIPvYxinD4r6AQOLgf9s+ldfe2NtqNs0F5EssbdQaw9R8J6ZHZyS2WlRz3CqdiFsAmofNfQ0i4WtJGXcfFPRPIxbfaHmZflURnINYPhj4jWunWMp103El7JKxkO3pyccV0vhDRG2G51fQ4bG5Q5Qq+4H8O1bF14T0W8uGmuLJGkY5JyRS956lXgtLHOH4uaEGx5NyR67acPizoR58u4xnH3a3P+EJ0D/nwT8zR/whOgf9A9PzNHvivT7GJ/wtbRHRhHHc+YRhFCZJPasLw38R
/// k00Xv/CRi6e6km3KCmNqYGBit6+0U6Xr9uNI8NR3MCru8/zcYb0wau6ZZT69Jc/8JNoMVqUIVGVwd4/Cj3r7le4lt+Jn/wDC29Cyf3Vz7fJ1rJ8RfEtdU0d4PDsd2lyeXIjzhO5rtB4L0EEEWCZHua57VZdQ8O6zHFoHhgXEMow8gOdwz09vxofMEeS+iKum/FXRrHSLO2liupJY4lR/l7gc9afqXxO0PULCW1DXtt5nHmxKNw+ldOPCOi3KLLcaaiSuNzLnofSlPgzQSoBsEwOnJp2mK9PseRx6f4e1ORoPD/8AatzqL52DCgbvVj6VU0/Wb7TL5rTUtWu7byHKuiOW5H6V7rp+h6dpTM1jbLEzdSKqT+ENEuJ3mmsUaSRizHJ5NR7LqilWWzWhzNv8U9AtLVIv9Kk28FmXJNYt34l0/wATfEDR7jTYJGMfySb06DcMH+dd2fBOgHrp6fmatWPhnSdNufPs7RY5cY3ZNVaT3I5oLYPE
/// 1l/aHhq+t1Te7QtsHvisf4bW89t4SiW5jaMs2VDDqMCusYBlIPQ9aREWNAiDCqMACrtrcjmdrHmfj3xvq9nfNY6LHNBFE2Jbnyc59gTxXMrqDRalZeJbK21KRLdwt1czjO8nrj04OK9xaGN/vxo31UGo57G2uLV7aWFDC/3kAwDUOLbvcuM0lscWfi1oYUEQ3JOOQE6Ug+LmhFSfKuf++OtdD/wh2h7Sv2FMHryab/wheg7cfYEx9TT98L0+xyGr/ELwjrVr5OqafNOmONyYK/Q9q5G48SadozrL4MuL2zZjl4JcFCPoa9c/4QrQP+gen5mj/hCtA/6B6fmalxkylOC2RH4K1+68R6CLy9g8mQNt6YDcdRV7xF/av9jS/wBg7Ptf8O/0qO7F/pNikei2MdyqfKsIbZgduTXIXuqfEHUZTa2+lxWKMcGUHJA+pOKtu2hmld3RU0H4ptZQyWniWKR7iBiheJepHUGtf/hbehbQfKuf++K0
/// tH8B6VYaaIruL7VPId80rnlmPJ/nVz/hC9Bwf9AT8zUpTtuW3TvsYDfFzQx0gum57JVHWfizZPpkqaPHOtywwrsnC+prrR4M0EDAsE/M1NF4V0aGF4o7JAjjDD2otPuK9PsefX3xSii0eG30gXBn3gTSTjJ29yPep38bXfifXdJsvDwuIYI5Q11vAyy5Heu2Hg/Q1zixT5uvJq1p+gabpcxlsbZYnK7SR6UJTvqw5odEaNFFFaGQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAEgAk8AdayW8U6Gmd2qWw2nB+foa05xm3kH+wf5VxPhG31WTQV+yvZeUJpAC8W4nDH3pMaR2lvcw3dus9tIssTjKupyDUtcTr2o3b+JrLQZrn7BbSw+Y9zEdpLDPyg9ulZF74iuLW11TR49RMpgeMQXQf5yCVyM9zyaLjUbnppOBk9Kym8T6Ij7W1O2B9C9P0TTTp1lte8uLoyYYtO+4jjpXMfEby7c6H
/// J5f/ADEEHyjrQ3pcIpN2OwstQtNQRnsp0mVTglDnFWa47xhHNLqej2ttfTWMc7ssnkNtLdKzPEMrW2pxaXDqN+7W9uHJWbYT2yzc5/KlcOXS56JVSbVLKC7NrNcxpOIzKYy3zbfXHpXmy+JL278J2kM13LaxyXjQyXquSyKC2OfwHNVYYTa+O76O11SW+K6YwSeR9zIcZxn60cxXIes21zFd26zW7h426MOhqWvL7CW+1I6DYSapcwidX8x43wzkbv8ACtKe8vtAs9esbe6nujbRpJHLOxZ1DcHn2xmjmFy62O+orye5lm0vXtBFj4jur5LyZfORpcgcj9K9WV1YkKwJHXB6U7icbEN5fWunw+bezxwR5xuc4qC01vTb+cw2l5DLIBnYrc4rH1eSCDxtpr6jtFs0Eixs4+VZMr+uM1Y1e80iG7st8QuLkyfuUgALDjr9KAsb9FeX3V9darqetvc61Lpr6eT5MCPtBA6E+ucfrViy1HUN
/// ek0OCe8nthcxsJGhYqW27sN+OM0uZXsPlZ6RRXnsWmXc1vrAOt34GmyEQkS8t8ob5vXrWfBqd/4nvvDyvf3Fml1FL5gt327tpI/pRzD9n5nqVQteQLeLaGRROylwmeSB3rgY9Fu5Rq9u+u6gBprfuWWXBbK5+b1q3pN3PeeItBu5jlptMZm+uVyaXMHIdzVPUNWstLjD3s6R7vuqTy30q1HIkqB42DKehBriLKQWnxO1I6xhVmiH2SSQfLgAbgM9/wDCqbISudXp+s2Opj/RLhHbGSgPI/Cr1crd6xpSeJBHYWf2rUVgYiWJAVTAJwT2/wDr1yhvHn0mbXZdauIdVinOLAS/JkNgJt68ik5WKUbnqtQ3N5b2iobqZIg7BV3nGT6VxCWN3rvi+9W51K8tI4baOQQwSYU7gf8ACub1NLi50eCO51G5YWmriDzS/O0qDkn1FJy0BRu7HsOaK4n+zpNV8UXFq2q3kcNtaxOnlS43EluT+Vcl
/// rWtz3C6hc2eo3qPaTFMGfyx16BcHNPmBQu7HsdRT3MFts+0SrHvYKu44yfSvPrjULjWjotnf6jPpttPZiZriF9jSPgcZ/E1natbCa305V1y5u4INRFv5pbBA65J7n3o5g5NdT1eivOddtrptQnEWtyNHAikRxXfluo2jkjBz611vhS8+3eGrabzJJOCpeX7xIJHP5U0xONlc04buG4mmiikDPC21wD904zTmuYVuFt2kUTOpZUzyQOprndEuYLfxBrvnSpGTcqfmOP4FrL1Swhl+IVjcf2hcKJLZ3TZLhSVI+X6HP6UXBRuztbm5itLdprhxHGoyWY4ApbeeO5t454WDRyKGVh3BrxzUL6bUvD+rahqGr3FveQXJiWzEnylc/wB2vUfDcsI8M6WqPjdbJsBPJG0UlK7sNxsrmtRRRVEBRRRQAUUUUAFFFFABRRRQAVBekrYzlTgiM4PpxU9V78E6fcbck+W2MfSga3PmiH59QTfg5l5z
/// 35r6chGII8cDaP5V8wQLi+j3DafN5/OvftW8b6NoVtH59wJpMAeXEQWHFc9F73Oqum2kjpK4j4r2P2nwa1wJNptZFfb/AH88Y/Ws2w+LD6lrUNnbaQxSQkZ8zLY9cYrk/Feu3vi3xZ/Z1tIyW3nCGOPdlSQcbjVynHlM4U5KevQp+CvG03haSTfbLNBIcsoOGB9a7hfjLprpj+zrgueijkGtrw18O9L0W1Q3kSXl0eWeRQQD7V08Wn2cC4htokGc8IKUIzS3HOdOUr2POf8Aha0QkBtfD0hb1+6f5V2HhXxFceIrSWa50ybT9jYUS/xj1HFaWo3EGmaZc3skSlLeJpGAUcgDNcv4P8fjxPcXUBsfsxgTeuH3bh+VVez1ZDtKN4o7SuJ+LEat4GmdgSY5FYY9elcxdfGDUjcOLbTI4lUkYkJJz+Vc14k8S694ktRNfwPHZRHJKIRGM9CamVSNrFwoyumy38L7l4vHNuijiSN0J9sZ/pXu
/// 9eB/DU48eWPHUP8Ah8pr3yij8IYj4wooorY5wooooAKKKKACiiigAooooAKKKKACk3D1H502ZtkDsOdqk/pXlln41uTc2Ya1hIN2VMYUhlBJG7NS5JFRi5bHq1FcZ4g8WzabeSRQ3UMZVA4jkhJPTOM5qr/wnt6fBy6mtmpuPNMbddvUc/rRzJDUJPY72ivMYPiTqD621g/2bYYHkEwU/KQpPTvT1+JN5bapaxTrDdW8pAkkiQr5fv3pc6H7OR6XRXD3/jT9+zWOqW8cI42Pb7mz9dwqponxKM13eQatGqpD/qZkXAl/DtT5kLkkeh1DLd28MqRSzIkkhwqscFq8zh+JWttMZm0zzLZptsapGcuvOSD7YqS71ZfEPjzRZrS2m2p/rMr9w4PWlzJrQfs2nqekxXMM7ukMqu0Zw4U52n3qRmVBliAPUmuS8Hhl8Q+IgwOftQIJ7jaKZ4/8RS6NFZ28VklyLpjlpF3LHjHOO9VfS4uX3rI7
/// AMpJAIJHUUteZ+G/GEtvrGpy6xE+yRY/KZIdgOAc8E/Stzwt4l1PWX1eW7txFb25/wBGbYRuHPX9KSkmDg0dVc3lvZqrXUyRKzbVLnGT6VMDkZFeXaxrF5rvgHS9UuoPMkW+JcQrwANwzW1eeOYZYIv7PuTbFR8/m2+/P6jFHMHK7Hb9OtIHU9GB/GvMl+Is8WrxWt46XlhMCJJI4ChTj6mmnxhbW3iiyGn2jNpiKxml8vLKcHv+VHMg5GekNqFojTK1xGGgXdKC33B6n0p9tdQXtus9pKk0TfddDkGvOIrn+04/GV9bxSeRLaYjZlxuIQ10Xw13jwDp/mKVbDZBGO5pKV3YHGyudUTjrSBgehB/GuMufGYg1i903WLN4rZRiOQD74qrqHjXTrTT5JtHhdrxYwkYdOoz0p8yQcjO3uL62tXRLmeOJpPuBmxu+lT9eleYeJJtQv5PC13fR7JZMtLGoIxkVb17xpf6TPcx2lxHPJC2Etzb
/// Hn23bv6Ucwcux6JRmuDb4lxReHxcPYyNqAUbrccDOfWuIv8AxDLqesTXMlxqtp50e5RbzHZE+Om3HqKTmugKDPc6K8s8P+PLy18Hzx34mbUo93ktMhO/jjNVrf4k69JNaeZGipIR5262K7B3wc80c6tcfs5XPW96/wB4enWq7ajZrd/ZWuYxPjPl7vmx9K881TxZbtdWw0OwZ1aYyXRMWe3WnaffLrfxJa6tbeXyY7Rv3jJhc4A4NHOuglBnolteW14pa1mSZVOCUOcGpq848Nahc6P4P1a8gh82eGVyqEdTuNZ2m/EnW7nVtOt7iKJVuZAsiGEqVyccHPNCmmh+zd2kesEgDJOB70gdScBgT9awPG2pT6V4XuLm2tluW4XY4yOTiuL8M+L7q58VWVs2nxyxypsM0cJQxdeOp9abkk9RRg5K6PVCQASeAOtV7O/tNQjMllcRzopwWjbIBrAv9du4/HC6KqobaWyMudvzbs4rk/AGsR+G
/// tKu7LUoJ4rhrhmwUo5lcOR2uep0hYA4JAP1rzufxhqMUbvFfxyP/AAobQjP/AI9Tz43t7rRo7i709xqaoQqeXkZPpRzIORneT3dvbRh7iZI0Y4DM2ATUb6nZR3Uds91Es8oykZblh7CvMtR1/wC2+FNOtpbGVLuK4V5I1iwoAbPT6VLJP/bPxG0OeytpwsMQWR2XCqBmp5+xXs+56lRRRWhkFFFFABRRRQAUUUUAFFFFAARkEHkGore2htYvLtokiTJO1FwMmpaKAILuxtb+Ly723inT+7IoYVGmlafHa/Zo7KBYOvliMbfyq3RQAAAAAcAdKgubK1vdn2u3jm8ttyeYoO0+oqeigCGaztriSOSeCOR4jmNmUEqfao7rS7G+kSS8tIZ3T7rSICVq1RQBVTS7GOJ40s4VSQ5dRGMN9ajh0XTLdswWFvGdpXKxgcHtV6igd2VY9NsomiaK0hRoc+WVQDZnrj060y902K6t7lYsQTXCbDMg
/// +b2+uKu0UCON0/wJLFqkF3qd/HdLA+9ES3EfzdiSOtdLp+lW2nS3MlugVriQyOQOpq7RStYbbZFPbQ3Ufl3MSSp/ddciobXStPsZDJZ2cEDtwWjQAmrdFMRUuNKsLuQSXVnBK6nIZ4wSKk+xW3mxy/Z498QwjbRlR7VPRQBCLS3XzdsMY845lwv3+Mc+vFRRaVYQNE0NnAjQ5ERWMDZnrj0q3RQBCLO3DTEQRgz/AOtO37/bn1pI7G1i8vy7eNPKTYmFA2r6D2qeigCOGCK2iEVvGsaDoqjAFNuLS3vI9l1BHMvo6g1NRQBDbWVtZpstYI4V9EUCmNptk9yLhrSEzDkSFBn86s0UAMEESytKI1EjDBYDkiom0+0eJ43tomSQ7nUoMMfU1YooAhhtLe3bdBBHG20JlVA+UdB9KiOl2BuDObOAyngv5Yyfxq3RQBVl0yxntVtprSGSBfuxsgKj8KG0uxayFo1nCbYdIjGNv5VaooApTaPp
/// twiLPY28ioAFDRg4Aq3HEkMaxxIqIowFUYAp1FAFObSNPuJmlnsoJJG+8zRgk0raVYMsatZwlYjlAUHyn2q3RQBWl06ynk3zWkMjYxlkBOKkW0t0MRWFAYhtjwv3B6D0qWigAooooAKKKKACiiigAooooAKKKKACo7j/AI9pP9w/yqSo7j/j2k/3D/KgD5gkUm6kA5JcgD8a9M8L/Cpptl34jcGNlytujHP4mvN4znU1yMfvv619OQ/6hP8AdH8q5aUU3qdlabikkZ9p4e0zTLd002xggdoym9EAY8dz3rw3RFbTPiBbxSEbobwxscZ5yRX0LXiPxI0O40bxUdWt1CwTyCRGX+F8f4jNaVFZJozou7afU9u60Vg+Dddh1/w3b3EbEyIuyUN1DDg1vVtuYNNOzOa+IV39j8D37YzvUR/99HFcX8G7QteajdFflVVQH880z4s6413qVro1jKxC8zKp4ck/KK7nwP4dPhzw+sEmDNKfMkx2
/// JHSsvinfsbfDTs+pvfZYAxbyY8nqdormfiQoTwBqGwKvC9v9oV1dcr8ShnwBqGfRf/QhWktjFOzueW/DQKPHljx2fp/umvfK8C+Gp/4rzT8/7f8A6Ca99rKj8JvX+IKKKK2OcKKKKACiiigAooooAKKKKACiiigApnkxg5Ea5/3RT6KAGtFGxyyKT6kVQ1bSf7Ss/Ijne2/2ojj+VaNFA07HN6P4Ls9N1E388sl3dAbVklYkqPTmuh8mL/nmn/fIp9FK1gbb3GeTF/zyT/vkUeTF/wA80/75FPopiGiNAAAi4HTigRopyqqD7CnUUAIFAJIABPXAoZFb7yg/UUtFAEFxZW11HsuIUdeuCtUr3QLW7t3ii3W3mEF2gYoW+uK1KKB3KWl6VaaRpkVjZxhYIxwp5+pq0YImUgxoQeD8op9FAivb2FpaQiK3t440GcKFFS+VGBgRr/3zT6KAGhFCkBVAPUAUoAUYUAD0FLRQA1o0b7yKfqKT
/// yY/+ea/98in0UAIVU4yoOOmR0pDFGTkopPrinUUAM8qP/nmv/fIo8mP/AJ5p/wB8in0UAM8qM9Y1/wC+aPKj/wCea/8AfNPooAaIox0RR+FKEVfuqB9BS0UAVr2yW8sZLcM0QkHLRnaR+IrCt/BFjHfQXVzNcXLwNuQSyswB9eTXTUUrXGm0IQGGGAI9DTREg+6iqfUCn0UxGRaeG7S21d9TkLz3RXYJJGJ2r1wM1qmNCclFJ+lOooHcrHT7Q3QuDbx+aP49ozU/lR/3F/KnUUCG+Wn9xfypQig5CgfQUtFABRRRQAUUUUAFFFFABRRRQAUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86
/// AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHVHcf8AHtJ/uH+VO81P76/nSM8bKVZlIIweaAPmBWH9pg8/63GPxr6fh/1Ef+6P5VzX/CBeFvM3/YE3Z3Z8xuv510okjVQAy4AwOaypwcb3NqtRTtYfVLVtIs9b06Sy1CISRP8AmD6irfmp/fX86PNT++v51qYnlNz4E8TeHdSefwlds1tu
/// ykfmfN+IPBqV0+J17H9mkAgV/laQMgwPXjmvUfNT++v50ean99fzqOTszX2j6o4fwr8OYNMmF/rjfbdRD7gxYlV/xP1ruqb5qf31/OjzU/vr+dUkkrIiUnJ3Y6uU+JZx8P8AUSCBwvX/AHhXU+an99fzqtf2llqlk9pfIk0En3kY8Gh6oS3PC/hqwPjzT8Efx/8AoJr3+sOx8L6Bpt4l1ZWcMU0edrqema2vNT++v51MI8qsXUmpu6HUU3zU/vr+dHmp/fX86szHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHm
/// p/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dHmp/fX86AHUU3zU/vr+dFAC4HoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQ
/// UUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA
/// 9BRRQAYHoKMD0FFFABgegowPQUUUAGB6CjA9BRRQAYHoKMD0FFFABgegooooA//ZIFFZAAD/2P/gABBKRklGAAEBAQB4AHgAAP/hAMhFeGlmAABNTQAqAAAACAADATsAAgAAAA8AAAAyh2kABAAAAAEAAABCnJ0AAQAAAB4AAACiAAAAAG1vaGFtZWQgZWxkZ3d5AAAABJADAAIAAAAUAAAAeJAEAAIAAAAUAAAAjJKRAAIAAAADNzIAAJKSAAIAAAADNzIAAAAAAAAyMDE3OjAxOjA5IDEwOjQyOjE5ADIwMTc6MDE6MDkgMTA6NDI6MTkAAABtAG8AaABhAG0AZQBkACAAZQBsAGQAZwB3AHkAAAD/2wBDAAcFBQYFBAcGBQYIBwcIChELCgkJChUPEAwRGBUaGRgVGBcbHichGx0lHRcYIi4iJSgpKywrGiAvMy8qMicqKyr/2wBDAQcICAoJChQLCxQqHBgcKioqKioqKioqKioq
/// KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKir/wAARCABVBBEDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRom
/// JygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD2f/hDLn/oZtU/76X/AAo/4Qy5/wChm1T/AL6X/CuqooA5X/hDLn/oZtU/76X/AAo/4Qy5/wChm1T/AL6X/Cuqpk08VvGZJ5FjQdWY4AoA5j/hDLn/AKGbVP8Avpf8KP8AhDLn/oZtU/76X/CszxB8U7DTpGi0qIXzqcM4bCg/XvXJXXxY1+YlYYraAZyCEJIH51DqRRrGjOWyPQP+EMuf+hm1T/vpf8KP+EMuf+hm1T/vpf8ACvMn+I/iQgEX4GfSMU1fiL4kwQ+pMCOfuKc/pUe2iX9Xmen/APCGXP8A0M2qf99L/hR/whlz/wBDNqn/AH0v+FeW
/// n4ieJv8AoJMMn+4vH6Up+InibtqTc/7C/wCFHtoj+rTPUf8AhDLn/oZtU/76X/Cj/hDLn/oZtU/76X/CvLo/iJ4lZ8NqTD/gC/4U9viL4j4xqB9M7F5/Sl7aNw+rTPTv+EMuf+hm1T/vpf8ACj/hDLn/AKGbVP8Avpf8K8uPxF8SnhdRPXrsX/ClX4heJcYbUm5HJKLx+lP20Q+rTPUP+EMuf+hm1T/vpf8ACj/hDLn/AKGbVP8Avpf8K8t/4WD4jLgDVGC5+9sH+FNPxA8Thv8AkJPk9ti/4Ue2gH1aoeqf8IZc/wDQzap/30v+FH/CGXP/AEM2qf8AfS/4V5aPiF4myP8AiYtkeqr/AIUv/CwvEhQf8TM8H+4vP6Ue2iH1aZ6j/wAIZc/9DNqn/fS/4Uf8IZc/9DNqn/fS/wCFeWt8Q/EmARqLZ7/Iv+FNb4heJlXKakx9gi/4Ue2iH1aZ6p/whlz/ANDNqn/fS/4Uf8IZc/8AQzap
/// /wB9L/hXl3/Cw/EpVT/abBj1GxeP0pP+Fh+JweNSY/8AAF/wo9tEPq0z1L/hDLn/AKGbVP8Avpf8KP8AhDLn/oZtU/76X/CvLv8AhYviYtg6gRx/cFH/AAsTxMOBqRPHXYv+FHtoh9Wmeo/8IZc/9DNqn/fS/wCFH/CGXP8A0M2qf99L/hXlY+IfifqdSJ/4Av8AhSr8Q/Eo66iT7FB/hR7aIvq8z1P/AIQy5/6GbVP++l/wo/4Qy5/6GbVP++l/wry3/hYXiQ4A1F8nr8q4H6Up+IHiLb/yEzvzjhB0o9tEPq8z1H/hDLn/AKGbVP8Avpf8KP8AhDLn/oZtU/76T/CvK28f+I24fUX2nnAVef0po8d+Iyp8vUHVe+VX/Cl7aI/q0z1b/hDbn/oZtU/76T/Cj/hDbj/oZtU/76T/AAryc+OPEbv82oyAnnhRz+lOfxnrzpgao55xwo/wo9vEPq0z1b/hDbj/AKGbVP8AvpP8KT/hDbj/
/// AKGbU/8AvpP8K8p/4TPxBGozqUjYOMbR/hSf8Jrr5jYNqUikk/wj/Cj2yB4eaPWP+ENuf+hm1T/vpP8ACj/hDLn/AKGbVP8Avpf8K8ni8e+JFTAv5FI4ztX/AApf+E+8Th/+QpJ7gqv+FHtkJ4eZ6v8A8IZc/wDQzap/30v+FH/CGXP/AEM2qf8AfS/4V5YPH/ibcP8AiZSf98qf6UN8QvEocBdTZh/1zA/pT9rHqL2Ez1P/AIQy5/6GbVP++l/wo/4Qy5/6GbVP++l/wrys/EHxSBzqDj/tmP8ACnf8LA8TBSW1Q8AHHljmmqsWP6vM9S/4Qy5/6GbVP++l/wAKP+EMuf8AoZtU/wC+l/wryyP4geIwuP7SY8dNqjH6Ug+IHiTcSmoPu9wv+FT7eNx/V5Hqn/CGXP8A0M2qf99J/hR/whlz/wBDNqn/AH0v+FeVHx74iIJOpMHzwuwUsnj7xO8bf8TB0z/0zFP20RfV5Hqn/CG3P/Qz
/// ap/30n+FH/CGXP8A0M2qf99L/hXlB8d+JNo/4mLnHfaP8KVPiD4m2ljqTZx3Rf8ACl7aJTw0j1b/AIQ25/6GbVP++k/wo/4Q25/6GbVP++k/wryb/hOvERU/8TJuT/dH+FH/AAnXiHA/4mbgj/ZH+FP20RfVpdz1n/hDbj/oZtU/76T/AApP+ENuP+hm1P8A76T/AAryU+N/EJ5/tJ8D2X/Cj/hNfEGQ39oSHHfA/wAKXt4h9Wketf8ACG3H/Qz6n/30n+FH/CHXH/Qz6n/30n+FeTf8Jr4gZsnUJBn2H+FRv4w11m3NfyLg8YUUe2iP6tM9d/4Q64/6GfU/++k/wo/4Q64/6GfU/wDvpP8ACvI08Wa8oLLqMg3deBQPFuuswA1R8HnOBxT9tEHhpo9c/wCEOuP+hn1P/vpP8KP+EOuP+hn1P/vpP8K8jHjLWg3F/J9MDmgeL9cHBv3AA7gc0e2iL6vOx65/wh1x/wBDPqf/AH0n+FH/
/// AAhtx/0M+p/99J/hXkX/AAl+vlQV1F+fpxS/8Jlrw+9qUgx14FL20QWHkeuf8Ibcf9DPqf8A30n+FH/CG3H/AEM+p/8AfSf4V5H/AMJnrxIP9ouBnngcU8+Mdb3ADUnI7kKKPbRH9Wl3PWf+ENuP+hn1P/vpP8KP+ENuP+hn1P8A76T/AAryYeMddAJ/tKQf8BHP6UxvGeu8Y1GT8AP8KPbxH9Vkt2euf8Ibcf8AQz6n/wB9J/hR/wAIbcf9DPqf/fSf4V5J/wAJt4g2YOoOVHIO0Uh8beIG5F++f90c0/bRJ+rSPXP+ENuP+hn1P/vpP8KP+ENuP+hn1P8A76T/AAryNfGmvE5OoOvHIwKX/hNteAwNSfHqAP8ACl7ZD+rS7nrf/CG3H/Qz6n/30n+FH/CHXH/Qz6n/AN9J/hXkn/CZ66QP+JhIMdeBz+lOk8aa4silNQYYX0B5p+2iH1eXc9Z/4Q24/wChn1P/AL6T/Cj/AIQ24/6G
/// fU/++k/wryP/AITPXmbnUZPfgf4Uh8aa7nnUXHoABzR7aIfVpdz13/hDbj/oZ9T/AO+k/wAKP+ENuP8AoZ9T/wC+k/wryRvGmufKf7RfjjBA5/SkPjTXT01GTg9MD/Cj20Q+rS7nrn/CHXH/AEM+p/8AfSf4Uf8ACHXH/Qz6n/30n+FeSf8ACZa43P8AaDr7YHNM/wCEz13n/iYSKPoKPbRD6tLuevf8Idcf9DPqf/fSf4Uf8Idcf9DPqf8A30n+FePnxrroGW1GX1+6OP0pB421rqNRkx/uj/Cj20RfVpHsP/CHXH/Qz6n/AN9J/hSf8IfP/wBDRqX/AH0n+FeP/wDCc662c38gXHUAc/pUB8Vaq7kSX0nUfNxS9vEr6rLuez/8IhN/0NGpf99p/hR/wiE3/Q06l/32n+FeJya/qUkmRdyNkdd3WlXXNRXDG7k45xmn7aInhpLqe1/8IhN/0NOpf99p/hR/wiE3/Q0al/32n+FeKnxB
/// fsxP2qQMehNN/t3U8j/THytHtoh9Wl3PbP8AhEJv+ho1L/vtP8KP+EQm/wCho1L/AL7T/CvGF8Qal8o+1NgdMmmvr+olebuQcjvS9sg+ru257T/wh8//AENGpf8Afaf4Uv8Awh8//Q0an/30n+FeLx+JdTIIW9kA7+9Tf8JPqzYBvpAv4U/bIPq0u57F/wAIfP8A9DRqf/fSf4Uf8IfP/wBDRqf/AH0n+FePp4l1bdtGoSKq8g4o/wCEn1aRWU38h54BxzS9tEPq0u56/wD8IfP/ANDRqX/faf4Uv/CHz/8AQ0an/wB9J/hXjP8AwkerBiGu5MduaU+J9WdgxvpCR7in7aIfVpdz2T/hEJv+ho1L/vtP8KP+EQm/6GjUv++0/wAK8VfxDqizB/tz/nUb+ItSZyftsmT1yelL20Q+rS7nt3/CITf9DRqX/faf4Uf8IhN/0NGpf99p/hXh/wDwkOqSMu+9kI6delTNrupMBm7kJA4+an7a
/// KH9Wkup7V/wiE3/Q06l/32n+FH/CITf9DTqX/faf4V4r/beoKMG5kyR/e6Un9s6j3u5MfWj20RfV33Pa/wDhEJv+hp1L/vtP8KP+ERl/6GnUv++0/wAK8XXV9QPBupBxkEtTDq96FYi4kGRz8/U0vbIPqz7ntX/CIy/9DTqX/faf4Uf8IjL/ANDTqX/faf4V4e2rXm45u5Bnr81Q/wBtXu7i4kIz13HpR7aILDSfU92/4RGX/oadS/77T/Cl/wCERm/6GnUv++0/wrw0avdsg/0qTd2G6pE168RfLF1Jn13Ue3jsH1aXc9u/4RCb/oaNS/77T/Cj/hEJv+ho1L/vtP8ACvEz4h1JJQwvmDY7nrTf+En1UqWF44Puaftoh9Wk+p7d/wAIhN/0NGpf99p/hR/wiE3/AENOpf8Afaf4V4c3iLVGC5vHA9j2pf7e1Foz/pjtnqM4o9qh/VZdWe4f8IhN/wBDTqX/AH2n+FH/AAiE3/Q0al/3
/// 2n+FeG/8JBqI5+1SDP8AtVLHr+pFcm8l6HHsKPbRF9Vkj23/AIRCb/oaNS/77T/Cj/hEJv8AoaNS/wC+0/wrxRfEWpFQovJNoPAzUb+ItRaTMl5Kp9KTrRQfVpHt/wDwiE3/AENOpf8Afaf4Uf8ACITf9DTqX/faf4V4d/wkGoFQReSA56FqRdf1EsQL1wM+tP2yD6rLue5f8IhN/wBDTqX/AH2n+FH/AAiM3/Q06l/32n+FeGrrmpkkm9YMeMA5zS/27qART9sc7e2an28R/VZdz3H/AIRCb/oadS/77T/Cj/hEZv8AoadS/wC+0/wrw5Nd1DBDXbgD/apx1y7lVU+1yH8TT9vEX1WR7f8A8IjN/wBDTqX/AH2n+FH/AAiE3/Q06l/32n+FeH/2vfowMd7KvPIznNP/ALf1HcWN5IfpR7aIfVpdz23/AIRCb/oadS/77T/Cj/hEJv8AoadS/wC+0/wrxT+3NRJz9sk/Oj+3NS/5/JPz
/// pe28g+r+Z7X/AMIjN/0NOpf99p/hR/wiM3/Q06l/32n+FeKHVr11XN3IOPU09NQvN2UvZTjuAeKr2qG8N5ntI8Hznp4o1P8A76T/AApf+EMuf+hm1T/vpf8ACvHo/EerWuBDfSZ9Sta9n8SfEVntAuYrpV/hlTFCqq5EqElself8IZc/9DNqn/fS/wCFH/CGXP8A0M2qf99L/hWJ4f8AirDdOsWuwpaFjgSoTsrv7W8t72ES2kyTRnoyHNaqSexg4tbnN/8ACGXP/Qzap/30v+FH/CGXP/Qzap/30v8AhXVUUxHK/wDCGXP/AEM2qf8AfS/4Uf8ACGXP/Qzap/30v+FdVRQByv8Awhlz/wBDNqn/AH0v+FFdVRQAUUUUAU9V1O30jTpLy8cLHGOcnrXiHivxnqHiN2R3WGzV90cSHn8fWuk+LeqPLd2unRsfLjHmSAHqTwP615o/3fxrlqzd+VHdQorl52LvGxlHf2rZ8E6RbeIPFKad
/// es/kmMsQhwfzrnn37l29K3/A+r2+g+LFvb7eYjGVOwdDWMLOVmb1G+XQ19J8HST+KrqwvbG6j09WkCylcDAztOaydF8K3+r2s1zBLbw28cjIJbh9u7B7cVb0rxWLTxncaldzXL2kjyeWmcjByBxVrQ/FdkvhdtJ1B7u1ZJmZJIkHIJz61tywOdOqo8xmR+ENVk1iTT3WOKWNd7PI2E2+uafrHhC/0e3im3w3cU8nlobdi3zVs2vinRZdZnkvYrm6QweXDJOAzRn3X/69QXXifTl0WC2tJJriaK++0ZaPAA2kYxn3o5IWH7Sre6LWhfDyVtYhj1a4tyrJueKGX94nHGRiuVu7LPiCaxt1LAXRgQEdPmwK63TPEXhu38USeIVlvBcXSgSW7YwhxXHXeoOmvXGo24kIFy0sanv82RSlGCWg4Ope7N/WtM0HwzcRWd5aXF9c+UHmZZQgUnsBj0qceEtPu9a0lba5eHT9RQSBZGG5fVc0moap
/// 4c8TCG81RrizvhGPNESj58cetV7jxNZL4i0me2hmWx00BF8zhm9TQnB7oVp30epvx+A9Fn8RXFul3GltbRgtCs4LMeeTxxXM6vo9lDodxf2EUToLwQJLFMX425wOOan07xVZQeJNU1JxIY7qMqEB5BwRWXaa/HZ+EU04q/2qPUPtSZ5BHoav92ChVRrj4eailmWe5sxcGPzBA0nzbf8AGq2meDL69s47y5ubaygnG2IzNgufpVzUPE3hTUtS/ta6tL9rlU2+QwGzPr9KsW/jPTrvQ7SxvpLuwNmNiPZsMOBxip5IXDmrWOV1HSLjS9VksrzAeM43Do3HUVMfD9wNAXWPMhNuz+WFD/ODnHIqLW9UXU9Zkmge7MKqNr3LZbAGKIpdHOipl5TqRfcwdsRhc/zxWTSUrGqcrK+5UcbI1OQVz2rpL3w3brpOiHTlf7bqLMGBOQcHFV9E1nS7SzvLDV7MtHcoVjuIUDbM1fn8S2NhqOinS/Om
/// s9LyCJPvyb/T6VcYq2pM5TvoVNS8D6lYWcs/nW9ybcfv44GLNH354qWw8C3k1raXNzdWsCXJDLFLJtZ0749+avap4n082149tfao0lwuxYncBEJ9ahutf0PVV02fV4ruOexQL+7UFXxjnNVywuZ89RkureBlHiWWw0mRILeCBZZZJ34XJI6/hTdV8G22neD4r3zI57uS42CWGTchXnH9KuXfjLSb7V76K8t7hbG9gjj8xVG5SpJ/rVC68Q6HF4dt9HsIbiYR3PmN5yj5l5/xquWBPNV0XQrTeCL1bGWZb20lnij82S3Rsuq9a07PwTY6h4HsdSSSO0u5JGEss74XAYjp+FOPjDRYtSupbdbspPbmFYY4xtjPfv61kap4mtLzwVbaRDHMtxDMzhyuARuPB/Oly00PmrSepm61oc2ian9nuHjfdGJY3Rsq6noRVQtM4GyLcuM71HFaviXWodUh03yo8C3tFikJPO4VUt9e1ODT/scc7CAx
/// lNm71/8A11g+W+h0RdR9ClwzgTbflXjnGa7Xw/ZeHdX0+8lfQljNpGHwLhjvz/KuAeZYzgISe4J6V0PhnxBbaNaahHcRSSfbI1VdvQYz1qoWT1CtTlbzLltolvryPd2cMGi2MJw8k0hZWJ6YJq5pnhEDxlaaXq0f2iznVnWVMhZBtzkGs/SfFNrbeH5dE1UXUUW7dHcWDAOOff61ZsPF1lZ+JdPvU+2ywWaOh8+TczAj+daWhe5z3qO8TB1W0is9auraDiKKZlVSeQAadpmjXGrXDJbSxIqKWYyHGeO35VPqOpaReG+lS2uF1CaYyRM2PLAJzz74qrYz6atyV1ZJn3KfLaI4AbH8qx5dTpu7biabp51LVbWxDANLKI3wegzjIrp9Y8MaRp1ze2f2DVcW8e5b1QGjY478cCuW0q+XTdTt7wBmFvKshOcfKDnH412jeM9EE+o6ja/anub+LyhDIQETitIKFtTGp7RvRlV/CNnp2nadPNZ6
/// hqTXqeYxtsARDjjGDk81gQDSYb+ez/su8uZTKVQGXYQOeCMHkVv/APCS6bq1lpZ1Ge7tZdLI+WE8S/X8qq6b4osrfxrd65c2+Y5FZY1+p4P5VXurYmHtdbjtf0Lw/p81hAk0tvPKN1yNwk8kY6Hpg1H4m8PabpmjWFxpkskwuv8AlqxHPXoB9PWub1Cc3upS3DO5eWRmJHv0rb1HX7e/0HSdOt4ZDcWhG4scKcZ4pNw7F8s11L9z4ctbS0hK6NeXebcSPOkuOSuTgYrP0Wy0efShJcQXlzqEkpRbSJwCF9elaFprujWmoW+sKt6LqGNofsu0FC+0jrnp+FVdMv8ARLnTjBqcd1Y3azeYtxbsNxGc4JquWBC53oax8D6QnjBtNe8l8j7MJggYb939zpWXr+gWlloMF9b21xY3Elx5Rtp2yWX+8OBW3J4+02TxE1yttKLaS1Fs0wIEgP8AerB1bVLCXw1Do+nT312Fm883F43zDA+6DQ1T
/// S0CHtG7nPCLzZCIomZV67OaYOSqqpyDhvzq/Z6xe6Rn7DM0fmD5vmzVOeeSZvMnbc7Nuc/3snJrBpHSubU7XVdGsNNks4rTwnPqQltklaZJGxuPbisuz8Mx6y9xdmS20K1jfYYp3JZGx71W8Q+I/7TvbSXT5J7VYLZYCVbAJFaOk+ItLg8NNpt7HNHc+dvNymCz85rb3WcnvpMrP4QMPiCLSrjUIgZ4xJbzKuUkB6d++Kju/CNxYaDLqGpXH2aVX2RWxT5pPcc9Kt3/inSrrxNp+oPb3LpZWwRY3x85UnFR+IvFtt4m0tf7SsjHexN+6kjPyge9Jxgi+aq7XMrQ9HbWr0wR3EVvtjLl5TgfSo7DTzf6tHYIVDtJsLLz+P6VHpF3YR6gH1SB5omjIUIcY96rWF6bPU4rm1DnZISozyKzXL1OiXPrY7jUvC1hp8txCdG1CWKFcC5hkDO59duOlJZ+DLaLQbG+uLS5v5Lz5ikT7REv5HJ9q
/// QeL9Fs9QuPENrFeNqF9H5L27ODGhxycfhVey8X6ZqGl6dZ65HeQPp0waKSFvv4z19q6EoNnH+9Sdxtp4f017jVJ5ILz7PZrlLR8LITx1PpzTm8M2V3NotxBFPbw6i5WS3ZtxUKeSGwO1Q3HiawvPFF5dXH2+3ilUIs1o+GUAAc/lTrvxTYy3emRRJNeWdkH3C5b97Ju6n8Km0NUO9S6Ha1oEFhaTTRaHcJEuQJhPu8v3Zdv9auaf4U0+4s9MP2a5vlvN3m3EcgVYOcdMGqy+JdE0rSdSttDW7uZtSXD+ewIi4xxVi08SaTILC5um1CCbTlIWGJgI5CMHn86fuXuFqqjYp6NoFhfW+ryCOe+exk2xwRsFLrzz0PPFXE8H6VL4sstNMssMc9uZWh3AurYB2Zx7n8qpWfiPTbjT9VtdR+02q3szXHmWBAdT/dNXYfH1hB4itbn7LO9tb2zWwdseYc4+Y+/H607U0hN1WytrvhyxsvDM9/Fa
/// 3FhOk/lpFM+4SjJ56D0zXFMwDhi3PTFdbqXiHSh4eutM0x765e9kMkkl4QfLwc4X865B0ctwwxWU3G+h0Uea1pis5ZSvB74HNAIVdxB+XgDpRGmxsk5JpZH2kYGS2OnXis3JPY30vYswWGp30TSWmm3VxCDtLxoSM+lKmm6lJK8UFhPPJGdrxxodyH3FMstT1GyiAtr+7ih8zeyK2AeldL40v4rXXI77QNScG7hVphDJyD74+taKnFq9zFylzWSObls763kSO5sbiGVzhY5EwzfQU670+809Ua9s5oFfO1nXAP0rr7zxXF/ZGh6jH5dxqFrugeGcbmcFRlj+VRN4httb0G6iv4Le1+xzpLBDFwGJyGOPxzRyR7mftZdjlH0vUUsReS2Vx9lbpKU+Ujsc1DHG8iFoo3ZEALEDgD3ru547WygutTbxfHewTRME08Dg7h8o69sj8qNK1rRtCsINGZVuFvhvvJ8j90GGAB9Dij2MXqHtZPoc
/// HDFJcThY43d+dqqM5odSMnaSyjpXd6bcaJ4RW7v7aYaheGQrEpIwI/8A9RNNS28NR6w+upexrDFELhbRsfM/Py/mP1odOw3WaeqOFki2SMtwrI6nDI/BU+lQvKrL82ME/KBXV+K9V07xHp0GsxiK3vopRDNCBkuBzuFV9EtLRtE1PzVs2k2BoTPN84OD90Y5NRyKxoqnu8xzil3IwcMvTjrShRKCMkN1Oa09F0ttX1D7MjlQitIcDJPtUem263GsW0EtvLJE0u144I/3gB9alRbehTqxRn7TEFYHdnpir+m6deaxepb2MDSSHqccL9TXbSeBNAttVmNz4giii2EpaykB4mK9W5p9p4fsdKmgl0bxhaW8gQecGbIk5J9fQ1sqcnuYyr9jntS8H3mk2fmXV7ZPLkBYIpdztk+mKrHw1eJq0mn3c9vazRxeb+9k2qw9AcV0viSx0iXRDqLatp02pxSAr9jwqSjI4K5PP41fY6Vr+rafrs2q
/// afE6wqkltKQD8pPOafs1syPaStdHnEltNa/LPE8ZxkBxjI9ahYKyks2Bn8q9H+IFxYX/AIZjiF9Z3UscwMaxuGYDBzz6dK84jisZFzNLKJDkMF6ZrOSUdEbQk5K4+3gnv51hsYJLiUDO2Jck1YfTNUtxGLnTrmHzG2IHjxuY+lUreS4trgtaXE0LL91xxxXVnVI734ebbq9kGo212DE7n944Pf8AWiyYSlJbIw5tK1W1RpLnS7uGNSAXePAGTgVG1td20kaXFu8Usv3FZcF88DHrWpoeotcJqtrq2oTFJbF0UytzvHzA/pWt4c8TWcGjTjVSs9xZ/vLJm6liMY59xT5Y9yeaa6HLTWd5Dv8APtJoxG22QsmNjYzg++KW30zUryF5rOwnmhXrJEmQK2tA8TsmqXMesMs1tqMflyk9FOThufqa1orayuYIL228Xf2ckcagwRcAY6g896OSO7YnKfY4aHTb27w9tbTTKxxuRdwyO31qM208
/// MxS4hkil/uMuG/Kus0LX1t7zXIo7qW3tr3LwkvjYwPb6g1n+Hb+2sry613VJpru5gIFtbSNnexyN30Ao9nHuP2tS2xhGJoLiSOQNHIn3kYYYfhTt+OpGcZGetb3iOaz1e3t9XSdEu5GCXNqem4DBfPocfrTbWOyl8F3shNmtwsg27v8AXEZHSpklfcvnbWqMBnfaC3TnIx0qSB5JpEjSNneQ4QKOtaGg2NhfXPlahd/YtwxFPJ2b3roYvBOjpeL9o8X2JhZwXAIG4dwOaI05PUJVEkck74bDcN0INaF14f1W2tXme1cIqB8gZ4NehXVv4euLa+tW1bRFhaPbb7EAZP8AeOeax7Hw/omk2+oG+16wvzPbMIVVvnU9tvNa+ysYus9zib/S7qyjtjdqB9oiEqBeTjA6/nVHbJEQwVlDDKkr1FehpaaJ4g0TR3vtaiga0j2SwyEEvxgd/at8SaLJYtp95rulXVqTsjRlA8pACBtOeo4qfZpG
/// nt7LY8b8wryM7/pTQx5OOavahDaQalPFbs0loszKkqdx/hUTpBGwNoZGPcP0NZytexoqq3NWx8JT39pFOL+whMoYiOWbDDHqMVkNAsbmPcCVOCVOQa7zw1HpFpolvLdX2ktG7NLPb3cY84dsLzxnFZdr4c0XWWuri31i10m3E5CW90o3cAcjkccmtvZdjJV3uzkm+UjqF/2loYAhUJ2jtu716TrGmaR4gsNOgXxHYQT2CmGSXgCXGPf/ADmrLHwrYWpi1FtJuk2hQ9lGPOB9Tk0vZMPrC7HlygkhRjmlCMHI3KuPU9q2dYTw0Fd9Bmv/ADi3Md1jZj2xRoKQSQ30dytmD9nYxtN0z/s+9TKLW7NfaNq6MYnGNvbo3rUTSHcHByD0ar2mafLqWoW9ihKtI/ls69BS29k19qaWsgNgsj7GklUhUAOM596nkvqP2iS1KTyOx+YYx60rl2IZewya7xvh1p9m1tNqfiezhtpX3KU+UyY7A5pI
/// fA/h5Xikk8U2Z2XPmTDeMFf7tX7OZn7aJwpySg+9uHAXvVnTdMu9Xukgtly7AkZ6Y7musl8G6P8AbZZR4r09IHk3qgGWAzwOvpmp7zwtpR1KW807xbp9vEwHlxFug7g80nSZP1hbHETQyR3ElvcLtliYoTnuKjUbSccY6gVueLYLGz1mGHT5oriIWyM80QzGzjg/nWpp3hDTNQ8M2t7e6i2lXMkjHdOP3ZXJxgcUexlfQr2ysc9caPf2f2R3gdvtqB4tgzuGen1qvICshhkjdJO6sMEV12oT2uh6h4bjh1CLU5LOQmW5gPCxls4+uCa5nWLqC91qe5t2cxO5aNT95hSnTtqKNRtlf+zrhrBrtIZDCrAFsZx61qaN4X1LV4pGtI0SLO3zZmIXPpnFS+F9Ng1TVGiuopBAYS7yW/yrGfVq6fTtLg0u38mPxbpUtozbjBOvy5/76604QT1CdSSOS1TSDo8iQPd21w5XnyJNwFVI5SQVjDZb
/// j7uMmtjxhY6VYagsui3sVyjL+9jhbKxnjnirXh7w7aapoctzeTyaYRInk3c5/dy9eAOKXImxxqJRMn+xbw6T/aQjZrcP5bnH3T71A0M4tldo3WJyQjEcMB6fjmvQbbRbGHwvf6UfEtlP5j+aoTjYQQfX2/WuV1W8hm0PTbKGWJ5LOSVXb+8Ccj+dEoImNVvZGIyhNrA7T3FdD4X8X33hu6IhHmW8rAuhBOPcc1zZBL5zu96lUu3CkDbyB61PM4PQ2lBSjqj6U06/h1KxiubdgySKDwc4qzXlXwn1R476502WQyLIvmIS2cY7frXqtd0XzK55dSPLKwUUUVRAUUUUAFFFFAHz140u3Hiu/wDNdmxMygHkAZrnpJguAx6nsK3fGisvi6/yOszH9awfqK8+o/eZ6lN+4kLWr4a0iHW9a8i5l8qCGJppyM52AVjySbFB61teDNZtNM8QO2pEpbXUDQSELnaD3pQs2E7qN0WdRt/C09pcyaNd
/// TWk9sNojnUkTYPUHJpvg3S9P1Wa4F9G0628TS7UYgscE4/Sp72Pwppen3aC+/tG/unP2Y7WAhXNSeH9T0rw5d3bwao9wZbYhJDHtxJg8Y/KtuUx53yWIb7S9L1Lw/Nq2k29zpwt5RGY7hc7zg8jmucA81kjRVLHChcnk+9dMviWPUvB91Z6xfGe4WVZItydODXPalHZWlwqWN693EQu+QptOT6flU1Fr7pdNyStIt6hYXmk3LwXSRxnapO05zxWvZ+F4D4XvNSvLkC6MPnW8a5yiggEn65FYmqPawXUaWV3LfYVTJ5w69OM110XjbR7vTdRim0lbedrdYVIfPmcYA9u35U48qdmTKVToijYeGdPc2GnXLyHVNStzPHOB8icEgEZ9qTTNB095P7MuZJpb8tKHnRPkg2+ozznH61cs9c0ltR0nXpbwwNp9oYWstpJYgEAjtUGma1okerLrSalJauTIbm0IJ84knHt0IrRxi9jPmk0UtK0f
/// TF0+yk1V5nm1O4MVu8S4CYbGTz3qzd+E9N8Ow3c2tvNdIt2tuhjXBHyg56+9NsNV0a5s9KS/vWsn027acQtHkzJuDY46d6s6t4j0jxP9pt2v5LEm+FzGWi3b1CgEfpRyRD37lM6Lpuj67LpurW1xfzSlWt/JbZhT0zzSXWi6BL4r/syG8a1iRtryHLZYdVrQtvFukyeLbrVbtn8uO2MNsxXJVgeuK4+zvo49aS6uW+VZgXcqGPPtUWRdpl7VtJ0+y8TXVjLemzt45eJNpbvwPxzV3VNI0rTvF8tpPeullBGszAKSWyoP65/WsrxNqEGo+JL27tizRNKpUlewPNdHLqehX3j9b3UW/wCJeiIzfLncQgG0j0zRyxvqLmkh8fhSw1NdKv8ASTJBZ6hI0Yt5Bl8ruJbJPcLxUGq6RZWuoWFtFYXloZJlVjKwIZS2OoJ96tapq+k3OvQ3R1uX7FlkW3ijMYt1wcFSO/8AjUf9uaZZ6Rbacmoy
/// ak6XqzvMQSY03A7QTyehqnGKQrzb2Ni58IaFcalf6RaWdxayWsHmrdM5KZxn19+ntXOaDpVhNZ3ep64JWtrchBs481uemDwOP1qz4o8Uzanr039n6lNHYOAMIxGBjnI71BpGo6Pb2WpaJqV9ItvcMDb3Aj6NyOgoajclOYy9ttIv9EuNU0aB7YW0oS4t5DnrnDZq34T0aw1DSNQuru1lvHt2UKiPtyD+NV2OmadoE+mQX/2yS/nVppBHhVVc1b0XUNKtLPV9Oi1aW3+0GMxTpHzx7UrWNOeVtg1nw1GFsW0u3e3kvn2iylbJBGRnd+GaqXvgrUdMs5Li4ltXjjYBtjn91k9xj1Na0fi/T7D+yY5JptRNjOXku3XBIIPGPbNVLjVdDtV1S7i1Ga6k1IMnleXtCBmznPsKOWJPtJroZlz4M1W3sptQuJLf7JAgfzdxxLnoF4z7VlaVpd5rF41vZPFvQbmZ2wAOuK6++8S6BeeDzoKS3Bkt
/// olMMpJxIeuDz68Vxulmx+1SLfTyQqq/I0a4ycdOtZyjFPQ1hJy1kanhDRI9f8SeTOpWFU3tEp+9g889utXtb8Pgaha2GmaLNYzTBiXe43hgMcg54rI8L6lptpdzHVpLiNZojGk1uxUox9QCM1vjxZb6DHaW1lM+sS25dhJMuMBsAAHn0NWlCxE+dSug1rwnpEWk6S+nytHLcT+TNOckOVBDce5FS+IvC2n6dYRzSW8+mRrciJpS+8XA5ywGeOmauv8QtEltNJQacu+2mMlxCsSkINpHGfciqlz4h0ZLa7GoX1zrFveXSzeU+QLdASTjnjrjir5YGadVPYrXeiaE3hqXWLKG4SG0lQGRycXAyM4GeM5qeGw8NX3he91hLCe1WEEW5aYne2ORjPvVa913RLLwzqen6bfy3KXRD29u6HbECQf0rK1fVYJ9C0mw093At4yZsLjc7f4UpWLjzGUhUeWpXAIJUSHlq6KPw3JqdhpR0hAJruJ5J
/// WkbAUK2Ki8K32jQ2+qW2uBfMmi2QTSR7/KODyD+Nb+leJdI0O4trO3umuYYLJozP5eNrM2fu0oxVtRynJOyRzl34Z1SKS1SEo4uJNkLwtuBPfOcY7VoS+EzY+H725n2TyxTKkPkOTnOQRjirUPi63sryzf7f/aFujv5hS2VAucfNUFpqej6RpVy1pqcuoyTTrKiFCuwKSO/1p8kSXUqLoXdD+H8kkk/9rvCV+zNJtSQ7kfgjj6ZrBTwbqT6X9rje25h85Yt3zFPXAGM4ro9P1zQrHxFf6sb+VhewMqW3l8qW5OTUNh4h0m2SzeC68m3Sz8uWIW43M+Mcv1601GIvaTuVLXwa+qeGdPutPeJLiZWD+a5BbDEdPwrmDbNFq0VlfH7LiTbKzDOPeuhTxDZRzaIwmYfZrktIdv8ACZCf5Gs3Vb/T9V8TveGQ/YGnUyErk44B4pe7fc0jKabbRrXWiaJqWjXV1oLzD7DgSSvkLLkE4Az2x+tU
/// r/R9Pi8FRapaXzTzNdLG7bTxkfdArR8Sanouo2KW+i6hLaWcC5+xxQ7RI3fJz3rB/tWBPAh0xiwuhqAlUBcAJjrQ0k7GcXLe51uo+HNL0vQ4bl9InvGeFZJZ0mxtJHpmqWjaN4a1ZrOwt/OlvbiFpJJlJCwEdjzz6VPZeJtE0/zNQt725lR7UQfYZMsqt68moItc0CDw7b2mm30mm3LjF1LHbgs5/u5zkc0csb3E3Ui9CPwz4Wsrq+kt9Sl3mRpI4IgSpbbnD/TiuXvbf7LqFzAgZjFKykAZzg44rrvDvjew024t01CxjnitVZI7vaDK3Jx1+vrXM6hrMi+IZtV02NbaQzNJEdgPGPSlNRsbQdTW6M/zFVTE0exs/ecEY/CvRZPCNhpmn2zf2JJqcBi3XF7HPtKZ9FzziuA1DV7/AFq6F1qknnSLtVdoCD8hXU2/iDRY7m1u9P1K+02KDaZrJMskhU5Oee/SlFRCq5OKsjEsfDEmox/a
/// IriCG3aby4EnJ3H2wAcVVn8N3+nWl/LMIpDYzCNhuIzu9PyroLPxNpyN5okewZ75rjENurGWPjC5zxRqXibSdU/ti2mu5rZLp45Y5EiBZcE5BGfeq5Ib3JU6i1sU4fBWo3E0VvC1vF5tuJ1lZzgLweePeuk0/wAF2UOi6Q1xHFdXNxetG8iSsFkXDHgdugqg3izRJbxrZpLk2hsltxLswVxt5xn2qfT/ABboOk6RpFmk9xc/2fdGeWRo8FshhkDP+1TUYrqS51JO1jjtdhFnrd5BEnlCGVgiBtwAB6c11w8K2UvglpzH/wATaC2F1M2442MSRx9BXOT39neeLmv5lY2Mtz5jAD5iu7OMV183xG0r+0ri3OlrHp7xeQ0w4kZcYAx3H41nTS15jScpe6kjm9M8Jajq+gf2uJ7cRDdlZW2sMdl+tPfwXqqJIyzQCRIfPaCNtzFfc9P1qvc6nayeG7PTwJz5c7yOhHVSRjnPtXU/8Jj4et57
/// oQSSJazWnlfZkgAAbHUnPNXyRI9pU7FLU/BCT2GjSaS1tBJcQq0nnSNulY9hwayv+EWe+8O20cNpDHfy3jQSSNMedu7IIPHatFvEGhXZ0KeW9nhl0xVWVFhBDkdgc8UWvizRZbW3/tGB5ANQkuCjIDwd2PrjNVyxI559EYmoeD73S7KS8a6gngt38uRIs5QnuSQPTtWGY4y+D9412Wp+KdNn8P6rZR3ck73Eq+Sn2cRrGAfbrxXHllCqxHJOAPbHWsKijc6acptXkLtx0pGXblyOAOCaQybZCpHQ8/T1pjOrBXcYHVc1koxLuy/punJqVuzR6ha2zA7dkgbcfpxWcdyzTKeeSp4xjHeup8MXWiWdlcz6s6nUA/7ovF5iouOoB4zVq/0zQ9Y1ea9sNaQq58x4vIbjJ6Hit+S60MlU5HqcX5ZEecE7mz1J3fhUg+QB8bVUkHJxj2Fdaw0u38Uy3lvqltZCCbasUkBIK+wxTYJtGk8eXUss
/// kT2kvz24aIsjv/ENuOOppezkP267HJblUYYAA8D0xjOKMAlfLXD4zgdMV6Yx8L6N40muL6WyMTxqz2bREiIkDkDGKpa1b+Db7XJ7xNRgt0njTZCkbLhQQSeB7Gn7JvqL26TvY4mztpry5W1jA8yWRVy5wOTx+taOp+F9V0l5xdwqwtyN8iMNozWvdaV4ZEkT6brsUUkcwkBZHO5cDAzj1Bq7rniXTLzTvEEME/nC5MTRMFxuIAB/lR7O3UTrOTVkcdbafFfWXnPqFtbOTtUS7y34YFUCrySFcbdhKFB7fxV1PhW/8P2lo82qy4v9wEPmRlwAOvHT0qXWbXQNS1aW9tNcECzEs0X2ZiQSenApuOlh+0cZ6rQ5u0v7rTHjurG4NvMAQJF7e1asnj3xJdKIzqCqGUhvLjCMT7MBmtGa28MReJPtcWsRLaHbvtTbucEDB7etU7KytdY8fm2sYGuLO4uS0eAVUJySfbFJKcdglUg90c/dTS3M
/// zzXbtJK5+Z3Ysx+vrV3SdFutXhuZLKSMG2QySbhjgD/61dfZWnhXw34tmuLnU4bqOKRkNtJAfk7e+cU7WtV8NTeIJ9R0nUY4Y2s2ja0jiK+adp5/WqUXe7ZLqJ6RRxV/ptzYSJHeACaSMSAg8FSSM/pT7rSkitDLZ6hBdlcF0iRsoPoRirGuanDqLacw3F4rfy5ffDE4/I109lr3haysWsbS5kghubZoZQ8GWLH+Lf149KmMddxyk7bGNB4I1NrZLi7eGxgkX5TcPguD9M1n3eg3NtpEepF4prdpmh4PVsnp+RrpoL7QfsFxp/iHxEuoW5TFoTC26A/XGaqk+H08MjTpfEIl2T+eNtucgYIwP++qqcE9iIyadmcdK4XowVh/CeWFaR0K/juNPUFJH1CISRBWwQD2rpZ7fwpdeGQlvqccUiBCZWt/3hwMHn3psl3o1qNE1K31pLl9NISSNYiCybiePfBqVAt1LbHGXdvLa3ktvMoWSJij
/// AHOCKIUlnnjtlfbJIwVc981e1K7tLvWrq7BZIJ5mkQ7ctgnPSqcs0SzhreWQ4IKsRtOQahR1Ztz3ijSn8O6vYypDdWPlO0ixqpcHczdOfTijT/DGq6jqtxp9qircW7lZC7gBBUmueIZdbi0+c3ErSxQDzAzEAMrHB+uK1dV1LSNYkU/2k+mvLBE9w8EOTI/OcnitLJGLlNboxIfDuozz3KQWwmezcJKpP3Sc4+vQ0kfh2/aS5XYlu9mFM8rfOFBHA9yRXQ2XiqytPEqulxLLbGz8iebZt81hnBI9c45ql4Z1m3tf7R+16nNZXUy4jmILAjuCO/tSSVwvJrY561hiuJlieaOFJchJpAQAfoBnBNOv7IWk0SR3cE4ZcP5QPX05AxVnS5bWHXRNeagsKLuKTOm5WbBw2PrW3rN/4f1X7Pby3cUV7HHuuNQSDCOPQKOvahwBSdzlHUrEsjRFQzFEfccbhSK5jTa4B3HBA4NdXInh+bw/bafJ
/// 4hRnhlaVWa3JDBsYAGPatW31vwrBYG01e3j1Ajjdb2wjYD9Oafs7dQ9tfoeeOfJJZmYEDoVzmtu+8J6pZaRbajcxxLbytgiJ9z8/d3Dt3qHU5NN+3o+jxzRWvVlm5YD25Na39raRayajcrql3Ob23ZPsxjwoY9GzntUqF92DqO+xiano8+nXIgndWu2AZooyf3QxkDJwDxTrbQry91CCwt4SZ5YvNCk48wEbhj8K3tRvtH1O8083mqXFzpqgD7K0eGjCjoTnJyRRf+MrS6gsrm2iZLzT7ovCQMZiOSFP0GBT5EuolOXYzj4F1+BS01oqEAkKzqeg3Y4744rLn0y5XTo7ySARQTOyhmPOV68fpWhqfiaZ/FH9q2U0ilWWQLuOMkDcP507xTrya1qED2iFbWKMB4wcAufmY4+pp8sQjOd9UYQb92V25z3NBYbSWx1Gff0Fbcen6NKsUkuvC3dxgwtCTg/hmpJ7fQYdBkt7PVYp55LlCHaB
/// gQoByOR71nyPuaupHojBDb5h94yIc4Q8kjvS3N1LcTGW+kMm453EdvSr0WnG5huZ7NjcLBKIy0akdc8n8q6GDw/pieEre81l5dJkFxiSZlLGZeeAB07U+R9yXKK1scbOHDjJAUDIBbPH1pNw4IPB7+teg29x4MtbK5SWa2uISn+jlYCJM+pbGa4eJbZVJuPNJJO0hAc/rScWXGp5EujWN5d6iPsLNHKimQODtEYXktkc5wK3o/HEsNiI7h7qR1V1aUTNl29cHpjis/w3PBYas8tzez2MYR/LmVMhWIIBIz+lS6fqtpYa1PdXUEOtI+V8yYcEY9CKtaGUk5MI9G8R+IYlvFV7xQ3l73lB9+M9OtZF/bTafMYLlFR1PKg7s+9b/hjxGmn2WsW0pMUd5bs6eXxskHAx+FVPD+v22kTzzatp6X/nx7FMxyR71MtdmVFuPQoW+s6hpiEWFw0CM27A+bLdM0640fURpceqlTLFcybN4xuZ89/y
/// NXPDutafpkt7LfaVFeJKm1A/Gzn/APVV3wd4hs9PvrkapGWs9haKPssn8JA+macVpqwlvdIiOla/pFslxEywp5/k54OHIz/9aorrR9f1PWvst4ZLi7SPcQzggrjd8vPpSx+IPM0vVYL+SVorn94iE5xLuBB9uKlh8RIl7oN8JmF5agJcNj7ybiMH1+Xir5ezJ5p9UUY/Deotqtvp6QLBcXAzHvfhOep9OlJqFheeH9SNvdRLFcxLklWyjA9/pWlNqdrqGsasZb+W1gunBSdU3MqA8qOePSs3Wru3k+xW8F7Nf/ZomBnmTBIJJAPJqXBWvcfPK9mhr+IdUurdrH7e3kpwVjG3cP60mm6Rd6ssv2GNnZI9/OBnH41Lrs9kxsTZCFFW22yhF6v69KtrHosiRy23iNtPfAEkaRtz7cVOpSsUI7i70jUGgST7PLG+11IyM1avtZutR8tLu4eXb91WYlR9B2q1dyaPFokkS6ql5dSXCstwYiCB
/// g5/nWSunObW7uImeaO3lWNpVXqGzhsde1U4sI1EnqhzRo8Zwu5um4mlER2/eyB8u3NbmnaNps/h1LvUbmTT2STaJDGW3jPUDrUGtroqQRDSZmnk3FncJt7AfzBP41DT6h7SN9DJjhZl4I4PNDpsxk89sdqIXRY3znJqNiVCgeuCfSstbm8W/kdZ8Py9p4stmRv8AWDaR9SK92rwr4fxmbxZAuSdmSPwIr3Wu+lex5uI+IKKKK1OcKKKKACiiigDxr4vaQbTVrfUYUVIrhSjMB/GOefrmvOWWXb97PsBX0t4i0Gy8RaU1nqMZdM7lI6q3qK8E8SeGNT8N3cqX0TralyIZ05DDsDXNUjZ3O7D1VblZhBcnEpGMcc03Y/ITBXOOtPWAZy+Megp2UjOOlckvdeh1yd9ENiZBuVjtboCvT9acu0j5V69hjg+tK0aOp/nTY0RW+Vsn60czJtGw7cj5cLllHy8DmmbYmKKnQD5h60/Cx4A4zQIl
/// DZFO8h3Q1E2tu2/MeSM0rLuIbHK9M96dtUNknnHc0FAWByR+NK0txaCfMmG5JHsP0qJihXlcuz4UhRgCppmPlmoCw8pFXr39qFKRcUlsIxbf86gEdPcUodmYliQMfw+npSMSQwflj0pYhsyrZ+bind2L1XQQYAAO08jt09alCIfnUbgeoIpPIX3oEbBGAP0qbt7Gb5ehIg+b/ZznFR4k4wMA5z9aVfkQeYxB9KBN2PA9atKVriu07WFjXbgH8Tnrz/hUsm0ufK6Y+Uk4I/Ko8ADcWOKfipTkxN33Q8KiwKDy4+9zndThsbbzjC/3RwaixznP4U4DI46+lXqJbj3aMIFhXaT94kcULgqp6E5yAOnPH6UzYfSnpsaRsFlUdOKG2V73YZJkSYUKF/iBHWlYgRkLjHYYH5VBLNwdrbm96YJsxkH72KPeHr2HrhlGUAJPIxwv0pjMhYluWzwD2pBLtj+b71Coph3d8ZqOZrcEu4H5SQSu7vgc
/// EULIqqMDC4xtX+dIsRbDEjB5okRePLGfpT5ruxVo7Dsou3Jyc8kdcelHy5ZsjaR97HKj0qJkKfeGKFEgOdpx/On7wWRMWjUgjOcYACjJp6DCHO7HvSIyyY6ZFIzOW/dHIHX60k5dTPR6IkjZTx8yntkZ/nUg2hWG4HnPI61XXzSw39KlfEeNx60e9fQrpodX4Z0HS9T0q7vdR+1E25VVS3AJOc/4VT1+DSbRYPsMF7CCDuF2MFvSrvg/VI7Xw/qNuNTSwu5pA6NKnVcH0FRXeqT2t/Hc3V7a6zlSojMfCe+GArpsranI3U59ihpugahqduby1tzLGGCmVHUAn6HmpJfDGsWkcklzZSLFFl5OVJXnHT0rSk12J/B3kW8y2d294HcQKVAUE56cVfuPEdpPr+uyPfu1nc2PlW+QdrNtAOPfINLlh3GpTvsc1/wj+qNZteC0IjZC65ZQxUfxbeuPetLSfDun6ldaPDKtxD9sjkdyhG1iuf8A
/// CtHT9WsbUov221MH2ExlXMjzbimMc8AZpmk63p8F54eknu9n2OOdZgEwAWzgdPen7OC1uTKpUbtY5CO3Fxdtb2kbyytIUiHHJ6U6bT7iG5FpcQstyCI9g5Y0+ylC6lC3mtArT/NMgwUG481YuZ4H19WFzLPAk2HnzhmTPJzWdoN3ubSc10C78L6lYQme+h8qPzFEjI6krnscdK19e+H91a3sv9mRSzWgjV871JHA7de9XtQ1bT/7H1eBby2YXUsb24QSMxUNn5y3f6Vbj8R6XB4pm1l9W8y2e3EYtkWTJfbjGCMY4NackHpcwdSb6HK6J4R1HUp7UywYtJpQGbeqttzyQM5o8S+FZ9NvtTl02Jm0+xlVJJpHHBIHGOvU1v22uaZc6lpF/JqYsksxiaDY2T8xPRRjuKsan4h0bVLDX7P7csX265V0kMZIIAXqMZ7UvZw7jVSpexzmieGRcyTprEckLG0+0w7W4YYODx9Kz18Kaw8McxtV
/// LMrMqGVAzqO4XOTXVT65pAviYb3ei6ULQOqtguA3bHuKdaeINCstSsZIbxY7dIGSRZ0d5N+DwCQeOR0qlTh3HKdTsctp/hLVdTty1isVwnlhmCTpuA9xnirF94b2WOmPHD5M00bGSSeZAkmMdDn3rYstQ0TTvD6waTrSWt1cKTeSNCdw/wBhfl+tSQ6h4c1CPQ7TW7nNvZwyFx5b/M3y7QeOnX8qOSC6kc1TsUtD8AXE2qW0esxsltcRsyeXMpDEDIxg1j3fhjVbTLG23o0/lxlHVsdflODx0711lt4h0+38VR382tq1jGjxw2ywsohGMDHy+1Zela3pf9nfZr65lbffLM4BbdsBYk5FDjDuO9Tcxn8Mapa7bm6g22qSKsuyVWZSxx0B461o634Mura5lm021eW1jhWUsZFLqNoJOM565rd1HXNHXRNTtLW9hYzypJbokbk4DA8sR149ajfWdK+2Pqg1lifsXkG2Ct8z7NuCMetHs4b3
/// Gp1W9jH0zQre+udCheO5jXUg5kcv129PpWbq3h+60gO9xbkWpm8tJN4OT6HB61saXrlhar4Za5usNZecLg7W+TcTjt70Xt7YJ4ensLC/XVJ7y9EsasGygxjI3AfNU8kO4RqTUtUckQCAdpYt8u0d/pWpP4b1SGJ3ltd4iAZ0V1Z0B6EqDkVFHpV/byrP9glKQ/MQecD1z612ereJtPEt7e2uoQiO5hVfKjh/fZGPvHHapVOLe5c6j6I5YeFdX+zi4+x7VZPM2713lfXbnNSXnhOa30PTb+Nlaa8VVMfmjILNgYFdUniTSJI4ftupRTQJbbAQrLcBsDjKgDFc/dapp6+GdImsrtTf2E28wSKxIG8sMccnmteSMdCFOq9kXLfwZaw21vDeRXkzvJsd4pEREfrhd2CSB9aqWHhexu/GEFgsss1jcoZIm4DEDI+bHuDWsPEumah5FxNcQjyGMqJP5isshznIHHUk1l6RrVjZ+NbS6afyrK3j
/// ZAVVjgHJxzz1J60mo21EpVbmRqfh6/0wI8tu3kSTeUrK6vuOenB4P1q7D4e8R6XbyywRXFsQu9xbTjcq+rAHNWtP1ywh0ORLiZ53XUxcxIFJyoHv2rXs9a0fTde1PVk1h7mO7ibbblXJ3H+E5GABS9nB7Mpzl1Rmar4I1GW30y5tJPtt5qSkv5ki5Bxng/nUVloPibTlDWEaRlWKtJvi4bpjd1rc07xPpECeHpZL8K1irpMmxjgMvUceorDm163bw3eW63YE0t9568MN0e4nOfXkU7Q7k80+xlXGha7d6ndi8hb7TEczvLIBtJ/2mPuO9PtdAlhvb621OGQS29kZ4xG6k4xw2e4rorzWtEv59TnivsTSLGITOHaPhVzuUd+D1pt5r+lvq0ky3KSBtFa1MgTaGk9PanywtuJyn2Oc1fSY7Cw0u5tpCRcWwlmDc8kkcflTbTwvq19bC6trUsjk+VvdUMhA7AnJrQnu9I1KLR7We9aKOG0M
/// cjKpyr5JC4xz1HNaEd/pOpafpZn1iSzawV1lRQwYjJIKkDrUqML7lc81FaHOW+g6rfQNPBbrEok8rfM6x5b0+YjJq/pWgeIknvE0+Ge1aBQZx5ojI9DknkcGrtxqVjq+iWVn9tjsntbgykzB28xOPmyAfm4rauvGulXCa5GJnU3FmtvblUOZNu7JJ/EVXJDuOUpvoc0PCviuO5naOLbLcLvLJOv71epOM81kw6xqlhbvFBeSWqkbQIztC9uT1ruNP8W6Zb6ro9xPeOUtrLypwUOFO0DA455rjo7my/4So3U/zWTXBbJUEbc/3f8AEVElDuVGUlujJMjSMZHmV2Y4Zs5JPc5NIQ3VBuXruYZrWlhsL7xUqwsq2c1yFIK7AIy2M+groIfAc58RSRXlpJ/Ze4iOa3lB+X+E9az5ZN6bFyqQ+ZytnbxXFw8c90sKD5g+0kk46cD2quocSBI13Fvujk5r0C70rwRoGsRq+oXkkkRDlUUOmfQ4
/// FHh/+zrjXr+Wx0+4+zSbfs04iG2P1zv4HNWqbXxMzVXsjgUQSSKijYztgZxyfT2qze6Vd2xVJoYgZCVUCVW5z7HitjUNMbWvEtwNE05zD5x+cDahOfvZ6c+1XWu/D0l9d6ffWxtoI5D5c9sSzuynB5bPHejkj3F7STexlTeF302YLrOqWtlI6BlRlJJ/IU608J3N/ZWlxZXNu0VxO8aEdVIB7fQVv3F/4PvrE2d9qWoXecBJZYFLw47Btv8AOo/7W0Swh06y8NXM0ssN2J2e4UKMYIPp1p8sO4c0+xxNzC9ney27YDxsVZzznBxnml+xzG0+1LDI0avtEjdM9/51oo2n3fiq5k18lbWWWRma2JbbnJH611Nve+DV0OXR47vUZoZnEiOyDdGc44OO+KlU3fQ0dRJLQ8+DeYW3lVJ5+U9D6U/yl3MPmYn5uQM12mveH9P0/wAN/ZdKt7yedrlX8yaEE8Dp8ozjmoNL0PTbPQ5pvGMM9m8j
/// KIJI2/eHrn5T26dqfI7iVaNtTkEZMttXKDqMjrTX5QEoytjAYjOfzrstSg8N6b4buY9O+2zTXqgwPPAAPlIzg4964x9ygZYsvO0Z6UpRaehVOSe4qhM85Hy85AOTQDg9gCcnHOPpTAwpcr61PLM3tAkO5JEkUlSrZUgYIGc5471LdXk9zM808jySNxmQ5OKhV5NvUbR0pGfectj0qVzPQlU43uAdiBuPfkZ6im+20fM3PH3RRuXIyeM0fL52N/HrQ7p2KtEcVYoWjI7k/wB48+tKiI27y9ykjHNNyigrv/LpSrlPut+IpLmeguVPYaVEZ5UZAwB7+tKGHy+g6qB196U5Zsk80mMCnyyH7ND7WZ7SaOWFgjxtvBCjO6lubmW6uHmldnlY7t54JqJSD0NLgZ+Y7R2zTtLcOWJoafruo6QzHSrqSAOAHHXdjoaW/wBZv9UZft17POF5Cs3AP06VnBXb7gyKNsifMwGBT57aMXLC492VgPkD
/// enYigSKvEm5jnqpNIUAiD596YSTy3HpU890HLF7CmQFsEts9B/XNKzRB1x8w6HIxilHkhOuWNRnO7GOKOYFBDwysp6AfeAx39KC77vmKyD0x0pAB2pKbuiuRDWO7G18+3pQAwUg856U8RgRl/wAAKbjFLmYuW+5Iz7sgfLkg596ZjO75uvUmilxS1exfKkKCMhWXKg8U7ChT5hYZ5UJjH41H2zQrrtbee3y0/eSuQ1FAVAyCcg85XjBp8Yyf4F5znHP602Jo2JD5BPSlaFwPlAb8aXNZ6i9wnIPlcIS4PHPGPerumarf6Tu+xXUkAkH7zYcg46dazUjl43Zx7GrBIUctjPejmlchxRcudWvdTQfa7qWdlbK7jkL9Aaj6IcjJOMkjp69KqorRuCr/ACnn61Zbd8q92FWndalJRQ6KPKuTxgdqI0Dq3HbgVGokXKyZ4+9trq/CHgu+1+7Ezo8NjGwy0nG8egqOVtkzmoxOo+FOiv5tzqt1
/// CVyoSFieCD1/pXp9QWdlBYWqW9pGI40GAoqevQirKx5cpczuFFFFUSFFFFABRRkUZFABVa/0+21K1a3vIhJG3UGrORRkUAeV6z8GoWZ59FvWjIOVilXcB7DpXE3/AID8SWE7ltMmm2n5WjG4MPw6V9FZFGRWMqMWbRrSifNP/CM6/wAn+x71c9R5DH+lJ/wjWvf9Am8/8Bnr6XyKMip9hEv6xI+ZG8Na8xy2jXp/7dnpyeGdeC8aReD/ALdnr6ZyKMij2EQ+sSPmj/hF9ek4Ok3f/gM9OfwtrxXjSLzjn/UNX0rkUZFH1eIfWJHzP/wjPiL/AKAt9/36P+FA8J684JOkXgPvA3FfTGRRkUewiNYmSPmf/hEdeA2nSrs56HyG4p6+E9eVCv8AZN4cjr5DV9K5FGRR7CI/rUj5pfwnr7Fc6Vd8f9MGoPhLXTknSLv/AL8NX0tkUZFH1eIfWpdj5pHhHXCM/wBkXf4wNSjwvrwwo0i7/wDA
/// dq+lcijIo9hEPrUux81f8IzrxOP7IvP/AAHanf8ACMa7/wBAe9/78N/hX0nkUZFH1eIvrMux82N4V11iP+JReZH/AExahfC+uxtn+yLzJPaFq+k8ijIo+rxQfWZdj5tbw1ruCf7IvP8Avw1C+GNeCj/iUXn/AH5avpLIoyKfsV3F9YfY+a/+EU17eWGkXYz/ANMGpw8L68OukXZHtA1fSWRRkUvYIf1mXY+aj4T15nJ/sm75H/PBqZ/wh+vf9Au8/wC/LV9MZFGRR7Bdx/WpI+aP+EQ8RbsjRbw+h2Ef0qVvB3iUKCNJuiT1+Xp+lfSWRRkUewiJ4mTPm0+DfEbR4fSbr8UJoHhHxEBj+yrj/vy1fSWRRkUfV4i+sSPmweEdfL5Gk3O7/ri1A8K68rEnSLvJ9IWr6TyKMij2ER/WZdj5u/4RjXf+gRef9+W/wo/4RjXf+gRef9+W/wAK+kcijIp+xXcX1h9j5vHhjXCmTpN4D2HkN/hQ
/// /hjXN3GkXh/7YtX0hkUZFL2C7j+su2x83f8ACMa7/wBAi8/78tS/8Izrv/QHvP8Avy1fSGRRkU/YruH1h9j5w/4RrXdwP9jXnAx/qW5pP+EZ10HI0e8/78tX0hkUZFL2C7h9Zl2Pm/8A4RrxATn+ybvb6eS1C+GddDD/AIlF57/uWr6QyKMij2C7h9ZkfN58L67tB/sm8+nktSf8Ivrv/QIvP+/LV9I5FGRQ6CYvrD7HzefCev4BXR7o5/6ZkUo8IeImU/8AEmucY/ukV9H5FGRS+rx7h9YkfOMXgzxGYxjR7heehFPHgrxGTzpE3txX0XkUZFP2ERfWJHziPBHiRSf+JTOcnPIpx8E+JCykaVcD14r6MyKMin7CILESR84zeCvERXDaRcEey1Gng3xIHLNpN18vT5etfSWRRkUewiHt5HzevhLxGX40a6xjrsNJ/wAIj4hCHfo9197j92TX0jkUZFL2ER/WJHzY3hHX2Lj+ybrnH/LF
/// qcPCWvhNo0i6HuIjX0jkUZFP2C7h9Zl2Pmr/AIQ7xCeumXmO/wAj0p8Ia8i4Gk3QHceSxzX0pkUZFHsV3D6xLsfNQ8Ja2Dk6Nd/hC1KfB2vtyNJuMdswtX0pkUZFHsEP6zLc+aW8Ia8QAdKu+P8Apg1H/CH69ksdJuznt5LV9LZFGRR7FD+tSPmn/hD/ABBs+TSLo89oiKU+EfEuCp0e854Pyf8A1q+lcijIpqjFCeJk+h81J4S19OmlXf8A34akPg7XpM/8Sm5/GFq+lsijIqfYRB4mT6HzSvg3X+v9kXIPT/UtTv8AhEdfXP8AxKbnnr+4avpTIoyKr2KXUX1mR82DwdrxXP8AZFz/AN+WpP8AhEPEIkQro10cDGfLIFfSmRRkUOkn1H9ZkfN58H+IlYFtJuicf3KIvBPiLayjSbnBHda+kMijIo9ku5Ht5HzivgjxKowNJmx9KafBXiVGQjSJzyc/L+NfSGRRkUexQKs0fNx8D+JC
/// vzaVMOP7pNaEWg+KYtN+yL4eZ1II83Lhx+uK+gcijIo9kkEqzkrM+b4/BXiWNQp0e4G45J64qT/hDPFGMDTboD0BIr6MyKMij2SD2ztY+cz4M8UYwNNulHsSKQeCfEo/5hM/5V9G5FGRR7JC9q73PnAeBvEocsNLuMnrxT/+EN8Sbsf2PP8A9819GZFGRR7JMft5HzkfBPiXdkaTMPwpD4J8S/8AQJn/AAFfR2RRkUeyQvas+cf+EL8Tplhpl2T/ALx5pjeDfE8xiL6VdMR/eycfnX0jkUZFCpJDVZo+b08F+KCuDpt1heAD6VEvgPxGGbfpNxweMCvpXIoyKPZIft5I+bl8DeJI1Ji0mfd23CnSeCPEbxgPpE49dor6PyKMil7GIfWJHzb/AMIH4kyMaVPt9CKc/gXxK7g/2VPjGCMda+kMijIo9jEf1iZ83f8ACCeJAyldJn4PORTf+ED8TFpD/ZEvPTIr6TyKMij2KD6xPqfNX/CB
/// eKyMjSJcU5fAvioYP9kS8V9J5FGRTVJIf1mR82p4H8UG48x9ImHHQClPgXxMEYDSZzubPSvpHIoyKToRZP1iR81HwN4n4H9jzg+uKkk8D+JSxP8AY9w3vX0jkUZFP2MSvrUz5ti8FeJASRo9yMDuKbH4I8Tpvc6ROSegIr6UyKMip+rxF9Ykz5t/4QbxOPmGlXG70xSf8IN4jILnSLnPpivpPIoyKFQig+sTPmz/AIQbxLtTGkXA+bJBHSl/4QbxMZH/AOJTP1HavpLIoyKfsIh9YkfN58EeJS0oGkT/ADDjiq7eBfFGBnSJz+FfTGRRkUexiH1iR80L4F8U440ib8RT08C+KOd2kTDj0r6UyKMij2ER/Wpnzb/wg/iYQ8aRNuBz0p6eCvEzKCdJuAfpX0fkUZFL6vEX1mZ83DwH4iMjFtJuOvpSSeBvEYR1XSLg9OdtfSWRRkUewiH1mVrHzgvgjxGHBGkT/dx0pIvBPiY7w+k3AH0r
/// 6QyKMij6vEFiJI+cE8E+IwT/AMSi43Yx0p48EeIzEFfSZ+npX0ZkUZFHsIh9YkfOf/CFeJlTCaTPkdDitnR/hjr+oOP7Rh+wL/edg+fwFe55FGRTVGKE8RJo4PR/hRpFjJHNfvJdzRnIGdq/lXcQQxwR+XCu1F6ADpUmRRkVskkYN3CijIoyKYgooyKMigAooyKKAGeVH/cH5UeVH/cH5UUUAHlR/wBwflR5Uf8AcH5UUUAHlR/3B+VHlR/3B+VFFAB5Uf8AcH5UeVH/AHB+VFFAB5Uf9wflR5Uf9wflRRQAeVH/AHB+VHlR/wBwflRRQAeVH/cH5UeVH/cH5UUUAHlR/wBwflR5Uf8AcH5UUUAHlR/3B+VHlR/3B+VFFAB5Uf8AcH5UeVH/AHB+VFFAB5Uf9wflR5Uf9wflRRQAeVH/AHB+VHlR/wBwflRRQAeVH/cH5UeVH/cH5UUUAHlR/wBwflR5Uf8AcH5UUUAHlR/3B+VHlR/3
/// B+VFFAB5Uf8AcH5UeVH/AHB+VFFAB5Uf9wflR5Uf9wflRRQAeVH/AHB+VHlR/wBwflRRQAeVH/cH5UeVH/cH5UUUAHlR/wBwflR5Uf8AcH5UUUAHlR/3B+VHlR/3B+VFFAB5Uf8AcH5UeVH/AHB+VFFAB5Uf9wflR5Uf9wflRRQAeVH/AHB+VHlR/wBwflRRQAeVH/cH5UeVH/cH5UUUAHlR/wBwflR5Uf8AcH5UUUAHlR/3B+VHlR/3B+VFFAB5Uf8AcH5UeVH/AHB+VFFAB5Uf9wflR5Uf9wflRRQAeVH/AHB+VHlR/wBwflRRQAeVH/cH5UeVH/cH5UUUAHlR/wBwflR5Uf8AcH5UUUAHlR/3B+VHlR/3B+VFFAB5Uf8AcH5UeVH/AHB+VFFAB5Uf9wflR5Uf9wflRRQAeVH/AHB+VHlR/wBwflRRQAeVH/cH5UeVH/cH5UUUAHlR/wBwflR5Uf8AcH5UUUAHlR/3B+VHlR/3B+VF
/// FAB5Uf8AcH5UeVH/AHB+VFFAB5Uf9wflR5Uf9wflRRQAeVH/AHB+VHlR/wBwflRRQAeVH/cH5UeVH/cH5UUUAHlR/wBwflR5Uf8AcH5UUUAHlR/3B+VHlR/3B+VFFAB5Uf8AcH5UeVH/AHB+VFFAB5Uf9wflR5Uf9wflRRQAeVH/AHB+VHlR/wBwflRRQAeVH/cH5UeVH/cH5UUUAHlR/wBwflR5Uf8AcH5UUUAHlR/3B+VHlR/3B+VFFAB5Uf8AcH5UeVH/AHB+VFFAB5Uf9wflR5Uf9wflRRQAeVH/AHB+VHlR/wBwflRRQAeVH/cH5UeVH/cH5UUUAHlR/wBwflR5Uf8AcH5UUUAHlR/3B+VHlR/3B+VFFAB5Uf8AcH5UeVH/AHB+VFFAB5Uf9wflR5Uf9wflRRQAeVH/AHB+VHlR/wBwflRRQAeVH/cH5UeVH/cH5UUUAHlR/wBwflR5Uf8AcH5UUUAHlR/3B+VHlR/3B+VFFAB5
/// Uf8AcH5UeVH/AHB+VFFAB5Uf9wflR5Uf9wflRRQAeVH/AHB+VFFFAH//2QHoJlBFUmhkR0ZUWlhRZ1RtRnRaVDBpYzNGc1JHRjBZVk52ZFhKalpUSWlQanhXYVdWM0lFNWhiV1U5SWxaZlFXMXlYMU5vWlhKaFlTSStQRVpwWld4a0lFNWhiV1U5SW5CbGNtWnZjbTFoWDJsa0lpQlVlWEJsUFNKSmJuUTJOQ0lnTHo0OFJtbGxiR1FnVG1GdFpUMGlRM1Z6ZEc5dFpYSmZhV1FpSUZSNWNHVTlJa2x1ZERZMElpQXZQanhHYVdWc1pDQk9ZVzFsUFNKamIyNTBZV04wWTIxaUlpQlVlWEJsUFNKVGRISnBibWNpSUM4K1BFWnBaV3hrSUU1aGJXVTlJbkJsY21admNtMWhYMlJoZEdVaUlGUjVjR1U5SWtSaGRHVlVhVzFsSWlBdlBqeEdhV1ZzWkNCT1lXMWxQU0pwYm5SeWJ5SWdW
/// SGx3WlQwaVUzUnlhVzVuSWlBdlBqeEdhV1ZzWkNCT1lXMWxQU0p3WlhKbWIzSnRZVjlrWVhSbFgyVnVaQ0lnVkhsd1pUMGlSR0YwWlZScGJXVWlJQzgrUEVacFpXeGtJRTVoYldVOUluQmhlVzFsYm5SZmRHVnliV1Z6SWlCVWVYQmxQU0pUZEhKcGJtY2lJQzgrUEVacFpXeGtJRTVoYldVOUltUmxiR2wyWlhKNVgzUmxjbTFsY3lJZ1ZIbHdaVDBpVTNSeWFXNW5JaUF2UGp4R2FXVnNaQ0JPWVcxbFBTSmtaV3hwZG1WeWVWOXdiR0ZqWlNJZ1ZIbHdaVDBpVTNSeWFXNW5JaUF2UGp4R2FXVnNaQ0JPWVcxbFBTSnphR2x3Y0dsdVoxOTBlWEJsSWlCVWVYQmxQU0pUZEhKcGJtY2lJQzgrUEVacFpXeGtJRTVoYldVOUluTmhiR1Z6WDNSaGVDSWdWSGx3WlQwaVJHVmphVzFo
/// YkNJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpWjJWdVpYSmhiRjkwWVhnaUlGUjVjR1U5SWtSbFkybHRZV3dpSUM4K1BFWnBaV3hrSUU1aGJXVTlJbTV2ZEdWeklpQlVlWEJsUFNKVGRISnBibWNpSUM4K1BFWnBaV3hrSUU1aGJXVTlJblJ2ZEdGc0lpQlVlWEJsUFNKRVpXTnBiV0ZzSWlBdlBqeEdhV1ZzWkNCT1lXMWxQU0p1WlhRaUlGUjVjR1U5SWtSbFkybHRZV3dpSUM4K1BFWnBaV3hrSUU1aGJXVTlJbkJsY21admNtMWhiMjVzZVNJZ1ZIbHdaVDBpVTNSeWFXNW5JaUF2UGp4R2FXVnNaQ0JPWVcxbFBTSlZjMlZ5VG1GdFpTSWdWSGx3WlQwaVUzUnlhVzVuSWlBdlBqeEdhV1ZzWkNCT1lXMWxQU0poWTNScGIyNWZaR0YwWlNJZ1ZIbHdaVDBpUkdGMFpWUnBiV1VpSUM4
/// K1BFWnBaV3hrSUU1aGJXVTlJbVpzWVdjaUlGUjVjR1U5SWtKdmIyeGxZVzRpSUM4K1BFWnBaV3hrSUU1aGJXVTlJbWxrYldGdVpHOXdJaUJVZVhCbFBTSkpiblEyTkNJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpVUhKdmRXNWphRWxFSWlCVWVYQmxQU0pKYm5Rek1pSWdMejQ4Um1sbGJHUWdUbUZ0WlQwaVEwOU5VRjlKUkNJZ1ZIbHdaVDBpU1c1ME16SWlJQzgrUEVacFpXeGtJRTVoYldVOUluTmxjbWxoYkNJZ1ZIbHdaVDBpU1c1ME5qUWlJQzgrUEVacFpXeGtJRTVoYldVOUltbDBaVzFmYm1GdFpTSWdWSGx3WlQwaVUzUnlhVzVuSWlBdlBqeEdhV1ZzWkNCT1lXMWxQU0p3Y21salpTSWdWSGx3WlQwaVJHOTFZbXhsSWlBdlBqeEdhV1ZzWkNCT1lXMWxQU0oxYm1sMElp
/// QlVlWEJsUFNKVGRISnBibWNpSUM4K1BFWnBaV3hrSUU1aGJXVTlJbkYxWVc1MGFYUjVJaUJVZVhCbFBTSkViM1ZpYkdVaUlDOCtQRVpwWld4a0lFNWhiV1U5SW5SdmRHRnNhWFJsYlNJZ1ZIbHdaVDBpUkc5MVlteGxJaUF2UGp4R2FXVnNaQ0JPWVcxbFBTSkRiMjV6ZEVOdmJuUnliMndpSUZSNWNHVTlJbE4wY21sdVp5SWdMejQ4Um1sbGJHUWdUbUZ0WlQwaVEyOXVjM1JEYjI1MGNtOXNVM1JoY25RaUlGUjVjR1U5SWtSaGRHVlVhVzFsSWlBdlBqeEdhV1ZzWkNCT1lXMWxQU0pEYjI1emRFTnZiblJ5YjJ4VGRHRnlkRVZ1WkNJZ1ZIbHdaVDBpUkdGMFpWUnBiV1VpSUM4K1BFWnBaV3hrSUU1aGJXVTlJa052Ym5OMFEyOXVkSEp2YkU1UGRHVnpJaUJVZVhCbFBTSlRk
/// SEpwYm1jaUlDOCtQRVpwWld4a0lFNWhiV1U5SWxCeWIycGxZM1JOWVc1bFoyVnlJaUJVZVhCbFBTSlRkSEpwYm1jaUlDOCtQRVpwWld4a0lFNWhiV1U5SWxCeWIycGxZM1JOWVc1bFoyVnlVM1JoY25RaUlGUjVjR1U5SWtSaGRHVlVhVzFsSWlBdlBqeEdhV1ZzWkNCT1lXMWxQU0pRY205cVpXTjBUV0Z1WldkbGNrVnVaQ0lnVkhsd1pUMGlSR0YwWlZScGJXVWlJQzgrUEVacFpXeGtJRTVoYldVOUlsQnliMnBsWTNSTllXNWxaMlZ5VGs5MFpYTWlJRlI1Y0dVOUlsTjBjbWx1WnlJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpUlhoamRYUnBkbVZOWVc1aFoyVnlJaUJVZVhCbFBTSlRkSEpwYm1jaUlDOCtQRVpwWld4a0lFNWhiV1U5SWtWNFkzVjBhWFpsVFdGdVlXZGxjbE4w
/// WVhKMElpQlVlWEJsUFNKRVlYUmxWR2x0WlNJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpUlhoamRYUnBkbVZOWVc1aFoyVnlSVzVrSWlCVWVYQmxQU0pFWVhSbFZHbHRaU0lnTHo0OFJtbGxiR1FnVG1GdFpUMGlSWGhqZFhScGRtVk5ZVzVoWjJWeVRtOTBaWE1pSUZSNWNHVTlJbE4wY21sdVp5SWdMejQ4Um1sbGJHUWdUbUZ0WlQwaVFXTmpiMjUwSWlCVWVYQmxQU0pUZEhKcGJtY2lJQzgrUEVacFpXeGtJRTVoYldVOUlrRmpZMjl1ZEZOMFlYSjBJaUJVZVhCbFBTSkVZWFJsVkdsdFpTSWdMejQ4Um1sbGJHUWdUbUZ0WlQwaVFXTmpiMjUwUlc1a0lpQlVlWEJsUFNKRVlYUmxWR2x0WlNJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpUVdOamIyNTBUbTkwWlhNaUlGUjVjR1U5SWxO
/// MGNtbHVaeUlnTHo0OFJtbGxiR1FnVG1GdFpUMGlSMjBpSUZSNWNHVTlJbE4wY21sdVp5SWdMejQ4Um1sbGJHUWdUbUZ0WlQwaVIyMVRkR0Z5ZENJZ1ZIbHdaVDBpUkdGMFpWUnBiV1VpSUM4K1BFWnBaV3hrSUU1aGJXVTlJa2R0Ulc1a0lpQlVlWEJsUFNKRVlYUmxWR2x0WlNJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpUjIxT2IzUmxjeUlnVkhsd1pUMGlVM1J5YVc1bklpQXZQanhHYVdWc1pDQk9ZVzFsUFNKQ2RYSmphR0Z6WlVSaGRHVWlJRlI1Y0dVOUlrUmhkR1ZVYVcxbElpQXZQanhHYVdWc1pDQk9ZVzFsUFNKdmNtUmxjbDl1YnlJZ1ZIbHdaVDBpU1c1ME5qUWlJQzgrUEVacFpXeGtJRTVoYldVOUlrOXlaR1Z5VG05MFpYTWlJRlI1Y0dVOUlsTjBjbWx1WnlJZ0x6
/// NDhSbWxsYkdRZ1RtRnRaVDBpUVdOalRtRnRaU0lnVkhsd1pUMGlVM1J5YVc1bklpQXZQanhHYVdWc1pDQk9ZVzFsUFNKdGIyaHNZU0lnVkhsd1pUMGlTVzUwTXpJaUlDOCtQRVpwWld4a0lFNWhiV1U5SWtSaGRHVk9aV1ZrSWlCVWVYQmxQU0pUZEhKcGJtY2lJQzgrUEVacFpXeGtJRTVoYldVOUluTjFjR0ZrWkhKbGMzTWlJRlI1Y0dVOUlsTjBjbWx1WnlJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpYzNWd2NIQm9iMjVsSWlCVWVYQmxQU0pUZEhKcGJtY2lJQzgrUEVacFpXeGtJRTVoYldVOUluTjFjR1poZUNJZ1ZIbHdaVDBpVTNSeWFXNW5JaUF2UGp4R2FXVnNaQ0JPWVcxbFBTSnpkWEJ0YjNCcGJHVWlJRlI1Y0dVOUlsTjBjbWx1WnlJZ0x6NDhSbWxsYkdRZ1RtRnRa
/// VDBpYzNWd2JXRnBiQ0lnVkhsd1pUMGlVM1J5YVc1bklpQXZQanhHYVdWc1pDQk9ZVzFsUFNKUVQxOU9UeUlnVkhsd1pUMGlVM1J5YVc1bklpQXZQanhHYVdWc1pDQk9ZVzFsUFNKSmJuRjFjbmxmVW1WbUlpQlVlWEJsUFNKVGRISnBibWNpSUM4K1BFWnBaV3hrSUU1aGJXVTlJa1JwYzJOdmRXNTBJaUJVZVhCbFBTSkViM1ZpYkdVaUlDOCtQRVpwWld4a0lFNWhiV1U5SWxSb1pVNWhiV1VpSUZSNWNHVTlJbE4wY21sdVp5SWdMejQ4Um1sbGJHUWdUbUZ0WlQwaVkyOXVjMkZzZEcxaGFXd2lJRlI1Y0dVOUlsTjBjbWx1WnlJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpWTI5dWMyRnNZV1JrY21WemN5SWdWSGx3WlQwaVUzUnlhVzVuSWlBdlBqeEdhV1ZzWkNCT1lXMWxQU0pq
/// YjI1ellXeDBjR2h2Ym1VaUlGUjVjR1U5SWxOMGNtbHVaeUlnTHo0OFJtbGxiR1FnVG1GdFpUMGlRMmwwZVU1aGJXVWlJRlI1Y0dVOUlsTjBjbWx1WnlJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpVUhKdmFtVmpkRWxFSWlCVWVYQmxQU0pKYm5RMk5DSWdMejQ4Um1sbGJHUWdUbUZ0WlQwaVVISnZhbVZqZEY5T1lXMWxJaUJVZVhCbFBTSlRkSEpwYm1jaUlDOCtQRVpwWld4a0lFNWhiV1U5SWtSbGNHRnlkRWxFSWlCVWVYQmxQU0pKYm5RMk5DSWdMejQ4Um1sbGJHUWdUbUZ0WlQwaVpHVndZWEowWDI1aGJXVWlJRlI1Y0dVOUlsTjBjbWx1WnlJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpUVhKRVpYQmhjblFpSUZSNWNHVTlJbE4wY21sdVp5SWdMejQ4Um1sbGJHUWdUbUZ0WlQw
/// aVJXNUVaWEJoY25RaUlGUjVjR1U5SWxOMGNtbHVaeUlnTHo0OFJtbGxiR1FnVG1GdFpUMGlSVTVVWlc1a1pYSWlJRlI1Y0dVOUlsTjBjbWx1WnlJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpWTNWemRHOXRaWEp1WVcxbElpQlVlWEJsUFNKVGRISnBibWNpSUM4K1BFWnBaV3hrSUU1aGJXVTlJbk4xY0hCc2FXVnljMTl1WVcxbElpQlVlWEJsUFNKVGRISnBibWNpSUM4K1BFWnBaV3hrSUU1aGJXVTlJbE4xY0hCc2FXVnlYMDVoYldWZlJVNGlJRlI1Y0dVOUlsTjBjbWx1WnlJZ0x6NDhSbWxsYkdRZ1RtRnRaVDBpU1hSbGJWOU9ZVzFsWDBGU0lpQlVlWEJsUFNKVGRISnBibWNpSUM4K1BFWnBaV3hrSUU1aGJXVTlJa2wwWlcxZlRtRnRaVjlGVGlJZ1ZIbHdaVDBpVTNSeWFX
/// NW5JaUF2UGp4R2FXVnNaQ0JPWVcxbFBTSkRhWFI1U1VRaUlGUjVjR1U5SWtsdWREWTBJaUF2UGp4R2FXVnNaQ0JPWVcxbFBTSlVaVzVrWlVsRUlpQlVlWEJsUFNKSmJuUTJOQ0lnTHo0OFJtbGxiR1FnVG1GdFpUMGlVbUYwWlNJZ1ZIbHdaVDBpVTNSeWFXNW5JaUF2UGp4R2FXVnNaQ0JPWVcxbFBTSlFkWEpqYUdGelpWUjVjR1ZKUkNJZ1ZIbHdaVDBpU1c1ME16SWlJQzgrUEVacFpXeGtJRTVoYldVOUlrTnZiblJoWTNSUVpYTnZia2xFSWlCVWVYQmxQU0pKYm5Rek1pSWdMejQ4Um1sbGJHUWdUbUZ0WlQwaVEyOXVkR0ZqZEUxdlltbHNaU0lnVkhsd1pUMGlVM1J5YVc1bklpQXZQanhHYVdWc1pDQk9ZVzFsUFNKRGIyNTBZV04wVFdsaGJDSWdWSGx3WlQwaVUzUnlh
/// VzVuSWlBdlBqeEdhV1ZzWkNCT1lXMWxQU0pUYUdGcGNHbHVaMFJoZEdVaUlGUjVjR1U5SWxOMGNtbHVaeUlnTHo0OFJtbGxiR1FnVG1GdFpUMGlTWFJsYlY5SlpDSWdWSGx3WlQwaVNXNTBOalFpSUM4K1BDOVdhV1YzUGp3dlJHRjBZVk5sZEQ0PQ==</Resource>
///   </Resources>
/// </XRTypeInfo>
namespace XtraReportSerialization {
    
    public class XtraReportForm : DevExpress.XtraReports.UI.XtraReport {
        private DevExpress.XtraReports.UI.DetailBand Detail;
        private DevExpress.XtraReports.UI.XRLabel label80;
        private DevExpress.XtraReports.UI.XRLabel label79;
        private DevExpress.XtraReports.UI.XRLabel label78;
        private DevExpress.XtraReports.UI.XRLabel label77;
        private DevExpress.XtraReports.UI.XRLabel label76;
        private DevExpress.XtraReports.UI.XRLabel label75;
        private DevExpress.XtraReports.UI.XRLabel label73;
        private DevExpress.XtraReports.UI.XRLabel label74;
        private DevExpress.XtraReports.UI.XRShape shape4;
        private DevExpress.XtraReports.UI.XRShape shape3;
        private DevExpress.XtraReports.UI.XRLabel label65;
        private DevExpress.XtraReports.UI.XRLabel label64;
        private DevExpress.XtraReports.UI.XRLabel label63;
        private DevExpress.XtraReports.UI.XRLabel label62;
        private DevExpress.XtraReports.UI.XRLabel label61;
        private DevExpress.XtraReports.UI.XRLabel label60;
        private DevExpress.XtraReports.UI.XRLabel label59;
        private DevExpress.XtraReports.UI.XRLabel label58;
        private DevExpress.XtraReports.UI.XRLine line16;
        private DevExpress.XtraReports.UI.XRLine line15;
        private DevExpress.XtraReports.UI.XRLine line14;
        private DevExpress.XtraReports.UI.XRLine line13;
        private DevExpress.XtraReports.UI.XRLine line12;
        private DevExpress.XtraReports.UI.XRLine line11;
        private DevExpress.XtraReports.UI.XRLabel label2;
        private DevExpress.XtraReports.UI.XRLabel label20;
        private DevExpress.XtraReports.UI.XRLabel label34;
        private DevExpress.XtraReports.UI.XRLabel label33;
        private DevExpress.XtraReports.UI.XRLabel label32;
        private DevExpress.XtraReports.UI.XRLabel label23;
        private DevExpress.XtraReports.UI.XRLabel label30;
        private DevExpress.XtraReports.UI.XRLabel label31;
        private DevExpress.XtraReports.UI.XRLabel label29;
        private DevExpress.XtraReports.UI.XRLabel label28;
        private DevExpress.XtraReports.UI.XRLabel label27;
        private DevExpress.XtraReports.UI.XRLabel label26;
        private DevExpress.XtraReports.UI.XRLabel label25;
        private DevExpress.XtraReports.UI.XRLabel label24;
        private DevExpress.XtraReports.UI.XRLabel label22;
        private DevExpress.XtraReports.UI.XRLabel label21;
        private DevExpress.XtraReports.UI.XRLabel label19;
        private DevExpress.XtraReports.UI.XRLabel label18;
        private DevExpress.XtraReports.UI.XRLabel label17;
        private DevExpress.XtraReports.UI.XRLabel label16;
        private DevExpress.XtraReports.UI.XRLabel label15;
        private DevExpress.XtraReports.UI.XRLabel label14;
        private DevExpress.XtraReports.UI.XRLabel label13;
        private DevExpress.XtraReports.UI.XRLabel label12;
        private DevExpress.XtraReports.UI.XRLine line2;
        private DevExpress.XtraReports.UI.XRLine line1;
        private DevExpress.XtraReports.UI.XRLabel label11;
        private DevExpress.XtraReports.UI.XRLabel label10;
        private DevExpress.XtraReports.UI.XRLabel label9;
        private DevExpress.XtraReports.UI.XRLabel label8;
        private DevExpress.XtraReports.UI.XRLabel label7;
        private DevExpress.XtraReports.UI.XRLabel label6;
        private DevExpress.XtraReports.UI.XRLabel label5;
        private DevExpress.XtraReports.UI.XRLabel label4;
        private DevExpress.XtraReports.UI.XRLabel label3;
        private DevExpress.XtraReports.UI.XRLabel label39;
        private DevExpress.XtraReports.UI.XRLabel label36;
        private DevExpress.XtraReports.UI.XRLabel label37;
        private DevExpress.XtraReports.UI.XRLabel label38;
        private DevExpress.XtraReports.UI.XRLabel label40;
        private DevExpress.XtraReports.UI.XRLabel label42;
        private DevExpress.XtraReports.UI.XRLabel label35;
        private DevExpress.XtraReports.UI.XRLabel label57;
        private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
        private DevExpress.XtraReports.UI.XRPictureBox pictureBox2;
        private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
        private DevExpress.DataAccess.Sql.SqlDataSource sqlDataSource2;
        private DevExpress.XtraReports.UI.XRLabel label53;
        private DevExpress.XtraReports.UI.XRLabel label47;
        private DevExpress.XtraReports.UI.DetailReportBand DetailReport;
        private DevExpress.XtraReports.UI.DetailBand Detail1;
        private DevExpress.XtraReports.UI.XRLine line22;
        private DevExpress.XtraReports.UI.XRLine line21;
        private DevExpress.XtraReports.UI.XRLine line19;
        private DevExpress.XtraReports.UI.XRLine line18;
        private DevExpress.XtraReports.UI.XRLine line17;
        private DevExpress.XtraReports.UI.XRLabel label56;
        private DevExpress.XtraReports.UI.XRLabel label46;
        private DevExpress.XtraReports.UI.XRLabel label45;
        private DevExpress.XtraReports.UI.XRLabel label44;
        private DevExpress.XtraReports.UI.XRLabel label43;
        private DevExpress.XtraReports.UI.XRLabel label41;
        private DevExpress.XtraReports.UI.XRShape shape1;
        private DevExpress.XtraReports.UI.XRLine line20;
        private DevExpress.XtraReports.UI.GroupFooterBand GroupFooter1;
        private DevExpress.XtraReports.UI.XRLabel label72;
        private DevExpress.XtraReports.Parameters.Parameter Only;
        private DevExpress.XtraReports.UI.XRLine line23;
        private DevExpress.XtraReports.UI.XRLine line24;
        private DevExpress.XtraReports.UI.XRLine line25;
        private DevExpress.XtraReports.UI.XRLine line26;
        private DevExpress.XtraReports.UI.XRLabel label66;
        private DevExpress.XtraReports.UI.XRLabel label67;
        private DevExpress.XtraReports.UI.XRLabel label68;
        private DevExpress.XtraReports.UI.XRLabel label69;
        private DevExpress.XtraReports.UI.XRLabel label71;
        private DevExpress.XtraReports.Parameters.Parameter TotalDeicount;
        private DevExpress.XtraReports.UI.XRLabel label70;
        private DevExpress.XtraReports.UI.XRShape shape2;
        private DevExpress.XtraReports.UI.XRLabel label1;
        private DevExpress.XtraReports.UI.ReportHeaderBand ReportHeader;
        private DevExpress.XtraReports.UI.XRPictureBox pictureBox1;
        private DevExpress.XtraReports.UI.PageFooterBand PageFooter;
        private DevExpress.XtraReports.UI.XRLabel label55;
        private DevExpress.XtraReports.UI.XRLabel label54;
        private DevExpress.XtraReports.UI.XRLabel label52;
        private DevExpress.XtraReports.UI.XRLabel label51;
        private DevExpress.XtraReports.UI.XRLabel label50;
        private DevExpress.XtraReports.UI.XRLabel label49;
        private DevExpress.XtraReports.UI.XRLabel label48;
        private System.Resources.ResourceManager _resources;
        private string _resourceString;
        public XtraReportForm() {
            this._resourceString = DevExpress.XtraReports.Serialization.XRResourceManager.GetResourceFor("XtraReportSerialization.XtraReportForm");
            this.InitializeComponent();
        }
        private System.Resources.ResourceManager resources {
            get {
                if (_resources == null) {
                    this._resources = new DevExpress.XtraReports.Serialization.XRResourceManager(this._resourceString);
                }
                return this._resources;
            }
        }
        private void InitializeComponent() {
            DevExpress.DataAccess.ConnectionParameters.MsSqlConnectionParameters msSqlConnectionParameters1 = new DevExpress.DataAccess.ConnectionParameters.MsSqlConnectionParameters();
            DevExpress.DataAccess.Sql.SelectQuery selectQuery1 = new DevExpress.DataAccess.Sql.SelectQuery();
            DevExpress.DataAccess.Sql.Column column1 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression1 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Table table1 = new DevExpress.DataAccess.Sql.Table();
            DevExpress.DataAccess.Sql.Column column2 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression2 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column3 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression3 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column4 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression4 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column5 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression5 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column6 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression6 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column7 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression7 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column8 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression8 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column9 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression9 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column10 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression10 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column11 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression11 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column12 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression12 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column13 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression13 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column14 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression14 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column15 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression15 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column16 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression16 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column17 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression17 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column18 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression18 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column19 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression19 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column20 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression20 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column21 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression21 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column22 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression22 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column23 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression23 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column24 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression24 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column25 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression25 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column26 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression26 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column27 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression27 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column28 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression28 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column29 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression29 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column30 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression30 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column31 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression31 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column32 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression32 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column33 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression33 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column34 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression34 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column35 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression35 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column36 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression36 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column37 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression37 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column38 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression38 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column39 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression39 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column40 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression40 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column41 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression41 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column42 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression42 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column43 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression43 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column44 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression44 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column45 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression45 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column46 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression46 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column47 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression47 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column48 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression48 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column49 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression49 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column50 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression50 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column51 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression51 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column52 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression52 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column53 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression53 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column54 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression54 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column55 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression55 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column56 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression56 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column57 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression57 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column58 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression58 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column59 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression59 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column60 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression60 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column61 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression61 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column62 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression62 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column63 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression63 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column64 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression64 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column65 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression65 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column66 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression66 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column67 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression67 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column68 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression68 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column69 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression69 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column70 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression70 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column71 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression71 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column72 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression72 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column73 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression73 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column74 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression74 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column75 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression75 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column76 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression76 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column77 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression77 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column78 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression78 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column79 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression79 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column80 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression80 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column81 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression81 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column82 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression82 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column83 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression83 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column84 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression84 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column85 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression85 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column86 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression86 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column87 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression87 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.DataAccess.Sql.Column column88 = new DevExpress.DataAccess.Sql.Column();
            DevExpress.DataAccess.Sql.ColumnExpression columnExpression88 = new DevExpress.DataAccess.Sql.ColumnExpression();
            DevExpress.XtraPrinting.Shape.ShapeRectangle shapeRectangle4 = new DevExpress.XtraPrinting.Shape.ShapeRectangle();
            DevExpress.XtraPrinting.Shape.ShapeRectangle shapeRectangle1 = new DevExpress.XtraPrinting.Shape.ShapeRectangle();
            DevExpress.XtraPrinting.Shape.ShapeRectangle shapeRectangle3 = new DevExpress.XtraPrinting.Shape.ShapeRectangle();
            DevExpress.XtraPrinting.Shape.ShapeRectangle shapeRectangle2 = new DevExpress.XtraPrinting.Shape.ShapeRectangle();
            this.Detail = new DevExpress.XtraReports.UI.DetailBand();
            this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
            this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
            this.sqlDataSource2 = new DevExpress.DataAccess.Sql.SqlDataSource();
            this.label53 = new DevExpress.XtraReports.UI.XRLabel();
            this.label20 = new DevExpress.XtraReports.UI.XRLabel();
            this.label47 = new DevExpress.XtraReports.UI.XRLabel();
            this.pictureBox2 = new DevExpress.XtraReports.UI.XRPictureBox();
            this.DetailReport = new DevExpress.XtraReports.UI.DetailReportBand();
            this.label23 = new DevExpress.XtraReports.UI.XRLabel();
            this.label65 = new DevExpress.XtraReports.UI.XRLabel();
            this.label45 = new DevExpress.XtraReports.UI.XRLabel();
            this.shape2 = new DevExpress.XtraReports.UI.XRShape();
            this.label44 = new DevExpress.XtraReports.UI.XRLabel();
            this.label58 = new DevExpress.XtraReports.UI.XRLabel();
            this.label17 = new DevExpress.XtraReports.UI.XRLabel();
            this.label8 = new DevExpress.XtraReports.UI.XRLabel();
            this.label37 = new DevExpress.XtraReports.UI.XRLabel();
            this.line20 = new DevExpress.XtraReports.UI.XRLine();
            this.label77 = new DevExpress.XtraReports.UI.XRLabel();
            this.shape4 = new DevExpress.XtraReports.UI.XRShape();
            this.label60 = new DevExpress.XtraReports.UI.XRLabel();
            this.label24 = new DevExpress.XtraReports.UI.XRLabel();
            this.label34 = new DevExpress.XtraReports.UI.XRLabel();
            this.label59 = new DevExpress.XtraReports.UI.XRLabel();
            this.label66 = new DevExpress.XtraReports.UI.XRLabel();
            this.GroupFooter1 = new DevExpress.XtraReports.UI.GroupFooterBand();
            this.label6 = new DevExpress.XtraReports.UI.XRLabel();
            this.label32 = new DevExpress.XtraReports.UI.XRLabel();
            this.label1 = new DevExpress.XtraReports.UI.XRLabel();
            this.ReportHeader = new DevExpress.XtraReports.UI.ReportHeaderBand();
            this.line11 = new DevExpress.XtraReports.UI.XRLine();
            this.line1 = new DevExpress.XtraReports.UI.XRLine();
            this.line17 = new DevExpress.XtraReports.UI.XRLine();
            this.label15 = new DevExpress.XtraReports.UI.XRLabel();
            this.pictureBox1 = new DevExpress.XtraReports.UI.XRPictureBox();
            this.line14 = new DevExpress.XtraReports.UI.XRLine();
            this.label29 = new DevExpress.XtraReports.UI.XRLabel();
            this.line18 = new DevExpress.XtraReports.UI.XRLine();
            this.label18 = new DevExpress.XtraReports.UI.XRLabel();
            this.label72 = new DevExpress.XtraReports.UI.XRLabel();
            this.label5 = new DevExpress.XtraReports.UI.XRLabel();
            this.label22 = new DevExpress.XtraReports.UI.XRLabel();
            this.label33 = new DevExpress.XtraReports.UI.XRLabel();
            this.label2 = new DevExpress.XtraReports.UI.XRLabel();
            this.label40 = new DevExpress.XtraReports.UI.XRLabel();
            this.label36 = new DevExpress.XtraReports.UI.XRLabel();
            this.label7 = new DevExpress.XtraReports.UI.XRLabel();
            this.label10 = new DevExpress.XtraReports.UI.XRLabel();
            this.PageFooter = new DevExpress.XtraReports.UI.PageFooterBand();
            this.label46 = new DevExpress.XtraReports.UI.XRLabel();
            this.label56 = new DevExpress.XtraReports.UI.XRLabel();
            this.label48 = new DevExpress.XtraReports.UI.XRLabel();
            this.label27 = new DevExpress.XtraReports.UI.XRLabel();
            this.label30 = new DevExpress.XtraReports.UI.XRLabel();
            this.label52 = new DevExpress.XtraReports.UI.XRLabel();
            this.shape1 = new DevExpress.XtraReports.UI.XRShape();
            this.label51 = new DevExpress.XtraReports.UI.XRLabel();
            this.line22 = new DevExpress.XtraReports.UI.XRLine();
            this.shape3 = new DevExpress.XtraReports.UI.XRShape();
            this.label31 = new DevExpress.XtraReports.UI.XRLabel();
            this.line16 = new DevExpress.XtraReports.UI.XRLine();
            this.line13 = new DevExpress.XtraReports.UI.XRLine();
            this.label64 = new DevExpress.XtraReports.UI.XRLabel();
            this.label50 = new DevExpress.XtraReports.UI.XRLabel();
            this.label73 = new DevExpress.XtraReports.UI.XRLabel();
            this.label78 = new DevExpress.XtraReports.UI.XRLabel();
            this.label70 = new DevExpress.XtraReports.UI.XRLabel();
            this.label25 = new DevExpress.XtraReports.UI.XRLabel();
            this.label16 = new DevExpress.XtraReports.UI.XRLabel();
            this.label80 = new DevExpress.XtraReports.UI.XRLabel();
            this.label26 = new DevExpress.XtraReports.UI.XRLabel();
            this.label76 = new DevExpress.XtraReports.UI.XRLabel();
            this.label38 = new DevExpress.XtraReports.UI.XRLabel();
            this.label71 = new DevExpress.XtraReports.UI.XRLabel();
            this.label63 = new DevExpress.XtraReports.UI.XRLabel();
            this.label67 = new DevExpress.XtraReports.UI.XRLabel();
            this.label61 = new DevExpress.XtraReports.UI.XRLabel();
            this.label41 = new DevExpress.XtraReports.UI.XRLabel();
            this.TotalDeicount = new DevExpress.XtraReports.Parameters.Parameter();
            this.label39 = new DevExpress.XtraReports.UI.XRLabel();
            this.label68 = new DevExpress.XtraReports.UI.XRLabel();
            this.label28 = new DevExpress.XtraReports.UI.XRLabel();
            this.line19 = new DevExpress.XtraReports.UI.XRLine();
            this.label19 = new DevExpress.XtraReports.UI.XRLabel();
            this.label35 = new DevExpress.XtraReports.UI.XRLabel();
            this.label14 = new DevExpress.XtraReports.UI.XRLabel();
            this.label9 = new DevExpress.XtraReports.UI.XRLabel();
            this.line2 = new DevExpress.XtraReports.UI.XRLine();
            this.label69 = new DevExpress.XtraReports.UI.XRLabel();
            this.label57 = new DevExpress.XtraReports.UI.XRLabel();
            this.line25 = new DevExpress.XtraReports.UI.XRLine();
            this.line23 = new DevExpress.XtraReports.UI.XRLine();
            this.label12 = new DevExpress.XtraReports.UI.XRLabel();
            this.line26 = new DevExpress.XtraReports.UI.XRLine();
            this.label74 = new DevExpress.XtraReports.UI.XRLabel();
            this.Only = new DevExpress.XtraReports.Parameters.Parameter();
            this.line21 = new DevExpress.XtraReports.UI.XRLine();
            this.line24 = new DevExpress.XtraReports.UI.XRLine();
            this.label75 = new DevExpress.XtraReports.UI.XRLabel();
            this.label55 = new DevExpress.XtraReports.UI.XRLabel();
            this.line15 = new DevExpress.XtraReports.UI.XRLine();
            this.label79 = new DevExpress.XtraReports.UI.XRLabel();
            this.label42 = new DevExpress.XtraReports.UI.XRLabel();
            this.Detail1 = new DevExpress.XtraReports.UI.DetailBand();
            this.label3 = new DevExpress.XtraReports.UI.XRLabel();
            this.label4 = new DevExpress.XtraReports.UI.XRLabel();
            this.line12 = new DevExpress.XtraReports.UI.XRLine();
            this.label43 = new DevExpress.XtraReports.UI.XRLabel();
            this.label49 = new DevExpress.XtraReports.UI.XRLabel();
            this.label11 = new DevExpress.XtraReports.UI.XRLabel();
            this.label62 = new DevExpress.XtraReports.UI.XRLabel();
            this.label13 = new DevExpress.XtraReports.UI.XRLabel();
            this.label21 = new DevExpress.XtraReports.UI.XRLabel();
            this.label54 = new DevExpress.XtraReports.UI.XRLabel();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // Detail
            // 
            this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
                        this.label80,
                        this.label79,
                        this.label78,
                        this.label77,
                        this.label76,
                        this.label75,
                        this.label73,
                        this.label74,
                        this.shape4,
                        this.shape3,
                        this.label65,
                        this.label64,
                        this.label63,
                        this.label62,
                        this.label61,
                        this.label60,
                        this.label59,
                        this.label58,
                        this.line16,
                        this.line15,
                        this.line14,
                        this.line13,
                        this.line12,
                        this.line11,
                        this.label2,
                        this.label20,
                        this.label34,
                        this.label33,
                        this.label32,
                        this.label23,
                        this.label30,
                        this.label31,
                        this.label29,
                        this.label28,
                        this.label27,
                        this.label26,
                        this.label25,
                        this.label24,
                        this.label22,
                        this.label21,
                        this.label19,
                        this.label18,
                        this.label17,
                        this.label16,
                        this.label15,
                        this.label14,
                        this.label13,
                        this.label12,
                        this.line2,
                        this.line1,
                        this.label11,
                        this.label10,
                        this.label9,
                        this.label8,
                        this.label7,
                        this.label6,
                        this.label5,
                        this.label4,
                        this.label3,
                        this.label39,
                        this.label36,
                        this.label37,
                        this.label38,
                        this.label40,
                        this.label42,
                        this.label35,
                        this.label57});
            this.Detail.Dpi = 254F;
            this.Detail.HeightF = 632.0523F;
            this.Detail.Name = "Detail";
            this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 254F);
            this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // BottomMargin
            // 
            this.BottomMargin.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
                        this.pictureBox2});
            this.BottomMargin.Dpi = 254F;
            this.BottomMargin.HeightF = 211F;
            this.BottomMargin.Name = "BottomMargin";
            this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 254F);
            this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // TopMargin
            // 
            this.TopMargin.Dpi = 254F;
            this.TopMargin.HeightF = 13F;
            this.TopMargin.Name = "TopMargin";
            this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 254F);
            this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // sqlDataSource2
            // 
            this.sqlDataSource2.ConnectionName = "192.168.1.40_Elhabeb_Connection";
            msSqlConnectionParameters1.AuthorizationType = DevExpress.DataAccess.ConnectionParameters.MsSqlAuthorizationType.SqlServer;
            msSqlConnectionParameters1.DatabaseName = "Elhabeb";
            msSqlConnectionParameters1.ServerName = "192.168.1.40";
            this.sqlDataSource2.ConnectionParameters = msSqlConnectionParameters1;
            this.sqlDataSource2.Name = "sqlDataSource2";
            columnExpression1.ColumnName = "performa_id";
            table1.Name = "V_Amr_Sheraa";
            columnExpression1.Table = table1;
            column1.Expression = columnExpression1;
            columnExpression2.ColumnName = "Customer_id";
            columnExpression2.Table = table1;
            column2.Expression = columnExpression2;
            columnExpression3.ColumnName = "contactcmb";
            columnExpression3.Table = table1;
            column3.Expression = columnExpression3;
            columnExpression4.ColumnName = "performa_date";
            columnExpression4.Table = table1;
            column4.Expression = columnExpression4;
            columnExpression5.ColumnName = "intro";
            columnExpression5.Table = table1;
            column5.Expression = columnExpression5;
            columnExpression6.ColumnName = "performa_date_end";
            columnExpression6.Table = table1;
            column6.Expression = columnExpression6;
            columnExpression7.ColumnName = "payment_termes";
            columnExpression7.Table = table1;
            column7.Expression = columnExpression7;
            columnExpression8.ColumnName = "delivery_termes";
            columnExpression8.Table = table1;
            column8.Expression = columnExpression8;
            columnExpression9.ColumnName = "delivery_place";
            columnExpression9.Table = table1;
            column9.Expression = columnExpression9;
            columnExpression10.ColumnName = "shipping_type";
            columnExpression10.Table = table1;
            column10.Expression = columnExpression10;
            columnExpression11.ColumnName = "sales_tax";
            columnExpression11.Table = table1;
            column11.Expression = columnExpression11;
            columnExpression12.ColumnName = "general_tax";
            columnExpression12.Table = table1;
            column12.Expression = columnExpression12;
            columnExpression13.ColumnName = "notes";
            columnExpression13.Table = table1;
            column13.Expression = columnExpression13;
            columnExpression14.ColumnName = "total";
            columnExpression14.Table = table1;
            column14.Expression = columnExpression14;
            columnExpression15.ColumnName = "net";
            columnExpression15.Table = table1;
            column15.Expression = columnExpression15;
            columnExpression16.ColumnName = "performaonly";
            columnExpression16.Table = table1;
            column16.Expression = columnExpression16;
            columnExpression17.ColumnName = "UserName";
            columnExpression17.Table = table1;
            column17.Expression = columnExpression17;
            columnExpression18.ColumnName = "action_date";
            columnExpression18.Table = table1;
            column18.Expression = columnExpression18;
            columnExpression19.ColumnName = "flag";
            columnExpression19.Table = table1;
            column19.Expression = columnExpression19;
            columnExpression20.ColumnName = "idmandop";
            columnExpression20.Table = table1;
            column20.Expression = columnExpression20;
            columnExpression21.ColumnName = "ProunchID";
            columnExpression21.Table = table1;
            column21.Expression = columnExpression21;
            columnExpression22.ColumnName = "COMP_ID";
            columnExpression22.Table = table1;
            column22.Expression = columnExpression22;
            columnExpression23.ColumnName = "serial";
            columnExpression23.Table = table1;
            column23.Expression = columnExpression23;
            columnExpression24.ColumnName = "item_name";
            columnExpression24.Table = table1;
            column24.Expression = columnExpression24;
            columnExpression25.ColumnName = "price";
            columnExpression25.Table = table1;
            column25.Expression = columnExpression25;
            columnExpression26.ColumnName = "unit";
            columnExpression26.Table = table1;
            column26.Expression = columnExpression26;
            columnExpression27.ColumnName = "quantity";
            columnExpression27.Table = table1;
            column27.Expression = columnExpression27;
            columnExpression28.ColumnName = "totalitem";
            columnExpression28.Table = table1;
            column28.Expression = columnExpression28;
            columnExpression29.ColumnName = "ConstControl";
            columnExpression29.Table = table1;
            column29.Expression = columnExpression29;
            columnExpression30.ColumnName = "ConstControlStart";
            columnExpression30.Table = table1;
            column30.Expression = columnExpression30;
            columnExpression31.ColumnName = "ConstControlStartEnd";
            columnExpression31.Table = table1;
            column31.Expression = columnExpression31;
            columnExpression32.ColumnName = "ConstControlNOtes";
            columnExpression32.Table = table1;
            column32.Expression = columnExpression32;
            columnExpression33.ColumnName = "ProjectManeger";
            columnExpression33.Table = table1;
            column33.Expression = columnExpression33;
            columnExpression34.ColumnName = "ProjectManegerStart";
            columnExpression34.Table = table1;
            column34.Expression = columnExpression34;
            columnExpression35.ColumnName = "ProjectManegerEnd";
            columnExpression35.Table = table1;
            column35.Expression = columnExpression35;
            columnExpression36.ColumnName = "ProjectManegerNOtes";
            columnExpression36.Table = table1;
            column36.Expression = columnExpression36;
            columnExpression37.ColumnName = "ExcutiveManager";
            columnExpression37.Table = table1;
            column37.Expression = columnExpression37;
            columnExpression38.ColumnName = "ExcutiveManagerStart";
            columnExpression38.Table = table1;
            column38.Expression = columnExpression38;
            columnExpression39.ColumnName = "ExcutiveManagerEnd";
            columnExpression39.Table = table1;
            column39.Expression = columnExpression39;
            columnExpression40.ColumnName = "ExcutiveManagerNotes";
            columnExpression40.Table = table1;
            column40.Expression = columnExpression40;
            columnExpression41.ColumnName = "Accont";
            columnExpression41.Table = table1;
            column41.Expression = columnExpression41;
            columnExpression42.ColumnName = "AccontStart";
            columnExpression42.Table = table1;
            column42.Expression = columnExpression42;
            columnExpression43.ColumnName = "AccontEnd";
            columnExpression43.Table = table1;
            column43.Expression = columnExpression43;
            columnExpression44.ColumnName = "AccontNotes";
            columnExpression44.Table = table1;
            column44.Expression = columnExpression44;
            columnExpression45.ColumnName = "Gm";
            columnExpression45.Table = table1;
            column45.Expression = columnExpression45;
            columnExpression46.ColumnName = "GmStart";
            columnExpression46.Table = table1;
            column46.Expression = columnExpression46;
            columnExpression47.ColumnName = "GmEnd";
            columnExpression47.Table = table1;
            column47.Expression = columnExpression47;
            columnExpression48.ColumnName = "GmNotes";
            columnExpression48.Table = table1;
            column48.Expression = columnExpression48;
            columnExpression49.ColumnName = "BurchaseDate";
            columnExpression49.Table = table1;
            column49.Expression = columnExpression49;
            columnExpression50.ColumnName = "order_no";
            columnExpression50.Table = table1;
            column50.Expression = columnExpression50;
            columnExpression51.ColumnName = "OrderNotes";
            columnExpression51.Table = table1;
            column51.Expression = columnExpression51;
            columnExpression52.ColumnName = "AccName";
            columnExpression52.Table = table1;
            column52.Expression = columnExpression52;
            columnExpression53.ColumnName = "mohla";
            columnExpression53.Table = table1;
            column53.Expression = columnExpression53;
            columnExpression54.ColumnName = "DateNeed";
            columnExpression54.Table = table1;
            column54.Expression = columnExpression54;
            columnExpression55.ColumnName = "supaddress";
            columnExpression55.Table = table1;
            column55.Expression = columnExpression55;
            columnExpression56.ColumnName = "suppphone";
            columnExpression56.Table = table1;
            column56.Expression = columnExpression56;
            columnExpression57.ColumnName = "supfax";
            columnExpression57.Table = table1;
            column57.Expression = columnExpression57;
            columnExpression58.ColumnName = "supmopile";
            columnExpression58.Table = table1;
            column58.Expression = columnExpression58;
            columnExpression59.ColumnName = "supmail";
            columnExpression59.Table = table1;
            column59.Expression = columnExpression59;
            columnExpression60.ColumnName = "PO_NO";
            columnExpression60.Table = table1;
            column60.Expression = columnExpression60;
            columnExpression61.ColumnName = "Inqury_Ref";
            columnExpression61.Table = table1;
            column61.Expression = columnExpression61;
            columnExpression62.ColumnName = "Discount";
            columnExpression62.Table = table1;
            column62.Expression = columnExpression62;
            columnExpression63.ColumnName = "TheName";
            columnExpression63.Table = table1;
            column63.Expression = columnExpression63;
            columnExpression64.ColumnName = "consaltmail";
            columnExpression64.Table = table1;
            column64.Expression = columnExpression64;
            columnExpression65.ColumnName = "consaladdress";
            columnExpression65.Table = table1;
            column65.Expression = columnExpression65;
            columnExpression66.ColumnName = "consaltphone";
            columnExpression66.Table = table1;
            column66.Expression = columnExpression66;
            columnExpression67.ColumnName = "CityName";
            columnExpression67.Table = table1;
            column67.Expression = columnExpression67;
            columnExpression68.ColumnName = "ProjectID";
            columnExpression68.Table = table1;
            column68.Expression = columnExpression68;
            columnExpression69.ColumnName = "Project_Name";
            columnExpression69.Table = table1;
            column69.Expression = columnExpression69;
            columnExpression70.ColumnName = "DepartID";
            columnExpression70.Table = table1;
            column70.Expression = columnExpression70;
            columnExpression71.ColumnName = "depart_name";
            columnExpression71.Table = table1;
            column71.Expression = columnExpression71;
            columnExpression72.ColumnName = "ArDepart";
            columnExpression72.Table = table1;
            column72.Expression = columnExpression72;
            columnExpression73.ColumnName = "EnDepart";
            columnExpression73.Table = table1;
            column73.Expression = columnExpression73;
            columnExpression74.ColumnName = "ENTender";
            columnExpression74.Table = table1;
            column74.Expression = columnExpression74;
            columnExpression75.ColumnName = "customername";
            columnExpression75.Table = table1;
            column75.Expression = columnExpression75;
            columnExpression76.ColumnName = "suppliers_name";
            columnExpression76.Table = table1;
            column76.Expression = columnExpression76;
            columnExpression77.ColumnName = "Supplier_Name_EN";
            columnExpression77.Table = table1;
            column77.Expression = columnExpression77;
            columnExpression78.ColumnName = "Item_Name_AR";
            columnExpression78.Table = table1;
            column78.Expression = columnExpression78;
            columnExpression79.ColumnName = "Item_Name_EN";
            columnExpression79.Table = table1;
            column79.Expression = columnExpression79;
            columnExpression80.ColumnName = "CityID";
            columnExpression80.Table = table1;
            column80.Expression = columnExpression80;
            columnExpression81.ColumnName = "TendeID";
            columnExpression81.Table = table1;
            column81.Expression = columnExpression81;
            columnExpression82.ColumnName = "Rate";
            columnExpression82.Table = table1;
            column82.Expression = columnExpression82;
            columnExpression83.ColumnName = "PurchaseTypeID";
            columnExpression83.Table = table1;
            column83.Expression = columnExpression83;
            columnExpression84.ColumnName = "ContactPesonID";
            columnExpression84.Table = table1;
            column84.Expression = columnExpression84;
            columnExpression85.ColumnName = "ContactMobile";
            columnExpression85.Table = table1;
            column85.Expression = columnExpression85;
            columnExpression86.ColumnName = "ContactMial";
            columnExpression86.Table = table1;
            column86.Expression = columnExpression86;
            columnExpression87.ColumnName = "ShaipingDate";
            columnExpression87.Table = table1;
            column87.Expression = columnExpression87;
            columnExpression88.ColumnName = "Item_Id";
            columnExpression88.Table = table1;
            column88.Expression = columnExpression88;
            selectQuery1.Columns.Add(column1);
            selectQuery1.Columns.Add(column2);
            selectQuery1.Columns.Add(column3);
            selectQuery1.Columns.Add(column4);
            selectQuery1.Columns.Add(column5);
            selectQuery1.Columns.Add(column6);
            selectQuery1.Columns.Add(column7);
            selectQuery1.Columns.Add(column8);
            selectQuery1.Columns.Add(column9);
            selectQuery1.Columns.Add(column10);
            selectQuery1.Columns.Add(column11);
            selectQuery1.Columns.Add(column12);
            selectQuery1.Columns.Add(column13);
            selectQuery1.Columns.Add(column14);
            selectQuery1.Columns.Add(column15);
            selectQuery1.Columns.Add(column16);
            selectQuery1.Columns.Add(column17);
            selectQuery1.Columns.Add(column18);
            selectQuery1.Columns.Add(column19);
            selectQuery1.Columns.Add(column20);
            selectQuery1.Columns.Add(column21);
            selectQuery1.Columns.Add(column22);
            selectQuery1.Columns.Add(column23);
            selectQuery1.Columns.Add(column24);
            selectQuery1.Columns.Add(column25);
            selectQuery1.Columns.Add(column26);
            selectQuery1.Columns.Add(column27);
            selectQuery1.Columns.Add(column28);
            selectQuery1.Columns.Add(column29);
            selectQuery1.Columns.Add(column30);
            selectQuery1.Columns.Add(column31);
            selectQuery1.Columns.Add(column32);
            selectQuery1.Columns.Add(column33);
            selectQuery1.Columns.Add(column34);
            selectQuery1.Columns.Add(column35);
            selectQuery1.Columns.Add(column36);
            selectQuery1.Columns.Add(column37);
            selectQuery1.Columns.Add(column38);
            selectQuery1.Columns.Add(column39);
            selectQuery1.Columns.Add(column40);
            selectQuery1.Columns.Add(column41);
            selectQuery1.Columns.Add(column42);
            selectQuery1.Columns.Add(column43);
            selectQuery1.Columns.Add(column44);
            selectQuery1.Columns.Add(column45);
            selectQuery1.Columns.Add(column46);
            selectQuery1.Columns.Add(column47);
            selectQuery1.Columns.Add(column48);
            selectQuery1.Columns.Add(column49);
            selectQuery1.Columns.Add(column50);
            selectQuery1.Columns.Add(column51);
            selectQuery1.Columns.Add(column52);
            selectQuery1.Columns.Add(column53);
            selectQuery1.Columns.Add(column54);
            selectQuery1.Columns.Add(column55);
            selectQuery1.Columns.Add(column56);
            selectQuery1.Columns.Add(column57);
            selectQuery1.Columns.Add(column58);
            selectQuery1.Columns.Add(column59);
            selectQuery1.Columns.Add(column60);
            selectQuery1.Columns.Add(column61);
            selectQuery1.Columns.Add(column62);
            selectQuery1.Columns.Add(column63);
            selectQuery1.Columns.Add(column64);
            selectQuery1.Columns.Add(column65);
            selectQuery1.Columns.Add(column66);
            selectQuery1.Columns.Add(column67);
            selectQuery1.Columns.Add(column68);
            selectQuery1.Columns.Add(column69);
            selectQuery1.Columns.Add(column70);
            selectQuery1.Columns.Add(column71);
            selectQuery1.Columns.Add(column72);
            selectQuery1.Columns.Add(column73);
            selectQuery1.Columns.Add(column74);
            selectQuery1.Columns.Add(column75);
            selectQuery1.Columns.Add(column76);
            selectQuery1.Columns.Add(column77);
            selectQuery1.Columns.Add(column78);
            selectQuery1.Columns.Add(column79);
            selectQuery1.Columns.Add(column80);
            selectQuery1.Columns.Add(column81);
            selectQuery1.Columns.Add(column82);
            selectQuery1.Columns.Add(column83);
            selectQuery1.Columns.Add(column84);
            selectQuery1.Columns.Add(column85);
            selectQuery1.Columns.Add(column86);
            selectQuery1.Columns.Add(column87);
            selectQuery1.Columns.Add(column88);
            selectQuery1.Name = "V_Amr_Sheraa";
            selectQuery1.Tables.Add(table1);
            this.sqlDataSource2.Queries.AddRange(new DevExpress.DataAccess.Sql.SqlQuery[] {
                        selectQuery1});
            this.sqlDataSource2.ResultSchemaSerializable = resources.GetString("sqlDataSource2.ResultSchemaSerializable");
            // 
            // label53
            // 
            this.label53.Dpi = 254F;
            this.label53.Font = new System.Drawing.Font("Times New Roman", 14F, System.Drawing.FontStyle.Bold);
            this.label53.LocationFloat = new DevExpress.Utils.PointFloat(533.4F, 266.7F);
            this.label53.Name = "label53";
            this.label53.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label53.SizeF = new System.Drawing.SizeF(354.9121F, 69.00336F);
            this.label53.StylePriority.UseFont = false;
            this.label53.StylePriority.UseTextAlignment = false;
            this.label53.Text = "Ayyash Awad";
            this.label53.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label20
            // 
            this.label20.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.suppliers_name")});
            this.label20.Dpi = 254F;
            this.label20.LocationFloat = new DevExpress.Utils.PointFloat(288.5547F, 64.13498F);
            this.label20.Name = "label20";
            this.label20.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label20.SizeF = new System.Drawing.SizeF(1044.663F, 50.27084F);
            this.label20.Text = "label20";
            // 
            // label47
            // 
            this.label47.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.Item_Name_AR")});
            this.label47.Dpi = 254F;
            this.label47.LocationFloat = new DevExpress.Utils.PointFloat(305.1703F, 13.05104F);
            this.label47.Name = "label47";
            this.label47.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label47.SizeF = new System.Drawing.SizeF(829.9802F, 58.42F);
            this.label47.Text = "label47";
            // 
            // pictureBox2
            // 
            this.pictureBox2.Dpi = 254F;
            this.pictureBox2.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox2.Image")));
            this.pictureBox2.LocationFloat = new DevExpress.Utils.PointFloat(15.875F, 18.52067F);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.SizeF = new System.Drawing.SizeF(2015.596F, 179.9167F);
            this.pictureBox2.Sizing = DevExpress.XtraPrinting.ImageSizeMode.Squeeze;
            // 
            // DetailReport
            // 
            this.DetailReport.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
                        this.Detail1,
                        this.GroupFooter1});
            this.DetailReport.DataSource = this.sqlDataSource2;
            this.DetailReport.Dpi = 254F;
            this.DetailReport.Level = 0;
            this.DetailReport.Name = "DetailReport";
            // 
            // label23
            // 
            this.label23.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.consaladdress")});
            this.label23.Dpi = 254F;
            this.label23.LocationFloat = new DevExpress.Utils.PointFloat(530.6795F, 411.877F);
            this.label23.Name = "label23";
            this.label23.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label23.SizeF = new System.Drawing.SizeF(1448.562F, 45.19086F);
            this.label23.Text = "label23";
            // 
            // label65
            // 
            this.label65.Dpi = 254F;
            this.label65.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label65.LocationFloat = new DevExpress.Utils.PointFloat(257.2014F, 462.915F);
            this.label65.Name = "label65";
            this.label65.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label65.SizeF = new System.Drawing.SizeF(30.42703F, 37.25333F);
            this.label65.StylePriority.UseFont = false;
            this.label65.StylePriority.UseTextAlignment = false;
            this.label65.Text = ":";
            this.label65.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label45
            // 
            this.label45.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.quantity")});
            this.label45.Dpi = 254F;
            this.label45.LocationFloat = new DevExpress.Utils.PointFloat(1342.178F, 13.05104F);
            this.label45.Name = "label45";
            this.label45.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label45.SizeF = new System.Drawing.SizeF(204.0995F, 58.42F);
            this.label45.StylePriority.UseTextAlignment = false;
            this.label45.Text = "label45";
            this.label45.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // shape2
            // 
            this.shape2.Dpi = 254F;
            this.shape2.LocationFloat = new DevExpress.Utils.PointFloat(20.68622F, 0F);
            this.shape2.Name = "shape2";
            this.shape2.Shape = shapeRectangle4;
            this.shape2.SizeF = new System.Drawing.SizeF(1997.138F, 188.3339F);
            // 
            // label44
            // 
            this.label44.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.price")});
            this.label44.Dpi = 254F;
            this.label44.LocationFloat = new DevExpress.Utils.PointFloat(1546.277F, 13.05104F);
            this.label44.Name = "label44";
            this.label44.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label44.SizeF = new System.Drawing.SizeF(204.0995F, 58.42F);
            this.label44.StylePriority.UseTextAlignment = false;
            this.label44.Text = "label44";
            this.label44.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label58
            // 
            this.label58.Dpi = 254F;
            this.label58.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label58.LocationFloat = new DevExpress.Utils.PointFloat(257.0958F, 118.9567F);
            this.label58.Name = "label58";
            this.label58.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label58.SizeF = new System.Drawing.SizeF(30.42706F, 45.19087F);
            this.label58.StylePriority.UseFont = false;
            this.label58.StylePriority.UseTextAlignment = false;
            this.label58.Text = ":";
            this.label58.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label17
            // 
            this.label17.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.PO_NO")});
            this.label17.Dpi = 254F;
            this.label17.LocationFloat = new DevExpress.Utils.PointFloat(1639.724F, 62.77233F);
            this.label17.Name = "label17";
            this.label17.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label17.SizeF = new System.Drawing.SizeF(253.9999F, 43.53719F);
            this.label17.Text = "label17";
            // 
            // label8
            // 
            this.label8.Dpi = 254F;
            this.label8.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label8.LocationFloat = new DevExpress.Utils.PointFloat(1404.02F, 111.8659F);
            this.label8.Name = "label8";
            this.label8.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label8.SizeF = new System.Drawing.SizeF(205.0519F, 45.19083F);
            this.label8.SnapLineMargin = new DevExpress.XtraPrinting.PaddingInfo(3, 3, 3, 3, 254F);
            this.label8.StylePriority.UseFont = false;
            this.label8.StylePriority.UseTextAlignment = false;
            this.label8.Text = "P.O.Date";
            this.label8.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // label37
            // 
            this.label37.Dpi = 254F;
            this.label37.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label37.LocationFloat = new DevExpress.Utils.PointFloat(1134.613F, 572.1349F);
            this.label37.Name = "label37";
            this.label37.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label37.SizeF = new System.Drawing.SizeF(195.9585F, 45.19086F);
            this.label37.StylePriority.UseFont = false;
            this.label37.StylePriority.UseTextAlignment = false;
            this.label37.Text = "Unit";
            this.label37.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // line20
            // 
            this.line20.BorderWidth = 0.5F;
            this.line20.Dpi = 254F;
            this.line20.ForeColor = System.Drawing.Color.DarkGray;
            this.line20.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line20.LineWidth = 3;
            this.line20.LocationFloat = new DevExpress.Utils.PointFloat(1334.326F, 0F);
            this.line20.Name = "line20";
            this.line20.SizeF = new System.Drawing.SizeF(5.291748F, 86.37923F);
            this.line20.StylePriority.UseBorderWidth = false;
            this.line20.StylePriority.UseForeColor = false;
            // 
            // label77
            // 
            this.label77.Dpi = 254F;
            this.label77.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label77.LocationFloat = new DevExpress.Utils.PointFloat(1613.501F, 109.876F);
            this.label77.Name = "label77";
            this.label77.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label77.SizeF = new System.Drawing.SizeF(22.15869F, 45.19089F);
            this.label77.StylePriority.UseFont = false;
            this.label77.StylePriority.UseTextAlignment = false;
            this.label77.Text = ":";
            this.label77.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // shape4
            // 
            this.shape4.Dpi = 254F;
            this.shape4.LocationFloat = new DevExpress.Utils.PointFloat(23.52107F, 555.579F);
            this.shape4.Name = "shape4";
            this.shape4.Shape = shapeRectangle1;
            this.shape4.SizeF = new System.Drawing.SizeF(1994.958F, 76.47327F);
            // 
            // label60
            // 
            this.label60.Dpi = 254F;
            this.label60.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label60.LocationFloat = new DevExpress.Utils.PointFloat(257.2014F, 203.6234F);
            this.label60.Name = "label60";
            this.label60.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label60.SizeF = new System.Drawing.SizeF(30.42706F, 45.19087F);
            this.label60.StylePriority.UseFont = false;
            this.label60.StylePriority.UseTextAlignment = false;
            this.label60.Text = ":";
            this.label60.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label24
            // 
            this.label24.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.suppphone")});
            this.label24.Dpi = 254F;
            this.label24.LocationFloat = new DevExpress.Utils.PointFloat(288.5547F, 204.7876F);
            this.label24.Name = "label24";
            this.label24.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label24.SizeF = new System.Drawing.SizeF(343.9584F, 45.19092F);
            this.label24.Text = "label24";
            // 
            // label34
            // 
            this.label34.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.consaltmail")});
            this.label34.Dpi = 254F;
            this.label34.LocationFloat = new DevExpress.Utils.PointFloat(753.9217F, 457.0677F);
            this.label34.Name = "label34";
            this.label34.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label34.SizeF = new System.Drawing.SizeF(1225.321F, 45.19089F);
            this.label34.Text = "label34";
            // 
            // label59
            // 
            this.label59.Dpi = 254F;
            this.label59.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label59.LocationFloat = new DevExpress.Utils.PointFloat(256.9898F, 166.37F);
            this.label59.Name = "label59";
            this.label59.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label59.SizeF = new System.Drawing.SizeF(30.42703F, 37.25336F);
            this.label59.StylePriority.UseFont = false;
            this.label59.StylePriority.UseTextAlignment = false;
            this.label59.Text = ":";
            this.label59.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label66
            // 
            this.label66.Dpi = 254F;
            this.label66.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label66.LocationFloat = new DevExpress.Utils.PointFloat(1564.859F, 0F);
            this.label66.Name = "label66";
            this.label66.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label66.SizeF = new System.Drawing.SizeF(171.6969F, 45.19086F);
            this.label66.StylePriority.UseFont = false;
            this.label66.StylePriority.UseTextAlignment = false;
            this.label66.Text = "Total";
            this.label66.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // GroupFooter1
            // 
            this.GroupFooter1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
                        this.label72,
                        this.line23,
                        this.line24,
                        this.line25,
                        this.line26,
                        this.label66,
                        this.label67,
                        this.label68,
                        this.label69,
                        this.label71,
                        this.label70,
                        this.shape2});
            this.GroupFooter1.Dpi = 254F;
            this.GroupFooter1.HeightF = 188.3339F;
            this.GroupFooter1.Name = "GroupFooter1";
            // 
            // label6
            // 
            this.label6.Dpi = 254F;
            this.label6.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label6.LocationFloat = new DevExpress.Utils.PointFloat(51.7525F, 249.9783F);
            this.label6.Name = "label6";
            this.label6.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label6.SizeF = new System.Drawing.SizeF(205.0521F, 45.19084F);
            this.label6.StylePriority.UseFont = false;
            this.label6.StylePriority.UseTextAlignment = false;
            this.label6.Text = "Mobile No.";
            this.label6.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // label32
            // 
            this.label32.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.supfax")});
            this.label32.Dpi = 254F;
            this.label32.Font = new System.Drawing.Font("Times New Roman", 8F);
            this.label32.LocationFloat = new DevExpress.Utils.PointFloat(762.1899F, 204.7876F);
            this.label32.Name = "label32";
            this.label32.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label32.SizeF = new System.Drawing.SizeF(571.0276F, 45.19095F);
            this.label32.StylePriority.UseFont = false;
            this.label32.Text = "label32";
            // 
            // label1
            // 
            this.label1.Dpi = 254F;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.label1.LocationFloat = new DevExpress.Utils.PointFloat(866.1136F, 223.7412F);
            this.label1.Name = "label1";
            this.label1.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label1.SizeF = new System.Drawing.SizeF(357.1875F, 58.42004F);
            this.label1.StylePriority.UseFont = false;
            this.label1.StylePriority.UseTextAlignment = false;
            this.label1.Text = "Purchase Order";
            this.label1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // ReportHeader
            // 
            this.ReportHeader.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
                        this.pictureBox1,
                        this.label1});
            this.ReportHeader.Dpi = 254F;
            this.ReportHeader.Expanded = false;
            this.ReportHeader.HeightF = 307.0625F;
            this.ReportHeader.Name = "ReportHeader";
            // 
            // line11
            // 
            this.line11.BorderWidth = 0.5F;
            this.line11.Dpi = 254F;
            this.line11.ForeColor = System.Drawing.Color.DarkGray;
            this.line11.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line11.LineWidth = 3;
            this.line11.LocationFloat = new DevExpress.Utils.PointFloat(120.8506F, 556.9847F);
            this.line11.Name = "line11";
            this.line11.SizeF = new System.Drawing.SizeF(5.291695F, 73.87164F);
            this.line11.StylePriority.UseBorderWidth = false;
            this.line11.StylePriority.UseForeColor = false;
            // 
            // line1
            // 
            this.line1.Dpi = 254F;
            this.line1.LineWidth = 3;
            this.line1.LocationFloat = new DevExpress.Utils.PointFloat(26.35255F, 297.7091F);
            this.line1.Name = "line1";
            this.line1.SizeF = new System.Drawing.SizeF(1988.82F, 6.614563F);
            // 
            // line17
            // 
            this.line17.BorderWidth = 0.5F;
            this.line17.Dpi = 254F;
            this.line17.ForeColor = System.Drawing.Color.DarkGray;
            this.line17.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line17.LineWidth = 3;
            this.line17.LocationFloat = new DevExpress.Utils.PointFloat(121.2181F, 0F);
            this.line17.Name = "line17";
            this.line17.SizeF = new System.Drawing.SizeF(5.291687F, 86.37923F);
            this.line17.StylePriority.UseBorderWidth = false;
            this.line17.StylePriority.UseForeColor = false;
            // 
            // label15
            // 
            this.label15.Dpi = 254F;
            this.label15.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label15.LocationFloat = new DevExpress.Utils.PointFloat(51.7525F, 457.0677F);
            this.label15.Name = "label15";
            this.label15.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label15.SizeF = new System.Drawing.SizeF(205.0521F, 45.19083F);
            this.label15.StylePriority.UseFont = false;
            this.label15.StylePriority.UseTextAlignment = false;
            this.label15.Text = "Telephone";
            this.label15.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Dpi = 254F;
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.LocationFloat = new DevExpress.Utils.PointFloat(13.08334F, 7.9375F);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.SizeF = new System.Drawing.SizeF(2008.188F, 193.1458F);
            // 
            // line14
            // 
            this.line14.BorderWidth = 0.5F;
            this.line14.Dpi = 254F;
            this.line14.ForeColor = System.Drawing.Color.DarkGray;
            this.line14.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line14.LineWidth = 3;
            this.line14.LocationFloat = new DevExpress.Utils.PointFloat(1332.996F, 554.7621F);
            this.line14.Name = "line14";
            this.line14.SizeF = new System.Drawing.SizeF(5.291748F, 73.8717F);
            this.line14.StylePriority.UseBorderWidth = false;
            this.line14.StylePriority.UseForeColor = false;
            // 
            // label29
            // 
            this.label29.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.consaltphone")});
            this.label29.Dpi = 254F;
            this.label29.LocationFloat = new DevExpress.Utils.PointFloat(288.5547F, 457.0677F);
            this.label29.Name = "label29";
            this.label29.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label29.SizeF = new System.Drawing.SizeF(222.25F, 45.19092F);
            this.label29.Text = "label29";
            // 
            // line18
            // 
            this.line18.BorderWidth = 0.5F;
            this.line18.Dpi = 254F;
            this.line18.ForeColor = System.Drawing.Color.DarkGray;
            this.line18.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line18.LineWidth = 3;
            this.line18.LocationFloat = new DevExpress.Utils.PointFloat(309.8698F, 0.4666292F);
            this.line18.Name = "line18";
            this.line18.SizeF = new System.Drawing.SizeF(5.291687F, 86.37923F);
            this.line18.StylePriority.UseBorderWidth = false;
            this.line18.StylePriority.UseForeColor = false;
            // 
            // label18
            // 
            this.label18.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.performa_date")});
            this.label18.Dpi = 254F;
            this.label18.LocationFloat = new DevExpress.Utils.PointFloat(1640.493F, 109.6169F);
            this.label18.Name = "label18";
            this.label18.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label18.SizeF = new System.Drawing.SizeF(254F, 47.43977F);
            this.label18.Text = "label18";
            // 
            // label72
            // 
            this.label72.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding(this.Only, "Text", "")});
            this.label72.Dpi = 254F;
            this.label72.LocationFloat = new DevExpress.Utils.PointFloat(47.47926F, 18.41506F);
            this.label72.Name = "label72";
            this.label72.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label72.SizeF = new System.Drawing.SizeF(1471.083F, 164.2533F);
            this.label72.Text = "label72";
            // 
            // label5
            // 
            this.label5.Dpi = 254F;
            this.label5.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label5.LocationFloat = new DevExpress.Utils.PointFloat(51.7525F, 204.7876F);
            this.label5.Name = "label5";
            this.label5.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label5.SizeF = new System.Drawing.SizeF(205.0521F, 45.19086F);
            this.label5.StylePriority.UseFont = false;
            this.label5.StylePriority.UseTextAlignment = false;
            this.label5.Text = "Tell.";
            this.label5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // label22
            // 
            this.label22.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.supaddress")});
            this.label22.Dpi = 254F;
            this.label22.Font = new System.Drawing.Font("Times New Roman", 9F);
            this.label22.LocationFloat = new DevExpress.Utils.PointFloat(288.5547F, 159.5967F);
            this.label22.Name = "label22";
            this.label22.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label22.SizeF = new System.Drawing.SizeF(1044.663F, 45.19083F);
            this.label22.StylePriority.UseFont = false;
            this.label22.Text = "label22";
            // 
            // label33
            // 
            this.label33.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.ContactMial")});
            this.label33.Dpi = 254F;
            this.label33.Font = new System.Drawing.Font("Times New Roman", 8F);
            this.label33.LocationFloat = new DevExpress.Utils.PointFloat(762.1899F, 249.9783F);
            this.label33.Name = "label33";
            this.label33.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label33.SizeF = new System.Drawing.SizeF(571.0276F, 47.73096F);
            this.label33.StylePriority.UseFont = false;
            this.label33.Text = "label33";
            // 
            // label2
            // 
            this.label2.Dpi = 254F;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label2.LocationFloat = new DevExpress.Utils.PointFloat(51.7525F, 66.67503F);
            this.label2.Name = "label2";
            this.label2.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label2.SizeF = new System.Drawing.SizeF(205.0521F, 45.19084F);
            this.label2.StylePriority.UseFont = false;
            this.label2.StylePriority.UseTextAlignment = false;
            this.label2.Text = "Supplier Name";
            this.label2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // label40
            // 
            this.label40.Dpi = 254F;
            this.label40.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label40.LocationFloat = new DevExpress.Utils.PointFloat(1752.884F, 572.1349F);
            this.label40.Name = "label40";
            this.label40.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label40.SizeF = new System.Drawing.SizeF(228.7911F, 45.19086F);
            this.label40.StylePriority.UseFont = false;
            this.label40.StylePriority.UseTextAlignment = false;
            this.label40.Text = "Total ";
            this.label40.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label36
            // 
            this.label36.Dpi = 254F;
            this.label36.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label36.LocationFloat = new DevExpress.Utils.PointFloat(320.0223F, 572.1349F);
            this.label36.Name = "label36";
            this.label36.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label36.SizeF = new System.Drawing.SizeF(802.5834F, 45.19086F);
            this.label36.StylePriority.UseFont = false;
            this.label36.StylePriority.UseTextAlignment = false;
            this.label36.Text = "Item Name";
            this.label36.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label7
            // 
            this.label7.Dpi = 254F;
            this.label7.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label7.LocationFloat = new DevExpress.Utils.PointFloat(1404.02F, 64.13498F);
            this.label7.Name = "label7";
            this.label7.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label7.SizeF = new System.Drawing.SizeF(205.0519F, 45.19084F);
            this.label7.StylePriority.UseFont = false;
            this.label7.StylePriority.UseTextAlignment = false;
            this.label7.Text = "P.O.No";
            this.label7.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // label10
            // 
            this.label10.Dpi = 254F;
            this.label10.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label10.LocationFloat = new DevExpress.Utils.PointFloat(1404.021F, 204.7876F);
            this.label10.Name = "label10";
            this.label10.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label10.SizeF = new System.Drawing.SizeF(205.0521F, 45.19086F);
            this.label10.StylePriority.UseFont = false;
            this.label10.StylePriority.UseTextAlignment = false;
            this.label10.Text = "RFM";
            this.label10.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // PageFooter
            // 
            this.PageFooter.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
                        this.label55,
                        this.label54,
                        this.label53,
                        this.label52,
                        this.label51,
                        this.label50,
                        this.label49,
                        this.label48});
            this.PageFooter.Dpi = 254F;
            this.PageFooter.HeightF = 403.5955F;
            this.PageFooter.Name = "PageFooter";
            // 
            // label46
            // 
            this.label46.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.totalitem")});
            this.label46.Dpi = 254F;
            this.label46.LocationFloat = new DevExpress.Utils.PointFloat(1750.376F, 13.05104F);
            this.label46.Name = "label46";
            this.label46.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label46.SizeF = new System.Drawing.SizeF(234.8971F, 58.42F);
            this.label46.StylePriority.UseTextAlignment = false;
            this.label46.Text = "label46";
            this.label46.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label56
            // 
            this.label56.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.Item_Id")});
            this.label56.Dpi = 254F;
            this.label56.Font = new System.Drawing.Font("Times New Roman", 7F);
            this.label56.LocationFloat = new DevExpress.Utils.PointFloat(127.8995F, 13.05104F);
            this.label56.Name = "label56";
            this.label56.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label56.SizeF = new System.Drawing.SizeF(177.2708F, 58.42F);
            this.label56.StylePriority.UseFont = false;
            this.label56.StylePriority.UseTextAlignment = false;
            this.label56.Text = "label56";
            this.label56.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label48
            // 
            this.label48.Dpi = 254F;
            this.label48.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label48.LocationFloat = new DevExpress.Utils.PointFloat(0F, 63.5F);
            this.label48.Name = "label48";
            this.label48.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label48.SizeF = new System.Drawing.SizeF(436.9327F, 69.00333F);
            this.label48.StylePriority.UseFont = false;
            this.label48.StylePriority.UseTextAlignment = false;
            this.label48.Text = "Purchasing Manager";
            this.label48.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label27
            // 
            this.label27.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.TheName")});
            this.label27.Dpi = 254F;
            this.label27.LocationFloat = new DevExpress.Utils.PointFloat(288.5547F, 366.6858F);
            this.label27.Name = "label27";
            this.label27.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label27.SizeF = new System.Drawing.SizeF(1690.687F, 45.19086F);
            this.label27.Text = "label27";
            // 
            // label30
            // 
            this.label30.Dpi = 254F;
            this.label30.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label30.LocationFloat = new DevExpress.Utils.PointFloat(632.8748F, 204.7876F);
            this.label30.Name = "label30";
            this.label30.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label30.SizeF = new System.Drawing.SizeF(96.24225F, 45.19084F);
            this.label30.StylePriority.UseFont = false;
            this.label30.StylePriority.UseTextAlignment = false;
            this.label30.Text = "Fax";
            this.label30.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // label52
            // 
            this.label52.Dpi = 254F;
            this.label52.Font = new System.Drawing.Font("Times New Roman", 14F, System.Drawing.FontStyle.Bold);
            this.label52.LocationFloat = new DevExpress.Utils.PointFloat(0F, 266.7F);
            this.label52.Name = "label52";
            this.label52.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label52.SizeF = new System.Drawing.SizeF(436.9327F, 69.00336F);
            this.label52.StylePriority.UseFont = false;
            this.label52.StylePriority.UseTextAlignment = false;
            this.label52.Text = "Mansour Al-Balawi";
            this.label52.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // shape1
            // 
            this.shape1.Dpi = 254F;
            this.shape1.LocationFloat = new DevExpress.Utils.PointFloat(19.75245F, 0.9449582F);
            this.shape1.Name = "shape1";
            this.shape1.Shape = shapeRectangle3;
            this.shape1.SizeF = new System.Drawing.SizeF(1998.912F, 86.36756F);
            // 
            // label51
            // 
            this.label51.Dpi = 254F;
            this.label51.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label51.LocationFloat = new DevExpress.Utils.PointFloat(1549.4F, 63.5F);
            this.label51.Name = "label51";
            this.label51.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label51.SizeF = new System.Drawing.SizeF(391.812F, 69.00333F);
            this.label51.StylePriority.UseFont = false;
            this.label51.StylePriority.UseTextAlignment = false;
            this.label51.Text = "Executive Manager";
            this.label51.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // line22
            // 
            this.line22.BorderWidth = 0.5F;
            this.line22.Dpi = 254F;
            this.line22.ForeColor = System.Drawing.Color.DarkGray;
            this.line22.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line22.LineWidth = 3;
            this.line22.LocationFloat = new DevExpress.Utils.PointFloat(1748.443F, 0F);
            this.line22.Name = "line22";
            this.line22.SizeF = new System.Drawing.SizeF(5.291748F, 86.37923F);
            this.line22.StylePriority.UseBorderWidth = false;
            this.line22.StylePriority.UseForeColor = false;
            // 
            // shape3
            // 
            this.shape3.Dpi = 254F;
            this.shape3.LocationFloat = new DevExpress.Utils.PointFloat(26.16685F, 23.51044F);
            this.shape3.Name = "shape3";
            this.shape3.Shape = shapeRectangle2;
            this.shape3.SizeF = new System.Drawing.SizeF(1994.958F, 510.6458F);
            // 
            // label31
            // 
            this.label31.Dpi = 254F;
            this.label31.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label31.LocationFloat = new DevExpress.Utils.PointFloat(632.8748F, 249.9783F);
            this.label31.Name = "label31";
            this.label31.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label31.SizeF = new System.Drawing.SizeF(96.24225F, 45.19089F);
            this.label31.StylePriority.UseFont = false;
            this.label31.StylePriority.UseTextAlignment = false;
            this.label31.Text = "E-Mail";
            this.label31.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // line16
            // 
            this.line16.BorderWidth = 0.5F;
            this.line16.Dpi = 254F;
            this.line16.ForeColor = System.Drawing.Color.DarkGray;
            this.line16.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line16.LineWidth = 3;
            this.line16.LocationFloat = new DevExpress.Utils.PointFloat(1746.392F, 556.8423F);
            this.line16.Name = "line16";
            this.line16.SizeF = new System.Drawing.SizeF(5.291748F, 73.87164F);
            this.line16.StylePriority.UseBorderWidth = false;
            this.line16.StylePriority.UseForeColor = false;
            // 
            // line13
            // 
            this.line13.BorderWidth = 0.5F;
            this.line13.Dpi = 254F;
            this.line13.ForeColor = System.Drawing.Color.DarkGray;
            this.line13.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line13.LineWidth = 3;
            this.line13.LocationFloat = new DevExpress.Utils.PointFloat(1127.267F, 556.1962F);
            this.line13.Name = "line13";
            this.line13.SizeF = new System.Drawing.SizeF(5.291626F, 73.8717F);
            this.line13.StylePriority.UseBorderWidth = false;
            this.line13.StylePriority.UseForeColor = false;
            // 
            // label64
            // 
            this.label64.Dpi = 254F;
            this.label64.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label64.LocationFloat = new DevExpress.Utils.PointFloat(256.9898F, 417.7243F);
            this.label64.Name = "label64";
            this.label64.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label64.SizeF = new System.Drawing.SizeF(30.42706F, 45.19089F);
            this.label64.StylePriority.UseFont = false;
            this.label64.StylePriority.UseTextAlignment = false;
            this.label64.Text = ":";
            this.label64.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label50
            // 
            this.label50.Dpi = 254F;
            this.label50.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label50.LocationFloat = new DevExpress.Utils.PointFloat(977.9F, 63.5F);
            this.label50.Name = "label50";
            this.label50.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label50.SizeF = new System.Drawing.SizeF(513.6622F, 69.00333F);
            this.label50.StylePriority.UseFont = false;
            this.label50.StylePriority.UseTextAlignment = false;
            this.label50.Text = "G.M. Financial Management";
            this.label50.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label73
            // 
            this.label73.Dpi = 254F;
            this.label73.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label73.LocationFloat = new DevExpress.Utils.PointFloat(729.5748F, 250.9386F);
            this.label73.Name = "label73";
            this.label73.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label73.SizeF = new System.Drawing.SizeF(30.42706F, 45.19089F);
            this.label73.StylePriority.UseFont = false;
            this.label73.StylePriority.UseTextAlignment = false;
            this.label73.Text = ":";
            this.label73.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label78
            // 
            this.label78.Dpi = 254F;
            this.label78.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label78.LocationFloat = new DevExpress.Utils.PointFloat(1613.501F, 159.4854F);
            this.label78.Name = "label78";
            this.label78.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label78.SizeF = new System.Drawing.SizeF(22.15869F, 45.19089F);
            this.label78.StylePriority.UseFont = false;
            this.label78.StylePriority.UseTextAlignment = false;
            this.label78.Text = ":";
            this.label78.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label70
            // 
            this.label70.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.net")});
            this.label70.Dpi = 254F;
            this.label70.LocationFloat = new DevExpress.Utils.PointFloat(1759.334F, 132.1859F);
            this.label70.Name = "label70";
            this.label70.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label70.SizeF = new System.Drawing.SizeF(254F, 47.83665F);
            this.label70.StylePriority.UseTextAlignment = false;
            this.label70.Text = "label70";
            this.label70.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label25
            // 
            this.label25.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.ContactMobile")});
            this.label25.Dpi = 254F;
            this.label25.LocationFloat = new DevExpress.Utils.PointFloat(288.5547F, 249.9783F);
            this.label25.Name = "label25";
            this.label25.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label25.SizeF = new System.Drawing.SizeF(343.9584F, 45.1909F);
            this.label25.Text = "label25";
            // 
            // label16
            // 
            this.label16.Dpi = 254F;
            this.label16.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label16.LocationFloat = new DevExpress.Utils.PointFloat(632.8748F, 457.0677F);
            this.label16.Name = "label16";
            this.label16.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label16.SizeF = new System.Drawing.SizeF(94.58862F, 45.19089F);
            this.label16.StylePriority.UseFont = false;
            this.label16.StylePriority.UseTextAlignment = false;
            this.label16.Text = "E-Mail";
            this.label16.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // label80
            // 
            this.label80.Dpi = 254F;
            this.label80.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label80.LocationFloat = new DevExpress.Utils.PointFloat(1613.501F, 247.1286F);
            this.label80.Name = "label80";
            this.label80.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label80.SizeF = new System.Drawing.SizeF(22.15869F, 45.19089F);
            this.label80.StylePriority.UseFont = false;
            this.label80.StylePriority.UseTextAlignment = false;
            this.label80.Text = ":";
            this.label80.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label26
            // 
            this.label26.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.Project_Name")});
            this.label26.Dpi = 254F;
            this.label26.LocationFloat = new DevExpress.Utils.PointFloat(288.5547F, 318.9552F);
            this.label26.Name = "label26";
            this.label26.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label26.SizeF = new System.Drawing.SizeF(1690.687F, 45.19089F);
            this.label26.Text = "label26";
            // 
            // label76
            // 
            this.label76.Dpi = 254F;
            this.label76.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label76.LocationFloat = new DevExpress.Utils.PointFloat(1612.675F, 60.26663F);
            this.label76.Name = "label76";
            this.label76.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label76.SizeF = new System.Drawing.SizeF(22.15869F, 45.19089F);
            this.label76.StylePriority.UseFont = false;
            this.label76.StylePriority.UseTextAlignment = false;
            this.label76.Text = ":";
            this.label76.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label38
            // 
            this.label38.Dpi = 254F;
            this.label38.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label38.LocationFloat = new DevExpress.Utils.PointFloat(1337.695F, 572.1349F);
            this.label38.Name = "label38";
            this.label38.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label38.SizeF = new System.Drawing.SizeF(196.9761F, 45.19086F);
            this.label38.StylePriority.UseFont = false;
            this.label38.StylePriority.UseTextAlignment = false;
            this.label38.Text = "Qty";
            this.label38.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label71
            // 
            this.label71.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding(this.TotalDeicount, "Text", "")});
            this.label71.Dpi = 254F;
            this.label71.LocationFloat = new DevExpress.Utils.PointFloat(1759.334F, 66.3942F);
            this.label71.Name = "label71";
            this.label71.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label71.SizeF = new System.Drawing.SizeF(254F, 47.83667F);
            this.label71.StylePriority.UseTextAlignment = false;
            this.label71.Text = "label71";
            this.label71.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label63
            // 
            this.label63.Dpi = 254F;
            this.label63.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label63.LocationFloat = new DevExpress.Utils.PointFloat(257.2014F, 370.3109F);
            this.label63.Name = "label63";
            this.label63.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label63.SizeF = new System.Drawing.SizeF(30.42706F, 45.19086F);
            this.label63.StylePriority.UseFont = false;
            this.label63.StylePriority.UseTextAlignment = false;
            this.label63.Text = ":";
            this.label63.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label67
            // 
            this.label67.Dpi = 254F;
            this.label67.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label67.LocationFloat = new DevExpress.Utils.PointFloat(1564.859F, 66.57136F);
            this.label67.Name = "label67";
            this.label67.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label67.SizeF = new System.Drawing.SizeF(179.6345F, 45.19086F);
            this.label67.StylePriority.UseFont = false;
            this.label67.StylePriority.UseTextAlignment = false;
            this.label67.Text = "Discount ";
            this.label67.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label61
            // 
            this.label61.Dpi = 254F;
            this.label61.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label61.LocationFloat = new DevExpress.Utils.PointFloat(257.0958F, 250.9309F);
            this.label61.Name = "label61";
            this.label61.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label61.SizeF = new System.Drawing.SizeF(30.42706F, 45.19089F);
            this.label61.StylePriority.UseFont = false;
            this.label61.StylePriority.UseTextAlignment = false;
            this.label61.Text = ":";
            this.label61.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label41
            // 
            this.label41.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.serial")});
            this.label41.Dpi = 254F;
            this.label41.Font = new System.Drawing.Font("Times New Roman", 8F);
            this.label41.LocationFloat = new DevExpress.Utils.PointFloat(28.31446F, 11.01578F);
            this.label41.Name = "label41";
            this.label41.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label41.SizeF = new System.Drawing.SizeF(95.51453F, 58.42F);
            this.label41.StylePriority.UseFont = false;
            this.label41.StylePriority.UseTextAlignment = false;
            this.label41.Text = "label41";
            this.label41.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // TotalDeicount
            // 
            this.TotalDeicount.Description = "Parameter1";
            this.TotalDeicount.Name = "TotalDeicount";
            this.TotalDeicount.Type = typeof(int);
            this.TotalDeicount.ValueInfo = "0";
            // 
            // label39
            // 
            this.label39.Dpi = 254F;
            this.label39.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label39.LocationFloat = new DevExpress.Utils.PointFloat(1544.722F, 572.1349F);
            this.label39.Name = "label39";
            this.label39.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label39.SizeF = new System.Drawing.SizeF(196.9761F, 45.19086F);
            this.label39.StylePriority.UseFont = false;
            this.label39.StylePriority.UseTextAlignment = false;
            this.label39.Text = "Unit Price";
            this.label39.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label68
            // 
            this.label68.Dpi = 254F;
            this.label68.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label68.LocationFloat = new DevExpress.Utils.PointFloat(1564.859F, 128.4255F);
            this.label68.Name = "label68";
            this.label68.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label68.SizeF = new System.Drawing.SizeF(179.6344F, 45.19087F);
            this.label68.StylePriority.UseFont = false;
            this.label68.StylePriority.UseTextAlignment = false;
            this.label68.Text = "Net Total";
            this.label68.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label28
            // 
            this.label28.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.CityName")});
            this.label28.Dpi = 254F;
            this.label28.LocationFloat = new DevExpress.Utils.PointFloat(288.5547F, 411.877F);
            this.label28.Name = "label28";
            this.label28.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label28.SizeF = new System.Drawing.SizeF(222.25F, 45.19089F);
            this.label28.Text = "label28";
            // 
            // line19
            // 
            this.line19.BorderWidth = 0.5F;
            this.line19.Dpi = 254F;
            this.line19.ForeColor = System.Drawing.Color.DarkGray;
            this.line19.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line19.LineWidth = 3;
            this.line19.LocationFloat = new DevExpress.Utils.PointFloat(1128.875F, 0F);
            this.line19.Name = "line19";
            this.line19.SizeF = new System.Drawing.SizeF(5.291626F, 86.37923F);
            this.line19.StylePriority.UseBorderWidth = false;
            this.line19.StylePriority.UseForeColor = false;
            // 
            // label19
            // 
            this.label19.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.ShaipingDate")});
            this.label19.Dpi = 254F;
            this.label19.LocationFloat = new DevExpress.Utils.PointFloat(1639.724F, 159.5967F);
            this.label19.Name = "label19";
            this.label19.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label19.SizeF = new System.Drawing.SizeF(254F, 45.19084F);
            this.label19.Text = "label19";
            // 
            // label35
            // 
            this.label35.Dpi = 254F;
            this.label35.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label35.LocationFloat = new DevExpress.Utils.PointFloat(23.70664F, 572.1349F);
            this.label35.Name = "label35";
            this.label35.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label35.SizeF = new System.Drawing.SizeF(94.56206F, 45.19086F);
            this.label35.StylePriority.UseFont = false;
            this.label35.StylePriority.UseTextAlignment = false;
            this.label35.Text = "S.No";
            this.label35.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label14
            // 
            this.label14.Dpi = 254F;
            this.label14.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label14.LocationFloat = new DevExpress.Utils.PointFloat(51.7525F, 411.877F);
            this.label14.Name = "label14";
            this.label14.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label14.SizeF = new System.Drawing.SizeF(205.0521F, 45.19086F);
            this.label14.StylePriority.UseFont = false;
            this.label14.StylePriority.UseTextAlignment = false;
            this.label14.Text = "Location";
            this.label14.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // label9
            // 
            this.label9.Dpi = 254F;
            this.label9.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label9.LocationFloat = new DevExpress.Utils.PointFloat(1404.02F, 159.5967F);
            this.label9.Name = "label9";
            this.label9.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label9.SizeF = new System.Drawing.SizeF(205.0519F, 45.19084F);
            this.label9.StylePriority.UseFont = false;
            this.label9.StylePriority.UseTextAlignment = false;
            this.label9.Text = "Delivery Date";
            this.label9.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // line2
            // 
            this.line2.Dpi = 254F;
            this.line2.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line2.LineWidth = 3;
            this.line2.LocationFloat = new DevExpress.Utils.PointFloat(1398.728F, 25.40002F);
            this.line2.Name = "line2";
            this.line2.SizeF = new System.Drawing.SizeF(5.291626F, 272.3091F);
            // 
            // label69
            // 
            this.label69.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.totalitem")});
            this.label69.Dpi = 254F;
            this.label69.LocationFloat = new DevExpress.Utils.PointFloat(1759.334F, 0F);
            this.label69.Name = "label69";
            this.label69.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label69.SizeF = new System.Drawing.SizeF(254F, 45.19088F);
            this.label69.StylePriority.UseTextAlignment = false;
            this.label69.Text = "label69";
            this.label69.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label57
            // 
            this.label57.Dpi = 254F;
            this.label57.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label57.LocationFloat = new DevExpress.Utils.PointFloat(256.9898F, 69.00806F);
            this.label57.Name = "label57";
            this.label57.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label57.SizeF = new System.Drawing.SizeF(30.42706F, 45.19086F);
            this.label57.StylePriority.UseFont = false;
            this.label57.StylePriority.UseTextAlignment = false;
            this.label57.Text = ":";
            this.label57.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // line25
            // 
            this.line25.Dpi = 254F;
            this.line25.LineWidth = 3;
            this.line25.LocationFloat = new DevExpress.Utils.PointFloat(1543.129F, 119.25F);
            this.line25.Name = "line25";
            this.line25.SizeF = new System.Drawing.SizeF(469.1591F, 7.9375F);
            // 
            // line23
            // 
            this.line23.Dpi = 254F;
            this.line23.LineWidth = 3;
            this.line23.LocationFloat = new DevExpress.Utils.PointFloat(1541.704F, 50.04688F);
            this.line23.Name = "line23";
            this.line23.SizeF = new System.Drawing.SizeF(470.5837F, 10.58333F);
            // 
            // label12
            // 
            this.label12.Dpi = 254F;
            this.label12.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label12.LocationFloat = new DevExpress.Utils.PointFloat(51.7525F, 321.4952F);
            this.label12.Name = "label12";
            this.label12.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label12.SizeF = new System.Drawing.SizeF(205.0521F, 45.19083F);
            this.label12.StylePriority.UseFont = false;
            this.label12.StylePriority.UseTextAlignment = false;
            this.label12.Text = "Project Ref";
            this.label12.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // line26
            // 
            this.line26.BorderWidth = 0.5F;
            this.line26.Dpi = 254F;
            this.line26.ForeColor = System.Drawing.Color.DarkGray;
            this.line26.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line26.LineWidth = 3;
            this.line26.LocationFloat = new DevExpress.Utils.PointFloat(1748.542F, 0F);
            this.line26.Name = "line26";
            this.line26.SizeF = new System.Drawing.SizeF(5.291626F, 184.6821F);
            this.line26.StylePriority.UseBorderWidth = false;
            this.line26.StylePriority.UseForeColor = false;
            // 
            // label74
            // 
            this.label74.Dpi = 254F;
            this.label74.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label74.LocationFloat = new DevExpress.Utils.PointFloat(729.6804F, 203.6312F);
            this.label74.Name = "label74";
            this.label74.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label74.SizeF = new System.Drawing.SizeF(30.42706F, 45.19087F);
            this.label74.StylePriority.UseFont = false;
            this.label74.StylePriority.UseTextAlignment = false;
            this.label74.Text = ":";
            this.label74.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // Only
            // 
            this.Only.Description = "Parameter1";
            this.Only.Name = "Only";
            this.Only.Type = typeof(int);
            this.Only.ValueInfo = "0";
            // 
            // line21
            // 
            this.line21.BorderWidth = 0.5F;
            this.line21.Dpi = 254F;
            this.line21.ForeColor = System.Drawing.Color.DarkGray;
            this.line21.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line21.LineWidth = 3;
            this.line21.LocationFloat = new DevExpress.Utils.PointFloat(1540.182F, 0F);
            this.line21.Name = "line21";
            this.line21.SizeF = new System.Drawing.SizeF(5.291748F, 86.37923F);
            this.line21.StylePriority.UseBorderWidth = false;
            this.line21.StylePriority.UseForeColor = false;
            // 
            // line24
            // 
            this.line24.BorderWidth = 0.5F;
            this.line24.Dpi = 254F;
            this.line24.ForeColor = System.Drawing.Color.DarkGray;
            this.line24.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line24.LineWidth = 3;
            this.line24.LocationFloat = new DevExpress.Utils.PointFloat(1539.521F, 0F);
            this.line24.Name = "line24";
            this.line24.SizeF = new System.Drawing.SizeF(5.291626F, 184.6821F);
            this.line24.StylePriority.UseBorderWidth = false;
            this.line24.StylePriority.UseForeColor = false;
            // 
            // label75
            // 
            this.label75.Dpi = 254F;
            this.label75.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label75.LocationFloat = new DevExpress.Utils.PointFloat(726.3204F, 457.1416F);
            this.label75.Name = "label75";
            this.label75.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label75.SizeF = new System.Drawing.SizeF(30.42706F, 45.19089F);
            this.label75.StylePriority.UseFont = false;
            this.label75.StylePriority.UseTextAlignment = false;
            this.label75.Text = ":";
            this.label75.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label55
            // 
            this.label55.Dpi = 254F;
            this.label55.Font = new System.Drawing.Font("Times New Roman", 14F, System.Drawing.FontStyle.Bold);
            this.label55.LocationFloat = new DevExpress.Utils.PointFloat(1549.4F, 266.7F);
            this.label55.Name = "label55";
            this.label55.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label55.SizeF = new System.Drawing.SizeF(391.812F, 69.00336F);
            this.label55.StylePriority.UseFont = false;
            this.label55.StylePriority.UseTextAlignment = false;
            this.label55.Text = "Raed ALwajeeh";
            this.label55.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // line15
            // 
            this.line15.BorderWidth = 0.5F;
            this.line15.Dpi = 254F;
            this.line15.ForeColor = System.Drawing.Color.DarkGray;
            this.line15.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line15.LineWidth = 3;
            this.line15.LocationFloat = new DevExpress.Utils.PointFloat(1539.371F, 556.1962F);
            this.line15.Name = "line15";
            this.line15.SizeF = new System.Drawing.SizeF(5.291748F, 73.8717F);
            this.line15.StylePriority.UseBorderWidth = false;
            this.line15.StylePriority.UseForeColor = false;
            // 
            // label79
            // 
            this.label79.Dpi = 254F;
            this.label79.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label79.LocationFloat = new DevExpress.Utils.PointFloat(1613.501F, 204.1338F);
            this.label79.Name = "label79";
            this.label79.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label79.SizeF = new System.Drawing.SizeF(22.15869F, 45.19089F);
            this.label79.StylePriority.UseFont = false;
            this.label79.StylePriority.UseTextAlignment = false;
            this.label79.Text = ":";
            this.label79.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label42
            // 
            this.label42.Dpi = 254F;
            this.label42.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label42.LocationFloat = new DevExpress.Utils.PointFloat(128.0054F, 572.1349F);
            this.label42.Name = "label42";
            this.label42.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label42.SizeF = new System.Drawing.SizeF(171.6969F, 45.19086F);
            this.label42.StylePriority.UseFont = false;
            this.label42.StylePriority.UseTextAlignment = false;
            this.label42.Text = "Item Code";
            this.label42.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // Detail1
            // 
            this.Detail1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
                        this.line22,
                        this.line21,
                        this.line19,
                        this.line18,
                        this.line17,
                        this.label56,
                        this.label47,
                        this.label46,
                        this.label45,
                        this.label44,
                        this.label43,
                        this.label41,
                        this.shape1,
                        this.line20});
            this.Detail1.Dpi = 254F;
            this.Detail1.HeightF = 87.31252F;
            this.Detail1.Name = "Detail1";
            // 
            // label3
            // 
            this.label3.Dpi = 254F;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label3.LocationFloat = new DevExpress.Utils.PointFloat(51.7525F, 114.4058F);
            this.label3.Name = "label3";
            this.label3.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label3.SizeF = new System.Drawing.SizeF(205.0521F, 45.19083F);
            this.label3.StylePriority.UseFont = false;
            this.label3.StylePriority.UseTextAlignment = false;
            this.label3.Text = "Contact person";
            this.label3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // label4
            // 
            this.label4.Dpi = 254F;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label4.LocationFloat = new DevExpress.Utils.PointFloat(51.7525F, 159.5967F);
            this.label4.Name = "label4";
            this.label4.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label4.SizeF = new System.Drawing.SizeF(205.0521F, 45.19084F);
            this.label4.StylePriority.UseFont = false;
            this.label4.StylePriority.UseTextAlignment = false;
            this.label4.Text = "Address";
            this.label4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // line12
            // 
            this.line12.BorderWidth = 0.5F;
            this.line12.Dpi = 254F;
            this.line12.ForeColor = System.Drawing.Color.DarkGray;
            this.line12.LineDirection = DevExpress.XtraReports.UI.LineDirection.Vertical;
            this.line12.LineWidth = 3;
            this.line12.LocationFloat = new DevExpress.Utils.PointFloat(308.705F, 556.8423F);
            this.line12.Name = "line12";
            this.line12.SizeF = new System.Drawing.SizeF(5.291687F, 73.87164F);
            this.line12.StylePriority.UseBorderWidth = false;
            this.line12.StylePriority.UseForeColor = false;
            // 
            // label43
            // 
            this.label43.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.unit")});
            this.label43.Dpi = 254F;
            this.label43.LocationFloat = new DevExpress.Utils.PointFloat(1135.151F, 13.05104F);
            this.label43.Name = "label43";
            this.label43.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label43.SizeF = new System.Drawing.SizeF(204.0996F, 58.42F);
            this.label43.StylePriority.UseTextAlignment = false;
            this.label43.Text = "label43";
            this.label43.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label49
            // 
            this.label49.Dpi = 254F;
            this.label49.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label49.LocationFloat = new DevExpress.Utils.PointFloat(546.1F, 63.5F);
            this.label49.Name = "label49";
            this.label49.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label49.SizeF = new System.Drawing.SizeF(354.9121F, 69.00333F);
            this.label49.StylePriority.UseFont = false;
            this.label49.StylePriority.UseTextAlignment = false;
            this.label49.Text = "Audit Manager";
            this.label49.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label11
            // 
            this.label11.Dpi = 254F;
            this.label11.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label11.LocationFloat = new DevExpress.Utils.PointFloat(1404.02F, 249.9783F);
            this.label11.Name = "label11";
            this.label11.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label11.SizeF = new System.Drawing.SizeF(205.0519F, 45.19084F);
            this.label11.StylePriority.UseFont = false;
            this.label11.StylePriority.UseTextAlignment = false;
            this.label11.Text = "Quotation Ref";
            this.label11.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // label62
            // 
            this.label62.Dpi = 254F;
            this.label62.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.label62.LocationFloat = new DevExpress.Utils.PointFloat(257.2014F, 322.6859F);
            this.label62.Name = "label62";
            this.label62.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label62.SizeF = new System.Drawing.SizeF(30.42706F, 45.19086F);
            this.label62.StylePriority.UseFont = false;
            this.label62.StylePriority.UseTextAlignment = false;
            this.label62.Text = ":";
            this.label62.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // label13
            // 
            this.label13.Dpi = 254F;
            this.label13.Font = new System.Drawing.Font("Times New Roman", 8F, System.Drawing.FontStyle.Bold);
            this.label13.LocationFloat = new DevExpress.Utils.PointFloat(51.7525F, 366.6858F);
            this.label13.Name = "label13";
            this.label13.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label13.SizeF = new System.Drawing.SizeF(205.0521F, 45.19086F);
            this.label13.StylePriority.UseFont = false;
            this.label13.StylePriority.UseTextAlignment = false;
            this.label13.Text = "Contact person";
            this.label13.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // label21
            // 
            this.label21.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
                        new DevExpress.XtraReports.UI.XRBinding("Text", null, "V_Amr_Sheraa.contactcmb")});
            this.label21.Dpi = 254F;
            this.label21.Font = new System.Drawing.Font("Times New Roman", 9F);
            this.label21.LocationFloat = new DevExpress.Utils.PointFloat(288.5547F, 114.4058F);
            this.label21.Name = "label21";
            this.label21.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label21.SizeF = new System.Drawing.SizeF(1044.663F, 45.19083F);
            this.label21.StylePriority.UseFont = false;
            this.label21.Text = "label21";
            // 
            // label54
            // 
            this.label54.Dpi = 254F;
            this.label54.Font = new System.Drawing.Font("Times New Roman", 14F, System.Drawing.FontStyle.Bold);
            this.label54.LocationFloat = new DevExpress.Utils.PointFloat(990.6F, 266.7F);
            this.label54.Name = "label54";
            this.label54.Padding = new DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254F);
            this.label54.SizeF = new System.Drawing.SizeF(450.1622F, 69.00336F);
            this.label54.StylePriority.UseFont = false;
            this.label54.StylePriority.UseTextAlignment = false;
            this.label54.Text = "Mohammed Ziada";
            this.label54.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // XtraReportForm
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
                        this.Detail,
                        this.TopMargin,
                        this.BottomMargin,
                        this.ReportHeader,
                        this.PageFooter,
                        this.DetailReport});
            this.ComponentStorage.AddRange(new System.ComponentModel.IComponent[] {
                        this.sqlDataSource2});
            this.DataMember = "V_Amr_Sheraa";
            this.DataSource = this.sqlDataSource2;
            this.DisplayName = "«„— ‘—«¡ —ﬁ„ 1";
            this.Dpi = 254F;
            this.Margins = new System.Drawing.Printing.Margins(61, 56, 13, 211);
            this.Name = "XtraReportForm";
            this.PageHeight = 2794;
            this.PageWidth = 2159;
            this.Parameters.AddRange(new DevExpress.XtraReports.Parameters.Parameter[] {
                        this.TotalDeicount,
                        this.Only});
            this.ReportUnit = DevExpress.XtraReports.UI.ReportUnit.TenthsOfAMillimeter;
            this.SnapGridSize = 12.7F;
            this.SnappingMode = DevExpress.XtraReports.UI.SnappingMode.None;
            this.Version = "16.2";
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();
        }
    }
}
', 1, 147)
 