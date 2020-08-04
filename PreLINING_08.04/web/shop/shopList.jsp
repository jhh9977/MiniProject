<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>PreLINING</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
<div class="gtco-section">
		<div class="gtco-container">
			<c:if test="${not empty slistbysearch }">
				<table border="1" cellspacing="0">
				<c:forEach var="s1" items="${slistbysearch }">
					<tr rowspan="3">
						<td><img src="${s1.img }" width="50" height="50"></td>
						<td colspan="5">
						<a href="${pageContext.request.contextPath }/ShopDetailController?num=${s1.num}">
						 ${s1.name }</a><br>
							평점: ${s1.scoreavg }<br>
							현재 대기팀: ${s1.queue_num }
						</td>
						<td>
							<a href="${pageContext.request.contextPath }/EnqueueController?pnum=2">예약</a>
						</td>
					</tr>
				</c:forEach>
				</table>
			</c:if>
			
			<c:if test="${not empty slistbycategory }">
				<table border="1" cellspacing="0">
					<c:forEach var="s2" items="${slistbycategory }">
						<tr rowspan="3">
							<td><img src="${s2.img }" width="50" height="50"></td>
							<td colspan="5">
							<a href="${pageContext.request.contextPath }/ShopDetailController?num=${s2.num}">
							 ${s2.name }</a><br>
								평점: ${s2.scoreavg }<br>
								현재 대기팀: ${s2.queue_num }
							</td>
							<td>
								<a href="${pageContext.request.contextPath }/EnqueueController?name=${s2.name }&pnum=2&history=1">예약</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		
			<c:if test="${not empty slistbyqnum }">
			<div class="row">
				<div class="col-md-8 text-left gtco-heading">
					<h2 class="cursive-font primary-color">Hot Place</h2>
				</div>
			</div>
			<div class="row">
			<c:forEach var="s1" items="${slistbyqnum }" begin="0" end="2">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath }/ShopDetailController?num=${s1.num}">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="${s1.img }" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>Fresh Mushrooms</h2>
							<p>Far far away, behind the word mountains</p>
							<p><span class="price cursive-font">$19.15</span></p>
						</div>
					</a>
				</div>
			</c:forEach>
			</div>
			<br>
			<hr>
			</c:if>
			
			
			<c:if test="${not empty slistbyscore }">
			<div class="row">
				<div class="col-md-8 text-left gtco-heading">
					<h2 class="cursive-font primary-color">High Rating</h2>
				</div>
			</div>
			<div class="row">
				<c:forEach var="s2" items="${slistbyscore }" begin="0" end="2">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="${pageContext.request.contextPath }/ShopDetailController?num=${s2.num}" >
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="${s2.img }" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>Fresh Mushrooms</h2>
							<p>Far far away, behind the word mountains</p>
							<p><span class="price cursive-font">$19.15</span></p>
						</div>
					</a>
				</div>
				</c:forEach>
			</div>
			</c:if>
			
		</div>
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