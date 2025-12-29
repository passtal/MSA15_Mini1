<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%
request.setAttribute("dp1", "shop");
request.setAttribute("dp2", "list");
%>
<jsp:include page="/layout/header.jsp" />

<!-- 본문 -->
<main class="doc">
	<div class="box1">
		<div class="shop_view_wrap flex vt">
			<div class="side_wrap flex col">
				<div class="page_tit flex vc"><span class="mti material-symbols-outlined">menu_book_2</span><strong class="page_tt s4 fx1">메뉴</strong></div>
				<ul class="menu scroll">
					<c:forEach var="i" begin="1" end="5">
					<li class="flex col">
						<p class="tt t1">짜장면</p>
						<p class="tt t2">메뉴에 대한 설명</p>
						<p class="tt t3">7,000원</p>
					</li>
					</c:forEach>					
				</ul>
			</div>
			<div class="view_wrap flex col">
				<!-- 가게소개 -->
				<div class="section view_top">
					<div class="inner flex wrap vt">
						<!-- 가게 사진 슬라이드 -->
						<div class="shop_view_photo_wrap">						
							<div class="shop_view_photo">
								<div class="slides swiper-wrapper">
									<c:forEach var="i" begin="1" end="5">
									<div class="el swiper-slide">
										<div class="resize">									
											<div class="img imgfix re"><img src="https://placehold.co/800x800"></div>												
										</div> 
									</div>
									</c:forEach>
								</div>
								<div class="btn prev flex ac"><span class="mti material-symbols-outlined">arrow_back_ios</span></div>
								<div class="btn next flex ac"><span class="mti material-symbols-outlined">arrow_forward_ios</span></div>
							</div>
							<div class="paging"></div>
						</div>
						<!-- 가게 사진 슬라이드 end -->
						
						<!-- 가게정보 -->
						<div class="shop_view_info flex col">
							<div class="info_tit flex col">
								<div class="cate"><span class="tt">한식 • 서울</span></div>
								<div class="tit"><span class="tt">대박 중국집</span></div>
								<div class="txt"><span class="tt wb">해당 식당에 대한 간략한 설명이 들어갑니다.</span></div>								
								<div class="view_rating flex vc">
									<span class="mti mtifill material-symbols-outlined">star</span>
									<span class="tt">5.0</span>
									<span class="tt">리뷰 100개</span>
								</div>								
							</div>
							<ul class="info_list flex col">
								<li>
									<div class="in flex wrap vt">
										<div class="tit flex vc">
											<span class="mti material-symbols-outlined">location_on</span>
											<span class="tt">주소</span>
										</div>
										<div class="txt wb">서울시 금천구 금천대로 155, 맛집시티 A동 1004호</div>
									</div>									
								</li>
								<li>
									<div class="in flex wrap vt">										
										<div class="tit flex vc">
											<span class="mti material-symbols-outlined">alarm</span>
											<span class="tt">영업시간</span>
										</div>
										<div class="txt wb">10:30 ~ 22:00 (연중무휴)</div>
									</div>									
								</li>
								<li>
									<div class="in flex wrap vt">										
										<div class="tit flex vc">
											<span class="mti material-symbols-outlined">call</span>
											<span class="tt">전화</span>
										</div>
										<div class="txt wb">02-000-0000</div>
									</div>									
								</li>
								<li>
									<div class="in flex wrap vt">
										<div class="tit flex vc">
											<span class="mti material-symbols-outlined">parking_sign</span>
											<span class="tt">편의시설</span>
										</div>										
										<div class="txt wb">주차시설 구비 / 시간당 1,000원</div>
									</div>									
								</li>
							</ul>
						</div>
						<!-- 가게정보 end -->
					</div>
				</div>
				<!-- 가게소개 end -->
				<div class="section view_review">
					<div class="inner">
						<div class="page_tit flex vc"><span class="mti material-symbols-outlined">hotel_class</span><strong class="page_tt s4 fx1">방문자 리뷰</strong></div>
						<div class="review_rating_box flex wrap">
						
						</div>						
					</div>
				</div>
			</div>
		</div>	
	</div>
</main>
<!-- 본문 end -->	 
<jsp:include page="/layout/script.jsp" />
<script>    
var viewPhoto = new Swiper('.shop_view_photo', {
	loop: true,
	speed: 400,
	navigation: {
	  prevEl: ".shop_view_photo_wrap .btn.prev",
	  nextEl: ".shop_view_photo_wrap .btn.next",
	},
	pagination: {
       el: ".shop_view_photo_wrap .paging",
       clickable: true,
     },	
     autoplay: {
        delay: 2500,
        disableOnInteraction: false,
     },	
});	
</script>		
<jsp:include page="/layout/footer.jsp" />