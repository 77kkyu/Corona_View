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
			<div class="col-4 col-sm-4 col-md-3 text-center" >
				<p class="confirmed number">${list.totalCase}</p>
				<p class="confirmed diff">(+${list.newCase})</p>
				<p>${list.countryName}</p><br>
 				<c:if test="${status.index eq 3}">
					<div id="more_btn_div" class="atag" align="center">
						<a id="more_btn_a" href="javascript:moreContent('more_list',10);">더보기(More)</a>
					</div>
				</c:if>
			</div>
		</c:forEach>
		
	</div>
	
	
	
</div>

<br><br><br><br><br><br>

<script>

function moreContent(id, cnt){

	var list_length = $("#"+id+" tr").length-1;  //tr갯수 구하기, 1을 빼는 이유는 제목, 
	var aname = id+"_btn";
	var callLength = list_length;

	$('#startCount').val(callLength);
	$('#viewCount').val(cnt);

	$.ajax({
		type   : "post",
		url    : "/getMoreContents_ajax.do",
		data   : $('#searchTxtForm').serialize(),
		dataType : "json",
		success  : function(result){
                    if(result.resultCnt > 0){
						var list = result.resultList;
							if(resultVO.title != ''){
								$('#'+aname).attr('href',"javascript:moreContent('
										getMoreList(list);
							}else{
								$("#"+id+"_div").remove();
							}
						}
                     }else{
                     }
		           },
		error    : function(request,status,error){
					alert("code = "+request.status+"message = "+request.responseText+"error = "+error); //실패 시 처리
					}
		});

		function getMoreList(list){

			var content = "";
			var length = list.length;
			for(i=0; i<list.length; i++){
				var resultVO = list[i];
				if(resultVO.title != ''){
					content += "<tr>";
					content += "<td>"+resultVO.title+"</td>";
					content += "<td>+resultVO.reg_date+"</td>";
					content += "</tr>";
				}
			}

			$("#more_list tr:last").after(content);
			// id가 more_list인 tr의 마지막에 content 값을 추가함
}

</script>

<!-- <script type="text/javascript">

var memberCountConTxt= ${TotalCase};

$({ val : 0 }).animate({ val : memberCountConTxt }, {
 duration: 2000,
step: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".memberCountCon").text(num);
},
complete: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".memberCountCon").text(num);
}
});

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script> -->

</body>
</html>