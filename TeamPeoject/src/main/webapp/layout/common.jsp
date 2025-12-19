<%
	String root = request.getContextPath();
	pageContext.setAttribute("root", root);
	
	String loginId = (String) session.getAttribute("loginId");
	pageContext.setAttribute("loginId", loginId);
%>