<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%
request.setAttribute("dp1", "shop");
request.setAttribute("dp2", "hot");
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
		<div class="shop_cate_wrap">
			<ul class="category flex">
				<li class="${param.cate == 'all' or empty param.cate ? 'on' : ''}"><a href="?cate=all" class="in flex ac"><span class="tt">전체</span></a></li>
				<li class="${param.cate == '1' ? 'on' : ''}"><a href="?cate=1" class="in flex ac"><span class="tt">한식</span></a></li>
				<li class="${param.cate == '2' ? 'on' : ''}"><a href="?cate=2" class="in flex ac"><span class="tt">중식</span></a></li>
				<li class="${param.cate == '3' ? 'on' : ''}"><a href="?cate=3" class="in flex ac"><span class="tt">일식</span></a></li>
				<li class="${param.cate == '4' ? 'on' : ''}"><a href="?cate=4" class="in flex ac"><span class="tt">양식</span></a></li>
			</ul>
		</div>
		<div class="shop_list_wrap">			
			<ul class="shop_list st1 grid">
				<!-- 리스트 최대 20개 까지 -->
				<c:forEach var="i" begin="1" end="20">
				<li class="wrap_in">
					<a href="${ root }/page/shop/shop_view.jsp" class="in">
						<div class="wrap_img">
							<div class="img resize imgfix"><img src="https://placehold.co/300x500" class="re"></div>
						</div>
						<div class="wrap_con flex col">
							<p class="shop_tt t1">식당이름</p>
							<p class="shop_tt t2 rowCut r1">식당에 대한 간략한 설명이 들어갑니다. 식당에 대한 간략한 설명이 들어갑니다.</p>
							<div class="info_wrap flex space vc">
								<div class="star flex vc">
									<span class="mti fill material-symbols-outlined">star</span>
									<span class="tt">5.0</span>
								</div>
								<div class="cate">
									<p class="shop_tt t3">한식 • 서울</p>
								</div>							
							</div>
						</div>
					</a>
				</li>
				</c:forEach>				
			</ul>
			<div class="page_btn ps"> 
				<button type="button" class="input_st s1 c4 re max1"><span class="tt">더보기</span></button>
			</div>
			
			<div class="no_con flex ac">등록된 글이 없습니다.</div>
		</div>
	</div>
</main>
<!-- 본문 end -->	 
<jsp:include page="/layout/script.jsp" />	
<jsp:include page="/layout/footer.jsp" />