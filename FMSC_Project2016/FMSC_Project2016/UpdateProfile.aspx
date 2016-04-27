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
                        <td>
                            <%--<asp:TextBox ID="state_address" runat="server" CssClass="form-group-sm form-control form-inline" Width="250px"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownListState" runat="server" CssClass="form-control" Width="250px">
                                <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                <asp:ListItem Value="CA">California</asp:ListItem>
                                <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                <asp:ListItem Value="FL">Florida</asp:ListItem>
                                <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                <asp:ListItem Value="ME">Maine</asp:ListItem>
                                <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                <asp:ListItem Value="MT">Montana</asp:ListItem>
                                <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                <asp:ListItem Value="NY">New York</asp:ListItem>
                                <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                <asp:ListItem Value="TX">Texas</asp:ListItem>
                                <asp:ListItem Value="UT">Utah</asp:ListItem>
                                <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                <asp:ListItem Value="WA">Washington</asp:ListItem>
                                <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                            </asp:DropDownList>
                        </td>
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
                        <td>Carrier</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="true" Width="250px">
                                
                                <asp:ListItem>alltel</asp:ListItem>
                                <asp:ListItem>att cingular</asp:ListItem>
                                <asp:ListItem>boost mobile</asp:ListItem>
                                <asp:ListItem>cingular</asp:ListItem>
                                <asp:ListItem>metro pcs</asp:ListItem>
                                <asp:ListItem>nextel</asp:ListItem>
                                <asp:ListItem>powertel</asp:ListItem>
                                <asp:ListItem>sprint nextel</asp:ListItem>
                                <asp:ListItem>suncom</asp:ListItem>
                                <asp:ListItem>t-mobile</asp:ListItem>
                                <asp:ListItem>us cellular</asp:ListItem>
                                <asp:ListItem>verizon</asp:ListItem>
                                <asp:ListItem>virgin mobile</asp:ListItem>
                            </asp:DropDownList>
                        </td>
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
