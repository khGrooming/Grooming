<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Grooming</title>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png">

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<!-- jQuery cookie -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-cookie/jquery.cookie.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">

<!-- Custom styles for this css -->
<%-- <link href="${pageContext.servletContext.contextPath }/resources/views/css/main.css" rel="stylesheet"> --%>

<style type="text/css">
*
{
    margin: 0;
    padding: 0;
    font-family: 'Jua', sans-serif
}
.right_container .right_spotlight_body .right_spotlight_category,
.right_container .right_spotlight_body .right_spotlight_content strong
{
	font-family: 'Nanum Gothic', sans-serif;
}
body
{
    position: relative;
}
.mento_container{
	margin-top: 150px;
}
.main_lst_container{
	margin-bottom: 100px;
}
.right_container
{
	position: absolute;
	padding: 2px;
    width: 160px;
    right: 200px;
    top: 0;
    border-radius: 3px;
	border: 1px solid lightgrey;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}
.right_container .right_spotlight_title
{
	text-align: center;
	padding: 10px;
	border-bottom: thin dashed;
}
.right_container .right_spotlight_item:hover
{
	background-color: #f0f0f0;
}
.right_container .right_spotlight_title h3
{
	margin: auto;
}
.right_container .right_spotlight_body
{
	font-size: 9pt;
	margin: 5px 0;
}
.right_container .right_spotlight_body .right_spotlight_item
{
	display: block;
    margin: 10px 3px;
	color: black;
    text-decoration: none;
    letter-spacing: 1px;
	border-bottom: thin dashed;
    transition: 0.6s;
}
.right_container .right_spotlight_body .right_spotlight_item .right_spotlight_content
{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis; 
}

</style>
</head>
<body>
	<jsp:include page="common/mainNavigationBar.jsp" />

<c:if test="${!empty hBoardList }">
	<div class="right_container">
		<div class="right_spotlight_title">
			<h3>시끌벅적</h3>
		</div>
		<c:forEach var="b" items="${hBoardList }">
		<div class="right_spotlight_body">
			<a href="?boardNo=${b.boardNo }">
				<div class="right_spotlight_item">
					<div class="right_spotlight_category">[ ${b.bCategoryName } ]</div>
					<div class="right_spotlight_content">
						<strong>${b.boardTitle }</strong>
					</div>
				</div>
			</a>
		</div>
		</c:forEach>
	</div>
</c:if>
	<!-- 멘토 그루밍 컨테이너 -->
	<div class="main_fst_container mento_container container">
		<div class="container_header">
			<h2 class="mt-auto mb-auto">멘토 그루밍</h2>
			<h6 class="font-weight-lighter">실력있는 멘토와 함께하는 스터디 그룹입니다.</h6>
		</div>

		<!-- 그루밍 카드 -->
		<div class="row text-center">
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="http://placehold.it/500x325" alt="">
					<div class="card-body">
						<h4 class="card-title">Card title</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- 컨테이너 끝 -->

	<div class="main_lst_container container"></div>

	<jsp:include page="common/footer.jsp" />

</body>
</html>
