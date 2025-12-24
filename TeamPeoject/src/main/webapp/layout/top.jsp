<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<!DOCTYPE html>
<c:set var="bodyClass" 
	   value="${dp0 == 'main' ? 'main' 
	   		  : (dp0 == 'pop' ? 'pop' 
	   		  : (dp1 == 'shop' ? 'shop' : 'sub'))}" />
<html class="${bodyClass} dp1_${dp1} dp2_${dp2}">
<head>
	<meta charset="UTF-8">
	<title>
		${ site.name }
		<c:choose>
	        <c:when test="${not empty dp1 and not empty dp2}">
	            <c:set var="navKey" value="${dp1}_${dp2}" />
	            : ${nav[navKey]}
	        </c:when>
	
	        <c:when test="${not empty dp1}">
	            : ${nav[dp1]}
	        </c:when>
	    </c:choose>
	</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>