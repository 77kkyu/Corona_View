<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CoronaView</title>
</head>
<body>

<!-- nav --> 
<div id="container" style="margin:auto; display:block">
      <tiles:insertAttribute name="nav"/>
</div>

<!-- header --> 
<div id="container" style="width:100%; height:200px; margin:auto; display:block">
      <tiles:insertAttribute name="header"/>
</div>
       
<!-- body --> 
<div id="container">
      <tiles:insertAttribute name="body"/>
</div>

<!-- footer --> 
<div style="width:100%; margin:auto; display:block">
      <tiles:insertAttribute name="footer"/>
</div>


</body>
</html>