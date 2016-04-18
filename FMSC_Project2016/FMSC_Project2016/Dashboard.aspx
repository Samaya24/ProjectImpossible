<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FMSC_Project2016.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
    Dashboard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <form id="form1" runat="server">
        <div>
            <center><asp:Label ID="Label1" runat="server" Text="Table showing total number of pixels in a particular state in USA"></asp:Label></center><br /><br />
            <center><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="500px" CellPadding="10" ForeColor="#333333" GridLines="None" Height="80px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <asp:Label ID="LblCompanyId" runat="server" Text='<%#Bind("states") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pixels">
                        <ItemTemplate>
                            <asp:Label ID="LblCompanyId" runat="server" Text='<%#Bind("pixel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            </center>
        </div>
    </form>

</asp:Content>
