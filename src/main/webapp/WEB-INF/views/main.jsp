<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>


<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" 
"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<title>Main</title>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 차트  -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>



<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>



</head>

<style>
.home .top {
	background-color: white;
	border-radius: 20px;
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
	text-align: center !important;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.text-center {
	text-align: center !important;
}

p {
	margin-top: 0;
	margin-bottom: 1rem;
	padding: 4px;
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

.home .top .dashboard .negative.diff, .home .top .dashboard .released.diff
	{
	color: green;
}

.home .top .dashboard .diff.minus {
	color: blue;
}

.atag {
	text-align: center;
}


.source {
    text-align: center;
    font-size: 15px;
    padding-bottom: 5px;
}
  
#area-chart, #line-chart, #bar-chart, #stacked, #pie-chart {
	min-height: 250px;
}
#first{
	font-size: 18px;
}
#last{
	border-bottom: 1px solid #cccccc;
}
a:link {
	text-decoration:none;
	color:black;
}
a:visited {
	text-decoration:none;
	color:black;
}
a:active {
	text-decoration:none;
	color:black;
}
a:hover {
	text-decoration:none;
	color:black;
}

#youtube{
	clear:both;
	border-bottom: 1px solid #cccccc;
}
#image{
	float:left;
	width:33%;
	display:inline;
}
#details{
	float:left;
	width:66%;
	display:inline;
}
#title{
	font-size:20px;
	font-weight:600;
}

/* tablesorter */
@import url('https://fonts.googleapis.com/css?family=Amarante');


html { overflow-y: scroll; }


::selection { background: #5f74a0; color: #fff; }
::-moz-selection { background: #5f74a0; color: #fff; }
::-webkit-selection { background: #5f74a0; color: #fff; }

br { display: block; line-height: 1.6em; } 

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
ol, ul { list-style: none; }

input, textarea { 
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  outline: none; 
}

blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
strong, b { font-weight: bold; } 

table { border-collapse: collapse; border-spacing: 0; }
img { border: 0; max-width: 100%; }

h1 { 
  font-family: 'Amarante', Tahoma, sans-serif;
  font-weight: bold;
  font-size: 3.6em;
  line-height: 1.7em;
  margin-bottom: 10px;
  text-align: center;
}


/** page structure **/
#wrapper {
  display: block;
  width: 850px;
  background: #fff;
  margin: 0 auto;
  padding: 10px 17px;
  -webkit-box-shadow: 2px 2px 3px -1px rgba(0,0,0,0.35);
}

#keywords {
  margin: 0 auto;
  font-size: 1.2em;
  margin-bottom: 15px;
}


#keywords thead {
  cursor: pointer;
  background: #c9dff0;
}
#keywords thead tr th { 
  font-weight: bold;
  padding: 12px 30px;
  padding-left: 42px;
}
#keywords thead tr th span { 
  padding-right: 20px;
  background-repeat: no-repeat;
  background-position: 100% 100%;
}

#keywords thead tr th.headerSortUp, #keywords thead tr th.headerSortDown {
  background: #acc8dd;
}

#keywords thead tr th.headerSortUp span {
  background-image: url('https://i.imgur.com/SP99ZPJ.png');
}
#keywords thead tr th.headerSortDown span {
  background-image: url('https://i.imgur.com/RkA9MBo.png');
}


#keywords tbody tr { 
  color: #555;
}
#keywords tbody tr td {
  text-align: center;
  padding: 15px 10px;
}
#keywords tbody tr td.lalign {
  text-align: center;
}


</style>


