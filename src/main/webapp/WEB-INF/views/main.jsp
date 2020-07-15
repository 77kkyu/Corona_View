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
<script src="/media/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="//d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/topojson/1.6.9/topojson.min.js" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/datamaps/0.5.5/datamaps.world.min.js" charset="utf-8"></script>
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
		<p>${list.countryName}</p>
		<br>
		</div>
		</c:forEach>
		
	</div>
	
</div>




<!-- <div id="map" style="width:1000px;height:1000px;align:center;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5c08d7664bc1f1677e82a267f0462f8"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.56682, 126.97865),
			level: 11
		};

		var map = new kakao.maps.Map(container, options);

		


	</script> -->
	
<div class="container">
<div id="container1"  style="border:1px dotted blue; width: 1000px; height: 475px; position: relative;"></div>
</div>

<br><br><br><br><br><br>


<script type="text/javascript">

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







</script>

</body>
</html>

<script type="text/javascript">
	// example data from server
    var series = [
      ["BLR", 75],
      ["BLZ", 43],
      ["RUS", 50],
      ["RWA", 88],
      ["SRB", 21],
      ["TLS", 43],
      ["REU", 21],
      ["TKM", 19],
      ["TJK", 60],
      ["ROU", 4],
      ["TKL", 44],
      ["GNB", 38],
      ["GUM", 67],
      ["GTM", 2],
      ["SGS", 95],
      ["GRC", 60],
      ["GNQ", 57],
      ["GLP", 53],
      ["JPN", 59],
      ["GUY", 24],
      ["GGY", 4],
      ["GUF", 21],
      ["GEO", 42],
      ["GRD", 65],
      ["GBR", 14],
      ["GAB", 47],
      ["SLV", 15],
      ["GIN", 19],
      ["GMB", 63],
      ["GRL", 56],
      ["ERI", 57],
      ["MNE", 93],
      ["MDA", 39],
      ["MDG", 71],
      ["MAF", 16],
      ["MAR", 8],
      ["MCO", 25],
      ["UZB", 81],
      ["MMR", 21],
      ["MLI", 95],
      ["MAC", 33],
      ["MNG", 93],
      ["MHL", 15],
      ["MKD", 52],
      ["MUS", 19],
      ["MLT", 69],
      ["MWI", 37],
      ["MDV", 44],
      ["MTQ", 13],
      ["MNP", 21],
      ["MSR", 89],
      ["MRT", 20],
      ["IMN", 72],
      ["UGA", 59],
      ["TZA", 62],
      ["MYS", 75],
      ["MEX", 80],
      ["ISR", 77],
      ["FRA", 54],
      ["IOT", 56],
      ["SHN", 91],
      ["FIN", 51],
      ["FJI", 22],
      ["FLK", 4],
      ["FSM", 69],
      ["FRO", 70],
      ["NIC", 66],
      ["NLD", 53],
      ["NOR", 7],
      ["NAM", 63],
      ["VUT", 15],
      ["NCL", 66],
      ["NER", 34],
      ["NFK", 33],
      ["NGA", 45],
      ["NZL", 96],
      ["NPL", 21],
      ["NRU", 13],
      ["NIU", 6],
      ["COK", 19],
      ["XKX", 32],
      ["CIV", 27],
      ["CHE", 65],
      ["COL", 64],
      ["CHN", 16],
      ["CMR", 70],
      ["CHL", 15],
      ["CCK", 85],
      ["CAN", 76],
      ["COG", 20],
      ["CAF", 93],
      ["COD", 36],
      ["CZE", 77],
      ["CYP", 65],
      ["CXR", 14],
      ["CRI", 31],
      ["CUW", 67],
      ["CPV", 63],
      ["CUB", 40],
      ["SWZ", 58],
      ["SYR", 96],
      ["SXM", 31]
    ];
    // Datamaps expect data in format:
    // { "USA": { "fillColor": "#42a844", numberOfWhatever: 75},
    //   "FRA": { "fillColor": "#8dc386", numberOfWhatever: 43 } }
    var dataset = {};
    // We need to colorize every country based on "numberOfWhatever"
    // colors should be uniq for every value.
    // For this purpose we create palette(using min/max series-value)
    var onlyValues = series.map(function(obj) {
      return obj[1];
    });
    var minValue = Math.min.apply(null, onlyValues),
      maxValue = Math.max.apply(null, onlyValues);
    // create color palette function
    // color can be whatever you wish
    var paletteScale = d3.scale.linear()
      .domain([minValue, maxValue])
      .range(["#EFEFFF", "#02386F"]); // blue color
    // fill dataset in appropriate format
    series.forEach(function(item) { //
      // item example value ["USA", 70]
      var iso = item[0],
        value = item[1];
      dataset[iso] = {
        numberOfThings: value,
        fillColor: paletteScale(value)
      };
    });
    // render map
    new Datamap({
      element: document.getElementById('container1'),
      projection: 'mercator', // big world map
      // countries don't listed in dataset will be painted with this color
      fills: {
        defaultFill: '#F5F5F5'
      },
      data: dataset,
      geographyConfig: {
        borderColor: '#DEDEDE',
        highlightBorderWidth: 2,
        // don't change color on mouse hover
        highlightFillColor: function(geo) {
          return geo['fillColor'] || '#F5F5F5';
        },
        // only change border
        highlightBorderColor: '#B7B7B7',
        // show desired information in tooltip
        popupTemplate: function(geo, data) {
          // don't show tooltip if country don't present in dataset
          if (!data) {
            return;
          }
          // tooltip content
          return ['<div class="hoverinfo">',
            '<strong>', geo.properties.name, '</strong>',
            '<br><strong> 하하하ㅏ핳</strong>',
            '<br>Count: <strong>', data.numberOfThings, '</strong>',
            '<br>사망자: 10',
            '</div>'
          ].join('');
        }
      }
    });

</script>
