<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">

<title>main navigation bar</title>

<!-- 폰트 (https://fonts.google.com/specimen/Jua?subset=korean&sidebar.open=true&selection.family=Jua) -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- style -->
<%-- <link href="${pageContext.servletContext.contextPath }/resources/views/css/mainnavi.css" rel="stylesheet"> --%>

<style type="text/css">
/* font start */
*
{
	font-family: 'Jua', sans-serif;
}
/* font end */
.main_navbar
{
	border-bottom: 1px solid;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}
.nav-link:hover
{
	background-color: #F9F9F9;
	border-radius: 15% / 50%;
	font-size: 1.5rem;
	padding: 0.5rem 1.3rem;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	transition: 0.2s;
}
.mainNavImg
{
	height: 50px;
}
.main_messages_icon, .main_alerts_icon
{
	cursor: pointer;
	padding: 0 15px 0 15px;
	position: relative;
}
.main_messages_icon, .main_alerts_icon .main_alert_dropdown
{
	position: relative;
}
.main_messages_icon svg,
.main_alerts_icon svg
{
	width: 38px;
	height: 38px;
	fill: grey;
}
.main_alerts_icon svg:hover
{
	background-color: #F9F9F9;
	border-radius: 50%;
	padding: 5px;
	width: 40px;
	height: 40px;
	fill: drak;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	transition: 0.2s;
}
.main_messages_icon svg:hover
{
	background-color: #F9F9F9;
	border-radius: 30%;
	padding: 5px;
	width: 40px;
	height: 40px;
	fill: drak;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	transition: 0.2s;
}
.main_messages_txt, .main_alerts_txt
{
	padding: 4px;
	color: white;
	width: 25px;
	height: 25px;
	background: #cc0000;
	border-radius: 50%;
	font-size: 18px;
	position: absolute;
	transform: translateY(-40%);
	left: 38px;
}
.main_alerts_dropdown
{
	display: none;
	position: absolute;
	border-radius: 5px;
	background-color: #F9F9F9;
	min-width: 300px;
	padding: 8px 0;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}
.main_alerts_dropdown.active
{
	display: block;
}
.main_alerts_header
{
	padding: 0 8px;
	border-bottom: 1px solid grey; 
}
.main_alerts_body
{
	font-size: 16px;
	width: 100%;
	display: block;
	padding: 8px;
}
.main_aBody_time
{
	font-size: 12px;
	min-width: auto;
	color: grey;
}
.main_alerts_body:hover
{
	background-color: #cbcbcb;
}
.main_alerts_header svg
{
	width: 14px;
	height: 14px;
	fill: grey;
	margin: 0 0 10px 0;
}
</style>
</head>
<body>
	<c:url var="mainPage" value="home.do"/>
	<c:url var="groomingMain" value="groomingMain.do"/>
	<c:url var="communityMain" value="communityMain.do"/>
	<c:url var="studyCafeMain" value="searchMap.do"/>
	<c:url var="loginPage" value="loginPage.do">
-		<c:param name="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
	</c:url>
	<c:url var="registerPage" value="registerPage.do">
-		<c:param name="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
	</c:url>
	<c:url var="myPage" value="mypage-memberup.do"/>
	<c:url var="logout" value="logout.do"/>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />

	<!-- Navigation -->
	<nav class="main_navbar navbar navbar-expand-sm navbar-light font-weight-bold h5 fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${mainPage }">
				<img class="mainNavImg" alt="groominglogo"
				src="${contextPath }/resources/views/images/grooming_logo(100x100).png">
			</a>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="${groomingMain }">그루밍</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${communityMain }">커뮤니티</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${studyCafeMain }">스터디카페</a>
				</li>
			</ul>
			<ul id="mainProfileArea" class="navbar-nav ml-auto">
				<c:if test="${empty sessionScope.loginUser }">
					<li class="nav-item">
						<a class="nav-link" href="${loginPage }">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${registerPage }">회원가입</a>
					</li>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser }">
					<li class="nav-item main_messages_icon">
						<div class="main_messages_txt text-center">${msg.count }</div>
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-envelope" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383l-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"/>
						</svg>
					</li>
					<li class="nav-item main_alerts_icon mr-2" onclick="openUserAlertToggle()">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bell" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2z"/>
							<path fill-rule="evenodd" d="M8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
						</svg>
						<div class="main_alerts_dropdown">
							<div class="main_alerts_header d-flex justify-content-between align-items-center">
								<span>알림</span>
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M24 20.188l-8.315-8.209 8.2-8.282-3.697-3.697-8.212 8.318-8.31-8.203-3.666 3.666 8.321 8.24-8.206 8.313 3.666 3.666 8.237-8.318 8.285 8.203z"/></svg>
							</div>
							<div class="main_alerts_body_container">
								<div class="main_alerts_body">
									<div class="spinner-border text-success" role="status">
										<span class="sr-only">Loading...</span>
									</div>
								</div>
							</div>
						</div>
						
					</li>
					<li class="nav-item mr-2">
						<a class="nav-link" href="${myPage }">${loginUser.memberNickName }</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${logout }">로그아웃</a>
					</li>
				</c:if>
			</ul>
		</div>
	</nav>
	
	<script type="text/javascript">
		<c:if test="${!empty sessionScope.loginUser }">
		$(function() {
			getUserAlert();
		});
		</c:if>
		
		function openUserAlertToggle() {
			var container = document.querySelector('.main_alerts_dropdown');
			container.classList.toggle('active');
			
			
			$(".main_alerts_txt").remove();
		}
		
		function refreshAlertBody(data) {
			var $alerts_dropdown = $(".main_alerts_body");
			var $alerts_dropdown_container = $(".main_alerts_body_container");
			$alerts_dropdown_container.html("");
			
			// 알림 내용 추가
			if(data.length > 0) {
				for(var i in data){
					console.log("알림 추가 시작");
					var $alerts_body = $('<div>').addClass("main_alerts_body");
					var $alerts_bodyInput = $('<input>').attr("type","hidden").val(data[i].alertNo);
					var $alerts_bodyContent = $('<div>').text(data[i].alertContent);
					var $alerts_bodyTime = $('<div>').addClass("main_aBody_time").text(data[i].alertCreateDate);
					
					$alerts_body.append($alerts_bodyInput);
					$alerts_body.append($alerts_bodyContent);
					$alerts_body.append($alerts_bodyTime);
					
					$alerts_dropdown_container.append($alerts_body);
				}
			} else {
				var $alerts_body = $('<div>').addClass("main_alerts_body");
				var $alerts_bodyInput = $('<input>').attr("type","hidden").val(null);
				var $alerts_bodyContent = $('<div>').text("아직 알림이 없습니다!");
				var $alerts_bodyTime = $('<div>').addClass("main_aBody_time");
				
				$alerts_body.append($alerts_bodyInput);
				$alerts_body.append($alerts_bodyContent);
				$alerts_body.append($alerts_bodyTime);
				
				$alerts_dropdown_container.append($alerts_body);
			}
		}
		
		$(".main_alerts_body_container").on("click",function(){
			var memberNo = "${loginUser.memberNo}";
			var alertBody = $(this);
			var alertNo = $(this).find("input[type=hidden]").val();

			console.log("삭제할 알람 번호" + alertNo);

			// 알림 삭제
			$.ajax({
				url:"deleteUserAlert.do",
				data:{alertNo:alertNo,memberNo:memberNo},
				success:function(data){
					console.log("알림 확인 결과 : " + data.length);
					refreshAlertBody(data);
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
			
			
			event.stopPropagation();
		});
		
		$(".main_alerts_icon").on("click",function(){
			var memberNo = "${loginUser.memberNo}";
			$.ajax({
				url:"getUserAlert.do",
				data:{memberNo:memberNo},
				dateType:"json",
				success:function(data){
					console.log("알림 확인 결과 : " + data.length);
					var $alerts_dropdown = $(".main_alerts_body");
					var $alerts_dropdown_container = $(".main_alerts_body_container");
					$alerts_dropdown_container.html("");
					
					// 알림 내용 추가
					if(data.length > 0) {
						for(var i in data){
							console.log("알림 추가 시작");
							var $alerts_body = $('<div>').addClass("main_alerts_body");
							var $alerts_bodyInput = $('<input>').attr("type","hidden").val(data[i].alertNo);
							var $alerts_bodyContent = $('<div>').text(data[i].alertContent);
							var $alerts_bodyTime = $('<div>').addClass("main_aBody_time").text(data[i].alertCreateDate);
							
							$alerts_body.append($alerts_bodyInput);
							$alerts_body.append($alerts_bodyContent);
							$alerts_body.append($alerts_bodyTime);
							
							$alerts_dropdown_container.append($alerts_body);
						}
					} else {
						var $alerts_body = $('<div>').addClass("main_alerts_body");
						var $alerts_bodyInput = $('<input>').attr("type","hidden").val(null);
						var $alerts_bodyContent = $('<div>').text("아직 알림이 없습니다!");
						var $alerts_bodyTime = $('<div>').addClass("main_aBody_time");
						
						$alerts_body.append($alerts_bodyInput);
						$alerts_body.append($alerts_bodyContent);
						$alerts_body.append($alerts_bodyTime);
						
						$alerts_dropdown_container.append($alerts_body);
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		});
		
		// 알림 카운트
		function getUserAlert() {
			var memberNo = "${loginUser.memberNo}";
			$.ajax({
				url:"getUserAlertCount.do",
				data:{memberNo:memberNo},
				success:function(data){
					console.log("알림 카운트 : " + data);
					
					
					var $alertIcon = $(".main_alerts_icon");
					
					if(data >= 10) {
						alertCount = "9+";
					}
					
					if(data > 0) {
						// 알림 숫자 표시
						var $alertDiv = $("<div>").addClass("main_alerts_txt text-center").text(data);

						$alertIcon.prepend($alertDiv);
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		}
	</script>

</body>
</html>