<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyApixel.aspx.cs" Inherits="FMSC_Project2016.BuyApixel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        
        <asp:MultiView ID="MultiView1" runat="server">
            <%--view to get the pixel values--%> 
            <asp:View ID="View1" runat="server">
                Select the number of pixels you want to buy:
                <%--drop down list with pre populated values--%>
                <asp:DropDownList ID="noOfPixels" runat="server">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" Text="Proceed to Checkout" OnClick="Button1_Click" />
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </asp:View>
            <asp:View ID="View2" runat="server">

                Please review your order before proceding further<br />
                <br />
                 <table runat="server" class="table table-bordered table-condensed table-responsive" style="width:100%">
                     <thead>
                         <tr>
                             <th>Number of Pixels bought</th>
                             <th>Number of meals donated</th>
                             <th>Price for 1 pixel</th>
                             <th>Total</th>
                         </tr>
                     </thead>
                     <tbody>
                         <tr>
                             <td><asp:Label ID="pixel_quantity" runat="server" ></asp:Label></td>
                             <td><asp:Label ID="meals_quantity" runat="server" ></asp:Label></td>
                             <td><asp:Label ID="price" runat="server" Text="$0.22"></asp:Label></td>
                             <td><asp:Label ID="Total" runat="server" ></asp:Label></td>
                         </tr>
                     </tbody>
                 </table>
                <asp:Button ID="Button2" runat="server" Text="Checkout" CssClass="btn btn-default btn-primary" OnClick="Button2_Click"/>
            </asp:View>
            <asp:View ID="View3" runat="server">
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
            </asp:View>
        </asp:MultiView>
    </div>
    </form>
</body>
</html>
