
Partial Class Success
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblMsg.Text = Request.QueryString("fn").ToString()
    End Sub
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
End Class
