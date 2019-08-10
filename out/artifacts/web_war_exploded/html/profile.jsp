<%@page import="java.util.Calendar"%>
<%@ page import="com.test.beans.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.hplus.com/apptags" prefix="myTags"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>H+ Sport</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<header id="home" class="header">
		<nav class="nav" role="navigation">
			<div class="container nav-elements">
				<div class="branding">
					<a href="#home"><img src="images/hpluslogo.svg"
						alt="Logo - H Plus Sports"></a>
				</div>
				<!-- branding -->
				<ul class="navbar">
					<li><a href="home">home</a></li>
					<li><a href="orderHistory">order history</a></li>
					<!-- <li><a href="viewProfile">view my profile</a></li> -->
					<li><a href='<%=response.encodeURL("viewProfile")%>'>view
							my profile</a></li>
					<li><a href='logout'>logout</a></li>
					<li><a href="redirect">linkedIn</a></li>

				</ul>
				<!-- navbar -->
			</div>
			<!-- container nav-elements -->
		</nav>
		<!-- <div class="container tagline">
    <h1 class="headline">Our Mission</h1>
    <p>We support and encourage <em>active and healthy</em> lifestyles, by offering <em>ethically sourced</em> and <em>eco-friendly</em> nutritional products for the <em>performance-driven</em> athlete.</p>
  </div>container tagline -->
	</header>

<jsp:useBean id="user" scope="request" type="com.test.beans.User"></jsp:useBean>
<section>

    <myTags:formatDate date="<%=Calendar.getInstance().getTime()%>"
        format="dd-MM-YYYY hh:mm"></myTags:formatDate>
</section>
<section id="profile" class="section">
    <div class="container">
        <h2 class="headline"></h2>
        <table id="profile">

            <tr>
                <td>Username</td>
                <td>${user.username}</td>
            </tr>
            <tr>
                <td>First Name</td>
                <td>${user.firstName}</td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td>${user.lastName}</td>
            </tr>
			<tr>
				<td>Age</td>
				<td>${user.age}</td>
			</tr>
			<tr>
				<td>Interested in</td>
				<td><jsp:getProperty property="activity" name="user" /></td>
			</tr>

<%--            <tr>--%>
<%--                <td>Age</td>--%>
<%--                <td>${user.age}</td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Interested in</td>--%>
<%--                <td>${user.activity}</td>--%>
<%--            </tr>--%>

        </table>
    </div>
	<div class="container">
		<h2 class="headline">Weight Summary</h2>
		<table id="weightSummary">
			<tr>
				<td>January</td>
				<td>${requestScope.weightSummary["January"]*2}</td>
			</tr>
			<tr>
				<td>February</td>
				<td>${requestScope.weightSummary["February"]/2}</td>
			</tr>
			<tr>
				<td>March</td>
				<td>${requestScope.weightSummary["March"]}</td>
			</tr>
		</table>
	</div>
</section>



	<footer class="footer">
		<div class="container">
			<nav class="nav" role="navigation">
				<div class="container nav-elements">
					<div class="branding">
						<a href="#home"><img src="images/hpluslogo.svg"
							alt="Logo - H Plus Sports"></a>
						<p class="address">
							100 Main Street<br> Seattle, WA 98144
						</p>
					</div>
				</div>
			</nav>
			<p class="legal">H+ Sport is a fictitious brand created by
				lynda.com solely for the purpose of training. All products and
				people associated with H+ Sport are also fictitious. Any resemblance
				to real brands, products, or people is purely coincidental.
				Information provided about the product is also fictitious and should
				not be construed to be representative of actual products on the
				market in a similar product category.</p>
		</div>
		<!-- container -->
	</footer>
	<!-- footer -->


</body>
</html>