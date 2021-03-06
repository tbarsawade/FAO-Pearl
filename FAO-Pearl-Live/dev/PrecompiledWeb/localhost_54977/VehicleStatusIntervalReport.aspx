<%@ page title="" language="VB" masterpagefile="~/USR.master" autoeventwireup="false" enableeventvalidation="false" inherits="VehicleStatusIntervalReport, App_Web_ym0u1jpz" viewStateEncryptionMode="Always" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="http://maps.google.com/maps/api/js?sensor=false" 
          type="text/javascript"></script>
   <script type="text/javascript">

       function OpenWindow(url) {

           var new_window = window.open(url, "List", "scrollbars=yes,resizable=yes,width=800,height=480,location=no");
           //new_window.onbeforeunload = function () { document.getElementById('ContentPlaceHolder1_btnRefresh').onclick(); }
           return false;
       }

    </script>
    <style type="text/css">
    .gradientBoxesWithOuterShadows {
            height: 100%;
            width: 99%;
            padding: 5px;
            background-color: white;
            /* outer shadows  (note the rgba is red, green, blue, alpha) */
            -webkit-box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.4);
            -moz-box-shadow: 0px 1px 6px rgba(23, 69, 88, .5);
            /* rounded corners */
            -webkit-border-radius: 12px;
            -moz-border-radius: 7px;
            border-radius: 7px;
            /* gradients */
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, white), color-stop(15%, white), color-stop(100%, #D7E9F5));
            background: -moz-linear-gradient(top, white 0%, white 55%, #D5E4F3 130%);
            background: -ms-linear-gradient(top, #e1ffff 0%,#fdffff 0%,#e1ffff 100%,#c8eefb 100%,#c8eefb 100%,#bee4f8 100%,#bee4f8 100%,#bee4f8 100%,#bee4f8 100%,#bee4f8 100%,#b1d8f5 100%,#e1ffff 100%,#e6f8fd 100%); /* IE10+ */
            background: linear-gradient(to bottom, #e1ffff 0%,#fdffff 0%,#e1ffff 100%,#c8eefb 100%,#c8eefb 100%,#bee4f8 100%,#bee4f8 100%,#bee4f8 100%,#bee4f8 100%,#bee4f8 100%,#b1d8f5 100%,#e1ffff 100%,#e6f8fd 100%); /* W3C */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e1ffff', endColorstr='#e6f8fd',GradientType=0 ); /* IE6-9 */
        }

        .style2 {
            width: 30%;
        }
    </style>
    <style type="text/css">
        .CompletionListCssClass {
            font-size: medium;
            border: 1px solid gray;
            background-color: white;
            width: auto;
            float: left;
            z-index: 100;
            position: initial;
            margin-left: -30px;
            overflow: scroll;
            height: 500px;
        }
    </style>
    <style type="text/css">
        /*Modal Popup*/
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .modalPopup {
            background-color: White;
            border-width: 3px;
            border-style: solid;
            border-color: Gray;
            padding: 3px;
            text-align: center;
        }

        .hidden {
            display: none;
        }
    </style>
     <script type="text/javascript">

         function toggleDiv(divId) {
             $("#" + divId).toggle();
         }
         function HideDiv(divId) {
             $("#" + divId).Hide();
         }
    </script>
    <a href="javascript:toggleDiv('div1');" style="background-color: #ccc; padding: 5px 10px;">Show / Hide</a>

    
        <div class="gradientBoxesWithOuterShadows" id="div1" style="margin-top: 10px; border:solid 1px #e2e2e2;">
            <asp:UpdatePanel ID="upnl" runat="server">
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnshow" />
                    <asp:PostBackTrigger ControlID="btnexportxl" />
                </Triggers>
                <ContentTemplate>
              <table width="100%" align="center" border="0" cellpadding="3" cellspacing="0" bordercolor="#E0E0E0" class="m9">
                                               <tr>

                            <td align="Left" width="30%">
                                <fieldset style="height: 170px">
                                    <legend style="color: Black; text-align: Left; font-weight: bold;">
                                        <asp:CheckBox ID="circlecheck" runat="server" AutoPostBack="true" OnCheckedChanged="checkuncheckcicle" />
                                        <asp:Label ID="lblCircle" runat="server" Text="Label"></asp:Label>
                                    </legend>
                                    <asp:Panel ID="Panel2" runat="server" Height="130px"
                                        Style="display: block" ScrollBars="Auto">
                                        <asp:CheckBoxList ID="Circle" runat="server" AutoPostBack="true">
                                        </asp:CheckBoxList>
                                    </asp:Panel>
                                </fieldset>
                            </td>
                            <td align="Left" width="30%">
                                <fieldset style="height: 170px">
                                    <legend style="color: Black; text-align: Left; font-weight: bold;">
                                        <asp:CheckBox ID="Citycheck" runat="server" AutoPostBack="true" OnCheckedChanged="Citycheckuncheck" />
                                       <asp:Label ID="lblcity" runat="server" Text="Label"></asp:Label></legend>
                                    <asp:Panel ID="Panel3" runat="server" Height="150px"
                                        Style="display: block" ScrollBars="Auto">

                                        <asp:CheckBoxList ID="City" runat="server" AutoPostBack="true">
                                        </asp:CheckBoxList>
                                    </asp:Panel>
                                </fieldset>

                            </td>

                            <td align="Left" width="35%">
                                <fieldset style="height: 170px">
                                    <asp:Panel ID="Panel1" runat="server" Height="150px" ScrollBars="Auto"
                                        Style="display: block">
                                        <asp:CheckBoxList ID="UsrVeh" runat="server" AutoPostBack="True">
                                        </asp:CheckBoxList>

                                    </asp:Panel>
                                </fieldset>
                            </td>
                            <td align="center" class="m8b" width="5%"></td>
                        </tr>
                        </table>
                       </div>
                    </ContentTemplate>
                </asp:UpdatePanel> 
            </div> 

    <div>
        <div class="gradientBoxesWithOuterShadows" id="div12" style="margin-top: 10px">
            <table width="100%" align="center" border="0" cellpadding="3" cellspacing="0" bordercolor="#E0E0E0"
                class="m9">
                <tr>
                    <td align="left" class="style2">
                        <table style="width: 99%">
                            <tr>
                                <td align="left" width="98%">
                                  <asp:Label ID="Label2" runat="server" Text="Start Date :" Style="color: #000000;
                                        font-weight: 700;"></asp:Label>
                                    &nbsp;<asp:TextBox ID="txtfrom" runat="server" Width="190PX" Height="18PX" BorderColor="#9999FF"
                                        BorderStyle="Outset"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd HH':'mm'"
                                        TargetControlID="txtfrom">
                                    </asp:CalendarExtender>
                                    &nbsp;<asp:Label ID="Label1" runat="server" Text="End Date :" Style="color: #000000;
                                        font-weight: 700;"></asp:Label>
                                    &nbsp;<asp:TextBox ID="txtTo" runat="server" Width="190PX" Height="18PX" BorderColor="#9999FF"
                                        BorderStyle="Outset"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd 23':'59'"
                                        TargetControlID="txtTo">
                                    </asp:CalendarExtender>
                                &nbsp;
                                <asp:Button ID="btnshow" runat="server" Text="Search" Font-Bold="True" 
                                        ForeColor="#336699" BorderColor="#669999" BorderStyle="Groove" Width="80" Height="30px" />&nbsp;
                                    <asp:ImageButton ID="btnexportxl" ToolTip="Export EXCEL" ImageAlign="Right" runat="server"
            Width="18px" Height="18px" ImageUrl="~/Images/excelexpo.jpg" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 70%">
                        <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:HiddenField ID="hdnimei" runat="server" />
        <div>
            <table width="100%" align="center" border="0" cellpadding="3" cellspacing="0" bordercolor="#E0E0E0"
                class="m9">
                <tr>
                    <td>
                        <br />
                        <asp:Panel runat="server" ID="pngv">
                            <asp:GridView ID="GVReport" runat="server" AllowPaging="False" AllowSorting="False"
                                AutoGenerateColumns="true" BorderColor="Green" BorderStyle="none" BorderWidth="1px" 
                                CellPadding="3" EmptyDataText="Record does not exists." Font-Size="Small" PageSize="15"
                                ShowFooter="false" Width="100%">
                                <RowStyle BackColor="White" BorderColor="Green" BorderWidth="1px" CssClass="gridrowhome"
                                    ForeColor="Black" Height="25px" />
                                <SelectedRowStyle BackColor="green" Font-Bold="True" ForeColor="White" />
                                <PagerStyle ForeColor="green" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#d0d0d0" BorderColor="Green" BorderWidth="1px" CssClass="gridheaderhome"
                                    Font-Bold="True" ForeColor="black" Height="25px" HorizontalAlign="Center" />
                                <EmptyDataRowStyle CssClass="EmptyDataRowStyle" />
                                <Columns>
                                </Columns>
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                <SortedDescendingHeaderStyle BackColor="#002876" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" VerticalAlign="Middle" />
                                  <Columns>
                                 <asp:TemplateField HeaderText="Map" ItemStyle-HorizontalAlign="Right"  >
                            <ItemTemplate>
                                   <a class="detail" style="text-decoration:none;"  href="#" onclick="OpenWindow('GpsMapViewer.aspx?IMIE=<%=hdnimei.Value%>&Start=<%#DataBinder.Eval(Container.DataItem, "FromDate")%>&End=<%#DataBinder.Eval(Container.DataItem, "ToDate")%>')"   >
                 <img alt="Show On Map" src="images/<%#DataBinder.Eval(Container.DataItem, "imgname")%>"  height="18px" width="18px"/></a>
                              
                            </ItemTemplate>
                            <ItemStyle Width="60px" HorizontalAlign="center"/>
                        </asp:TemplateField>
                                </Columns>

                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <asp:Panel ID="PleaseWaitMessagePanel" runat="server" CssClass="modalPopup" Height="50px" Width="125px">
        Please wait &nbsp&nbsp&nbsp&nbsp&nbsp<asp:ImageButton ID="imgclose" runat="server" ImageUrl="~/images/close.png" />
        <br />
        <img src="images/uploading.gif" alt="Please wait" />
    </asp:Panel>
    <asp:Button ID="HiddenButton" runat="server" CssClass="hidden" Text="Hidden Button"
        ToolTip="Necessary for Modal Popup Extender" />
    <asp:ModalPopupExtender ID="PleaseWaitPopup" BehaviorID="PleaseWaitPopup" runat="server" TargetControlID="HiddenButton" PopupControlID="PleaseWaitMessagePanel" BackgroundCssClass="modalBackground" CancelControlID="imgclose">
    </asp:ModalPopupExtender>
    <input type="hidden" id="hdnmove" value="0" />

   <asp:HiddenField ID="hdnui" runat="server" />
</asp:Content>
