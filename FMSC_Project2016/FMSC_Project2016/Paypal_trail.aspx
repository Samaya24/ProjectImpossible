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
            <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
            "/>
            <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" name="submit" alt="PayPal - The safer, easier way to pay online!"/>
            <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1"/>
        </form>


    </div>
    <%--</form>--%>
</body>
</html>
