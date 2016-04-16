<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuyApixel.aspx.cs" Inherits="FMSC_Project2016.BuyApixel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript">



        function SetValue() {

            document.getElementById('Hidden1').value = "testing !!!!!";


            alert(document.getElementById('Hidden1').value);
        }



    </script>

    <script type="text/javascript">
        var pixel_price = '<%=Session["total_price"] %>';
    </script>

</head>
<body>

    <div class="container">

        <asp:MultiView ID="MultiView1" runat="server">
            <%--view to get the pixel values--%>
            <asp:View ID="View1" runat="server">
                <form id="form1" runat="server">
                    the number of pixels you want to buy:
                <%--drop down list with pre populated values--%>
                    <asp:DropDownList ID="noOfPixels" runat="server">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="Button1" runat="server" Text="Proceed to Checkout" OnClick="Button1_Click" />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </form>
            </asp:View>
            <asp:View ID="View2" runat="server">
                Please review your order before proceding further<br />
                <br />
                <table runat="server" class="table table-bordered table-condensed table-responsive" style="width: 100%">
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
                            <td>
                                <asp:Label ID="pixel_quantity" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="meals_quantity" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="price" runat="server" Text="$0.22"></asp:Label></td>
                            <td>
                                <asp:Label ID="Total" runat="server"></asp:Label></td>
                        </tr>
                    </tbody>
                </table>
                <form id="form_paypal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
                    <input type="hidden" name="cmd" value="_s-xclick" />
                    <input type="hidden" name="hosted_button_id" value="4ZLBG4WM7SMGC" />

                    <table id="cart">
                        <tr>
                            <td>
                                <input type="hidden" name="item_name" value="Memorex 256MB Memory Stick" />
                            </td>
                            <td>
                                <input type="hidden" name="amount" value="<%=Session["total_price"] %>"/>
                            </td>
                            <td class="item-total">
                                <input type="text" name="item-total" value="10" />
                            </td>
                        </tr>
                    </table>

                    <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_donateCC_LG.gif" name="submit" alt="PayPal - The safer, easier way to pay online!" />
                    <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" />
                </form>

            </asp:View>

        </asp:MultiView>
    </div>

</body>
</html>
