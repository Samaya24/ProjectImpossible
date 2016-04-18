<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="FMSC_Project2016.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
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
                        <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email ID invalid" 
                            ValidationExpression="^[^\W][\w.]{5,}@{1}[^\W\d]{2,}(.com|.edu)$" ControlToValidate="email_id"></asp:RegularExpressionValidator></td>
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
                            <asp:Button ID="Button1" runat="server" Text="Next Page" CssClass=" btn right" OnClick="Button1_Click"/>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table id="secquestion" runat="server" class="table table-condensed">
                    <tr>
                        <td>Password:</td>
                        <td><asp:TextBox ID="password" TextMode="Password" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="password" ErrorMessage="Enter Password"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Confirm Password:</td>
                        <td><asp:TextBox ID="cnfrm_password" TextMode="Password" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cnfrm_password" ErrorMessage="Re-enter Password"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password do not match"
                            ControlToCompare="password" ControlToValidate="cnfrm_password"></asp:CompareValidator></td>
                    </tr>
                    <tr>
                        <td>Security Question 1:</td>
                        <td><asp:DropDownList ID="sec_ques1" runat="server" CssClass="dropdown form-control">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="1">What was your favourite book?</asp:ListItem>
                            <asp:ListItem Value="2">what is your favourite place?</asp:ListItem>
                            <asp:ListItem Value="3">Your nick name?</asp:ListItem>
                            <asp:ListItem Value="4">Your pet's name?</asp:ListItem>
                            <asp:ListItem Value="5">Name of your role model?</asp:ListItem>
                        </asp:DropDownList></td>
                        <%--<td><asp:TextBox ID="sec_ques1" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>--%>
                    </tr>
                    <tr>
                        <td>Answer:</td>
                        <td><asp:TextBox ID="Answer1" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Security Question 2:</td>
                        <td><asp:DropDownList ID="sec_ques2" runat="server" CssClass="dropdown form-control">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="1">What was your favourite book?</asp:ListItem>
                            <asp:ListItem Value="2">what is your favourite place?</asp:ListItem>
                            <asp:ListItem Value="3">Your nick name?</asp:ListItem>
                            <asp:ListItem Value="4">Your pet's name?</asp:ListItem>
                            <asp:ListItem Value="5">Name of your role model?</asp:ListItem>
                        </asp:DropDownList></td>
                        <%--<td><asp:TextBox ID="sec_ques2" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>--%>
                    </tr>
                    <tr>
                        <td>Answer:</td>
                        <td><asp:TextBox ID="Answer2" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Security Question 3:</td>
                        <td><asp:DropDownList ID="sec_ques3" runat="server" CssClass="dropdown form-control">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="1">What was your favourite book?</asp:ListItem>
                            <asp:ListItem Value="2">what is your favourite place?</asp:ListItem>
                            <asp:ListItem Value="3">Your nick name?</asp:ListItem>
                            <asp:ListItem Value="4">Your pet's name?</asp:ListItem>
                            <asp:ListItem Value="5">Name of your role model?</asp:ListItem>
                        </asp:DropDownList></td>
                        <%--<td><asp:TextBox ID="sec_ques3" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>--%>
                    </tr>
                    <tr>
                        <td>Answer:</td>
                        <td><asp:TextBox ID="Answer3" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" CssClass=" btn right"/></td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <p>Thank you for Registering.</p>
                <p>Please click on the the link <a href="Login.aspx">Login Here</a> to log into the page.</p>
            </asp:View>
        </asp:MultiView>
  </form> 
</asp:Content>
