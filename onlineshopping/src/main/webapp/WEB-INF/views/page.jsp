<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- Spring tags for static content -->
<!-- Note how our build project has NO resources directory! 
      A mapping from /resources to /assets is made in the dispatcher-servlet -->
<!-- Now we refer to the location of the css root as ${css} -->
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<!-- if your URL is 'www.foo.com/MyCoolApp/index.jsp then the "contextPath" is'MyCoolApp' -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Online Shopping - ${title}</title>

<script>
	window.menu = '${title}'; // get from pagecontroller - push down to JS
	window.contextRoot = '${contextRoot}'; // push the context path we got with JSTL above down into JS
</script>

<!-- Bootstrap Core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">
<!--  Bootswatch readable theme  -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">

<!--  Bootswatch jQuery DataTable theme  -->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${css}/myapp.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div class="wrapper">
		<!-- Navigation - an HTML5 <nav> element representing a list of href links -->
		<!-- Using "./" path makes file position relative to THIS file (not classpath or WEB-INF) -->
		<%@include file="./shared/navbar.jsp"%>

		<!--  Page Content -->

		<div class="content">
			<!--  userClickHome comes from the Controller as a clue to what is going on -->
			<!--  User clicked Home -->
			<c:if test="${userClickHome == true }">
				<!-- BEGIN home.jsp -->

				<!-- home.jsp -->
				<!-- Page Content -->
				<div class="container">

					<div class="row">

						<div class="col-md-3">
							<div class="list-group">
								<!--  BEGIN shared/sidebar.jsp -->
								<p class="lead">Shop Name</p>

								<div class="list-group">
									<c:forEach items="${categories}" var="category">
										<a href="${contextRoot}/show/category/${category.id}/products"
											class="list-group-item" id="a_${category.name}">${category.name}</a>
									</c:forEach>
								</div>
								<!--  END shared/sidebar.jsp -->
							</div>
						</div>

						<div class="col-md-9">

							<div class="row carousel-holder">

								<div class="col-md-12">
									<div id="carousel-example-generic" class="carousel slide"
										data-ride="carousel">
										<ol class="carousel-indicators">
											<li data-target="#carousel-example-generic" data-slide-to="0"
												class="active"></li>
											<li data-target="#carousel-example-generic" data-slide-to="1"></li>
											<li data-target="#carousel-example-generic" data-slide-to="2"></li>
										</ol>
										<div class="carousel-inner">
											<div class="item active">
												<img class="slide-image" src="http://placehold.it/800x300"
													alt="">
											</div>
											<div class="item">
												<img class="slide-image" src="http://placehold.it/800x300"
													alt="">
											</div>
											<div class="item">
												<img class="slide-image" src="http://placehold.it/800x300"
													alt="">
											</div>
										</div>
										<a class="left carousel-control"
											href="#carousel-example-generic" data-slide="prev"> <span
											class="glyphicon glyphicon-chevron-left"></span>
										</a> <a class="right carousel-control"
											href="#carousel-example-generic" data-slide="next"> <span
											class="glyphicon glyphicon-chevron-right"></span>
										</a>
									</div>
								</div>

							</div>

							<div class="row">

								<div class="col-sm-4 col-lg-4 col-md-4">
									<div class="thumbnail">
										<img src="http://placehold.it/320x150" alt="">
										<div class="caption">
											<h4 class="pull-right">$24.99</h4>
											<h4>
												<a href="#">First Product</a>
											</h4>
											<p>
												See more snippets like this online store item at <a
													target="_blank" href="http://www.bootsnipp.com">Bootsnipp
													- http://bootsnipp.com</a>.
											</p>
										</div>
										<div class="ratings">
											<p class="pull-right">15 reviews</p>
											<p>
												<span class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span>
											</p>
										</div>
									</div>
								</div>

								<div class="col-sm-4 col-lg-4 col-md-4">
									<div class="thumbnail">
										<img src="http://placehold.it/320x150" alt="">
										<div class="caption">
											<h4 class="pull-right">$64.99</h4>
											<h4>
												<a href="#">Second Product</a>
											</h4>
											<p>This is a short description. Lorem ipsum dolor sit
												amet, consectetur adipiscing elit.</p>
										</div>
										<div class="ratings">
											<p class="pull-right">12 reviews</p>
											<p>
												<span class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star-empty"></span>
											</p>
										</div>
									</div>
								</div>

								<div class="col-sm-4 col-lg-4 col-md-4">
									<div class="thumbnail">
										<img src="http://placehold.it/320x150" alt="">
										<div class="caption">
											<h4 class="pull-right">$74.99</h4>
											<h4>
												<a href="#">Third Product</a>
											</h4>
											<p>This is a short description. Lorem ipsum dolor sit
												amet, consectetur adipiscing elit.</p>
										</div>
										<div class="ratings">
											<p class="pull-right">31 reviews</p>
											<p>
												<span class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star-empty"></span>
											</p>
										</div>
									</div>
								</div>

								<div class="col-sm-4 col-lg-4 col-md-4">
									<div class="thumbnail">
										<img src="http://placehold.it/320x150" alt="">
										<div class="caption">
											<h4 class="pull-right">$84.99</h4>
											<h4>
												<a href="#">Fourth Product</a>
											</h4>
											<p>This is a short description. Lorem ipsum dolor sit
												amet, consectetur adipiscing elit.</p>
										</div>
										<div class="ratings">
											<p class="pull-right">6 reviews</p>
											<p>
												<span class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star-empty"></span> <span
													class="glyphicon glyphicon-star-empty"></span>
											</p>
										</div>
									</div>
								</div>

								<div class="col-sm-4 col-lg-4 col-md-4">
									<div class="thumbnail">
										<img src="http://placehold.it/320x150" alt="">
										<div class="caption">
											<h4 class="pull-right">$94.99</h4>
											<h4>
												<a href="#">Fifth Product</a>
											</h4>
											<p>This is a short description. Lorem ipsum dolor sit
												amet, consectetur adipiscing elit.</p>
										</div>
										<div class="ratings">
											<p class="pull-right">18 reviews</p>
											<p>
												<span class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star"></span> <span
													class="glyphicon glyphicon-star-empty"></span>
											</p>
										</div>
									</div>
								</div>

								<div class="col-sm-4 col-lg-4 col-md-4">
									<h4>
										<a href="#">Like this template?</a>
									</h4>
									<p>
										If you like this template, then check out <a target="_blank"
											href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">this
											tutorial</a> on how to build a working review system for your
										online store!
									</p>
									<a class="btn btn-primary" target="_blank"
										href="http://maxoffsky.com/code-blog/laravel-shop-tutorial-1-building-a-review-system/">View
										Tutorial</a>
								</div>

							</div>

						</div>

					</div>
				</div>
				<!-- /.container -->

				<!-- END home.jsp -->
			</c:if>
			<!--  User clicked About -->
			<c:if test="${userClickAbout == true }">
				<%@include file="about.jsp"%>
			</c:if>
			<c:if test="${userClickContact == true }">
				<%@include file="contact.jsp"%>
			</c:if>
			<!--  check what button user pressed from model -->
			<c:if
				test="${userClickAllProducts == true or userClickCategoryProducts == true }">
				<!--  BEGIN listProducts.jsp -->
				<div class="container">
					<div class="row">
						<!-- Would be to display sidebar -->
						<div class="col-md-3">
							<!--  BEGIN shared/sidebar.jsp -->
							<p class="lead">Shop Name</p>
							<div class="list-group">
								<c:forEach items="${categories}" var="category">
									<a href="${contextRoot}/show/category/${category.id}/products"
										class="list-group-item" id="a_${category.name}">${category.name}</a>
								</c:forEach>
							</div>
							<!--  END shared/sidebar.jsp -->
						</div>
						<!-- to display the actual products -->
						<div class="col-md-9">
							<!-- Added breadcrumb component -->
							<div class="row">
								<div class="col-lg-12">
									<c:if test="${userClickAllProducts == true}">
										<script>
											window.categoryId = '';
										</script>
										<ol class="breadcrumb">
											<li><a href="${contextRoot}/home">Home</a></li>
											<li class="active">All Products</li>
										</ol>
									</c:if>
									<c:if test="${userClickCategoryProducts == true}">
										<script>
											window.categoryId = '${category.id}';
										</script>

										<ol class="breadcrumb">
											<li><a href="${contextRoot}/home">Home</a></li>
											<li class="active">Category</li>
											<li class="active">${category.name}</li>
										</ol>
									</c:if>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="container-fluid">
										<div class="table-responsive">
											<table id="productListTable"
												class="table table-striped table-borderd">
												<thead>
													<tr>
														<th>Image</th>
														<th>Name</th>
														<th>Brand</th>
														<th>Price</th>
														<th>Qty. Available</th>
														<th>ID</th>
													</tr>
												</thead>
												<tfoot>
													<tr>
														<th>Image</th>
														<th>Name</th>
														<th>Brand</th>
														<th>Price</th>
														<th>Qty. Available</th>
														<th>ID</th>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--  END listProducts.jsp -->
			</c:if>
		</div>
		<!--  Footer comes here -->
		<%@include file="./shared/footer.jsp"%>

		<!-- jQuery -->
		<script src="${js}/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${js}/bootstrap.min.js"></script>

		<!--  DataTable Plugin -->
		<script src="${js}/jquery.dataTables.js"></script>

		<!--  Bootstrap DataTable Plugin -->
		<script src="${js}/dataTables.bootstrap.js"></script>

		<!--  self coded JavaScript !must be put after loading JS library files. -->
		<script src="${js}/myapp.js"></script>
	</div>
</body>

</html>
