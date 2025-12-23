<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<h2>${board.title}</h2>
	<p>작성자 : ${board.username} | 평점 : ${board.rating}</p>
	<hr>
	<c:foreach>
		<img src="${pageContext.request.contextPath}${img.img_path}" width="300"><br>
	</c:foreach>
	
	<div class="content">
		${board.content}
	</div>
	
	<hr>
	
	<h3>댓글</h3>
	
	<ul>
		<c:foreach var="comment" items="commentList">
			<li>
				<span>${comment.username}</span> : ${comment.content}
				<span>${comment.created_at}</span>
			</li>
		</c:foreach>
	</ul>
	
	<form action="${pageContext.request.contextPath}/board/comment" method="post">
		<input type="hidden" name="board_no" value="${board.no}">
		<textarea name="content" required placeholder="댓글을 남겨주세요"></textarea>
        <button type="submit">등록</button>
	</form>
	
	<a href="${pageContext.request.contextPath}/board/list">목록으로</a>
</body>
</html>