<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<title>Main</title>
</head>

<style>

.home .top {
    background-color: white;
    border-radius: 10px;
    margin-top: 0;
    margin-bottom: 10px;
    padding-top: 10px;
    padding-bottom: 10px;
    border: 1px solid #dee2e6;
}


.home .top h2 {
    padding-top: 10px;
    padding-bottom: 10px;
    font-size: 28px;
}

.home h1, .home h2, .home h3, .home h4, .home h5 {
    text-align: center;
}

.h2, h2 {
    font-size: 2rem;
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    margin-bottom: .5rem;
    font-weight: 500;
    line-height: 1.2;
}

h1, h2, h3, h4, h5, h6 {
    margin-top: 0;
    margin-bottom: .5rem;
}

.text-center {
    text-align: center!important;
}




p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.text-center {
    text-align: center!important;
}

p {
    margin-top: 0;
    margin-bottom: 1rem;
}

.home .top .dashboard p.number {
    font-size: 22px;
    font-weight: 500;
}

.home .top .dashboard .diff {
    position: absolute;
    top: 27px;
    left: 50%;
    margin-left: -50%;
    width: 100%;
    color: red;
}

.home .top .dashboard p {
    font-size: 15px;
}







</style>

<body id="top" class="home">

<div class="top container"> 

	<h2>전 세계</h2>
	
	<div class="row dashboard world">
		<div class="col-4 col-sm-4 col-md-3 text-center" >
		<p class="confirmed number">12,170,088</p>
		<p class="confirmed diff">(+168,287)</p>
		<p>확진자</p>
		</div>
		
		<div class="col-4 col-sm-4 col-md-2 text-center" >
		<p class="death red number">552,075</p>
		<p class="death diff">(+4,283)</p>
		<p>사망자</p>
		</div>
		
		<div class="col-4 col-sm-4 col-md-2 text-center" >
		<p class="released number">7,065,361</p>
		<p class="released diff">(+122,284)</p>
		<p>격리해제</p>
		</div>
		
		<div class="col-6 col-sm-6 col-md-3 text-center" >
		<p class="fatality number">4.54%</p>
		<p>치사율</p>
		</div>
		
		<div class="col-6 col-sm-6 col-md-2 text-center" >
		<p class="country number">214</p>
		<p class="country diff">(-)</p>
		<p>발생국</p>
		</div>
	</div>
	
	<h2>대한민국</h2>
	
	

</div>

</body>
</html>
