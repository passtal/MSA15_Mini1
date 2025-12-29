<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>  
<%
request.setAttribute("dp0", "main");
%>
<jsp:include page="/layout/header.jsp" />
<section class="main_visual">	
	<div class="slides swiper-wrapper">
		<c:forEach var="i" begin="1" end="10">
		<div class="el swiper-slide">
			<div class="resize">
				<div class="re">
					<div class="img imgfix"><img src="https://placehold.co/400x800"></div>
					<div class="visual_con flex col">
						<p class="cate"><span class="tt t1">한식</span></p>
						<p><span class="tt t2">해당 카테고리에 대한 타이틀</span></p>
						<p><span class="tt t3">카테고리에 대한 설명글이 들어갑니다.카테고리에 대한 설명글이 들어갑니다.카테고리에 대한 설명글이 들어갑니다.</span></p>
					</div>
				</div>				
			</div>
		</div>
		</c:forEach>
	</div>
	<div class="btn prev flex ac"><span class="mti material-symbols-outlined">arrow_back_ios</span></div>
	<div class="paging"></div>
	<div class="btn next flex ac"><span class="mti material-symbols-outlined">arrow_forward_ios</span></div>	
</section>
<section class="main_wrap main_hot">
	<div class="box1 inner">
		<div class="main_tit flex space vc">
			<div class="tit_wrap flex vc">
				<span class="mti material-symbols-outlined">food_bank</span>
				<span class="tit"><b class="point">인기</b> 맛집</span>
			</div>
			<div class="main_more">
				<a href="" class="more flex vc">
					<span class="tt">더보기</span>
					<span class="mti material-symbols-outlined">add</span>
				</a>
			</div>
		</div>
		<div class="shop_list_wrap">			
			<ul class="shop_list st1 grid">
				<!-- 리스트 최대 10개 까지 -->
				<c:forEach var="i" begin="1" end="10">
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
		</div>
	</div>
	
</section>
<section class="main_wrap main_new">
	<div class="box1 inner">
		<div class="main_tit flex space vc">
			<div class="tit_wrap flex vc">
				<span class="mti material-symbols-outlined">award_meal</span>
				<span class="tit"><b class="point">신규</b> 맛집</span>
			</div>
			<div class="main_more">
				<a href="" class="more flex vc">
					<span class="tt">더보기</span>
					<span class="mti material-symbols-outlined">add</span>
				</a>
			</div>
		</div>
		<div class="shop_list_wrap">
			<ul class="shop_list st2 round grid">
				<!-- 리스트 최대 6개 까지 -->
				<c:forEach var="i" begin="1" end="6">
				<li class="wrap_in">
					<a href="${ root }/page/shop/shop_view.jsp" class="in flex wrap vt">
						<div class="wrap_img">
							<div class="img resize imgfix"><img src="https://placehold.co/300x500" class="re"></div>
						</div>
						<div class="wrap_con flex col">
							<p class="shop_tt t1">식당이름</p>
							<p class="shop_tt t2 rowCut r2">식당에 대한 간략한 설명이 들어갑니다. 식당에 대한 간략한 설명이 들어갑니다.</p>
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
		</div>
	</div>
</section>
<section class="main_wrap main_banner">
	<div class="box1 inner">
		<div class="banner">
			<img src="https://placehold.co/1400x160" alt="banner">
		</div>
	</div>
</section>
<section class="main_wrap main_review">
	<div class="box1 inner">
		<div class="main_tit flex space vc">
			<div class="tit_wrap flex vc">
				<span class="mti material-symbols-outlined">hotel_class</span>
				<span class="tit">리얼 <b class="point">리뷰</b></span>
			</div>			
		</div>
		<div class="shop_list_wrap">
			<ul class="shop_list st3 round grid">
				<!-- 리스트 최대 5개 까지 -->
				<c:forEach var="i" begin="1" end="5">
				<li class="wrap_in">
					<a href="${ root }/page/shop/shop_view.jsp" class="in">
						<div class="wrap_img">
							<div class="img resize imgfix"><img src="https://placehold.co/300x500" class="re"></div>
						</div>
						<div class="wrap_con flex col">
							<p class="shop_tt t1">식당이름</p>
							<p class="shop_tt t2 rowCut r2">두 줄 리뷰내용이 들어갑니다. 두 줄 리뷰내용이 들어갑니다. </p>
							<div class="info_wrap flex space vc">
								<div class="user flex vc">
									<div class="img imgfix"><img src="https://placehold.co/300x300"></div>
									<div class="name rowCut r1">닉네임이 들어갑니다.</div>
								</div>
								<div class="star flex vc">
									<span class="mti fill material-symbols-outlined">star</span>
									<span class="tt">5.0</span>
								</div>							
							</div>
						</div>
					</a>
				</li>
				</c:forEach>				
			</ul>
		</div>
	</div>
</section>
<jsp:include page="/layout/script.jsp" />
<script>    
var mainVisual = new Swiper('.main_visual', {
	loop: true,
	slidesPerView: 3,
	spaceBetween: 20,
	speed: 400,
	navigation: {
	  prevEl: ".main_visual .btn.prev",
	  nextEl: ".main_visual .btn.next",
	},
	pagination: {
       el: ".main_visual .paging",
       type: "progressbar",
     },	
     autoplay: {
        delay: 2500,
        disableOnInteraction: false,
     },	
});	
</script>	
<jsp:include page="/layout/footer.jsp" />