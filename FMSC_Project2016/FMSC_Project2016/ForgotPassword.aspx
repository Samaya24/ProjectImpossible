<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="FMSC_Project2016.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
    Forgot Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <form id="form1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <p><strong>Plese enter the registered email id:</strong> </p>
            <asp:TextBox ID="email_id" runat="server" CssClass="form-control" Width="250px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Continue" CssClass="btn" OnClick="Button1_Click" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <p><strong>Please fill out the following details and we will reset your password</strong></p>
            <br />
            <br />
            <p><strong>Security Question 1:</strong></p>
            <asp:TextBox ID="sec_ques1" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="Answer1" runat="server" CssClass="form-control" Width="250px"></asp:TextBox>
            <br />
            <p><strong>Security Question 2:</strong></p>
            <asp:TextBox ID="sec_ques2" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="Answer2" runat="server" CssClass="form-control" Width="250px"></asp:TextBox>
            <br />
            <p><strong>Security Question 3:</strong></p>
            <asp:TextBox ID="sec_ques3" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="Answer3" runat="server" CssClass="form-control" Width="250px"></asp:TextBox>
            <br /><br />
            <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" CssClass="btn"/>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <p><strong>Reset Password</strong></p>
            <br />
            <br />
            <p><strong>New Password</strong></p>
            <asp:TextBox ID="password" TextMode="Password" runat="server" CssClass="form-control" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="password" ErrorMessage="Enter Password"></asp:RequiredFieldValidator>
            <br />
            <p><strong>Confirm Password</strong></p>
            <asp:TextBox ID="cnfrm_password" TextMode="Password" runat="server" CssClass="form-control" Width="250px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cnfrm_password" ErrorMessage="Re-enter Password"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password do not match" ControlToCompare="password" ControlToValidate="cnfrm_password"></asp:CompareValidator>
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="Submit" OnClick="Button3_Click" CssClass="btn" />
        </asp:View>
        <asp:View ID="View4" runat="server">
            <p><strong>Your password has been reset.</strong></p>
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="Login" OnClick="Button4_Click" CssClass="btn" />
        </asp:View>
    </asp:MultiView>
    </form>
</asp:Content>
