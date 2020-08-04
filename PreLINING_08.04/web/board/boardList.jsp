<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글리스트</title>
</head>
<body>
<c:if test="${memberType == 1} ">
	<form action="${pageContext.request.contextPath }/AddBoardController" method="post">
		<table border="1" cellspacing="0">
			<tr>
				<td>
					<textarea name="content" rows="5" cols="50"></textarea><br>
				</td>
				<td>
					<input type="submit" value="작성">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					평점 <input type="number" name="score">
					<input type="hidden" name="g_name" value="${id }">
					<input type="hidden" name="s_name" value="${shop.name }">
				</td>
			</tr>
		</table>
	</form>
</c:if>
<br><hr><br>
<c:if test="${not empty boardlist }">
	<table border="1" cellspacing="0">
		<c:forEach var="b" items="${boardlist }">
			<tr>
				<td>${b.g_name }</td>
				<td colspan="5">
				 ${b.content }<br>
				 평점: ${b.score }
				</td>
			</tr>
			<c:if test="${b.g_name == loginInfo.nickname }">
				<tr>
					<td colspan="3">
						<a href="${pageContext.request.contextPath }
						/web/board/editBoardForm.jsp?bnum=${b.num}&content=${b.content}&score=${b.score}">
						수정</a>
						<a href="${pageContext.request.contextPath }
						/DelBoardController?bnum=${b.num}">삭제</a>
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</c:if>
<c:if test="${empty boardlist }">
아직 댓글이 없습니다.
</c:if>
</body>
</html>