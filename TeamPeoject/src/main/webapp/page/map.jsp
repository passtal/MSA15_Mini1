<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%
request.setAttribute("dp1", "shop");
request.setAttribute("dp2", "map");
%>
<jsp:include page="/layout/header.jsp" />

<!-- 본문 -->
<main class="doc">	
	<div class="shop_map_wrap">
		<div class="box1">
			<div class="page_tit">
				<span class="tt">					
					<c:set var="navKey" value="${dp1}_${dp2}" />
					${nav[navKey]}
				</span>
				<div class="t1 ps1">지도로 한눈에 맛집의 위치를 확인하세요!!</div>			
			</div>
			<!-- 카카오 api 제공 기본 css 스타일 코드 -->
			<div class="shop_map_layout flex wrap">
				<div class="map_wrap">
					<div id="map" class="map-container"></div>
				</div>
				<c:if test="${role == 'ROLE_OWNER' or role == 'ROLE_ADMIN'}">
				<div class="shop_upload member_wrap">
					<form action="${pageContext.request.contextPath}/page/map" method="post">
					<ul class="form_st">
						<li>								
							<div class="mem_tit">
								<span class="tt s1 fit">식당정보 입력</span>
								<div class="input_tt">지도에서 위치를 클릭하면 좌표가 자동 입력됩니다.</div>
							</div>								
						</li>
						<li>
							<div class="mem_tit"><span class="tt">식당이름</span><span class="ess"></span></div>
							<div class="in">
								<input type="text" class="input_st fit" name="placename" required placeholder="ex)북경짜장">									
							</div>
						</li>
						<li>
							<div class="mem_tit"><span class="tt">주소</span><span class="ess"></span></div>
							<div class="in">
								<input type="text" class="input_st fit" name="address" required placeholder="ex)인천광역시 부평구...">									
							</div>
						</li>
						<li>
							<div class="mem_tit"><span class="tt">전화번호</span><span class="ess"></span></div>
							<div class="in">								
								<input type="text" class="input_st fit" name="phone" required placeholder="ex)032-515-9103">									
							</div>
						</li>
						<li>
							<div class="mem_tit"><span class="tt">식당소개</span><span class="ess"></span></div>
							<div class="in">								
								<textarea name="content" class="input_st fit" placeholder="간단한 설명"></textarea>									
							</div>
						</li>
						<li>
							<div class="mem_tit"><span class="tt">위도(Lat)</span><span class="ess"></span></div>
							<div class="in">								
								<input type="text" class="input_st fit" name="lat" id="lat" readonly placeholder="지도 클릭 시 입력">								
							</div>
						</li>
						<li>
							<div class="mem_tit"><span class="tt">경도(Lng)</span><span class="ess"></span></div>
							<div class="in">								
								<input type="text" class="input_st fit" name="lng" id="lng" readonly placeholder="지도 클릭 시 입력">								
							</div>
						</li>
						<li>
						<div class="mem_tit"><span class="tt">사진첨부</span></div>
							<div class="in flex col">
								<!-- 사진 최대 5개 까지 -->
								<c:forEach var="i" begin="1" end="5">
								<input type="file" class="input_st fit" name="">
								</c:forEach>
							</div>
						</li>
						<li class="btn_wrap">							
							<button type="submit" class="input_st s1 c1">저장하기</button>
						</li>
					</ul>
					</form>
				</div>
				</c:if>
			</div>			
		</div>
	</div>
	<div class="shop_list_wrap">
		<div class="box1">		
			<div class="page_tit">
				<div class="page_tt s6"><strong>추천맛집</strong></div>
			</div>
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
</main>

<!-- 카카오 api 제공 카카오맵api 적용코드 -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ac490ca5185816a42d85c339f174c04"></script>
<script>
    var mapContainer = document.getElementById('map'), 
        mapOption = { 
            center: new kakao.maps.LatLng(37.489548, 126.7235346),
            level: 3 
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); 

    // ★ 수정됨: loginUser.auth -> role
    var canRegister = "${role == 'ROLE_OWNER'}";

    if (canRegister == "true") {
        var clickMarker = new kakao.maps.Marker({ position: map.getCenter() }); 
        clickMarker.setMap(map); 

        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
            var latlng = mouseEvent.latLng;
            clickMarker.setPosition(latlng);
            
            if(document.getElementById('lat')) {
                document.getElementById('lat').value = latlng.getLat();
                document.getElementById('lng').value = latlng.getLng();
            }
        });
    }

    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
    var isAdmin = "${role == 'ROLE_ADMIN'}";
    var activeOverlay = null;

    var places = [
        <c:forEach var="place" items="${placeList}">
        {
            no: "${place.no}",
            title: "${place.placename}",
            desc: "${place.content}",
            addr: "${place.address}", 
            tel: "${place.phone}", 
            latlng: new kakao.maps.LatLng(${place.lat}, ${place.lng})
        },
        </c:forEach>
    ];

    for (var i = 0; i < places.length; i ++) {
        var markerImage = new kakao.maps.MarkerImage(imageSrc, new kakao.maps.Size(24, 35)); 
        var marker = new kakao.maps.Marker({
            map: map,
            position: places[i].latlng,
            title : places[i].title,
            image : markerImage
        });

        (function(marker, place) {
            kakao.maps.event.addListener(marker, 'click', function() {
                
                if (activeOverlay) {
                    activeOverlay.setMap(null);
                }

                var content = '<div class="map_overlay_box flex col">' + 
                              '  <div class="tt t1">' + place.title + '</div>' + 
                              '  <div class="tt t2">' + place.desc + '</div>' + 
                              '  <div class="tt t3">' + place.addr + '</div>' + 
                              '  <div class="tt t4">' + place.tel + '</div>' + 
                              '  <div><a href="${pageContext.request.contextPath}/place/view?no=' + place.no + '" class="input_st s3 c1">가게입장</a></div>';

                if (isAdmin == "true") {
                    content += ' <form action="${pageContext.request.contextPath}/place/delete" method="post" style="display:inline;">' +
                               '   <input type="hidden" name="no" value="' + place.no + '">' +
                               '   <button type="submit" class="input_st s3 c4 re" onclick="return confirm(\'정말 삭제하시겠습니까?\')">가게삭제</button>' +
                               ' </form>';
                }

                content += '</div>';

                var overlay = new kakao.maps.CustomOverlay({
                    content: content,
                    map: map,
                    position: marker.getPosition(),
                    yAnchor: 1.2 
                });
                
                overlay.setMap(map);
                activeOverlay = overlay;
            });
        })(marker, places[i]);
    }
</script>
<!-- 본문 end -->	 
<jsp:include page="/layout/footer.jsp" />