Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.Services
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.Adapters.ControlAdapter
Imports System.Drawing
Imports System.Threading
Imports System
Imports System.Collections.Specialized
Imports System.Text
Imports System.Net.Security
Imports System.IO
Imports Newtonsoft.Json.Converters
Imports Newtonsoft.Json
Imports System.Web.Script.Serialization

Partial Class PRToInvRpt
    Inherits System.Web.UI.Page
    Protected Sub Page_PreInit1(ByVal sender As Object, ByVal e As EventArgs) Handles Me.PreInit
        Try
            If Not Session("CTheme") Is Nothing And Not Session("CTheme") = String.Empty Then
                Page.Theme = Convert.ToString(Session("CTheme"))
            Else
                Page.Theme = "Default"
            End If
        Catch ex As Exception
        End Try

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtd1.Text = Now.AddDays(-1).ToString("yyyy-MM-dd")
            txtd2.Text = Now.ToString("yyyy-MM-dd")
        End If
    End Sub

    <WebMethod()>
    Public Shared Function GetData(sdate As String, tdate As String) As DGrid
        Dim jsonData As String = ""
        Dim grid As New DGrid()
        Dim conStr As String = ConfigurationManager.ConnectionStrings("conStr").ConnectionString
        Dim con As New SqlConnection(conStr)
        Dim da As New SqlDataAdapter("", con)
        Try
            Dim tblPR As New DataTable
            tblPR.Columns.Add("PR Requester", GetType(String))
            tblPR.Columns.Add("Sub Department", GetType(String))
            tblPR.Columns.Add("PR No", GetType(String))
            tblPR.Columns.Add("PR Created On", GetType(String))
            tblPR.Columns.Add("Estimated Cost", GetType(String))
            tblPR.Columns.Add("Required By", GetType(String))
            tblPR.Columns.Add("Purchase Duration From", GetType(String))
            tblPR.Columns.Add("Purchase Duration To", GetType(String))
            tblPR.Columns.Add("Special Instruction", GetType(String))
            tblPR.Columns.Add("Item Sub Category", GetType(String))
            tblPR.Columns.Add("PR Item Name", GetType(String))
            tblPR.Columns.Add("Item Description", GetType(String))
            tblPR.Columns.Add("Make or Model", GetType(String))
            tblPR.Columns.Add("UOM", GetType(String))
            tblPR.Columns.Add("PR Qty", GetType(String))
            tblPR.Columns.Add("PR Status", GetType(String))

            tblPR.Columns.Add("PES No", GetType(String))
            tblPR.Columns.Add("PES Created On", GetType(String))
            tblPR.Columns.Add("PES Creator", GetType(String))
            tblPR.Columns.Add("PES Item Name", GetType(String))
            tblPR.Columns.Add("Vendor Name1", GetType(String))
            tblPR.Columns.Add("Vendor Name2", GetType(String))
            tblPR.Columns.Add("Vendor Name3", GetType(String))
            tblPR.Columns.Add("Vendor Selected", GetType(String))
            tblPR.Columns.Add("PES Qty", GetType(String))
            tblPR.Columns.Add("PES Bal Qty", GetType(String))
            tblPR.Columns.Add("PES Status", GetType(String))


            tblPR.Columns.Add("PO No", GetType(String))
            tblPR.Columns.Add("PO Created On", GetType(String))
            tblPR.Columns.Add("PO Current Status", GetType(String))
            tblPR.Columns.Add("PO Item Name", GetType(String))
            tblPR.Columns.Add("PO Qty", GetType(String))
            tblPR.Columns.Add("PO Bal Qty", GetType(String))

            tblPR.Columns.Add("Inv No", GetType(String))
            tblPR.Columns.Add("Invoice Created On", GetType(String))
            tblPR.Columns.Add("Invoice Item Name", GetType(String))
            tblPR.Columns.Add("Inv Qty", GetType(String))
            tblPR.Columns.Add("Amount", GetType(String))
            tblPR.Columns.Add("Invoice Status", GetType(String))

            Dim dtfull As New DataTable()

            Dim objDC As New DataClass()
            Dim objDTPR As New DataTable()
            'Purchase Requistion * PR Items
            objDTPR = objDC.ExecuteQryDT("select d.tid,DMS.udf_split('SESSION-USER-UID',d.fld3) as [PR Requester],DMS.udf_split('MASTER-Sub Department-fld1',d.fld2) as [Sub Department],d.fld1 as [PR No],  replace(convert(nvarchar,d.adate,106),' ','-') as [PR Created On],convert(varchar,cast(d.fld13 as money),1) as [Estimated Cost],d.fld57  as [Required By],d.fld54 as [Purchase Duration From],d.fld55 as [Purchase Duration To],d.fld43 as [Special Instruction],pritem.fld14 as [Item Description],pritem.fld13 as [Make Or Model],DMS.udf_split('MASTER-GL Category Level_2-fld1',pritem.fld9)as [PR Item Sub Category],DMS.udf_split('MASTER-Item Master-fld2',pritem.fld3) as [Item Name],DMS.udf_split('MASTER-UOM Master-fld1',pritem.fld5) as [UOM],d.curstatus as [PR Status],pritem.fld6 as [PR Quantity],pritem.fld12 as [SR NO] from mmm_mst_doc as d inner join mmm_mst_doc_item as pritem on d.tid=pritem.DOCID where eid=" & HttpContext.Current.Session("EID") & "  and d.documenttype='Purchase Requisition' and convert(date,d.adate)>='" & sdate & "' and convert(date,d.adate)<='" & tdate & "'  order by d.tid,pritem.TID")

            For pri As Integer = 0 To objDTPR.Rows.Count - 1
                Dim dr As DataRow = tblPR.NewRow()
                dr("PR Requester") = objDTPR.Rows(pri)("PR Requester")
                dr("Sub Department") = objDTPR.Rows(pri)("Sub Department")
                dr("PR No") = objDTPR.Rows(pri)("PR No")
                dr("PR Created On") = objDTPR.Rows(pri)("PR Created On")
                dr("Estimated Cost") = objDTPR.Rows(pri)("Estimated Cost")
                dr("Required By") = objDTPR.Rows(pri)("Required By")
                dr("Purchase Duration From") = objDTPR.Rows(pri)("Purchase Duration From")
                dr("Purchase Duration To") = objDTPR.Rows(pri)("Purchase Duration To")
                dr("Special Instruction") = objDTPR.Rows(pri)("Special Instruction")
                dr("Item Description") = objDTPR.Rows(pri)("Item Description")
                dr("Make or Model") = objDTPR.Rows(pri)("Make or Model")
                dr("Item Sub Category") = objDTPR.Rows(pri)("PR Item Sub Category")
                dr("PR Item Name") = objDTPR.Rows(pri)("Item Name")
                dr("UOM") = objDTPR.Rows(pri)("UOM")
                dr("PR Status") = objDTPR.Rows(pri)("PR Status")
                dr("PR Qty") = objDTPR.Rows(pri)("PR Quantity")

                Dim objDTPES As New DataTable()
                objDTPES = objDC.ExecuteQryDT("select DMS.udf_split('DOCUMENT-Purchase Requisition-fld1',pes.fld3) as [PR No],pes.fld1 as [PES NO],replace(convert(nvarchar,pes.adate,106),' ','-') as [PES Created On],u.UserName as [PES Creator], pes.Curstatus as [PES Status],DMS.udf_split('MASTER-Item Master-fld2',pesitem.fld1) as [PES Item Name],DMS.udf_split('MASTER-Vendor Master-fld2',pes.fld47) as [Vendor 1],DMS.udf_split('MASTER-Vendor Master-fld2',pes.fld48) as [Vendor 2],DMS.udf_split('MASTER-Vendor Master-fld2',pes.fld49) as [Vendor 3],DMS.udf_split('MASTER-Vendor Master-fld2',pes.fld11) as [Vender Selected],isnull(pesitem.fld12,0) as [PES Qty],isnull(pesitem.fld9,0) as [PES Bal Qty],pesitem.fld11 as [SR NO]  from mmm_mst_doc as pes inner join mmm_mst_user as u on pes.ouid=u.uid inner join mmm_mst_doc_item as pesitem on pes.tid=pesitem.docid  where pes.documenttype='PES' and pes.eid=" & HttpContext.Current.Session("EID") & " and DMS.udf_split('DOCUMENT-Purchase Requisition-fld1',pes.fld3)='" & objDTPR.Rows(pri)("PR No") & "' and pesitem.fld11='" & objDTPR.Rows(pri)("SR NO") & "'")
                If objDTPES.Rows.Count > 0 Then
                    'PES  & PES Items
                    For pesi As Integer = 0 To objDTPES.Rows.Count - 1
                        dr("PES No") = objDTPES.Rows(pesi)("PES NO")
                        dr("PES Created On") = objDTPES.Rows(pesi)("PES Created On")
                        dr("PES Creator") = objDTPES.Rows(pesi)("PES Creator")
                        dr("PES Status") = objDTPES.Rows(pesi)("PES Status")
                        dr("PES Item Name") = objDTPES.Rows(pesi)("PES Item Name")
                        dr("Vendor Name1") = objDTPES.Rows(pesi)("Vendor 1")
                        dr("Vendor Name2") = objDTPES.Rows(pesi)("Vendor 2")
                        dr("Vendor Name3") = objDTPES.Rows(pesi)("Vendor 3")
                        dr("Vendor Selected") = objDTPES.Rows(pesi)("Vender Selected")
                        dr("PES Qty") = objDTPES.Rows(pesi)("PES Qty")
                        dr("PES Bal Qty") = objDTPES.Rows(pesi)("PES Bal Qty")

                        'PO & PO Item

                        Dim objDTPO As New DataTable()
                        objDTPO = objDC.ExecuteQryDT("select po.fld1 as [PO NO], DMS.udf_split('DOCUMENT-PES-fld1',po.fld3) as [PR NO],replace(convert(nvarchar,po.adate,106),' ','-') as [PO Created On],Po.curstatus as [PO Current Status],DMS.udf_split('MASTER-Item Master-fld2',poitem.fld3) as [PO Item Name],poitem.fld21 as [PO Qty],poitem.fld17 as [PO Bal Qty],poitem.fld20 as [SR NO] from mmm_mst_doc as po inner join mmm_mst_doc_item as poitem on po.tid=poitem.docid  where po.documenttype='Purchase Order' and po.eid=" & HttpContext.Current.Session("EID") & " and DMS.udf_split('DOCUMENT-PES-fld1',po.fld3)='" & objDTPES.Rows(pesi)("PES NO") & "' and poitem.fld20='" & objDTPES.Rows(pesi)("SR NO") & "'")
                        If objDTPO.Rows.Count > 0 Then
                            For poi As Integer = 0 To objDTPO.Rows.Count - 1
                                dr("PO No") = objDTPO.Rows(poi)("PO NO")
                                dr("PO Created On") = objDTPO.Rows(poi)("PO Created On")
                                dr("PO Current Status") = objDTPO.Rows(poi)("PO Current Status")
                                dr("PO Item Name") = objDTPO.Rows(poi)("PO Item Name")
                                dr("PO Qty") = objDTPO.Rows(poi)("PO Qty")
                                dr("PO Bal Qty") = objDTPO.Rows(poi)("PO Bal Qty")


                                'Invoice & Invoice Item
                                Dim objDTInvoice As New DataTable()
                                objDTInvoice = objDC.ExecuteQryDT("select invpo.fld17 as [Invoice No],replace(convert(nvarchar,invpo.adate,106),' ','-') as [Invoice Created On],DMS.udf_split('DOCUMENT-Purchase Order-fld1',invpo.fld1) as [PO NO],invpo.curstatus as [Invoice Status],DMS.udf_split('MASTER-Item Master-fld2',invpoitem.fld2) as [Invoice Item Name],invpoitem.fld20 as [PO Invoice Quantity],invpoitem.fld7 as [Invoice Amount],invpoitem.fld19 as [SR NO] from mmm_mst_doc as invpo inner join mmm_mst_doc_item as invpoitem on invpo.tid=invpoitem.docid where invpo.documenttype='Invoice PO' and invpo.eid=" & HttpContext.Current.Session("EID") & " and DMS.udf_split('DOCUMENT-Purchase Order-fld1',invpo.fld1)='" & objDTPO.Rows(poi)("PO NO") & "' and invpoitem.fld19='" & objDTPO.Rows(poi)("SR NO") & "'")
                                If objDTInvoice.Rows.Count > 0 Then

                                    For invi As Integer = 0 To objDTInvoice.Rows.Count - 1
                                        dr("Inv No") = objDTInvoice.Rows(invi)("Invoice No")
                                        dr("Invoice Created On") = objDTInvoice.Rows(invi)("Invoice Created On")
                                        dr("Invoice Status") = objDTInvoice.Rows(invi)("Invoice Status")
                                        dr("Invoice Item Name") = objDTInvoice.Rows(invi)("Invoice Item Name")
                                        dr("Inv Qty") = objDTInvoice.Rows(invi)("PO Invoice Quantity")
                                        dr("Amount") = objDTInvoice.Rows(invi)("Invoice Amount")
                                    Next
                                Else
                                    dr("Inv No") = ""
                                    dr("Invoice Created On") = ""
                                    dr("Invoice Status") = ""
                                    dr("Invoice Item Name") = ""
                                    dr("Inv Qty") = ""
                                    dr("Amount") = ""
                                End If


                            Next
                        Else
                            dr("PO No") = ""
                            dr("PO Created On") = ""
                            dr("PO Current Status") = ""
                            dr("PO Item Name") = ""
                            dr("PO Qty") = ""
                            dr("PO Bal Qty") = ""


                            dr("Inv No") = ""
                            dr("Invoice Created On") = ""
                            dr("Invoice Status") = ""
                            dr("Invoice Item Name") = ""
                            dr("Inv Qty") = ""
                            dr("Amount") = ""


                        End If
                    Next
                Else
                    dr("PES No") = ""
                    dr("PES Created On") = ""
                    dr("PES Creator") = ""
                    dr("PES Status") = ""
                    dr("PES Item Name") = ""
                    dr("Vendor Name1") = ""
                    dr("Vendor Name2") = ""
                    dr("Vendor Name3") = ""
                    dr("Vendor Selected") = ""
                    dr("PES Qty") = ""
                    dr("PES Bal Qty") = ""

                    dr("PO No") = ""
                    dr("PO Created On") = ""
                    dr("PO Current Status") = ""
                    dr("PO Item Name") = ""
                    dr("PO Qty") = ""
                    dr("PO Bal Qty") = ""


                    dr("Inv No") = ""
                    dr("Invoice Created On") = ""
                    dr("Invoice Status") = ""
                    dr("Invoice Item Name") = ""
                    dr("Inv Qty") = ""
                    dr("Amount") = ""

                End If

                tblPR.Rows.Add(dr)

            Next

            Dim strError = ""
            grid = DynamicGrid.GridData(tblPR, strError)
            If tblPR.Rows.Count = 0 Then
                grid.Message = "No data found...!"
                grid.Success = False
            End If

           

        Catch Ex As Exception
            grid.Success = False
            grid.Message = "No data found...!"
            grid.Count = 0

        Finally
            con.Close()
            da.Dispose()
            con.Dispose()
        End Try
        Return grid
    End Function
End Class
