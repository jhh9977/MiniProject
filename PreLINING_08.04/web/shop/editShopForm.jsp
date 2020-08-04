<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>PreLINING</title>
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/web/bootstrap/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/web/bootstrap/css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/web/bootstrap/css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/web/bootstrap/css/bootstrap.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/web/bootstrap/css/magnific-popup.css">
	<!-- Bootstrap DateTimePicker -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/web/bootstrap/css/bootstrap-datetimepicker.min.css">
	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/web/bootstrap/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/web/bootstrap/css/owl.theme.default.min.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/web/bootstrap/css/style.css">
	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/modernizr-2.6.2.min.js"></script>

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
	<div id="page">

	<nav class="gtco-nav" role="navigation">
				<div class="gtco-container">
					<div class="row">
						<div class="col-sm-4 col-xs-12">
							<div id="gtco-logo"><a href="${pageContext.request.contextPath }/web/main.jsp">PreLINING</a></div>
						</div>
						<div class="col-xs-8 text-right menu-1">
							<ul>
								<li>${sessionScope.id }님 환영합니다.</li>
								<li><a href="${pageContext.request.contextPath }/LogoutController">로그아웃</a></li>
								<li class="has-dropdown">
									<a href="#">Mypage</a>
									<ul class="dropdown">
										<li><a href="${pageContext.request.contextPath }/SearchController">회원정보</a></li>
										<li><a href="${pageContext.request.contextPath }/ShopDetailController?num=${shop.num}">가게정보</a></li>
									</ul>
								</li>
								<li class="btn-cta"><a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>
							</ul>
						</div>
					</div>
				</div>
	</nav>
	
	<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner" 
	style="background-image: url(${pageContext.request.contextPath }/web/images/img_bg_1.jpg)" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-15 col-md-offset-0">	
					<div class="row row-mt-10em">
						<div class="col-md-6 col-md-push-3 animate-box" data-animate-effect="fadeIn">
						<h2 class="text-center">정보 수정</h2>
							<div class="form-wrap">
								<div class="tab tab-content tab-content-inner active">
									<form action="${pageContext.request.contextPath }/EditShopController" method = "post" name="loginForm" onsubmit="return check()">
										<label class="text-left">이름</label>
										<div class="readonly">
										<input type="text" name="name" class="form-control" value="${shop.name }" readonly> <br>
										</div>
										<c:forEach var="menu" items="${menulist }" varStatus="status">
											<label class="text-left">메뉴${status.count }</label>
											<input type="text" name="menu" class="form-control" value="${menu }"> <br>
										</c:forEach>
										<label class="text-left">위치</label>
										<input type="text" name="location" class="form-control" value="${shop.location }"> <br>
										<label class="text-left">전화번호</label>
										<input type="tel" name="phone" class="form-control" value="${shop.phone }"> <br>
										<label class="text-left">상세설명</label>
										<textarea name="content" rows="10" cols="20" class="form-control" >${shop.content }</textarea><br>
										<label class="text-left">카테고리</label>
										<input type="text" name="category" class="form-control" value="${shop.category }"> <br>
										<input type="hidden" name="num" value="${shop.num }">
										<div class="text-right">
										<input type="button" class="btn btn-primary" value="취소"
										onclick="location.href='${pageContext.request.contextPath }/web/shop/shopDetail.jsp'">
										<input type="submit" class="btn btn-primary" value="수정">
										</div>
										<hr>
										<h5> <a href="${pageContext.request.contextPath }/DelShopController">탈퇴하기</a></h5>
									</form>	
								</div>
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</header>

	





	
	<!-- page </div> -->
	</div>

	
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/jquery.countTo.js"></script>
	<!-- Stellar Parallax -->
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/jquery.stellar.min.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/magnific-popup-options.js"></script>
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
	<!-- Main -->
	<script src="${pageContext.request.contextPath }/web/bootstrap/js/main.js"></script>
	</body>
</html>

