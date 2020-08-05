<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>main navigation bar</title>
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png">
<style>
@font-face {
	font-family: 'NanumGothic';
	src: url(${pageContext.servletContext.contextPath }/resources/views/font/NanumGothic.ttf)
		format('truetype');
}

body {
	font-family: NanumGothic;
}

.main_navbar {
	
}

.mainNavImg {
	height: 50px;
}

.main_messages_icon, .main_alerts_icon {
	cursor: pointer;
	padding: 0 15px 0 15px;
	position: relative;
}

.main_messages_icon svg, .main_alerts_icon svg {
	width: 38px;
	height: 38px;
	fill: #fff;
}

.main_messages_txt, .main_alerts_txt {
	color: white;
	width: 25px;
	height: 25px;
	background: darkorange;
	border-radius: 50%;
	border: 1px solid;
	font-size: 18px;
	position: absolute;
	top: -2px;
	left: 38px;
}
</style>
</head>
<body>
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />

	<!-- Navigation -->
	<nav
		class="main_navbar navbar navbar-expand-sm navbar-dark bg-success font-weight-bold h5 fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#"> <img class="mainNavImg"
				alt="groominglogo"
				src="${contextPath }/resources/views/images/grooming_logo(100x100).png">
			</a>

			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="groomingMain.do">그루밍</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">커뮤니티</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">스터디카페</a>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<c:if test="${empty sessionScope.loginUser }">
					<li class="nav-item">
						<a class="nav-link" href="#">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">회원가입</a>
					</li>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser }">
					<li class="nav-item main_messages_icon">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-envelope" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383l-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"/>
						</svg>
						<div class="main_messages_txt text-center">${msg.count }9</div>
					</li>
					<li class="nav-item main_alerts_icon mr-2">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bell" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2z"/>
							<path fill-rule="evenodd" d="M8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
						</svg>
						<div class="main_alerts_txt text-center">${alerts.count }1</div>
					</li>
					<li class="nav-item mr-2">
						<a class="nav-link" href="#">${loginUser.userName }아이디</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">로그아웃</a>
					</li>
				</c:if>
			</ul>
		</div>
	</nav>

</body>
</html>