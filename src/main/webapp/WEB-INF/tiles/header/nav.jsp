<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>CoronaView</title>

<style type="text/css">

#nav{
	background:black;
}

</style>

<script type="text/javascript">

function animation(){
	var div = document.getElementById('prevent');
	$('prevent').animate({
		scrollTop: div.scrollHeight-div.clientHeight}, 500);
}

</script>

</head>
<body>


<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div id="nav" class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>            
<a href="/Corona_View/main"><img style="width:270px; height:55px; margin-left:30%;" src="<c:url value="/resources/images/logo.JPG"/>"/></a>
            
        </div>
		
		
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="page-scroll" href="#section1">국내 현황</a>
                </li>
                <li>
                    <a class="page-scroll" href="#section2">입국 제한</a>
                </li>
                <li>
                    <a class="page-scroll" href="#section3">예방 수칙</a>
                </li>
                <li>
                    <a class="page-scroll" href="#section4">뉴스</a>
                </li>
                
            </ul>
        </div>
    </div>
</nav>


</body>
</html>