<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<jsp:include page="/layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>맛집 지도</title>
    <!-- 카카오api 제공 커스텀 레이아웃 -->
    <style>
        .overlay-box { background: white; padding: 10px; border: 1px solid #ccc; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.2); text-align: center; min-width: 120px; }
        .overlay-btn { display: inline-block; padding: 3px 8px; margin: 2px; font-size: 12px; color: white; border-radius: 3px; border: none; cursor: pointer; text-decoration: none;}
        .btn-go { background: #28a745; }
        .btn-del { background: #dc3545; }
    </style>
</head>
<body>

<!-- 카카오 api 제공 기본 css 스타일 코드 -->
<div class="container">
    <h2>맛집 지도</h2>

    <div id="map" class="map-container" style="width:100%; height:500px; margin-bottom: 20px; border:1px solid #ddd;"></div>

    <c:if test="${role == 'ROLE_OWNER' or role == 'ROLE_ADMIN'}">
        <div class="form-section" style="padding: 20px; background: #f9f9f9; border: 1px solid #eee;">
            <h3>새 맛집 등록</h3>
            <p>지도에서 위치를 클릭하면 좌표가 자동 입력됩니다.</p>
            
            <form action="${pageContext.request.contextPath}/page/map" method="post">
                <div class="input-group">
                    <label>식당이름</label>
                    <input type="text" name="placename" required placeholder="ex)부평역">
                </div>
                <div class="input-group">
                    <label>주소</label>
                    <input type="text" name="address" required placeholder="ex)인천광역시 부평구...">
                </div>
                <div class="input-group">
                    <label>전화번호</label>
                    <input type="text" name="phone" required placeholder="ex)032-515-9103">
                </div>
                <div class="input-group">
                    <label>설명</label>
                    <textarea name="content" rows="3" placeholder="간단한 설명"></textarea>
                </div>
                
                <div class="input-group">
                    <label>위도(Lat)</label>
                    <input type="text" name="lat" id="lat" readonly placeholder="지도 클릭 시 입력" style="background:#eee;">
                </div>
                <div class="input-group">
                    <label>경도(Lng)</label>
                    <input type="text" name="lng" id="lng" readonly placeholder="지도 클릭 시 입력" style="background:#eee;">
                </div>

                <button type="submit" class="btn-save" style="margin-top:10px;">저장하기</button>
            </form>
        </div>
    </c:if>

    <c:if test="${role == 'ROLE_USER' or empty loginUser}">
        <p style="color: gray; text-align: center;">* 파트너(사장님) 계정으로 로그인하면 맛집을 등록할 수 있습니다.</p>
    </c:if>
</div>

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

                var content = '<div class="overlay-box">' + 
                              '  <strong>' + place.title + '</strong><br>' + 
                              '  <a href="${pageContext.request.contextPath}/board/list?place_no=' + place.no + '" class="overlay-btn btn-go">입장</a>';

                if (isAdmin == "true") {
                    content += ' <form action="${pageContext.request.contextPath}/place/delete" method="post" style="display:inline;">' +
                               '   <input type="hidden" name="no" value="' + place.no + '">' +
                               '   <button type="submit" class="overlay-btn btn-del" onclick="return confirm(\'정말 삭제하시겠습니까?\')">삭제</button>' +
                               ' </form>';
                }

                content += '</div>';

                var overlay = new kakao.maps.CustomOverlay({
                    content: content,
                    map: map,
                    position: marker.getPosition(),
                    yAnchor: 1.5 
                });
                
                overlay.setMap(map);
                activeOverlay = overlay;
            });
        })(marker, places[i]);
    }
</script>

</body>
</html>

<jsp:include page="/layout/footer.jsp" />