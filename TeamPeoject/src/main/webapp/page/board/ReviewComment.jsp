<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%
request.setAttribute("dp1", "shop");
request.setAttribute("dp2", "comm");
%>
<jsp:include page="/layout/header.jsp" />

<!-- 본문 -->
<main class="doc">
	<h2>${board.title}</h2>
    <p>작성자 : ${board.username} | 평점 : ${board.rating}</p>
    <hr>
    
    <c:forEach var="img" items="${board.imageList}">
        <img src="${pageContext.request.contextPath}${img.img_path}" width="300"><br>
    </c:forEach>
    
    <div class="content">
        ${board.content}
    </div>
    
    <hr>
    
    <h3>댓글</h3>
    
    <ul>
        <c:forEach var="comment" items="${commentList}">
            <li>
                <strong>${comment.username} (User ${comment.user_no})</strong> : 
                ${comment.content}
                <span style="font-size:0.8em; color:gray;">${comment.created_at}</span>
            </li>
        </c:forEach>
        
        <c:if test="${empty commentList}">
            <li>작성된 댓글이 없습니다.</li>
        </c:if>
    </ul>
    
    <form action="${pageContext.request.contextPath}/board/comment" method="post">
        <input type="hidden" name="board_no" value="${board.no}">
        
        <c:if test="${not empty sessionScope.loginUser}">
            <textarea name="content" required placeholder="댓글을 남겨주세요" rows="3" cols="50"></textarea>
            <button type="submit">등록</button>
        </c:if>
        <c:if test="${empty sessionScope.loginUser}">
            <textarea disabled placeholder="로그인 후 댓글을 작성할 수 있습니다." rows="3" cols="50"></textarea>
            <button type="button" onclick="location.href='${pageContext.request.contextPath}/page/login.jsp'">로그인하러 가기</button>
        </c:if>
    </form>
    
    <br>
    <a href="${pageContext.request.contextPath}/board/list">목록으로</a>
</main>
<!-- 본문 end -->	
<jsp:include page="/layout/script.jsp" />	
<jsp:include page="/layout/footer.jsp" />