<body id="top" class="home">

	<div class="top container memberCountCon">

		<h2>대한민국</h2>
		<div class="row dashboard world">
			<div class="col-4 col-sm-4 col-md-3 text-center">
				<p class="confirmed number">${TotalCase}</p>
				<p class="confirmed diff">(+${newCase})</p>
				<p>확진자</p>
			</div>

			<div class="col-4 col-sm-4 col-md-2 text-center">
				<p class="death red number">${TotalDeath}</p>
				<p class="death diff">(+${TodayDeath})</p>
				<p>사망자</p>
			</div>

			<div class="col-4 col-sm-4 col-md-2 text-center">
				<p class="released number">${TotalRecovered}</p>
				<p class="released diff">(+${TodayRecovered})</p>
				<p>격리해제</p>
			</div>

			<div class="col-6 col-sm-6 col-md-3 text-center">
				<p class="fatality number">${deathPercentage}%</p>
				<p>치사율</p>
			</div>

			<div class="col-6 col-sm-6 col-md-1 text-center">
				<p class="testing number">${checkingCounter}</p>
				<p>검사중</p>
			</div>
		</div>
		<br>


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

			<c:forEach items="${locationList}" var="list" varStatus="status">

				<c:if test="${status.index <= 3}">
					<div class="col-4 col-sm-4 col-md-3 text-center">
						<p class="confirmed number">${list.totalCase}</p>
						<p class="confirmed diff">(+${list.newCase})</p>
						<p>${list.countryName}</p>
						<br>
					</div>
				</c:if>

				<c:if test="${status.index eq 3}">
					<div align="center">
						<input type="button" id="but" class="btn btn-primary" value="더보기"
							onclick="fsubmit();">
					</div>
					<br>
				</c:if>

				<c:if test="${status.index > 3}">
					<div name="view" class="col-4 col-sm-4 col-md-3 text-center"
						style="display: none">
						<p class="confirmed number">${list.totalCase}</p>
						<p class="confirmed diff">(+${list.newCase})</p>
						<p>${list.countryName}</p>
						<br>
					</div>
				</c:if>

			</c:forEach>

		</div>

	</div>


<div class="container">

<br><br>
<h1>대한민국 NEWS</h1>
<br><br>


<c:forEach items="${newsList}" var="list" varStatus="status">

	<div id="news">
	
	<%-- <fmt:parseDate value="${list.pubDate}" var="parseDate" pattern="yyyyMMdd"/>
		<fmt:formatDate value="${parseDate}" pattern="yyyy.MM.dd"/> --%>
		<a href="${list.link}" target="_blank"><div id="first"><B>${list.title}</B></div>
		<div style="font-weight:600;">${list.description}</div><br>
		<div id="last">${list.pubDate}</div></a>
		<br><br>
		
	</div>
	
</c:forEach>

</div>


<div class="container">

<br><br>
<h1>YouTube</h1>
<br><br>

<c:forEach items="${youtubeList}" var="list" varStatus="status">   
	
	<a href="${list.vedioId}" target="_blank">
	<div id="youtube" class="d-flex flex-wrap flex-sm-nowrap align-items-stretch border-bottom">
	
		<div id="image"><img style="width:93%;" src="${list.imgUrl}"></div>
		
		<div id="details">
		<br><br><div id="title">${list.title}</div><br>
			<div>${list.channelTitle}ㆍ${list.publishTime}<br>
				${list.content}</div>
		</div>
	
	</div>
	</a>
	
	<br>
</c:forEach>

</div>



<div class="container">

<div id="area">
<br><br><br><br>

	<h1>확진자 상세 정보</h1>
	
	<br><br>
	
	<ul>
		<li>확진자 동선을 더이상 업데이트 하지 않습니다.
		<li>지역을 클릭하면 확진자 동선을 확인 할 수 있는 지자체 홈페이지가 새창으로 열립니다.
	</ul>
</div>

<br>

