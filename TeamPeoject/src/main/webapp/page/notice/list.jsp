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
		<div class="page_tit">
			<span class="tt">
				<c:set var="navKey" value="${dp1}_${dp2}" />
				${nav[navKey]}
			</span>			
		</div>
		<div class="board_search">
		    <div class="total"><i class="t1">Total.</i><i class="t2">123</i></div>
		    <div class="search">
		        <label class="select">                  
		            <select class="input_st">
		                <option>전체</option>
		                <option>제목</option>
		                <option>내용</option>      
		            </select>
		        </label>
		        <label class="inp"><input type="text" class="input_st" placeholder="검색어입력"></label>
		        <button type="button" class="input_st c5 re btn"><i class="mti ico"></i> <i class="tt">검색</i></button>
		    </div>
		</div>
		<table class="board_table">	
		    <colgroup>
		    	<col class="w_no">
		        <col class="w_tit">
		        <col class="w_name">
		        <col class="w_date">
		        <col class="w_hit">
		    </colgroup>
		    <thead>
		    	<tr>
		            <th scope="col" class="w_no">번호</th>
		            <th scope="col" class="w_tit">제목</th>
		            <th scope="col" class="w_name">작성자</th>
		            <th scope="col" class="w_date">등록일</th>
		            <th scope="col" class="w_hit">조회수</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<tr class="rNotice">
		            <td class="w_no"><span class="boardIco notice"></span></td>
		            <td class="w_tit">
		            	<div class="aTit_wrap">
		                	<a href="javascript:void(0)" class="board_aTit">맛조은테이블 홈페이지를 이용하기 전에 공지사항 숙지하세요.</a>
		                    <span class="boardIco file"></span>
		                </div>
		            </td>
		            <td class="w_name">관리자</td>
		            <td class="w_date">2025-01-01</td>
		            <td class="w_hit">1000</td>
		        </tr>
		        <c:forEach var="i" begin="1" end="10">
		        <c:set var="rev" value="${11 - i}" />		        
		        <tr>
		            <td class="w_no">${rev}</td>
		            <td class="w_tit">
		            	<div class="aTit_wrap">
		                	<a href="javascript:void(0)" class="board_aTit">안녕하세요. 맛조은테이블에서 소식을 알립니다.</a>		                                     
		                </div>
		            </td>
		            <td class="w_name">관리자</td>
		            <td class="w_date">2025-01-01</td>
		            <td class="w_hit">1000</td>
		        </tr>
		        </c:forEach>	          
		    </tbody>
		</table>
		
		<div class="board_pg">
		    <button class="btn first" onclick="javascript:location.href='#'"><i class="mti ico"></i></button>
		    <button class="btn prev" onclick="javascript:location.href='#'"><i class="mti ico"></i></button>
		    <button class="on">1</button>
		    <button onclick="javascript:location.href='#'">2</button>
		    <button onclick="javascript:location.href='#'">3</button>
		    <button onclick="javascript:location.href='#'">4</button>
		    <button onclick="javascript:location.href='#'">5</button>
		    <button class="btn next" onclick="javascript:location.href='#'"><i class="mti ico"></i></button>
		    <button class="btn last" onclick="javascript:location.href='#'"><i class="mti ico"></i></button>
		</div>		
	</div>
</main> 
<!-- 본문 end -->	 

<jsp:include page="/layout/script.jsp" />	
<jsp:include page="/layout/footer.jsp" />