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

<!-- 오른쪽 컨테이너 스타일 -->
<style type="text/css">
/* *
{
    font-family: 'Jua', sans-serif;
} */
.right_container .right_spotlight_body .right_spotlight_category,
.right_container .right_spotlight_body .right_spotlight_content strong
{
	font-family: 'Nanum Gothic', sans-serif;
}
.right_container
{
	margin-right: 5%;
	float: right;
	padding: 2px;
    width: 160px;
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

<!-- 메인 컨테이너 -->
<style type="text/css">
.main_container
{
	margin-bottom: 3rem;
	font-family: 'Jua', sans-serif;
}
.main_container .container_header
{
	margin: 3.5rem 0 2.5rem; 
}
</style>
<!-- 카드 스타일 -->
<style>
.cards_bundle
{
	text-align: center
}
.cards_bundle .card_container .card_box
{
    cursor: pointer;
    width: 100%;
	border-radius: 1rem;
	border: 0.2rem solid skyblue;
    transition: 0.4s;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}
.cards_bundle .card_container .card_box:hover .card_header
{
	border-bottom: 0.1rem solid darkorange;
    transition: 0.4s;
}
.cards_bundle .card_container .card_box:hover
{
	border: 0.2rem solid darkorange;
    transition: 0.6s;
}
.cards_bundle .card_container .card_header
{
	position: relative;
	height: 12.5rem;
	border-bottom: 0.1rem solid skyblue;
	border-radius: 15px 15px 0px 0px;
    transition: 0.4s;
}
.cards_bundle .card_container .card_header img
{
	object-fit: scale-down;
	height: 100%;
	width: 100%;
}
.cards_bundle .card_container .card_header .card_dDay
{
	position: absolute;
	top: 0;
	left: 0;
	width: 2.5rem;
	height: 2.5rem;
	margin: 0.8rem;
	border-radius: 50%;
	text-align: center;
	line-height: 2.5rem;
}
.cards_bundle .card_container .card_header .card_dDay.card_dDay_green
{
	font-size: 0.8rem;
	background: white;
	color: green;
	border: thin solid green;
}
.cards_bundle .card_container .card_header .card_dDay.card_dDay_red
{
	font-size: 1rem;
	background: white;
	color: red;
	border: thin solid red;
}
.cards_bundle .card_container .card_header .card_dDay.card_dDay_orange
{
	font-size: 0.8rem;
	background: white;
	color: orange;
	border: thin solid orange;
}
.cards_bundle .card_container .card_header .card_dDay.card_dDay_black
{
	font-size: 0.8rem;
	background: white;
	color: black;
	border: thin solid black;
}
.cards_bundle .card_container .card_body
{
    height: 11rem;
    width: 100%;
}
.cards_bundle .card_container .card_body .card_title
{
	text-align: left;
	font-size: 1.5rem;
	line-height: 1.5rem;
	margin: 0;
	padding: 0.5rem 0.3rem 0.3rem;
    color: #007bff;
   	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.cards_bundle .card_container .card_body .card_tags
{
	text-align: left;
	margin: 0;
	padding: 0.3rem;
   	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.cards_bundle .card_container .card_body .card_tags .badge
{
	margin: 0 3px;
    font-weight: lighter;
    padding: 5px 8px;
	color: #fff;
    background-color: #17a2b8;
	display: inline-block;
    padding: .25em .4em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25rem;
	font-family: 'Nanum Gothic', sans-serif;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.cards_bundle .card_container .card_body .card_intro
{
	font-family: 'Nanum Gothic', sans-serif;
	text-align: left;
	margin: 0;
	padding: 0 0.3rem;
	min-height: 4.5rem;
	max-height: 4.5rem;
	overflow-y: auto;
}
.cards_bundle .card_container .card_body .card_intro::-webkit-scrollbar
{
	width: 0.45rem;
}
.cards_bundle .card_container .card_body .card_intro::-webkit-scrollbar-thumb
{
	background-color: darkorange;
    border-radius: 0.4rem;
    background-clip: padding-box;
    border: 2px solid transparent;
}
.cards_bundle .card_container .card_body .card_intro::-webkit-scrollbar-track {
    background-color: skyblue;
    border-radius: 0.225rem;
    box-shadow: inset 0px 0px 5px white;
}
.cards_bundle .card_container .card_body .card_between
{
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.cards_bundle .card_container .card_body .card_between p
{
	margin: 0.3rem;
	padding: 0;
}


</style>

</head>
<body>
	<jsp:include page="common/mainNavigationBar.jsp" />
<section>

<c:if test="${!empty hBoardList }">
	<div class="right_container">
		<div class="right_spotlight_title">
			<h3>시끌벅적</h3>
		</div>
		<c:forEach var="b" items="${hBoardList }">
		<div class="right_spotlight_body">
			<a href="communityDetailView.do?boardNo=${b.boardNo }">
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
	<div class="main_container mento_container container">
		<div class="container_header">
			<h2 class="mt-auto mb-auto">멘토 그루밍</h2>
			<h6 class="font-weight-lighter">실력있는 멘토와 함께하는 스터디 그룹입니다.</h6>
		</div>

			<!-- 그루밍 카드 -->
			<div class="cards_bundle row text-center">
				
				<div class="card_container col-md-3">
					<div class="card_box">
						<!-- 그룹 이미지 -->
						<div class="card_header">
							<img src="${contextPath }/resources/upGroomingFiles/test.png">
							<!-- 그룹 d-day 태그 -->
							<div class="card_dDay card_dDay_green">
								<span>D-1</span>
							</div>
						</div>
						<!-- 그룹 본문 -->
						<div class="card_body">
							<!-- 그룹 제목 -->
							<div class="card_title">제목제목제목제목제목제목제목제목</div>
							<div class="card_tags">
								<span class="badge">#태그</span><span class="badge">#태그</span><span class="badge">#태그</span><span class="badge">#태그</span><span class="badge">#태그</span><span class="badge">#태그</span>
							</div>
							<!-- 그룹 한줄 소개  -->
							<div class="card_intro">한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄한줄</div>
							<div class="card_between mt-0">
								<p class="card_np">인원 1/3</p>
								<p class="card_gt">멘토</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div> <!-- 컨테이너 끝 -->

</section>

<script type="text/javascript">



/* 주소 변경 */
	$(document).ready(function() {
		history.replaceState(null, null, '${contextPath }/home.do');
	});
</script>

	<jsp:include page="common/footer.jsp" />
</body>
</html>
