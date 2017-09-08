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
		<%@include file="navbar.jsp"%>

		<!--  Page Content -->

		<div class="content">
			<!--  userClickHome comes from the Controller as a clue to what is going on -->
			<!--  User clicked Home -->
			<c:if test="${userClickHome == true }">
				<%@include file="home.jsp"%>
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
				<%@include file="listProducts.jsp"%>
			</c:if>
			<c:if test="${userClickShowProduct == true}">
				<%@include file="singleProduct.jsp"%>
			</c:if>
			<c:if test="${userClickManageProducts == true}">
				<%@include file="manageProducts.jsp"%>
			</c:if>
		</div>
		<!--  Footer comes here -->
		<%@include file="footer.jsp"%>

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
