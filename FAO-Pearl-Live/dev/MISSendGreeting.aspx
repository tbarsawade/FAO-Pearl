<%@ Page Title="" Language="VB"  AutoEventWireup="false" CodeFile="MISSendGreeting.aspx.vb" Inherits="MISSendGreeting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table cellspacing="0px" cellpadding="0px" width="800px" border="2px">
        <tr>
            <td>Subject</td>
            <td>        <asp:TextBox ID="txtSubject" runat="server"  Width="771px"></asp:TextBox></td>
        </tr>

         <tr>
            <td>Email IDs :</td>
            <td>        format of emailIDs (Some text : emailID,Some text : emailid,Some text : emailid)<br />
                <asp:TextBox ID="txtMailIDs" runat="server" Height="171px" TextMode="MultiLine" Width="771px"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Sendor ID</td>
            <td> <asp:TextBox ID="txtSendorID" runat="server"  Width="771px"></asp:TextBox></td>
        </tr>

         <tr>
            <td>Password</td>
            <td> <asp:TextBox ID="txtPWD" runat="server"  Width="771px" TextMode="Password"></asp:TextBox></td>
        </tr>

         <tr>
            <td>BCC</td>
            <td> <asp:TextBox ID="txtBCC" runat="server"  Width="771px"></asp:TextBox></td>
        </tr>

    </table>

        <asp:Button ID="btnSend" runat="server" Text="Send" Width="170px" />
    
    &nbsp;<asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    
    </div>
    </form>
</body>
</html>
