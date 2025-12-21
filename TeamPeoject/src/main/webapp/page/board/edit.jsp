<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
</head>
<body>
    <div class="edit-container">
        <h2>게시글 수정하기</h2>

        <form action="${pageContext.request.contextPath}/board" method="post" class="edit-form">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="no" value="${board.no}">

            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" value="${board.title}" required class="form-control">
            </div>

            <div class="form-group">
                <label for="rating">평점</label>
                <input type="number" id="rating" name="rating" step="0.5" min="0" max="5" value="${board.rating}" class="form-control">
            </div>

            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" rows="10" required class="form-control">${board.content}</textarea>
            </div>

            <div class="form-actions">
                <button type="button" class="btn-cancel" onclick="history.back()">취소</button>
                <button type="submit" class="btn-submit">수정 완료</button>
            </div>
        </form>
    </div>
</body>
</html>