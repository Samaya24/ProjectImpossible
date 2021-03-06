﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="payment_success.aspx.cs" Inherits="FMSC_Project2016.payment_success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <script type="text/javascript">
        function RefreshUpdatePanel() {
            __doPostBack('UpdatePanel1', '');  // This JS funcs forces a postback
            Panel1.Visible = true;                                    // It is generated by ASP.NET when creating the HTML
        };
    </script>
    <asp:Label ID="Label2" runat="server"></asp:Label>
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
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                                <ContentTemplate>
                            <asp:Label ID="Print_name" runat="server" ></asp:Label>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                            <br />
                            
                            
                            <br />
                            <br />
                            
                                    <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Click to change the display name" AutoPostBack="true"/>
                                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                                        Please enter the name to be displayed<br />
                                        <br />
                                        &nbsp;<asp:TextBox ID="update_name" runat="server" CssClass="form-control" Width="250px"></asp:TextBox>
                                        <br />
                                        <br />
                                        <asp:Button ID="Button3" runat="server" Text="Submit" OnClick="Button3_Click" CssClass="btn" />
                                    </asp:Panel>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="CheckBox1" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <%-- links for facebook , twitter and  other sites--%>
                        <td>links for facebook , twitter and  other sites
                            <asp:Label ID="labelSteps_1_2" runat="server" Text=""></asp:Label>
<%--// The code to populate the asp:Label component with the html and script code
// for Steps 1 and 2 should go in the code-behind file--%>
                            
                        </td>
                    </tr>
                </table>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </div>
    </form>
</asp:Content>