<div id="location-tag" class="d-flex flex-wrap align-content-center">
	<button type="button" class="btn btn-primary" onclick="location.href='https://www.seoul.go.kr/coronaV/coronaStatus.do' " style="width: 60px; margin: 1px">서울</button>
	<button type="button" class="btn btn-primary" onclick="location.href='http://www.busan.go.kr/corona19/index#travelhist' " style="width: 60px; margin: 1px">부산</button>
	<button type="button" class="btn btn-primary" onclick="location.href='http://www.daegu.go.kr/dgcontent/index.do?menu_id=00936598' " style="width: 60px; margin: 1px">대구</button>
	<button type="button" class="btn btn-primary" onclick="location.href='https://www.incheon.go.kr/health/HE020409' " style="width: 60px; margin: 1px">인천</button>
	
	<button type="button" class="btn btn-primary" onclick="location.href='https://www.gwangju.go.kr/c19/c19/contentsView.do?pageId=coronagj2' " style="width: 60px; margin: 1px">광주</button>
	<button type="button" class="btn btn-primary" onclick="location.href='https://www.daejeon.go.kr/corona19/index.do?menuId=0002' " style="width: 60px; margin: 1px">대전</button>
	<button type="button" class="btn btn-primary" onclick="location.href='https://www.ulsan.go.kr/corona.jsp' " style="width: 60px; margin: 1px">울산</button>
	<button type="button" class="btn btn-primary" onclick="location.href='https://www.sejong.go.kr/bbs/R3391/list.do' " style="width: 60px; margin: 1px">세종</button>
	
	<button type="button" class="btn btn-primary" onclick="location.href='https://www.gg.go.kr/bbs/board.do?bsIdx=722&amp;menuId=2903#page=1' " style="width: 60px; margin: 1px">경기</button>
	<button type="button" class="btn btn-primary" onclick="location.href='https://www.provin.gangwon.kr/covid-19.html' " style="width: 60px; margin: 1px">강원</button>
	<button type="button" class="btn btn-primary" onclick="location.href='http://www1.chungbuk.go.kr/covid-19/index.do' " style="width: 60px; margin: 1px">충북</button>
	<button type="button" class="btn btn-primary" onclick="location.href='http://www.chungnam.go.kr/coronaStatus.do' " style="width: 60px; margin: 1px">충남</button>
	
	<button type="button" class="btn btn-primary" onclick="location.href='http://www.jeonbuk.go.kr/board/list.jeonbuk?boardId=BBS_0000107&amp;menuCd=DOM_000000110006000000&amp;contentsSid=1224&amp;cpath=' " style="width: 60px; margin: 1px">전북</button>
	<button type="button" class="btn btn-primary" onclick="location.href='https://www.jeonnam.go.kr/coronaMainPage.do' " style="width: 60px; margin: 1px">전남</button>
	<button type="button" class="btn btn-primary" onclick="location.href='http://gb.go.kr/corona_main.htm' " style="width: 60px; margin: 1px">경북</button>
	<button type="button" class="btn btn-primary" onclick="location.href='http://xn--19-q81ii1knc140d892b.kr/main/main.do#close' " style="width: 60px; margin: 1px">경남</button>
	<button type="button" class="btn btn-primary" onclick="location.href='https://www.jeju.go.kr/wel/healthCare/corona/coronaNotice.htm' " style="width: 60px; margin: 1px">제주</button>
</div>

<div id="prevent">
<br><br><br><br>


<h1>예방 행동 수칙</h1>

<br>
<img style="width:80%; height:1600px; margin-left:10%" src="<c:url value="/resources/images/corona_1.jpeg"/>"/>
<img style="width:80%; height:1000px; margin-left:10%" src="<c:url value="/resources/images/corona_2.jpeg"/>"/>
<img style="width:80%; height:1000px; margin-left:10%" src="<c:url value="/resources/images/corona_3.jpeg"/>"/>

</div>


<div id="city">
<br><br><br><br>
<h1>입국제한조치 현황</h1>
</div>


<br><br>

<div class="source"><span>(7/8 17시 기준 자료)</span><br>
<a target="_blank" href="http://www.0404.go.kr/dev/newest_list.mofa">출처: [외교부 해외안전여행]</a>
</div>

<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          입국제한 해제 (15개국)
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        ※방문하시려는 국가.지역 관할 우리 공관(대사관.총영사관.출장소.분관 등) 홈페이지, 해당 정부 공식 홈페이지 등을 사전에 필수적으로 참고하시기 바랍니다<br><br><br>

✔️미주<br>
아이티(6/30), 앤티가바부다(6/1)<br><br>

✔️유럽<br>
네덜란드(7/1), 라트비아(7/1), 룩셈부르크(7/1), 몬테네그로(5/30), 벨라루스(6/25), 북마케도니아(6/26), 사이프러스(4/20), 세르비아(5/22), 터키(6/11), 포르투갈(7/1), 폴란드(7/3), 프랑스(7/3)<br><br>

✔️중동<br>
튀니지(7/2)<br><br>

