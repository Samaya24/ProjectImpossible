<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FMSC_Project2016.Default" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
    Welcome To FMSC
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

<%--    <div class="container"> 
        <div class="progress">
            <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="<%=End_pixel%>" aria-valuemin="0" aria-valuemax="1000000" style="width: <%=CurrentEP %>%">
                
            </div>
        </div>
    </div>--%>

    <p>
        <asp:Label ID="Label1" runat="server" Text="No. of Pixels sold:"></asp:Label>
        <asp:Label ID="Label2" runat="server" CssClass="text-success"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="No. of Pixels remaining:"></asp:Label>
        <asp:Label ID="Label4" runat="server" CssClass="text-warning"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="Percentage sold:"></asp:Label>
        <asp:Label ID="Label6" runat="server" CssClass="text-success"></asp:Label>
    </p>
    <center><canvas id="myCanvas" width="1000" height="1000" style="display:none;"></canvas>
        <img id="canvasImg" usemap="#imageMap">
    </center>
    <map name="imageMap" id="try">
        <%--<div id="try">
        </div>--%>
        <area shape="rect" coords="0,0,999,7" title="Samaya Sharma" />
        <area shape="rect" coords="0,8,870,8" title="Samaya Sharma" />
        <area shape="rect" coords="872,8,999,8" title="Shreekar Gr" />
        <area shape="rect" coords="0,9,999,17" title="Shreekar Gr" />
        <area shape="rect" coords="0,18,691,18" title="Shreekar Gr" />
        <area shape="rect" coords="692,18,999,18" title="Samaya Sharma" />
        <area shape="rect" coords="0,19,999,35" title="Samaya Sharma" />
        <area shape="rect" coords="0,36,343,36" title="Samaya Sharma" />
        <area shape="rect" coords="344,36,999,36" title="SGR" />
        <area shape="rect" coords="0,37,999,40" title="SGR" />
        <area shape="rect" coords="0,41,274,41" title="SGR" />
        <area shape="rect" coords="275,41,999,41" title="ISU" />
        <area shape="rect" coords="0,42,275,42" title="ISU" />
        <area shape="rect" coords="276,42,436,42" title="Samaya Sharma" />
        <area shape="rect" coords="437,42,537,42" title="Shreeker Gr" />
        <area shape="rect" coords="538,42,999,42" title="Anand Kalukuri" />
        <area shape="rect" coords="0,43,999,141" title="Anand Kalukuri" />
        <area shape="rect" coords="0,142,538,142" title="Anand Kalukuri" />
        <area shape="rect" coords="539,142,999,142" title="Anand" />
        <area shape="rect" coords="0,143,999,146" title="Anand" />
        <area shape="rect" coords="0,147,539,147" title="Anand" />
        <area shape="rect" coords="540,148,999,148" title="Shreekar" />
        <area shape="rect" coords="0,149,999,151" title="Shreekar" />
        <area shape="rect" coords="0,152,539,152" title="Shreekar" />
        <area shape="rect" coords="540,152,999,152" title="Samaya" />
        <area shape="rect" coords="0,153,999,153" title="Samaya" />
        <area shape="rect" coords="0,154,539,154" title="Samaya" />
        <area shape="rect" coords="540,154,999,154" title="Anand" />
        <area shape="rect" coords="0,155,539,155" title="Anand" />
    </map>

    <script type="text/javascript">

<%--        $(document).ready(function () {
            var counter = '<%= End_pixel%>';
            var percent = counter/10000;
            $('.progress-bar').css('width', '10%').attr('aria-valuenow', 10);--%>
        

            function drawImage(imageObj) {
                var canvas = document.getElementById('myCanvas');
                var context = canvas.getContext('2d');
                var imageX = 0;
                var imageY = 0;
                var imageWidth = imageObj.width;
                var imageHeight = imageObj.height;

                context.drawImage(imageObj, imageX, imageY);

                var imageData = context.getImageData(imageX, imageY, imageWidth, imageHeight);


                var counter = '<%= End_pixel%>';
                for (var i = 0; i < imageData.data.length; i += 4) {
                    if (i < counter * 4) {
                        imageData.data[i + 3] = 255;
                    }
                    else {
                        imageData.data[i + 3] = 20;
                    }
                }

                context.putImageData(imageData, 0, 0);

                var dataURL = canvas.toDataURL();

                document.getElementById('canvasImg').src = dataURL;
            }
       
            var imageObj = new Image();
            imageObj.onload = function () {
                drawImage(this);
            };
            imageObj.src = 'img/collage.jpg';
       
    </script>
</asp:Content>
