<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grooming</title>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png">


<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css"
	integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX"
	crossorigin="anonymous">
<!-- Bootstrap4 TagsInput -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.css" rel="stylesheet">

<style type="text/css">
* {
 font-family: 'Jua', sans-serif;
	margin: 0;
	padding: 0;
	/* box-sizind: border-box; */
}
body{
	min-width: 1330px;
}
section {
	position: relative;
	min-height: 91vh;
	/* background: #fee648; */
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

#profileImg {
	cursor: Pointer;
}

#content_my {
	margin-right: auto;
	margin-left: 5%;
}

.subContent_my {
	/* height: 100%; */
}






#counter {
	float: right;
	margin-bottom: 0.5em;
	background: rgba(224, 224, 224, 1);
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
}

.submenu {
	display: inline-block;
	/* background:yellowgreen; */
	font-size: 15px;
	text-align: center;
	line-height: 50px;
	width: 10%;
	height: 50px;
	margin-left: 5%;
	margin-right: 5%;
}

.submenu a {
	color: black;
	text-decoration: none
}

.a {
	display: none;
}

.specTd {
	font-size: 12px;
	white-space: pre;
}

.modelForm {
	width: 100px;
	height: 150px;
	border: 1px solid black;
	margin-left: auto;
	margin-right: auto;
}




.myPage_navbar{
	display: inline-block;
	margin:3% 15%;
}



.submenubar nav {
	position: relative;
	display: flex;
	justify-content: center;
	box-sizing: border-box;
}


.submenubar nav::before {
	position: absolute;
	top: 5%;
	left: 0;
	width: 100%;
	color: black;
	font: 400 24px/1;
	text-align: center;
}


/* common */
.submenubar nav ul {
	position: relative;
	margin: 0;
	padding: 0;
	list-style: none;
}
.submenubar nav ul::after {
	display: block;
	clear: both;
}
.submenubar nav ul li {
	position: relative;
	float: left;
	border: 1px solid gray;
	background:white;
	z-index: 100;
}
.submenubar nav ul li:not(:first-child) {
	border-left: none;
}
.submenubar nav ul li:hover {
	
	background:white;
}

.submenubar nav ul li a {
	display: inline-block;
	padding: 0.7em 4em;
	color: black;
	font: 400 18px/1;
	text-align: center;
	text-decoration: none;
	white-space: nowrap;
}
.submenubar nav ul ul {
	position: absolute;
	top: 100%;
	left: -2px;
}

.submenubar nav ul ul li {
	float: none;
	margin: 0;
}
.submenubar nav ul ul li:not(:first-child) {
	border: 1px solid gray;
	background:white;
	border-top: none;
}
.submenubar nav ul ul ul {
	position: absolute;
	top: -2px;
	left: 100%;
}

/* DEMO #2 */
.submenubar .nav02 ul ul {
	visibility: hidden;
	opacity: 0;
	transition: .2s ease-in-out;
}
.submenubar .nav02 ul li:hover > ul {
	visibility: visible;
	opacity: 1;
}



</style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />
	 
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />

	<c:if test="${!empty loginUser }">

		<div class="subContent_my myPage_navbar"
			style="width: 70%; height: 50px; border-radius: 10px; margin-top: 7%; ">

			<div class="submenubar">
    <nav class="nav02">
        <ul>
            <li><a href="mypage-memberup.do">개인정보</a>
            	<ul>
                    <li><a href="mypage-memberup.do">개인정보 수정</a></li>
                    <li><a href="mentor.do">멘토 등록</a></li>
                    <li><a href="memberSecession.do">회원 탈퇴</a></li>
                    <!-- <li><a href="test.do">테스트</a></li> -->
                  
                </ul>
            </li>
            <li>
                <a href="mpgrooming.do">스터디</a>
                <ul>
                	
                    <li><a href="mpgrooming.do">진행중인스터디</a></li>
                    <li><a href="opengrooming.do">개설한 스터디</a></li>
                    <li><a href="GHeart.do">찜목록</a></li>
                    <li><a href="gApplicant.do">신청내역</a></li>
                </ul>
            </li>
             <li>
                <a href="mypageCommunity.do">활동내역</a>
                <ul>
                    <li><a href="mypageCommunity.do">내가 쓴 글</a></li>
                    <li><a href="mypageReply.do">내가 쓴 댓글</a></li>
                </ul>
            </li>
            <li><a href="mypagePoint.do">포인트</a></li>
        </ul>
    </nav>
</div>
		</div>


		<script>
			$(".submenu").on("click", function() {
				var clickId = $(this).attr("id");
				$(".a").css("display", "none");
				$(".s").css("background", "white");

				switch (clickId) {
				case "menu1":
					$("#menu1").css("background", "gray");
					$("#a1").css("display", "block");
					break;
				case "menu2":
					$("#menu2").css("background", "gray");
					$("#a2").css("display", "block");
					break;
				case "menu3":
					$("#menu3").css("background", "gray");
					$("#a3").css("display", "block");
					break;
				case "menu4":
					$("#menu4").css("background", "gray");
					$("#a4").css("display", "block");
					break;
				case "menu5":
					$("#menu5").css("background", "gray");
					$("#a5").css("display", "block");
					break;

				default:
					alert('선택한 값이 없습니다.');
					break;
				}

			})
		</script>
	</c:if>
	<c:if test="${empty loginUser}">
		<h3>정보 없음</h3>
	</c:if>

	

	<!-- /.container -->





		


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js"
		integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J"
		crossorigin="anonymous"></script>

</body>
</html>