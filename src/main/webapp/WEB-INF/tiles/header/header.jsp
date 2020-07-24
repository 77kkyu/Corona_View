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

#header{
	width:100%;
	height:300px;
	background:black;
	clear:both;
}


.p1{
	color:white;
	font-family:'Segoe UI';
	font-size:30px;
	font-weight: 500;
	text-align:center;
	margin-top:100px;
}

.home .top {
   background-color: white;
   border-radius: 20px;
   margin-top: 25px;
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
  
#line-chart, #bar-chart, #pie-chart {
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
  padding-left: 75px;
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

.pfont{
	color: #3e3e3e;
    font-size: 13px;
    margin-bottom: 0;
    align: center;
}

.border{
   border-bottom: 1px solid #cccccc;
}
</style>
</head>

<body>


<div id="header" class="container">	

	<p class="p1">실시간<br>코로나 19 (COVID-19)</p>

</div>


</body>
</html>