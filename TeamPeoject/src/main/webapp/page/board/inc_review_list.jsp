<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul class="review_list">
	<c:forEach var="i" begin="1" end="2">
	<li>
		<div class="review_inner flex col">
			<div class="con_wrap flex vc space">			
				<div class="avatar_wrap flex vc">
					<div class="avatar_img">
						<p class="resize imgfix"><img src="https://placehold.co/200x200" class="re"></p>					
					</div>
					<div class="name"><strong> ${board.username}</strong></div>
				</div>				

				<!-- 본인 글에만 보이게 -->	
				<div class="page_btn">				
			        <form action="${pageContext.request.contextPath}/board/delete" method="post" class="form-delete">
			            <input type="hidden" name="no" value="${board.no}">						
						<button onclick="layerOpen('${pageContext.request.contextPath}/page/board/edit.jsp')" type="button" class="input_st s2 c1 re">수정</button>
			            <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');" class="input_st s2 c4 re">삭제</button>
			        </form>
				</div>
				<!-- 본인 글에만 보이게 end -->	
			</div>
			<div class="con_wrap flex vc space">			
				<div class="rateStar_wrap flex di vc">
					<c:forEach var="i" begin="1" end="5">
					<span class="mti mtifill material-symbols-outlined star full">star</span>
					</c:forEach>
					<strong class="tt">${board.rating}점</strong>
				</div>
				<div class="conDate"><span class="tt">DATE. <fmt:formatDate value="${board.created_at}" pattern="yyyy-MM-dd HH:mm"/></span></div>
			</div>
			<div class="con_wrap conPhoto">
				<ul class="list grid">
					<!-- 최대 5개 -->
					<c:forEach var="i" begin="1" end="5">
					<li><a href="javascript:void(0);" class="in resize imgfix" onclick="layerOpenImg(this)"><img src="https://placehold.co/1000x1200" class="re"></a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="con_wrap">				
				<div class="conTxt"><div class="tt">${board.content}</div></div>				
			</div>
		</div>		
	</li>
	</c:forEach>
</ul>

<!-- 더보기 버튼은 게시글 10개 이상일때만 보이고 클릭 시에 10개 더 보이기 -->
<div class="page_btn ps"> 
	<button type="button" class="input_st c4 re max1"><span class="tt">더보기</span></button>
</div>
