<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성하기</title>
</head>
<body>
    <div class="form-container">
        <h2>맛집 리뷰 남기기</h2>

        <form action="${pageContext.request.contextPath}/board" method="post" class="review-form">

        	<input type="hidden" name="action" value="insert">

            <div class="form-group">
                <label for="title">리뷰 제목</label>
                <input type="text" id="title" name="title" required placeholder="리뷰 제목을 입력해주세요.">
            </div>

            <div class="form-group">
                <label for="rating">평점 (0.5 ~ 5.0)</label>
                <input type="number" id="rating" name="rating" min="0.5" max="5.0" step="0.5" value="5.0">
            </div>

            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" rows="10" placeholder="맛, 서비스, 분위기는 어떠셨나요?"></textarea>
            </div>

            <div class="form-actions">
                <button type="button" class="btn-cancel" onclick="history.back()">취소</button>
                <button type="submit" class="btn-submit">리뷰 등록</button>
            </div>

        </form>
    </div>
</body>
</html>