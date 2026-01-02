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
					<c:forEach var="menu" items="${ menuList }">
						<li class="flex col">
							<p class="tt t1">${ menu.menuname }</p>
							<c:if test="${not empty menu.content}">
							    <p class="tt t2">${menu.content}</p>
							</c:if>
							<p class="tt t3">${ menu.price }원</p>
						</li>
					</c:forEach>	
					<c:if test="${not empty loginUser && (fn:contains(authList, 'ROLE_OWNER') || fn:contains(authList, 'ROLE_ADMIN'))}">
						<a href="javascript:layerOpen('${root}/menu/write?place_no=${place.no}')" class="btn ...">
							메뉴 추가
						</a>
					</c:if>
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
									<fmt:formatNumber value="${i}" pattern="00" var="num" />
									<div class="el swiper-slide">
										<div class="resize">									
											<div class="img imgfix re">
<!-- 												<img src="https://placehold.co/800x800"> -->
												<c:if test="${empty place.thumbnail_img}">
													<img src="'https://placehold.co/300x500' : place.thumbnail_img" class="re">
												</c:if>
												<c:if test="${place.thumbnail_img != null}">
													<img src="${root}${place.thumbnail_img}" class="re">
												</c:if>
											</div>												
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
								<div class="cate">
									<span class="tt">
										<c:forEach var="name" items="${foodName}">
										    ${name} 
										</c:forEach>
										• ${place.region}
