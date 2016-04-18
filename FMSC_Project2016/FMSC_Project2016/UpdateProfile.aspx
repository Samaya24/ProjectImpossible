<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs" Inherits="FMSC_Project2016.UpdateProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
    Update Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form id="form2" runat="server">
        <asp:Label ID="Label1" runat="server" ></asp:Label>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table id="signup" class=" table table-responsive">
                    <tr>
                        <td>First Name:</td>
                        <td><asp:TextBox ID="frst_name" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><asp:TextBox ID="last_name" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><asp:TextBox ID="email_id" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email ID invalid" 
                            ValidationExpression="^[^\W][\w.]{5,}@{1}[^\W\d]{2,}(.com|.edu)$" ControlToValidate="email_id"></asp:RegularExpressionValidator>
                    </tr>
                    <tr><td class="tabbable">Address fields</td></tr>
                    <tr>
                        <td>Street</td>
                        <td><asp:TextBox ID="street_address" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td><asp:TextBox ID="city_address" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>State</td>
                        <td><asp:TextBox ID="state_address" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Country</td>
                        <td><asp:TextBox ID="country_address" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Pin Code</td>
                        <td><asp:TextBox ID="pin_address" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Phone Number</td>
                        <td><asp:TextBox ID="phone_num" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="Update" CssClass=" btn right" OnClick="Button1_Click"/>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
  </form>
</asp:Content>
