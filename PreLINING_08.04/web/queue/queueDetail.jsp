<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function onClick(){
	
}
</script>
</head>
<body>


<c:if test="${not empty sessionScope.id}">
	<c:if test = "${sessionScope.memberType == 2 }" >	<!-- 판매자일 때 대기열 리스트 조회 -->
		<c:if test="${not empty qlist }">
			<h3 align="center">${shop.name }</h3>
			<table border = 1 align = "center">	
				<tr>
					<th>고객명</th><th>인원 수</th><th>예약 시간</th>
				</tr>	
				<c:forEach var = "x" items = "${qlist }">
						<tr>
							<td>${x.g_name }</td>
							<td>${x.pnum }</td>
							<td>${x.r_date }</td>
							<td><a href = "${pageContext.request.contextPath }
							/DequeueController?qnum=${x.num }&g_name=${x.g_name }&log=1">방문완료</a></td>
							<td><a href = "${pageContext.request.contextPath }
							/DequeueController?qnum=${x.num }&g_name=${x.g_name}&log=0">방문취소</a></td>
						</tr>
				</c:forEach>
			</table>
		</c:if>
		<c:if test="${empty qlist }">
			현재 대기중인 손님 없음
		</c:if>
	</c:if>
	
	
	<c:if test = "${sessionScope.memberType == 1 }" >	<!-- 구매자일 때 예약 내역 조회 -->
		<!-- 다중예약 가능할 경우 c:forEach 사용 -->
		<%-- <form action= "${pageContext.request.contextPath }/DequeueController" 
		name = "cencelForm" onsubmit = "return onClick()"> --%>
			<c:if test="${not empty q }">
				<h3 align="center">현재 예약 가게</h3>
				<table border = 1>
					<tr>
						<th>가게명</th>
						<td>
						${q.s_name }
						</td>
					</tr>
					<tr>
						<th>현재 내 순번</th>
						<td>
						${seq_wait }
						</td>
						<th>예약 시간</th>
						<td>
						${q.r_date }
						</td>
					</tr>
					<tr>
						<td><a href = "${pageContext.request.contextPath }/DequeueController">예약 취소</a></td>
					</tr>
				</table>
			</c:if>
			<c:if test="${empty q }">
				<h3 align="center">현재 예약 가게 없음</h3>
			</c:if>
			
		<h3 align="center">최근 방문한 가게</h3>
		<c:import url="/SearchLogController"></c:import>
	</c:if>
	
	

</c:if>



</body>
</html>