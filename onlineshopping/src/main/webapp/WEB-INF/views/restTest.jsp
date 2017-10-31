<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="angular" value="/resources/angular" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Readable Theme -->
<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="${css}/myapp.css" rel="stylesheet">
<!-- jQuery -->
<script src="${js}/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${js}/bootstrap.min.js"></script>
<style>
.bs-example {
	margin: 20px;
}
</style>
<!-- AnularJS 1.6 Core JavaScript -->
<script src="${angular}/angular.min.js"></script>
<script src="${angular}/restTester.js"></script>
<title>Online Shopping - ${title}</title>
</head>

<body>
    <div class="wrapper">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="${contextRoot}/home">Home</a>
                </div>
            </div>
        </nav>
        <div class="content">

            <div class="container">

                <div class="row">

                    <div class="col-xs-12">

                        <h1>REST Test Harness for Online Shopping App</h1>
                        <hr />

                    </div>

                    <div class="bs-example" ng-app="resttestapp"
                        ng-controller="RestTestController">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th>code</th>
                                    <th>name</th>
                                    <th>brand</th>
                                    <th>unitPrice</th>
                                    <th>quantity</th>
                                    <th>purchases</th>
                                    <th>views</th>
                                    <th>file</th>
                                </tr>

                            </thead>
                            <tbody>
                                <tr ng-repeat="product in products">
                                    <td>{{product.id}}</td>
                                    <td>{{product.code}}</td>
                                    <td>{{product.name}}</td>
                                    <td>{{product.brand}}</td>
                                    <td>{{product.unitPrice | currency:"USD$ "}}</td>
                                    <td>{{product.quantity}}</td>
                                    <td>{{product.purchases}}</td>
                                    <td>{{product.views}}</td>
                                    <td>{{product.file}}</td>
                                </tr>
                            </tbody>
                            </div>
                            </div>
                            </div>
                            <%@include file="footer.jsp"%>
                            </div>
</body>

</html>