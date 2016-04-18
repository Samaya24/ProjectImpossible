<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FMSC_Project2016.Login" %>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
    Log In
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <asp:Label ID="login_lbl" runat="server"></asp:Label>
        <table runat="server" class="table table-responsive">
            <tr>
                <%-- Login module --%>
                <td>
                    <p>
                        Login:&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="userid" runat="server" CssClass="form-control" Width="250px"></asp:TextBox>
                    </p>
                    <p>
                        Password:
                        <asp:TextBox TextMode="Password" ID="password" runat="server" CssClass="form-control" Width="250px"></asp:TextBox>
                    </p>
                    <asp:CheckBox ID="CheckBox1" runat="server" /> Remember Me
                    <p>
                        Not an existing user <a href="Signup.aspx">Signup here</a>&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Submit" CssClass="btn"/>
                    </p>
                    <p>
                        <a href="ForgotPassword.aspx">Forgot Password</a>
                    </p>
                </td>
                <td>

                </td>
                <td>
                    <strong>Services avaliable on Sign up:</strong>
                </td>
            </tr>
        </table>
        
    </form>
</asp:Content>
