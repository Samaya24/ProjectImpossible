<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FMSC_Project2016.Default" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
    Welcome To FMSC
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
  
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<!--    <center><asp:Image ID="Image1" runat="server" ImageUrl="img/collage.jpg" /></center> -->
    <canvas id="myCanvas" width="1000" height="1000"></canvas>

      <script>
        function drawImage(imageObj) {
            var canvas = document.getElementById('myCanvas');
            var context = canvas.getContext('2d');
            var imageX = 50;
            var imageY = 50;
            var imageWidth = imageObj.width;
            var imageHeight = imageObj.height;

            context.drawImage(imageObj, imageX, imageY);

            var imageData = context.getImageData(0, 0, imageWidth, imageHeight);
            //        var data1 = imageData.data;
            //context.putImageData(imageData, 50, 600);

            //var copy = context.createImageData(100, 100);

            //for (var i = 0; i < copy.data.length; i++) {
            //    copy.data[i] = imageData.data[i];
            //}

            for (var i = 0; i < imageData.data.length; i += 4) {
          //      imageData.data[i + 2] = 255;
                imageData.data[i + 3] = 20;
            }

            context.putImageData(imageData, 0, 0);

            //context.putImageData(copy, 250, 600);

            // iterate over all pixels
            //        for(var i = 0, n = data1.length; i < n; i += 4) {
            //          var red = data1[i];
            //          var green = data1[i + 1];
            //          var blue = data1[i + 2];
            //          var alpha = data1[i + 3];
            //        }

            // pick out pixel data from x, y coordinate
            // var x = 20;
            // var y = 20;
            // var red = data1[((imageWidth * y) + x) * 4];
            // var green = data1[((imageWidth * y) + x) * 4 + 1];
            // var blue = data1[((imageWidth * y) + x) * 4 + 2];
            // var alpha = data1[((imageWidth * y) + x) * 4 + 3];

            // // iterate over all pixels based on x and y coordinates
            // for(var y = 0; y < imageHeight; y++) {
            //   // loop through each column
            //   for(var x = 0; x < imageWidth; x++) {
            //     var red = data1[((imageWidth * y) + x) * 4];
            //     var green = data1[((imageWidth * y) + x) * 4 + 1];
            //     var blue = data1[((imageWidth * y) + x) * 4 + 2];
            //     var alpha = data1[((imageWidth * y) + x) * 4 + 3];
            //   }
            // }
        }
        var imageObj = new Image();
        imageObj.onload = function () {
            drawImage(this);
        };
        //      imageObj.src = 'http://www.html5canvastutorials.com/demos/assets/darth-vader.jpg';
        imageObj.src = 'img/collage.jpg';
    </script>
</asp:Content>
