<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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

		<ex:formatDate date="<%=Calendar.getInstance().getTime()%>"
			format="dd-MM-YYYY hh:mm"></ex:formatDate>
	</section>
	<section id="profile" class="section">
		<div class="container">
			<h2 class="headline"></h2>
			<table id="profile">

				<tr>
					<td>Username</td>
					<td><jsp:getProperty property="username" name="user" /></td>
				</tr>
				<tr>
					<td>First Name</td>
					<td><jsp:getProperty property="firstName" name="user" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><jsp:getProperty property="lastName" name="user" /></td>
				</tr>
				<tr>
					<td>Age</td>
					<td>${user.age}</td>
				</tr>
				<tr>
					<td>Interested in</td>
					<td>${user.activity}</td>
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