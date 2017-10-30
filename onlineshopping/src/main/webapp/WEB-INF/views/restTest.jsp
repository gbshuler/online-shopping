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
                    <div class="col-xs-12">{{3 + 4}}</div>
                    <div ng-app="resttestapp" ng-controller="RestTestController">
                        <h1>{{greeting}}</h1>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>
    </div>
</body>

</html>