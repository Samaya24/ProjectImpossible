<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment_confirmation.aspx.cs" Inherits="FMSC_Project2016.Payment_confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        You have done a great job. We thank a lot for your donation
                <asp:Label ID="user_name" runat="server" ></asp:Label>
                .<br />
                <br />
                Please take a moment to help us gain more popularity:<br />
                <br />
                <br />
                <table runat="server" class="table-responsive">
                    <tr>
                        <td>Please check the name that will be displayed on the Home page<br />
                            <br />
                            <br />
                            <asp:Label ID="Print_name" runat="server" ></asp:Label>
                        </td>
                        <%-- links for facebook , twitter and  other sites--%>
                        <td>links for facebook , twitter and  other sites</td>
                    </tr>
                </table>
    </div>
    </form>
</body>
</html>
