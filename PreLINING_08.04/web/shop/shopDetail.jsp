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
	
	<c:if test="${sessionScope.memberType==1 }">
	<header id="gtco-header" class="gtco-cover gtco-cover-xss" role="banner" 
	style="background-image: url(${pageContext.request.contextPath }/web/images/img_bg_2.jpg)" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">		
			</div>
		</div>
	</header>
	
	<div class="gtco-section">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2>${shop.name }</h2>
				</div>
			</div>
			
			<div class="well">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="fh5co-text">
							<h2>음식점소개</h2>
							<br>
							<h4>${shop.content }</h4>
						</div>
				</div>
			</div>
			</div>
			
			<br>
			<br>
			
			<div class="well">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="fh5co-text">
							<h2>메뉴</h2>
							<br>
							<c:forEach var="menu" items="${menulist }" varStatus="status">
											<label class="text-left">메뉴${status.count }</label>
											<h4>${menu }</h4>
							</c:forEach>
						</div>
				</div>
			</div>
			</div>
			
			<br>
			<br>
			
			<div class="well">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="fh5co-text">
							<h2>위치</h2>
							<br>
							<h4>${shop.location }</h4>
						</div>
				</div>
			</div>
			<br>
			<br>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="fh5co-text">
							<h2>예약현황</h2>
							<br>
							<h4>${shop.queue_num }명</h4>
						</div>
				</div>
			</div>
			</div>
			
			<br>
			<br>
			
			<div class="well">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<c:if test="${  empty flag_qck || (flag_qck && shop.num != bshopnum) || !flag_qck}">
						<input type="button" class="btn btn-primary" value="대기신청" 
							onclick="location.href='${pageContext.request.contextPath }/EnqueueController?pnum=2'">
					</c:if>
					<c:if test="${  flag_qck && not empty bshopnum && shop.num == bshopnum}">
						<input type="button" class="btn btn-primary" value="대기취소" 
							onclick="location.href='${pageContext.request.contextPath }/DequeueController'">
					</c:if>
				</div>
			</div>
			</div>
			<br>
			<br>
			<hr>
			
			<div class="well">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="fh5co-text">
							<h2>댓글</h2>
							<br>
							<h4>댓글리스트</h4>
						</div>
				</div>
			</div>
			</div>
			
			
		</div>
	</div>
	</c:if>


	<c:if test="${sessionScope.memberType==2 }">
	<c:if test="${not empty sessionScope.shop }">
	<%-- <c:import url="${pageContext.request.contextPath }/SearchQueueController"></c:import> --%>
	<header id="gtco-header" class="gtco-cover gtco-cover-xss" role="banner" 
	style="background-image: url(${pageContext.request.contextPath }/web/images/img_bg_2.jpg)" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">		
			</div>
		</div>
	</header>
	
	<div class="gtco-section">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2>${shop.name }</h2>
				</div>
			</div>
			
			<div class="well">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="fh5co-text">
							<h2>음식점소개</h2>
							<br>
							<h4>${shop.content }</h4>
						</div>
				</div>
			</div>
			</div>
			
			<br>
			<br>
			
			<div class="well">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="fh5co-text">
							<h2>메뉴</h2>
							<br>
							<c:forEach var="menu" items="${menulist }" varStatus="status">
											<label class="text-left">메뉴${status.count }</label>
											<h4>${menu }</h4>
							</c:forEach>
						</div>
				</div>
			</div>
			</div>
			
			<br>
			<br>
			
			<div class="well">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="fh5co-text">
							<h2>위치</h2>
							<br>
							<h4>${shop.location }</h4>
						</div>
				</div>
			</div>
			<br>
			<br>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="fh5co-text">
							<h2>예약현황</h2>
							<br>
							<h4>예약수</h4>
						</div>
				</div>
			</div>
			</div>
			
			<br>
			<br>
			
			<div class="well">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="fh5co-text">
							<h2><a href="${pageContext.request.contextPath }/SearchQueueController">현재 대기열 확인</a></h2>
						</div>
				</div>
			</div>
			</div>
			
			<br>
			<br>
			<hr>
			
			<div class="well">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
						<div class="fh5co-text">
							<h2>댓글</h2>
							<br>
							<h4>댓글리스트</h4>
						</div>
				</div>
			</div>
			</div>
			
			
		</div>
	</div>
	</c:if>
	<c:if test="${empty sessionScope.shop }">
		<h3>현재 등록한 가게가 없습니다</h3>
		<a href="${pageContext.request.contextPath }/web/shop/addShopForm.jsp">가게등록</a>
	</c:if>
</c:if>



	
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

