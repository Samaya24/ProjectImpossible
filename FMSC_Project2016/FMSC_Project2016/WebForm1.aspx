<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="FMSC_Project2016.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <title>Facebook share sampel</title>
    <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script>
<script src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php"
           type="text/javascript">
</script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <a href="http://www.facebook.com/sharer.php?s=100&amp;p%5Btitle%5D=Donate a meal&amp;p[summary]=Hi I have donated a meal for the poor kids I would advice you to do the same&amp;p[url]=http://iis.it.ilstu.edu/368Spr16/it3680105/App2">
        Facebookare</a>
    <form id="form1" runat="server">
    <div>
    <a name="sharebutton" type="button" href="http://www.facebook.com/sharer.php">Share</a>  
    </div>
</form>

<asp:Label ID="lblShare" runat="server" Text=""></asp:Label>

</asp:Content>
