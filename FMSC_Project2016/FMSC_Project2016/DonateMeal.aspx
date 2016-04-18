<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DonateMeal.aspx.cs" Inherits="FMSC_Project2016.DonateMeal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="container">
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <asp:MultiView ID="MultiView1" runat="server">
            <%--view to get the pixel values--%>
            <asp:View ID="View1" runat="server">
                <form id="form1" runat="server">
                    Please select the number of pixels you want to buy to the number of meals to donate:
                    <br />
                    <br />
                <%--drop down list with pre populated values--%>
                    <asp:DropDownList ID="noOfPixels" runat="server" CssClass="dropdown form-control" Width="100px">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Proceed to Checkout" OnClick="Button1_Click" CssClass="form-control" Width="250px" />
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
                                <input type="hidden" name="item_name" value="FMSC donate meal" />
                            </td>
                            
                        </tr>
                    </table>

                    <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_donateCC_LG.gif" name="submit" alt="PayPal - The safer, easier way to pay online!" />
                    <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" />
                </form>

            </asp:View>

        </asp:MultiView>
    </div>
</asp:Content>
