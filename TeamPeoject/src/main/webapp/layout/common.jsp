
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="board.DTO.User" %>
<%

	String root = request.getContextPath();
	pageContext.setAttribute("root", root);
	
	String loginId = (String) session.getAttribute("loginId");
	pageContext.setAttribute("loginId", loginId);
	
	User loginUser = (User) session.getAttribute("loginUser");
	pageContext.setAttribute("loginUser", loginUser);
	
	
	// site 정보
	Map<String, String> site = new HashMap<>();
	site.put("name", "사이트네임");
	site.put("owner", "홍길동");
	site.put("addr", "서울시 금천구 금천대로 155, 맛집시티 A동 1004호");
	site.put("bnum", "012-34-45678");
	site.put("email", "admin@email.com");
	site.put("tel", "070-1234-5678");
	
	// nav
	Map<String, String> nav = new HashMap<>();
	nav.put("shop", "맛집");
	nav.put("shop_list", "맛집소개");
	nav.put("shop_map", "맛집지도");
	nav.put("shop_hot", "인기맛집");	
	
	nav.put("notice", "커뮤니티");
	nav.put("notice_list", "공지사항");
	
	nav.put("member", "회원서비스");
	nav.put("member_login", "로그인");
	nav.put("member_signup", "회원가입");
	nav.put("member_logout", "로그아웃");
	
	nav.put("mypage", "마이페이지");
	nav.put("mypage_modify", "회원정보 수정");
	
	nav.put("policy_agree", "이용약관");
	nav.put("policy_privacy", "개인정보처리방침");
	nav.put("policy_map", "위치정보 이용약관");
	nav.put("policy_guide", "이용안내");

	request.setAttribute("nav", nav);	
	request.setAttribute("site", site);
	
%>