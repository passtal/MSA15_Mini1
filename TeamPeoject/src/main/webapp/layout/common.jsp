<%@ page import="board.DTO.User" %>
<%

	String root = request.getContextPath();
	pageContext.setAttribute("root", root);
	
	String loginId = (String) session.getAttribute("loginId");
	pageContext.setAttribute("loginId", loginId);
	
	User loginUser = (User) session.getAttribute("loginUser");
	pageContext.setAttribute("loginUser", loginUser);
	
%>