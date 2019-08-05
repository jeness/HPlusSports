<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.Product"%>
<%@page import="java.util.List" buffer="8kb" isELIgnored="false"
	session="true" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isThreadSafe="true" isErrorPage="false"
	errorPage="error.jsp"%>


<html lang="en">
<head>
<meta charset="UTF-8">
<title>H+ Sport</title>
<link rel="stylesheet" href="css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<header id="home" class="header">
		<nav class="nav" role="navigation">
			<div class="container nav-elements">
				<div class="branding">
					<a href="home"><img src="images/hpluslogo.svg"
						alt="Logo - H Plus Sports"></a>
				</div>
				<!-- branding -->
				<ul class="navbar">
					<li><a href="home">home</a></li>
					<li><a href="#products">products</a></li>
					<li><a href="#history">history</a></li>
					<li><a href="login">login</a></li>
					<li><a href="#people">people</a></li>
					<li><a href="#search">search</a></li>
					<li><a href="registerUser">new user?</a></li>
					<li><a href="redirect">linkedIn</a></li>
				</ul>
				<!-- navbar -->

				<!-- navbar -->
			</div>
			<!-- container nav-elements -->
		</nav>
	</header>

	<section id="products" class="section">
		<div class="container">
			<h2 class="headline">Products</h2>
			<p>
				H+ Sport is <em>dedicated to creating</em> eco-friendly,
				high-quality, nutrient-rich, nutritional products that <em>enhance
					active lifestyles</em>.
			</p>
			<%
				if (session.getAttribute("noofproducts") != null) {
			%>
			<span id="size"
				title="<%=(ArrayList) session.getAttribute("noofproducts")%>">Items
				in Cart: <%=((ArrayList) session.getAttribute("noofproducts")).size()%></span>
			<%
				} else {
			%>
			<span id="size">Items in Cart: 0</span>
			<%
				}
			%>

		</div>


		<%--fetch he products from the rqq object --%>
		<%-- iterate the list and generate the display for every product --%>


		<div class="productContainer">

			<%
				List<Product> products = (ArrayList) request.getAttribute("products");
				Iterator<Product> iterator = products.iterator();
				while (iterator.hasNext()) {
					Product product = iterator.next();
			%>
			<form method="get" action="products">

				<div class="productContainerItem">
					<img id="pic3" src="<%=product.getProductImgPath()%>"> <input
						type="text" name="product" value="<%=product.getProductName()%>"><br />
					<button>Add to Cart</button>
				</div>
			</form>
			<%
				}
			%>
		</div>
	</section>
	<!-- #products -->

	<section id="search" class="section">
		<header class="imageheader"></header>
		<div class="container">
			<h2 class="headline">Search Products</h2>
			<form action="search" method="get">
				<label class="card-title">Search your product</label> <input
					type="search" name="search"> <input type="submit"
					value="Search">
			</form>
		</div>
	</section>
	<!-- guarantee -->

	<section id="history" class="section">
		<div class="container">
						<div class="text-content">
							<h2 class="headline">Company History</h2>
							<p>
								In 2006, H+ Sport founder <a href="#employees-henrytwill">Henry
									Twill</a> set out to create supplements and nutritional products
								made from the <em>purest ingredients</em> and backed by
								scientific and <em>performance data</em> – to provide a strong
								basis of <em>trust and accountability</em>.
							</p>
							<p>
								His quest began while training for his <em>first 5K
									marathon</em>, after recovering from a <em>lengthy injury</em> that
								left him with residual aches, pains, and decreased athletic
								performance. He yearned for <em>simple and natural
									ingredients</em>, in their purest form, instead of labels with <em>lengthy
									chemical names</em> and disclaimers. When no products lived up to
								his strict requirements, Henry set his sights on <em>creating
									products</em> that catered to his own vision.
							</p>
							<p>
								Today that vision has become H+ Sport…offering a variety of <a
									href="#products">supplements, energy bars and rehydration
									solutions</a>. At the foundation of H+ Sports are products backed
								by scientific and performance data.
							</p>
						</div>
					</div>
					<!-- container text -->
	</section>
	
	
	<section id="people" class="section">
  <header class="imageheader"></header>
  <div class="container">
    <h2 class="headline">People</h2>
    <div class="people-cards">
      <div class="person-card">
        <img src="images/employees/HenryTwill.jpg" alt="HenryTwill Photo">
        <div class="card-info">
          <h3 class="card-name">Henry Twill, Jr</h3>
          <h4 class="card-title">CEO</h4>
        </div>
        <p class="card-text">Henry Twill Jr. is the <em>founder</em> and CEO of H+ Sports. Previously he was an <em>athletic trainer</em> working with several top athletes, making sure that they had the direction and proper coaching to keep them at the <em>top of their game</em>. Henry’s passion for finding natural alternatives led him to developing H+ Sport Multivitamins. The supplements <em>became a success</em> with his clients and led to the creation of H+ Sports.</p>
      </div><!-- person-card -->

      <div class="person-card">
        <img src="images/employees/JessicaNewton.jpg" alt="JessicaNewton Photo">
        <div class="card-info">
          <h3 class="card-name">Jessica Newton-Smith, MBA</h3>
          <h4 class="card-title">CFO</h4>
        </div>
        <p class="card-text">Jessica Newton-Smith joined us in 2012 and brings more than <em>10 years</em> of financial management experience to H+ Sports, spanning a variety of companies and industries ranging from <em> Fortune 500 agencies</em> to start-ups. She has extensive experience working in <em>emerging markets</em> and in the consumer and retail sectors.</p>
      </div><!-- person-card -->

      <div class="person-card">
        <img src="images/employees/PhiTang.jpg" alt="PhiTang Photo">
        <div class="card-info">
          <h3 class="card-name">Phi Tang, MBA</h3>
          <h4 class="card-title">Director of Product Development</h4>
        </div>
        <p class="card-text">Phi Tang joined H+ Sports in <em>2007</em> as Manager of Marketing Research. He was promoted to Director of Product Development in 2011. He has made <em>major contributions</em> to the discovery, development, and implementation of the H+ Sport product lines. Before joining the company he worked as a <em>scientific expert</em> and brings vast knowledge of ingredients and <em>new technologies</em>.</p>
      </div><!-- person-card -->

      <div class="person-card">
        <img src="images/employees/MariaSontas.jpg" alt="MariaSontas Photo">
        <div class="card-info">
          <h3 class="card-name">Maria Sontas</h3>
          <h4 class="card-title">Director of Marketing</h4>
        </div>
        <p class="card-text">Maria Sontas has been with H+ Sport since 2010. She oversees the company’s <em>marketing strategy</em> – ensuring advertising campaigns, social media initiatives, and events are planned to <em>position the company</em> strongly in a competitive marketplace. Maria is a <em>competing triathlete</em> and her passion for our products shows in her unique ability to drive awareness and <em>increase our presence</em> around the world.</p>
      </div><!-- person-card -->

      <div class="person-card">
        <img src="images/employees/AngelaHaston.jpg" alt="AngelaHaston Photo">
        <div class="card-info">
          <h3 class="card-name">Angela Hashton</h3>
          <h4 class="card-title">Director of Sales</h4>
        </div>
        <p class="card-text">Angela Hashton joined the company in 2009, to <em>initiate new relationships</em> for our growing line of H+ Sports active apparel. After being with the company for a year, she was promoted to Director of Sales. Angela is the drive behind the H+ Sport <em>ACTIVE product line</em> and has an uncanny ability to formulate strategies that have helped build our unified sales force. <em>Educating people</em> about health and nutrition is something that Angela holds dear.</p>
      </div><!-- person-card -->

      <div class="person-card">
        <img src="images/employees/MichaelLewiston.jpg" alt="MichaelLewiston Photo">
        <div class="card-info">
          <h3 class="card-name">Michael Lewiston</h3>
          <h4 class="card-title">MFA, Creative Director</h4>
        </div>
        <p class="card-text">Michael Lewiston is a multi-faceted <em>creative person</em> who began his career as a designer for a small business firm, while also working as an independent <em>painter and sculptor</em>. In 2007, Henry Twill was impressed by Michael’s creative work in a national ad campaign for a high profile sports apparel company. Henry approached Michael, and asked him to <em>manage creative direction</em> for the H+ Sport ACTIVE apparel line.</p>
      </div><!-- person-card -->
  </div><!-- container -->
</section><!-- people -->




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