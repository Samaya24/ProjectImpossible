<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="FMSC_Project2016.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
<%--    <h1 style="text-align:center; color:green">Help us make this image visible by this summer</h1>
    <center><img src="img/collage.jpg" /></center>--%>
    
    			<div class="row" id="featuresHeading">
				<div class="col-12">
					<h2 style="color: saddlebrown; text-align:center">About Us</h2>
					<p class="lead"></p>
				</div><!-- end col-12 -->
			</div><!-- end featuresHeading -->
			
			
			<div class="row" id="features">
				<div class="col-sm-6 feature">
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">Our Vision</h3>
						</div><!-- end panel-heading -->
						<img src="img/vision.jpg" alt="Our Vision" class="img-circle" width="250px" height="200px">
						
						<p>With God’s help, Feed My Starving Children (FMSC) will strive to eliminate starvation 
                            in children throughout the world by helping to instill compassion in people to hear 
                            and respond to the cries of those in need. The vision of FMSC is to eliminate starvation 
                            in children throughout the world by helping to instill compassion in people to hear and respond to the cries of those in need.</p>
						
<%--						<a href="https://www.udemy.com/build-beautiful-html5-website/" target="_blank" class="btn btn-warning btn-block"></a>--%>
					</div><!-- end panel -->
				</div><!-- end feature -->
				
				<div class="col-sm-6 feature">
					<div class="panel">
						<div class="panel-heading">
							<h3 class="panel-title">Mission Statement</h3>
						</div><!-- end panel-heading -->
						<img src="img/mission.jpg" alt="Mission Statement" class="img-circle">
						
						<p>Their approach is to have volunteers hand-pack meals specially formulated for malnourished
                             children, and send them to partners around the world where they're used to operate 
                            orphanages, schools, clinics, and feeding programs to break the cycle of poverty. FMSC 
                            food has reached more than 70 countries. FMSC experienced an average annual growth 
                            rate of 48% in the past decade.
                            1 pixel = 1 meal. Therefore, 1 pixel will equal the cost of one meal through Feed
                             My Starving Children, or $0.22. So, the goal then is to sell 1,000,000 pixels 
                            at $0.22 a pixel in order to donate 1,000,000 meals to Feed My Starving Children.</p>
						
<%--						<a href="https://www.udemy.com/build-beautiful-html5-website/" target="_blank" class="btn btn-danger btn-block">Style it up with CSS3</a>--%>
					</div><!-- end panel -->
				</div><!-- end feature -->
			</div><!-- end features -->
</asp:Content>
