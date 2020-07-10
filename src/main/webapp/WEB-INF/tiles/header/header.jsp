<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>CoronaView</title>

<style type="text/css">

#header{
	width:100%;
	height:300px;
	background:black;
	clear:both;
}


p{
	color:white;
	font-family:'Segoe UI';
	font-size:30px;
	font-weight: 500;
	text-align:center;
}

</style>
</head>

<body>


<div id="header" class="container">

	<img style="width:200px; height:60px; margin-left:350px;" src="<c:url value="/resources/images/logo2.png"/>"/>

	<p>코로나 19 현황</p>

</div>


</body>
</html>