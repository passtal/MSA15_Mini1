<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>  
<%
request.setAttribute("dp1", "notice");
request.setAttribute("dp2", "list");
%>
<jsp:include page="/layout/header.jsp" />

<!-- 본문 -->
<main class="doc">
	<div class="box1">
		게시판
	</div>
</main> 
<!-- 본문 end -->	 

<jsp:include page="/layout/script.jsp" />	
<jsp:include page="/layout/footer.jsp" />