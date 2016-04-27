<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FMSC_Project2016.Default" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
    Welcome To FMSC
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <div class="container"> 
        <div class="progress">
            <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="<%=End_pixel%>" aria-valuemin="0" aria-valuemax="1000000" style="width: <%=CurrentEP %>%">
                
            </div>
        </div>
    </div>
    <center><canvas id="myCanvas" width="1000" height="1000" style="display:none;"></canvas>
        <img id="canvasImg" usemap="#imageMap">
    </center>
    <map name="imageMap" id="try">
        <%--<div id="try">
        </div>--%>
        <area shape="rect" href="" coords="0,0,999,7" title="Samaya Sharma" />
        <area shape="rect" href="" coords="0,8,870,8" title="Samaya Sharma" />
        <area shape="rect" href="" coords="872,8,999,8" title="Shreekar Gr" />
        <%--<area shape="rect" href="" coords="0,9,999,9" title="Shreekar Gr" />--%>
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
