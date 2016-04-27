<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FMSC_Project2016.Default" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
    Welcome To FMSC
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <center><canvas id="myCanvas" width="1000" height="1000" style="display:none;"></canvas>
        <img id="canvasImg" alt="Right click to save me!" usemap="#imageMap">
    </center>
    <map name="imageMap">
        <div id="try">

        </div>
<%--        <area shape="rect" coords="0,0,82,126" href="sun.htm" alt="Sun" title="Suhn"/>
        <area shape="circle" coords="90,58,3" href="mercur.htm" alt="Mercury"/>
        <area shape="circle" coords="124,58,8" href="venus.htm" alt="Venus"/>--%>
    </map>

    <script type="text/javascript">

        function drawImage(imageObj) {
            var canvas = document.getElementById('myCanvas');
            var context = canvas.getContext('2d');
            var imageX = 0;
            var imageY = 0;
            var imageWidth = imageObj.width;
            var imageHeight = imageObj.height;

            context.drawImage(imageObj, imageX, imageY);

            var imageData = context.getImageData(imageX, imageY, imageWidth, imageHeight);
            //        var data1 = imageData.data;
            //context.putImageData(imageData, 50, 600);

            //var copy = context.createImageData(100, 100);

            //for (var i = 0; i < copy.data.length; i++) {
            //    copy.data[i] = imageData.data[i];
            //}

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

            var x, y, x1, y1, row;
            var donations = '<%= No_Of_Donations%>';
            var startPixel = '<%= Start_pixel%>';
            var endPixel = '<%= End_pixel%>';
            var registeredName = '<%= Registered_name%>';
            for (var i = 0; i < donations; i++) {
                
                for (var j = 1000; j < 1000000; j+=1000) {
                    if (startPixel < j && endPixel < j) {
                        x = 0;
                        y = 0;
                        x1 = endPixel;
                        y1 = 0;
                        row = 0;
                    }
                    else if (startPixel < j && endPixel > j) {
                        x = 0;
                        y = 1;
                        x1 = endPixel - 1000;
                        y1 = 1;
                    }
                    var elem = document.createElement("area");
                    elem.shape = "rect";                 
                    var x = 0;
                    var y = 0;                 
                    var x1 = 500
                    var y1 = 200;
                    var coordinate = x + "," + y + "," + x1 + "," + y1;
                    elem.coords = coordinate;
                    elem.title = registeredName;
                    document.getElementById("try").appendChild(elem);

                    string query ="select * from purchase_user where start_pixel = ("+(xyz + 1).ToString()+");"
                }
            }

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
