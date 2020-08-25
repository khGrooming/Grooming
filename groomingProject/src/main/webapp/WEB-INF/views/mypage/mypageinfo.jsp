<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css"
	integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX"
	crossorigin="anonymous">

<%-- <link href="${pageContext.servletContext.contextPath }/resources/views/css/memberLoginRegistration.css" rel="stylesheet"> --%>

<style type="text/css">
* {
 font-family: 'Jua', sans-serif;
	margin: 0;
	padding: 0;
	/* box-sizind: border-box; */
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
	height: 100%;
}

.profile_my {
	margin-top: 10%;
	height: 110px;
}

#memo {
	width: 75%;
	margin-left: auto;
	margin-right: auto;
	height: 100px;
}

#memoTextArea {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	height: 90px;
	font-size: 12px;
}

#expBox {
	width: 75%;
	height: 15px;
	margin-top: 1%;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 3%;
	border: 1px solid gray;
	text-align: center;
}

#expBar {
	width: 25%;
	height: 13px;
	background-color: yellow;
	position: absolute;
}

.profile_img {
	width: 100px;
	transform: translate(-50%);
	height: 100px;
	border-radius: 50%;
	position: absolute;
}

.grayBox {
	height: 50px;
	border: 1px solid lightgray;
	border-radius: 12px;
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

#fileView {
	width: 155px;
	height: 155px;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid gray;
}

#test {
	margin-top:5px;
	text-align: center;
}

#test ul ul {
	display: none;
}

#test ul li:hover>ul {
	display: block;
}

#test ul {
       width: 90%;
	list-style: none;
	position: relative;
	display: inline-table;
}

#test ul:after {
	content: "";
	clear: both;
	display: block;
}

#test ul li {
	float: left;
	margin-left: 3%;
	margin-right: 3%;
	
}

#test ul li :hover {
}

#test ul li a {
	width:120px;
	display: block;
	padding: 10px;
	color : #757575;
	text-decoration: none;
	margin: 0 10px;
}

#test ul ul {
	width:20%;
	position: absolute;
	padding:1%;
	border: 1px solid rgba(229, 229, 229, 1); 
	border-radius: 10px;
	background:white;
	top: 100%;
	z-index: 50;
}

#test ul ul li {
	float: none;
	position: relative;
}

#test ul ul li a {
	color: gray;
}
#test ul ul li a:hover {
	color: black;
	
	border-bottom:1px solid gray; 
}

</style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />
	
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />

	<c:if test="${!empty loginUser }">
		



		<div class="subContent_my"
			style="width: 70%; height: 50px; border: 1px solid rgba(229, 229, 229, 1); border-radius: 10px; margin-top: 6%; margin-left: auto; margin-right: auto; position: r">
			
			<div class="menubar">
				<div  id="test">
					<ul >
						<li><a href="mypage-memberup.do">개인정보</a>
							<ul>
								<li><a href="mypage-memberup.do">개인정보수정</a></li>
								<li><a href="mentor.do">멘토등록</a></li>
								<li><a href="memberSecession.do">탈퇴하기</a></li>
							</ul>
						</li>
						<li><a href="mpgrooming.do">스터디</a>
							<ul>
								<li><a href="opengrooming.do">개설한 스터디</a></li>
								
								<li><a href="GHeart.do">찜목록</a></li>
								<li><a href="gApplicant.do">신청내역</a></li>
								<li><a href="ginsertTemp.do">작성내역</a></li>
							</ul>
						</li>
						<li><a href="#">활동내역</a>
							<ul>
								<li><a href="#">내가 쓴 글</a></li>
								<li><a href="#">내가 쓴 댓글</a></li>
							</ul>
						</li>
						<li><a href="#">포인트</a></li>
					</ul>
				</div>
			</div>
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