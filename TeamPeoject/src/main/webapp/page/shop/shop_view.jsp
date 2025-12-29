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
				<div class="section view_top">
					<div class="inner flex wrap vt">
						<div class="shop_view_photo">
							<div class="slides swiper-wrapper">
								<c:forEach var="i" begin="1" end="1">
								<div class="el swiper-slide">
									<div class="resize">									
										<div class="img imgfix re"><img src="https://placehold.co/800x800"></div>												
									</div> 
								</div>
								</c:forEach>
							</div>
							<div class="btn prev flex ac"><span class="mti material-symbols-outlined">arrow_back_ios</span></div>
							<div class="paging"></div>
							<div class="btn next flex ac"><span class="mti material-symbols-outlined">arrow_forward_ios</span></div>
						</div>
						<div class="shop_view_info">
							bbbbb
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
	  prevEl: ".shop_view_photo .btn.prev",
	  nextEl: ".shop_view_photo .btn.next",
	},
	pagination: {
       el: ".shop_view_photo .paging",
       clickable: true,
     },	
     autoplay: {
        delay: 2500,
        disableOnInteraction: false,
     },	
});	
</script>		
<jsp:include page="/layout/footer.jsp" />