<%-- 										${foodName} • ${place.region} --%>
									</span>
								</div>
								<div class="tit"><span class="tt">${place.placename}</span></div>
								<div class="txt"><span class="tt wb">${ place.content }</span></div>								
								<div class="view_rating flex vc">
									<span class="mti mtifill material-symbols-outlined">star</span>
									
									<c:choose>
										<c:when test="${empty reviewList}">
											<span class="tt">0.0</span>
											<span class="tt">리뷰 0개</span>
										</c:when>
										<c:otherwise>
											<span class="tt"><fmt:formatNumber value="${reviewAvg}" maxFractionDigits="1"/></span>
											<span class="tt">리뷰 ${reviewTotal}개</span>
										</c:otherwise>
									</c:choose>
								</div>
							
							</div>
							<ul class="info_list flex col">
								<li>
									<div class="in flex wrap vt">
										<div class="tit flex vc">
											<span class="mti material-symbols-outlined">location_on</span>
											<span class="tt">주소</span>
										</div>
										<div class="txt wb">${place.address}</div>
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
										<div class="txt wb">${place.phone}</div>
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
						<div class="page_tit flex vc">
							<span class="mti material-symbols-outlined">hotel_class</span>
							<strong class="page_tt s4 fx1">방문자 리뷰</strong>	
							<c:if test="${not empty loginId}">
							    <a href="javascript:layerOpen('${pageContext.request.contextPath}/board/write?place_no=${place.no}')" class="btn input_st s2 c1 re mgL"><i class="tt">리뷰 올리기</i></a>
							</c:if>												
						</div>
						<c:choose>
							<c:when test="${empty reviewList}">
								<div class="review_rating_box flex wrap">
									<div class="rate_overview flex vc">
										<div class="wrap_in">
											<div class="rateNum"><strong class="tt"><fmt:formatNumber value="${reviewAvgRaw}" maxFractionDigits="1" /></strong></div>
											<div class="rateSec">
												<div class="rateStar_total">
													<div class="rateStar_wrap starBase flex di vc">
														<span class="mti mtifill material-symbols-outlined star">star</span>
														<span class="mti mtifill material-symbols-outlined star">star</span>
														<span class="mti mtifill material-symbols-outlined star">star</span>
														<span class="mti mtifill material-symbols-outlined star">star</span>
														<span class="mti mtifill material-symbols-outlined star">star</span>
													</div>
													<div class="rateStar_wrap starFill flex di vc" style="width:calc(${reviewAvgPer}% - .125em);">
														<span class="mti mtifill material-symbols-outlined star full">star</span>
														<span class="mti mtifill material-symbols-outlined star full">star</span>
														<span class="mti mtifill material-symbols-outlined star full">star</span>
														<span class="mti mtifill material-symbols-outlined star full">star</span>
														<span class="mti mtifill material-symbols-outlined star full">star</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="rate_distribution">
										<ul class="wrap_list">
											<!-- 5~1점 전부 0으로 -->
											<c:forEach var="s" begin="1" end="5">
												<li class="item flex vc">
													<div class="rateScore"><span class="tt">${6 - s}점</span></div>
													<div class="rateBar"><div class="barFill" style="width:0%;"></div></div>
													<div class="ratePers"><span class="tt">(0)</span></div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</c:when>
							
							<c:otherwise>
								<div class="review_rating_box flex wrap">
									<div class="rate_overview flex vc">
										<div class="wrap_in">
											<div class="rateNum"><strong class="tt"><fmt:formatNumber value="${reviewAvg}" maxFractionDigits="1"/></strong></div>
											<div class="rateSec">
												<div class="rateStar_total">
													<div class="rateStar_wrap starBase flex di vc">
														<span class="mti mtifill material-symbols-outlined star">star</span>
														<span class="mti mtifill material-symbols-outlined star">star</span>
														<span class="mti mtifill material-symbols-outlined star">star</span>
														<span class="mti mtifill material-symbols-outlined star">star</span>
														<span class="mti mtifill material-symbols-outlined star">star</span>
													</div>
													<div class="rateStar_wrap starFill flex di vc" style="width:calc(${reviewAvgPer}% - .125em);">
														<span class="mti mtifill material-symbols-outlined star full">star</span>
														<span class="mti mtifill material-symbols-outlined star full">star</span>
														<span class="mti mtifill material-symbols-outlined star full">star</span>
														<span class="mti mtifill material-symbols-outlined star full">star</span>
														<span class="mti mtifill material-symbols-outlined star full">star</span>
													</div>
												</div>
											</div>
											<div class="rateTxt"><span class="tt">${reviewTotal}개의 리뷰</span></div>
										</div>
									</div>
									<div class="rate_distribution">
										<ul class="wrap_list">
											<li class="item flex vc">
												<div class="rateScore"><span class="tt">5점</span></div>
												<div class="rateBar"><div class="barFill" style="width:${star5Per}%;"></div></div>
												<div class="ratePers"><span class="tt">${star5}</span></div>
											</li>
											<li class="item flex vc">
												<div class="rateScore"><span class="tt">4점</span></div>
												<div class="rateBar"><div class="barFill" style="width:${star4Per}%;"></div></div>
												<div class="ratePers"><span class="tt">${star4}</span></div>
											</li>
											<li class="item flex vc">
												<div class="rateScore"><span class="tt">3점</span></div>
												<div class="rateBar"><div class="barFill" style="width:${star3Per}%;"></div></div>
												<div class="ratePers"><span class="tt">${star3}</span></div>
											</li>
											<li class="item flex vc">
												<div class="rateScore"><span class="tt">2점</span></div>
												<div class="rateBar"><div class="barFill" style="width:${star2Per}%;"></div></div>
												<div class="ratePers"><span class="tt">${star2}</span></div>
											</li>
											<li class="item flex vc">
												<div class="rateScore"><span class="tt">1점</span></div>
												<div class="rateBar"><div class="barFill" style="width:${star1Per}%;"></div></div>
												<div class="ratePers"><span class="tt">${star1}</span></div>
											</li>
										</ul>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						
						<!-- 리뷰 별점 end -->
						
						<!-- 리뷰 리스트 -->
						<div class="review_list_box" id="listView">
						<%@ include file="/page/board/inc_review_list.jsp" %>
						</div>
						<!-- 리뷰 리스트 end -->
					</div>
				</div>
			</div>
		</div>	
	</div>
</main>
<!-- 본문 end -->	 
<jsp:include page="/layout/script.jsp" />
<script>    
// 사진 슬라이드
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