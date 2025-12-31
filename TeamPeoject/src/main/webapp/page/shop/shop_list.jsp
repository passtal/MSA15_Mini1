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
		<div class="page_tit">
			<span class="tt">
				<c:set var="navKey" value="${dp1}_${dp2}" />
				${nav[navKey]}
			</span>	
			<div class="t1 ps1">대한민국 모든 맛집이 한 곳에!!</div>			
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
				<c:choose>
					  <c:when test="${not empty placeList}">
						    <c:forEach var="place" items="${placeList}" varStatus="st">
							      <c:if test="${st.count <= 20}">
								      <li class="wrap_in">
									        <a href="${root}/place/view?no=${place.no}" class="in">
										          <div class="wrap_img">
											            <div class="img resize imgfix">
<%-- 											             	 <img src="${empty place.thumbnail_img ? 'https://placehold.co/300x500' : place.thumbnail_img}" class="re"> --%>
															<c:if test="${empty place.thumbnail_img}">
																<img src="'https://placehold.co/300x500' : place.thumbnail_img}" class="re">
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
												                <span class="tt"></span>
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
					    	<li class="no_con flex ac">등록된 맛집이 없습니다.</li>
					  </c:otherwise>
				</c:choose>				
			</ul>
			<div class="page_btn ps"> 
				<button type="button" class="input_st s1 c4 re max1"><span class="tt">더보기</span></button>
			</div>
		</div>
	</div>
</main>
<!-- 본문 end -->	 
<jsp:include page="/layout/script.jsp" />	
<jsp:include page="/layout/footer.jsp" />