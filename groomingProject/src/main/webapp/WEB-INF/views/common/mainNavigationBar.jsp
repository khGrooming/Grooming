<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<title>main navigation bar</title>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png">
<style>
@font-face {
	font-family: 'NanumGothic';
	src: url(${pageContext.servletContext.contextPath }/resources/views/font/NanumGothic.ttf) format('truetype');
} 
body { 
	font-family: NanumGothic; 
}
.mainNavImg {
	height: 50px;
}
</style>
</head>
<body>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-sm navbar-dark bg-success font-weight-bold h5 fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#"><img class="mainNavImg" alt="groominglogo" src="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png"></a>

			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="#">그루밍</a>
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
					<li class="nav-item">
						<a class="nav-link" href="#">메시지</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">알림</a>
					</li>
					<li class="nav-item">
						<p class="navbar-text" href="#">${loginUser.userName }</p>
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