✔️아프리카<br>
탄자니아(5/20)<br>
      </div>
    </div>
  </div>
  
  
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          입국금지 조치 (115개국)
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        ✔️아시아태평양<br>
나우루, 네팔, 뉴질랜드, 니우에, 대만, 동티모르, 라오스, 마셜제도, 마이크로네시아, 마카오, 말레이시아, 몰디브, 몽골, 미얀마, 바누아투, 베트남, 부탄, 사모아, 사모아(미국령), 솔로몬제도, 스리랑카, 싱가포르, 인도네시아, 일본, 쿡제도, 키리바시, 투발루, 통가, 파푸아뉴기니, 피지, 필리핀, 호주, 홍콩, 중국(지역별상이)
<br><br>
✔️미주<br>
과테말라, 그레나다, 니카라과, 벨리즈, 볼리비아, 브라질, 수리남, 아르헨티나, 엘살바도르, 온두라스, 우루과이, 칠레, 캐나다, 코스타리카, 콜롬비아, 쿠바, 트리니다드토바고, 파나마, 파라과이, 페루
<br><br>
✔️유럽<br>
노르웨이, 독일, 러시아, 루마니아, 리투아니아, 리히텐슈타인, 몰도바, 벨기에, 보스니아헤르체고비나, 불가리아, 스위스, 아르메니아, 아이슬란드, 아제르바이잔, 에스토니아, 오스트리아, 조지아, 체코, 키르기즈스탄, 타지키스탄, 투르크메니스탄, 핀란드
<br><br>
✔️중동<br>
리비아, 모로코, 바레인, 사우디, 아랍에미리트, 알제리, 오만, 요르단, 이라크, 이스라엘, 카타르, 쿠웨이트, 팔레스타인
<br><br>
✔️아프리카<br>
가나, 가봉, 감비아, 나미비아, 남아프리카공화국, 니제르, 르완다, 마다가스카르, 말라위, 모리셔스, 민주콩고, 보츠와나, 부르키나파소, 상투메프린시페, 세이셸, 수단, 에리트레아, 에스와티니, 우간다, 차드, 카메룬, 케냐, 코모로, 코트디부아르, 콩고공화국, 토고<br>
      </div>
    </div>
  </div>
  
  
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          격리 조치 (7개국)
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        ✔️미주<br>
미국, 세인트키츠네비스<br><br>

✔️중동<br>
모리타니아<br><br>

✔️아프리카<br>
부룬디, 베냉, 세네갈, 시에라리온<br>
      </div>
    </div>
  </div>
  
  
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingFour">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
          검역 강화 (48개국)
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
✔️아시아태평양<br>
방글라데시, 브루나이, 인도, 캄보디아, 태국, 파키스탄, 폴리네시아(프랑스령)<br><br>

✔️미주<br>
가이아나, 도미니카공화국, 멕시코, 바베이도스, 바하마, 베네수엘라, 세인트루시아, 세인트빈센트그레나딘, 에콰도르, 자메이카<br><br>

✔️유럽<br>
그리스, 덴마크, 몰타, 스웨덴, 슬로바키아, 슬로베니아, 아일랜드, 알바니아, 영국, 우즈베키스탄, 우크라이나, 이탈리아, 카자흐스탄, 크로아티아, 헝가리<br><br>

✔️중동<br>
레바논, 이란, 이집트<br><br>

✔️아프리카<br>
기니, 기니비사우, 나이지리아, 남수단, 라이베리아, 말리, 모잠비크, 앙골라, 에티오피아, 잠비아, 적도기니, 짐바브웨, 중앙아프리카공화국<br>
      </div>
    </div>
  </div>
  
</div>

</div>


<br><br><br><br>


<!-- 카카오맵 -->
<div class="container">
<div id="map" class="container" style="width:700px;height:700px;align:center;"></div>
</div>



<div id="status">
<br><br><br><br>

	<!-- 차트 -->
	
	<div class="container">
		<h3 class="text-primary text-center">국내차트🌏</h3>
		<br><br><br>
		<div class="row">
		
    <div class="text-center">
      <label>차트1</label> <br><br><br>
      <div id="area-chart" style="width:80%; height:370px; margin-left:10%;"></div>
    </div>
    
    <br><br><br><br><br>
    
    <div class="text-center">
       <label>차트2</label> <br><br><br>
      <div id="line-chart" style="width:80%; height:370px; margin-left:10%;"></div>
    </div>
    
    <br><br><br><br><br>
    
    <div  class="text-center">
       <label>차트3</label> <br><br><br>
      <div id="bar-chart" style="width:80%; height:370px; margin-left:10%;"></div>
    </div>
    
    <br><br><br><br><br>
    
    <div class="text-center">
       <label>차트4</label> <br><br><br>
      <div id="stacked" style="width:80%; height:370px; margin-left:10%;"></div>
    </div>
    
    <br><br><br><br><br>
    
    <div class="text-center">
       <label>차트5</label> <br><br><br>
      <div id="pie-chart" style="width:350px; height:350px; margin-left:35%"></div>
    </div>
    <br>
    
	  </div>
	
	</div>
