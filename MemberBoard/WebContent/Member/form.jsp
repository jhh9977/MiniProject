<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function check(){
	idTxt = document.loginForm.id;
	pwTxt = document.loginForm.pwd;
	
	if(idTxt.value == ""){
		alert("아이디를 입력해주세요.");
		idTxt.value = "";
		idTxt.focus();
		return false;
	}
	if(pwTxt.value == ""){
		alert("비밀번호를 입력해주세요.");
		idTxt.value = "";
		idTxt.focus();
		return false;
	}
}
</script>
</head>
<body>
	<h3>회원가입</h3>
	<form action="${pageContext.request.contextPath }/JoinController" 
	method = "post">
	id:<input type = "text" name = "id"><br>
	pwd:<input type = "password" name = "pwd"><br>
	name:<input type = "text" name = "name"><br>
	email:<input type = "text" name = "email"><br>
	<input type = "reset" value = "취소">
	<input type = "submit" value = "가입">
	</form>
</body>
</html>



