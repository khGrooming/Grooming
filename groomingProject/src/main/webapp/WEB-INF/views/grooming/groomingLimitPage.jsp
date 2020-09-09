<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--      <script src="http:/code.jquery.com/jquery-latest.min.js"></script> -->

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">
	
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>


<!-- modal CSS  -->
<link
	href="${pageContext.servletContext.contextPath }/resources/views/css/modal.css" rel="stylesheet">
<title>Hello, world!</title>
<style>
body {
	height: 1200px;
}

img {
	max-width: 100%;
	max-height: 100%;
	
}
/*폰트 설정 */
@font-face {
	font-family: 'TmoneyRoundWindExtraBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: "TmoneyRoundWindExtraBold";
}

.groomingImage {
	width: 450px;
	height: 550px;
	background-size: cover;
	border: 1px solid lightgreen;
}

.status {
	border-radius: 10px;
	border: 1px solid black;
	width: 80px;
	height: 40px;
	text-align: center;
	color: red;
	margin-bottom: 20px;
}

.pimg {
	background-size: cover;
	width: 100px;
	height: 90px;
}
.far .fas{
	font-size:20px;
	
}

.fas{
	color:yellow;
}
#gImg{
width:100%;
height:100%;
}
</style>
</head>

<body>


	<jsp:include page="../common/mainNavigationBar.jsp" />

	<div style="margin-bottom:400px;">
		<img src="${contextPath }/resources/views/images/grooming_logo(100x100).png">
		<label>이미 마감된 게시글 입니다.</label>
	</div>
		
	<jsp:include page="../common/footer.jsp" />


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous">
	</script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous">
	</script>
</body>

</html>
