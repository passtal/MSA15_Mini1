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
		<c:set var="imgs" value="slide1.jpg,slide2.jpg,slide3.jpg,slide4.jpg" />
		<c:set var="cates" value="한식,중식,일식,양식" />
		<c:set var="titles" value="한국인의 소울푸드,중식 한 접시로 기분전환,오늘은 깔끔하게 일식,특별한 파티엔 이거지" />
		<c:set var="descs" value="
		집밥처럼 편안하고 언제 먹어도 마음까지 든든한 한 끼,
		불향 가득한 맛으로 입맛도 기분도 확 살아나는 선택,
		담백하고 정갈한 맛으로 부담 없이 즐기는 한 끼,
		분위기까지 채워주는 맛으로 소중한 날을 더 특별하게" />
		<c:forEach var="i" begin="0" end="3">
		<div class="el swiper-slide">
			<div class="resize">
				<div class="re">
					<div class="img imgfix"><img src="static/img/${fn:split(imgs, ',')[i]}"></div>
					<div class="visual_con flex col">
						<p class="cate"><span class="tt t1">${fn:split(cates, ',')[i]}</span></p>
						<p><span class="tt t2">${fn:split(titles, ',')[i]}</span></p>
						<p><span class="tt t3">${fn:split(descs, ',')[i]}</span></p>
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
				<c:choose>
					  <c:when test="${not empty placeList}">
						    <c:forEach var="place" items="${placeList}" varStatus="st">
							      <c:if test="${st.count <= 10}">
								      <li class="wrap_in">
									        <a href="${root}/place/view?no=${place.no}" class="in">
										          <div class="wrap_img">
											            <div class="img resize imgfix">
<%-- 											             	 <img src="${empty place.thumbnail_img ? 'https://placehold.co/300x500' : place.thumbnail_img}" class="re"> --%>
															<c:if test="${empty place.thumbnail_img}">
																<img src="'https://placehold.co/300x500' : place.thumbnail_img" class="re">
															</c:if>
															<c:if test="${place.thumbnail_img != null}">
																<img src="${root}${place.thumbnail_img}" class="re">
															</c:if>
											            </div>
										          </div>
										          <div class="wrap_con flex col">
											          <p class="shop_tt t1">${place.placename}</p>
											          <p class="shop_tt t2 rowCut r1">${place.content}</p>
										              <div class="info_wrap flex space vc">
											              <div class="star flex vc">
												                <span class="mti mtifill material-symbols-outlined">star</span>
												                <span class="tt">-</span>
											              </div>
											              <div class="cate">
											                	<p class="shop_tt t3">${place.region}</p>
											              </div>
										              </div>
										          </div>
									        </a>
								      </li>
							      </c:if>
						    </c:forEach>
					  </c:when>
					  <c:otherwise>
					    	<div class="no_con flex ac">등록된 맛집이 없습니다.</div>
					  </c:otherwise>
				</c:choose>
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
				<c:choose>
					  <c:when test="${not empty placeList}">
							<c:forEach var="place" items="${placeList}" varStatus="st">
					     		 <c:if test="${st.count <= 6}">
								      <li class="wrap_in">
									        <a href="${root}/place/view?no=${place.no}" class="in flex wrap vt">
										          <div class="wrap_img">
											            <div class="img resize imgfix">
<%-- 											              <img src="${empty place.thumbnail_img ? 'https://placehold.co/300x500' : place.thumbnail_img}" class="re"> --%>
											              <c:if test="${empty place.thumbnail_img}">
																<img src="'https://placehold.co/300x500' : place.thumbnail_img" class="re">
															</c:if>
															<c:if test="${place.thumbnail_img != null}">
																<img src="${root}${place.thumbnail_img}" class="re">
															</c:if>
											            </div>
										          </div>
										          <div class="wrap_con flex col">
										            <p class="shop_tt t1">${place.placename}</p>
										            <p class="shop_tt t2 rowCut r1">${place.content}</p>
												  <div class="info_wrap flex space vc">
										              <div class="star flex vc">
											                <span class="mti mtifill material-symbols-outlined">star</span>
											                <span class="tt">-</span>
										              </div>
										              <div class="cate">
										                	<p class="shop_tt t3">${place.region}</p>
										              </div>
									              </div>
										          </div>
									        </a>
								      </li>
							      </c:if>
						    </c:forEach>
					  </c:when>
					  <c:otherwise>
					   	 	<div class="no_con flex ac">등록된 맛집이 없습니다.</div>
					  </c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</section>
<section class="main_wrap main_banner">
	<div class="box1 inner">
		<div class="banner">
			<img src="${ root }/static/img/banner.png" alt="banner">
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
				<c:choose>
					  <c:when test="${not empty reviewList}">
						    <c:forEach var="b" items="${reviewList}" varStatus="st">
							      <c:if test="${st.count <= 5}">
							      <li class="wrap_in">
							        <a href="${root}/board/view?no=${b.no}" class="in">
							          <div class="wrap_img">
							            <div class="img resize imgfix"><img src="${ root }/static/img/place/p0${1}.jpg" class="re"></div>
							          </div>
							          <div class="wrap_con flex col">
							            <p class="shop_tt t1">${b.title}</p>
							            <p class="shop_tt t2 rowCut r2">${b.content}</p>
							            <div class="info_wrap flex space vc">
							              <div class="user flex vc">
							                <div class="img imgfix"><img src="https://placehold.co/300x300"></div>
							                <div class="name rowCut r1">${b.username}</div>
							              </div>
							              <div class="star flex vc">
							                <span class="mti mtifill material-symbols-outlined">star</span>
							                <span class="tt">${b.rating}</span>
							              </div>
							            </div>
							          </div>
							        </a>
							      </li>
							      </c:if>
						    </c:forEach>
			  			</c:when>
				  <c:otherwise>
				    	<div class="no_con flex ac">등록된 리뷰가 없습니다.</div>
				  </c:otherwise>
			</c:choose>
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
