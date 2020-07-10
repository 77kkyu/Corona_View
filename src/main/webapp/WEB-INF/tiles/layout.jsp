<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>CoronaView</title>
</head>
<body>

<div id="wrapper">

<!-- header --> 
<div id="container" style="width:100%; height:200px; margin:auto; display:block">
      <tiles:insertAttribute name="header"/>
</div>
       
<!-- container --> 
<div id="container">
      <tiles:insertAttribute name="body"/>
</div>

<!-- footer --> 
<div style="width:100%;  margin:auto; display:block">
      <tiles:insertAttribute name="footer"/>
</div>

</div>



</body>
</html>