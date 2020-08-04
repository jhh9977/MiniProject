<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${not empty visitList }">
		<table border = 1>	
			<c:forEach var = "v" items = "${visitList }" >	
				<tr>
					<th>가게명</th>
					<td>${v.s_name }</td>
				</tr>
				<tr>
					<th>평점</th>
					<td></td>
				<tr>
				<tr>
					<th>현재 대기팀</th>
					<td></td>
				<tr>
					<td><a href = "${pageContext.request.contextPath }/EnqueueController?name=${v.name }&pnum=2&history=1">예약하기</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>