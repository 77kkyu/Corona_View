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
    padding: 4px
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

.home .top .dashboard .negative.diff, .home .top .dashboard .released.diff {
    color: green;
}

.home .top .dashboard .diff.minus {
    color: blue;
}

.atag{
	text-align:center;
}


</style>

<body id="top" class="home">

<div class="top container memberCountCon"> 

	<h2>대한민국</h2>
	<div class="row dashboard world">
		<div class="col-4 col-sm-4 col-md-3 text-center" >
		<p class="confirmed number">${TotalCase}</p>
		<p class="confirmed diff">(+${newCase})</p>
		<p>확진자</p>
		</div>
		
		<div class="col-4 col-sm-4 col-md-2 text-center" >
		<p class="death red number">${TotalDeath}</p>
		<p class="death diff">(+${TodayDeath})</p>
		<p>사망자</p>
		</div>
		
		<div class="col-4 col-sm-4 col-md-2 text-center" >
		<p class="released number">${TotalRecovered}</p>
		<p class="released diff">(+${TodayRecovered})</p>
		<p>격리해제</p>
		</div>
		
		<div class="col-6 col-sm-6 col-md-3 text-center" >
		<p class="fatality number">${deathPercentage}%</p>
		<p>치사율</p>
		</div>
		
		<div class="col-6 col-sm-6 col-md-1 text-center" >
		<p class="testing number">${checkingCounter}</p>
		<p>검사중</p>
		</div>
	</div><br>
	
	
	<h2>지역별 확진자</h2>
	<%-- <div class="row dashboard world">
		<div class="col-4 col-sm-4 col-md-3 text-center" >
		<p class="confirmed number">${seoulTotalCase}</p>
		<p class="confirmed diff">(+${seoulNewCase})</p>
		<p>${seoulCountryName}</p>
		</div>
		
		<div class="col-4 col-sm-4 col-md-2 text-center" >
		<p class="death red number">${gyeonggiTotalCase}</p>
		<p class="death diff">(+${gyeonggiNewCase})</p>
		<p>${gyeonggiCountryName}</p>
		</div>
		
		<div class="col-4 col-sm-4 col-md-2 text-center" >
		<p class="death red number">${daeguTotalCase}</p>
		<p class="death diff">(+${daeguNewCase})</p>
		<p>${daeguCountryName}</p>
		</div>
		
		<div class="col-6 col-sm-6 col-md-3 text-center" >
		<p class="death red number">${gyeongbukTotalCase}</p>
		<p class="death diff">(+${gyeongbukNewCase})</p>
		<p>${gyeongbukCountryName}</p>
		</div>
		
		<div class="col-6 col-sm-6 col-md-1 text-center" >
		<p class="death red number">${busanTotalCase}</p>
		<p class="death diff">(+${busanNewCase})</p>
		<p>${busanCountryName}</p>
		</div>
	</div> --%>
	
	
	<div class="row dashboard world">
		
		<c:forEach items="${locationList}" var="list"  varStatus="status" >
			
			 <c:if test="${status.index <= 3}">
	         	<div class="col-4 col-sm-4 col-md-3 text-center">
	         		<p class="confirmed number">${list.totalCase}</p>
					<p class="confirmed diff">(+${list.newCase})</p>
					<p>${list.countryName}</p><br>
				</div>
	         </c:if>
	         
	         <c:if test="${status.index eq 3}">
		         <div align="center">
						<input type="button" id="but" class="btn btn-primary" value="더보기" onclick="fsubmit();">
				 </div>
			 </c:if>

	         <c:if test="${status.index > 3}">
	         	<div name="view" class="col-4 col-sm-4 col-md-3 text-center" style="display:none">
	         		<p class="confirmed number">${list.totalCase}</p>
					<p class="confirmed diff">(+${list.newCase})</p>
					<p>${list.countryName}</p><br>
				</div>
	         </c:if>
	         
		</c:forEach>
		
	</div>
	
	
	
	
</div>

<br><br><br><br><br><br>


<script type="text/javascript">
	
	    function fsubmit(){
    
		var obj = document.getElementsByName("view").length;
		
		if(document.getElementById("but").value == "숨기기"){
			document.getElementById("but").value = "더보기";
			for(var i=0; i<obj; i++){
				document.getElementsByName("view")[i].style.display="none";	
			}
		}
		
		else if(document.getElementById("but").value == "더보기"){
			document.getElementById("but").value = "숨기기";
			for(var i=0; i<obj; i++){
				document.getElementsByName("view")[i].style.display="block";	
			}
		}
		
	}
	
</script>


</body>
</html>