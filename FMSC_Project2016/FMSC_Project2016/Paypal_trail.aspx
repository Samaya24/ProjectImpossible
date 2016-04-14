<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Paypal_trail.aspx.cs" Inherits="FMSC_Project2016.Paypal_trail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%--<form id="form1" runat="server">--%>
    <div>
        <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick"/>
<input type="hidden" name="hosted_button_id" value="4ZLBG4WM7SMGC"/>
<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_donateCC_LG.gif" name="submit" alt="PayPal - The safer, easier way to pay online!"/>
<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1"/>
</form>

        <%--<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
  <input type="hidden" name="cmd" value="_xclick"/>
  <input type="hidden" name="business" value="seller@designerfotos.com"/>
  <input type="hidden" name="item_name" value="Memorex 256MB Memory Stick"/>
  <input type="hidden" name="item_number" value="MEM32507725"/>
  <input type="hidden" name="amount" value="3"/>
  <input type="hidden" name="tax" value="1"/>
  <input type="hidden" name="quantity" value="1"/>
  <input type="hidden" name="no_note" value="1"/>
  <input type="hidden" name="currency_code" value="USD"/>--%>
            <%--</form>--%>

    </div>
    <%--</form>--%>
</body>
</html>
