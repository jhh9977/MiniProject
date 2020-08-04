<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
</head>
<body>
<c:if test="${not empty sessionScope.id }">
	<a href="${pageContext.request.contextPath }/">내 정보</a>
	<a href="${pageContext.request.contextPath }/">예약조회</a>
	<a href="${pageContext.request.contextPath }/">로그아웃</a><br>
</c:if>

<h3>댓글 수정</h3>
	<form action="${pageContext.request.contextPath }/EditBoardController" method="post">
		<table border="1" cellspacing="0">
			<tr>
				<td>
					<textarea name="content" rows="5" cols="50">{content}</textarea><br>
				</td>
				<td>
					<input type="submit" value="수정">
					<input type="reset" value="취소">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					평점 <input type="number" name="score" value=${score }>
					<input type="hidden" name="bnum" value="${bnum }">
				</td>
			</tr>
		</table>
	</form>


</body>
</html>