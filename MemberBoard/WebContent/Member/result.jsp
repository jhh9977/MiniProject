<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>메뉴</h3>
	<c:if test="${not empty sessionScope.id && empty requestScope.edit_flag }">
	${sessionScope.id }님 로그인!<br>
	<a href = "${pageContext.request.contextPath }/SearchController">내정보수정</a>
	<br>
	<a href = "${pageContext.request.contextPath }/LogoutController">로그아웃</a>
	<br>
	<a href = "${pageContext.request.contextPath }/DelController">탈퇴</a>
	<br>
	<c:import url="/ListController">
	</c:import>
	</c:if>
	<c:if test="${empty sessionScope.id && empty requestScope.join_flag
	&& empty requestScope.del_flag && empty requestScope.logout_flag}">
	<h3>로그인 실패!</h3>
	<a href = "${pageContext.request.contextPath }/Member/loginForm.jsp">로그인 화면으로</a>
	</c:if>
	
	
	<c:if test="${not empty requestScope.join_flag }">
		<c:if test="${requestScope.join_flag }">
			<h3>회원가입 완료!</h3>		
			<a href = "${pageContext.request.contextPath }/Member/loginForm.jsp">로그인 하러 가기</a>
		</c:if>
		<c:if test="${!requestScope.join_flag }">
			<h3>중복된 아이디가 있습니다.</h3>		
			<a href = "${pageContext.request.contextPath }/Member/form.jsp">회원가입 화면으로</a>
		</c:if>
	</c:if>
	<c:if test="${not empty requestScope.edit_flag }">
	<h3>내정보수정완료!</h3>
	<a href = "${pageContext.request.contextPath }/SearchController">수정된 정보 보기</a>
	<a href = "${pageContext.request.contextPath }/Member/result.jsp">마이페이지로</a>
	<a href = "${pageContext.request.contextPath }/Member/loginForm.jsp">로그인 화면으로</a>
	</c:if>
	<c:if test="${not empty requestScope.del_flag }">
	<h3>탈퇴 완료!</h3>
	<a href = "${pageContext.request.contextPath }/Member/loginForm.jsp">로그인 화면으로</a>
	<a href = "${pageContext.request.contextPath }/Member/form.jsp">회원가입하기</a>
	</c:if>
	<c:if test="${not empty requestScope.logout_flag }">
	<h3>로그아웃 되었습니다!</h3>
	<a href = "${pageContext.request.contextPath }/Member/loginForm.jsp">로그인 화면으로</a>
	</c:if>
</body>
</html>