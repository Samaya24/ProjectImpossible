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
    <map name="imageMap" id="try">
        <%--<div id="try">
        </div>--%>
        <area shape="rect" href="" coords="0,0,999,7" title="Samaya Sharma" />
        <area shape="rect"  href="" coords="0,8,870,8" title="Samaya Sharma" />
        <area shape="rect" href="" coords="872,8,999,8" title="Shreekar Gr" />
        <%--<area shape="rect" href="" coords="0,9,999,9" title="Shreekar Gr" />--%>
    </map>

    <script type="text/javascript">

        //function createHover(x, y, x1, y1, rn) {
        //    alert("start of hover");
        //    var elem = document.createElement("area");
        //    elem.shape = "rect";
        //    var coordinate = x + "," + y + "," + x1 + "," + y1;
        //    elem.coords = coordinate;
        //    elem.title = rn;
        //    document.getElementById("try").appendChild(elem);
        //    alert("end of hover " + rn);
        //}

        //function topRow(startPixel, rowStart, rn) {
        //    var x = startPixel - (rowStart * 1000);
        //    var y = rowStart;
        //    var x1 = 1000;
        //    var y1 = rowEnd;
        //    createHover(x, y, x1, y1, rn);
        //}

        //function bottomRow(endPixel, rowEnd, rn) {
        //    var x = 0;
        //    var y = rowEnd;
        //    var x1 = endPixel - (rowEnd * 1000);
        //    var y1 = rowEnd;
        //    createHover(x, y, x1, y1, rn);
        //}

        //function middleRow(nomr, rowStart, rn) {
        //    for (var i = 0; i < nomr; i++) {
        //        createHover(0, (rowStart + 1), 1000, (rowStart + 1), rn);
        //    }
        //}

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

            //var x, y, x1, y1, row;
        <%--    var donations = '<%= No_Of_Donations%>';--%>

    //        var registeredName;

            //var registeredName = ""; 

                               <%--registeredName = '<%=RetrieveName(0)%>';
                    alert(donations);--%>
            //var startPixel;
            //var endPixel;
            //var rowStart;
            //var rowEnd;

            //for (var i = 0; i < donations; i++) {

            //    if (i == 0) {
                  <%-- registeredName = '<%=RetrieveName(0)%>';--%>
                    //alert(registeredName);
   //             }
   //             else {
                    <%--registeredName = '<%=RetrieveName(CurrentEP+1)%>';--%>
                    //alert(registeredName);
                                                    <%--startPixel = '<%= CurrentSP%>';--%>
                <%--endPixel = '<%= CurrentEP%>';--%>
            //    rowStart = Math.floor(startPixel / 1000);
            //    rowEnd = Math.floor(endPixel / 1000);
            //    }

            //    if (rowStart == rowEnd) {
            //        x = startPixel - (rowStart * 1000);
            //        y = rowStart;
            //        x1 = endPixel - (rowEnd * 1000);
            //        y1 = rowEnd;
            //        alert("inside first if " + rowStart + " , " + rowEnd);
            //        createHover(x, y, x1, y1, registeredName);

            //    }
            //        //alert(rowStart+","+rowEnd);
            //    else if (rowStart < rowEnd) {
            //        topRow(startPixel, rowStart, registeredName);
            //        bottomRow(endPixel, rowEnd, registeredName);
            //        middleRow((rowEnd - rowStart - 1), rowStart, registeredName);
            //        alert("inside else if");
            //    }

            //}
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

        var imageObj = new Image();
        imageObj.onload = function () {
            drawImage(this);
        };
        //      imageObj.src = 'http://www.html5canvastutorials.com/demos/assets/darth-vader.jpg';
        imageObj.src = 'img/collage.jpg';
    </script>
</asp:Content>