</div>

  
  <br><br><br><br>
  
  
  <div class="container">
  <div id="wrapper" style="position: relative; z-index: 0; max-width: 100%; max-height: 100%; width: 100%; height: 100%;">
  <h1>국내 코로나 현황 리스트</h1>
  <br><br><br>
  <table id="keywords" cellspacing="0" cellpadding="0">
    <thead>
      <tr>
        <th><span>&nbsp;&nbsp;지역</span></th>
        <th><span>&nbsp;&nbsp;확진자</span></th>
        <th><span>&nbsp;&nbsp;완치자</span></th>
        <th><span>&nbsp;&nbsp;사망자</span></th>
        <th><span>&nbsp;&nbsp;발생률%</span></th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach items="${locationList}" var="list" varStatus="status">
    	<tr>
	        <td class="lalign">${list.countryName}</td>
	        <td>${list.totalCase} <br><font color="blue">(+${list.newCase})</font></td>
	        <td><font color="green">${list.recovered}</font></td>
	        <td><font color="red">${list.death}</font></td>
	        <td>${list.percentage}%</td>
      	</tr>
    </c:forEach>
      
    </tbody>
  </table>
 </div> 
 </div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>



</body>
</html>

<script type="text/javascript">

$(function(){
	  $('#keywords').tablesorter(); 
	});

		function fsubmit(){      //더보기 버튼
    
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

<script type="text/javascript">
var data = [
    { y: '2020-02', a: 3150,  b: 27, c: 17},
    { y: '2020-03', a: 9786,  b: 5408, c: 162},
    { y: '2020-04', a: 10765,  b: 9059, c: 247},
    { y: '2020-05', a: 11468,  b: 10405, c: 270},
    { y: '2020-06', a: 12800,  b: 11537, c: 282}
  ],
  config = {
    data: data,
    xkey: 'y',
    ykeys: ['a', 'b', 'c'],
    labels: ['확진자', '격리해제', '사망자'],
    fillOpacity: 0.6,
    hideHover: 'auto',
    behaveLikeLine: true,
    resize: true,
    pointFillColors:['#ffffff'],
    pointStrokeColors: ['black'],
    lineColors:['gray', 'blue','red']
};


//var myArray1 = new Array();
//myArray1 = ${locationList[0].totalCase};
// 도시이름, 확진자 , 사망자 꺼내기


 
//var day_data = [{y: '서울', a: ${TotalCase}, b: ${TotalCase}}]

//var day_data = [{countryName: "+${locationList[0].countryName}+", newCase: ${locationList[0].newCase}}];

var day_data = ${chartList};

/* var day_data = [
    { y: '서울', a: 50,  b: 90 , c:10},
    { y: '경기', a: 65,  b: 75},
    { y: '인천', a: 50,  b: 50},
    { y: '대구', a: 75,  b: 60},
    { y: '경북', a: 80,  b: 65},
    { y: '경남', a: 90,  b: 70},
    { y: '전북', a: 100, b: 75},
    { y: '전남', a: 115, b: 75},
    { y: '충남', a: 120, b: 85},
    { y: '세종', a: 145, b: 85},
    { y: '제주', a: 160, b: 95}
  ]     */
Morris.Bar({
	  element: 'bar-chart',
	  data: day_data,
	  xkey: 'countryName',
	  ykeys: ['totalCase', 'death'],
	  labels: ['확진자', '사망자'],
	  xLabelAngle: 60,
	  fillOpacity: 0.6,
	    hideHover: 'auto',
	    behaveLikeLine: true,
	    resize: true
	});


Morris.Bar({
	  element: 'stacked',
	  data: day_data,
	  xkey: 'countryName',
	  ykeys: ['totalCase'],
	  labels: ['확진자'],
	  xLabelAngle: 60,
	  fillOpacity: 0.6,
	    hideHover: 'auto',
	    behaveLikeLine: true,
	    resize: true,
	  barColors: function (row, series, type) {
	    if (type === 'bar') {
	      var red = Math.ceil(255 * row.y / this.ymax);
	      return 'rgb(' + red + ',0,0)';
	    }
	    else {return '#000';}
	  }
	}); 
config.element = 'area-chart';
Morris.Area(config);
config.element = 'line-chart';
Morris.Line(config);
/* config.element = 'bar-chart';
Morris.Bar(config);   */
/* config.element = 'stacked';
config.stacked = true;
Morris.Bar(config); */

Morris.Donut({
element: 'pie-chart',
data: ${chartList}
}); // value, label 데이터만 받음
</script>


<!-- 카카오맵 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5c08d7664bc1f1677e82a267f0462f8"></script>
<script>
	    var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(36.1284249157748, 127.89893833794618),
			level: 13
		};

		var map = new kakao.maps.Map(container, options);

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
		    {
		        title: '서울', 
		        latlng: new kakao.maps.LatLng(37.56682420267543, 126.978652258823),
		        content:'<div>지역이름 : ${locationsMap[7].countryName}</div>'+
		        		'<div>확진자수 : ${locationsMap[7].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[7].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[7].death}</div>'
		    },
		    {
		        title: '부산', 
		        latlng: new kakao.maps.LatLng(35.17971036598665, 129.07507262974576),
		        content:'<div>지역이름 : ${locationsMap[11].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[11].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[11].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[11].death}</div>'
		    },
		    {
		        title: '대구', 
		        latlng: new kakao.maps.LatLng(35.8713631918401, 128.60180182588218),
		        content:'<div>지역이름 : ${locationsMap[14].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[14].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[14].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[14].death}</div>'
		    },
		    {
		        title: '인천',
		        latlng: new kakao.maps.LatLng(37.456063072990744 , 126.70527479352269),
		        content:'<div>지역이름 : ${locationsMap[15].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[15].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[15].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[15].death}</div>'
		    },
		    {
		        title: '광주',
		        latlng: new kakao.maps.LatLng(35.16010646005846 , 126.85162446297755),
		        content:'<div>지역이름 : ${locationsMap[3].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[3].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[3].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[3].death}</div>'
		    },
		    {
		        title: '대전',
		        latlng: new kakao.maps.LatLng(36.3505388634306 , 127.38484598695104),
		        content:'<div>지역이름 : ${locationsMap[10].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[10].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[10].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[10].death}</div>'
		    },
		    {
		        title: '울산',
		        latlng: new kakao.maps.LatLng(35.539511817217985 , 129.31145772815375),
		        content:'<div>지역이름 : ${locationsMap[4].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[4].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[4].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[4].death}</div>'
		    },
		    {
		        title: '세종',
		        latlng: new kakao.maps.LatLng(36.48005401646766 , 127.28922876097302),
		        content:'<div>지역이름 : ${locationsMap[5].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[5].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[5].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[5].death}</div>'
		    },
		    {
		        title: '경기',
		        latlng: new kakao.maps.LatLng(37.37784270504621 , 127.45610487710596),
		        content:'<div>지역이름 : ${locationsMap[0].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[0].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[0].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[0].death}</div>'
		    },
		    {
		        title: '강원',
		        latlng: new kakao.maps.LatLng(37.652257380893325 , 128.25842795777797),
		        content:'<div>지역이름 : ${locationsMap[2].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[2].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[2].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[2].death}</div>'
		    },
		    {
		        title: '충북',
		        latlng: new kakao.maps.LatLng(36.875749878396626 , 127.7574612999741),
		        content:'<div>지역이름 : ${locationsMap[6].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[6].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[6].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[6].death}</div>'
		        
		    },
		    {
		        title: '충남',
		        latlng: new kakao.maps.LatLng(36.54119465952566 , 126.80216357465115),
		        content:'<div>지역이름 : ${locationsMap[9].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[9].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[9].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[9].death}</div>'
		    },
		    {
		        title: '전북',
		        latlng: new kakao.maps.LatLng(35.72687957312509 , 127.1303032346507),
		        content:'<div>지역이름 : ${locationsMap[1].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[1].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[1].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[1].death}</div>'
		    },
		    {
		        title: '전남',
		        latlng: new kakao.maps.LatLng(34.958581776499166 , 126.98823003163007),
		        content:'<div>지역이름 : ${locationsMap[16].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[16].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[16].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[16].death}</div>'
		    },
		    {
		        title: '경북',
		        latlng: new kakao.maps.LatLng(36.495608352900796 , 128.713000311704),
		        content:'<div>지역이름 : ${locationsMap[12].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[12].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[12].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[12].death}</div>'
		    },
		    {
		        title: '경남',
		        latlng: new kakao.maps.LatLng(35.4703113787759 , 128.2326878492813),
		        content:'<div>지역이름 : ${locationsMap[8].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[8].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[8].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[8].death}</div>'
		    },
		    {
		        title: '제주',
		        latlng: new kakao.maps.LatLng(33.4889044233285 , 126.49823997905348),
		        content:'<div>지역이름 : ${locationsMap[13].countryName}</div>'+
				        '<div>확진자수 : ${locationsMap[13].totalCase}</div>'+
		        		'<div>완치자수 : ${locationsMap[13].recovered}</div>'+
		        		'<div>사망자수 : ${locationsMap[13].death}</div>'
		    }
		];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지
		         
		    });   

		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용    
		    });

		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		    
		}


		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		} 

		


</script> 


