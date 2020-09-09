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

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- style -->
<%-- <link href="${pageContext.servletContext.contextPath }/resources/views/css/mainnavi.css" rel="stylesheet"> --%>
<style type="text/css">
.main_navbar
{
    background-color: #fff;
    position: fixed;
    font-family: 'Jua', sans-serif;
    width: 100%;
    display: flex;
    transition: 0.6s;
    padding: 1rem 6.25rem;
	border-bottom: thin solid lightgrey;
    z-index: 1040;
}
.main_navbar .main_navbar_logo
{
	margin: 0.2rem;
}
.main_navbar .mainNavImg
{
	margin: 0.2rem;
	padding: 0.3rem;
	height: 3rem;
    transition: 0.6s;
}
.main_navbar #mainProfileArea
{
	margin-left: auto;
}
.main_navbar .proFile_img
{
	margin: auto 0.18rem;
	height: 2.18rem;
	width: 2.18rem;
	border-radius: 50%;
	border: thin solid lightgrey;
}
.main_navbar #grooming
{
	min-width: 5.02rem;
}
.main_navbar #community
{
	min-width: 6.5rem;
}
.main_navbar #studycafe
{
	min-width: 7.9rem;
}
.main_navbar #login_item
{
	min-width: 5.2rem;
}
.main_navbar #register_item
{
	min-width: 6.7rem;
}
.main_navbar #logout_item
{
	min-width: 6.6rem;
}
.main_navbar #memberNickName_item_con
{
	min-width: 6rem;
}
.main_navbar #memberNickName_item
{
	margin-left: 0;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 6rem;
}
.main_navbar ul
{
	margin-top: auto;
	margin-bottom: auto;
}
.main_navbar ul li
{
	text-align: center;
    list-style: none;
    border-bottom: thin solid white;
}
.main_navbar ul li#memberNickName_item_con
{
	line-height: 2.3rem;
}
.main_navbar ul li#logout_item
{
	line-height: 2.8rem;
}
.main_navbar ul li a
{
	font-size: 1.625rem;
    margin: 0.2rem 0.5rem;
    text-decoration: none;
    color: darkslategrey;
    letter-spacing: 1px;
    /* transition: 0.6s; */
}
.main_navbar ul li:hover
{
    border-bottom: thin solid green;
}
.main_navbar ul li:hover a
{
    color: green;
}
/* 스티키 설정 */
.main_navbar.sticky
{
    padding: 0.3125rem 12.5rem;
}
.main_navbar.sticky ul li a
{
	font-size: 1.375rem;
}
.main_navbar.sticky .mainNavImg
{
	height: 2.2rem;
	padding: 0;
}
.main_navbar.sticky #grooming
{
	min-width: 4.5rem;
}
.main_navbar.sticky #community
{
	min-width: 5.7rem;
}
.main_navbar.sticky #studycafe
{
	min-width: 6.9rem;
}
.main_navbar.sticky #login_item
{
	min-width: 5.2rem;
}
.main_navbar.sticky #register_item
{
	min-width: 6.7rem;
}
.main_navbar.sticky #logout_item
{
	min-width: 5.8rem;
}
.main_navbar.sticky .main_messages_txt,
.main_navbar.sticky .main_alerts_txt
{
	line-height: 0.85rem;
	padding: 0.25rem;
	color: white;
	width: 1.2rem;
	height: 1.2rem;
	background: #cc0000;
	border-radius: 50%;
	text-align: center;
	font-size: 1rem;
	position: absolute;
	top: -0.273rem;
	left: 1.12rem;
}
.main_navbar.sticky .main_messages_icon,
.main_navbar.sticky .main_alerts_icon
{
    margin: 0.2rem 0.7rem;
}
.main_navbar.sticky .main_messages_icon .main_naviIcon .img_svg,
.main_navbar.sticky .main_alerts_icon .main_naviIcon .img_svg
{
	width: 2rem;
	height: 2rem;
}
.main_navbar.sticky .proFile_img
{
	height: 2rem;
	width: 2rem;
}
/* 네비바 기본 스타일 끝 */
.main_navbar .main_flex
{
    display: flex;
}
.main_navbar .main_flex_between
{
	display: flex;
	justify-content: space-between;
	align-items: center;
}
/* 메시지 알림창 */
.main_navbar .main_messages_icon,
.main_navbar .main_alerts_icon
{
	cursor: pointer;
    margin: 0.2rem 0.7rem;
	padding: 0.18rem;
	position: relative;
}

.main_navbar .main_messages_icon .main_naviIcon .img_svg,
.main_navbar .main_alerts_icon .main_naviIcon .img_svg
{
	width: 2rem;
	height: 2rem;
}
.main_navbar .main_messages_icon .main_messages_txt,
.main_navbar .main_alerts_icon .main_alerts_txt
{
	line-height: 1.37rem;
	padding: 0.25rem;
	margin: 0.2rem;
	color: white;
	width: 1.58rem;
	height: 1.58rem;
	background: #cc0000;
	border-radius: 50%;
	text-align: center;
	font-size: 1.125rem;
	position: absolute;
	top: -0.3rem;
	left: 1.12rem;
}
.main_navbar .main_dropdown
{
	display: none;
	overflow: auto;
	position: absolute;
	background-color: #F9F9F9;
	min-width: 18.75rem;
	padding: 0.5rem 0;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	z-index: 10000;
}
.main_navbar .main_messages_dropdown
{
	right: 0.62rem;
}
.main_navbar .main_messages_dropdown.active,
.main_navbar .main_alerts_dropdown.active
{
	display: block;
}
.main_navbar .main_messages_header,
.main_navbar .main_alerts_header
{
	padding: 0 0.5rem;
	border-bottom: 1px solid grey; 
}
.main_navbar .main_mIcons_container
{
	display: flex;
}
.main_navbar .main_mIcons_container .main_mIcon
{
	margin-left: 0.32rem;
}
.main_navbar .main_messages_body,
.main_navbar .main_alerts_body
{
    text-align: left;
	font-weight: lighter;
	font-size: 1rem;
	width: 100%;
	display: block;
	padding: 0.5rem;
}
.main_navbar .main_messages_body_container,
.main_navbar .main_alerts_body_container
{
	overflow: auto;
    max-height: 18.75rem;
}
.main_navbar .main_messages_body > div
{
	padding: 0 0 0.19rem 0;
}
.main_navbar .main_messages_img
{
	padding: 0.25rem 0.25rem 0 0;
	height: 1.56rem;
	width: 1.56rem;
	object-fit: contain;
}
.main_navbar .main_mBody_time,
.main_navbar .main_aBody_time
{
	font-size: 0.75rem;
	min-width: auto;
	color: grey;
}
.main_navbar .main_messages_body:hover,
.main_navbar .main_alerts_body:hover
{
	background-color: #cbcbcb;
}
.main_navbar .main_messages_header .main_mIcon .img_svg,
.main_navbar .main_alerts_header .main_aIcon .img_svg
{
	width: 1.25rem;
	height: 1.25rem;
	margin: 0 0 0.62rem 0;
}
.main_navbar .main_messages_header .main_mIcon > .img_svg:hover,
.main_navbar .main_alerts_header .main_aIcon > .img_svg:hover
{
	background-color: lightgrey;
	border-radius: 50%;
	box-shadow: 0 0.5rem 1rem 0 rgba(0,0,0,0.2);
	transition: 0.2s;
}
.main_upIcon,
.main_adminIcon
{
    position: fixed;
    display: none;
	width: 1.87rem;
	height: 1.87rem;
	bottom: 3rem;
	right: 1rem;
	float:right;
	font-size: 1.25rem;
	border: none;
	outline: none;
	cursor: pointer;
}
.main_adminIcon
{
	bottom: 6rem;
    display: block;
}
.main_upIcon .img_svg,
.main_adminIcon .img_svg
{
	width: 100%;
	height: 100%;
	background-color: white;
	border-radius: 50%;
}
.main_upIcon:hover .img_svg,
.main_adminIcon:hover .img_svg
{
	background-color: lightgreen;
}
.main_upIcon.show
{
	display: block;
}
@media (min-width: 751px) and (max-width: 991px)
{
	.main_navbar { padding: 1rem 0; }
	.main_navbar.sticky { padding: 0.3125rem  3rem; }
}
@media (min-width: 651px) and (max-width: 750px)
{
	.main_navbar { padding: 1rem 0; }
	.main_navbar.sticky { padding: 0.3125rem 0; }
}
@media (min-width: 0px) and (max-width: 650px)
{
	.main_navbar { padding: 1rem 0; }
	.main_navbar.sticky { padding: 0.3125rem 0; }
	.main_navbar ul li a { font-size: 1rem; }
	.main_navbar.sticky ul li a { font-size: 1rem; }
	.main_navbar .main_flex { padding-left: 0; }
	.main_navbar .mainNavImg { height: 1.8rem; }
	.main_navbar.sticky .mainNavImg { height: 1.8rem; }
	.main_navbar #grooming { min-width: 3.6rem; }
	.main_navbar.sticky #grooming { min-width: 3.6rem; }
	.main_navbar #community { min-width: 4.5rem; }
	.main_navbar.sticky #community { min-width: 4.5rem; }
	.main_navbar #studycafe { min-width: 5.4rem; }
	.main_navbar.sticky #studycafe { min-width: 5.4rem; }
	.main_navbar #mainProfileArea .img_svg { height: 1.8rem; width: 1.8rem; }
	.main_navbar.sticky #mainProfileArea .img_svg { height: 1.8rem; width: 1.8rem; }
}
</style>
</head>
<body>
	<c:url var="mainPage" value="home.do"/>
	<c:url var="groomingMain" value="groomingMain.do">
		<c:param name="memberNo" value="${loginUser.memberNo}"/>
	</c:url>
	<c:url var="communityMain" value="communityMain.do"/>
	<c:url var="studyCafeMain" value="searchMap.do"/>
	<c:url var="loginPage" value="loginPage.do">
		<c:param name="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
	</c:url>
	<c:url var="registerPage" value="registerPage.do">
		<c:param name="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
	</c:url>
	<c:url var="myPage" value="mypage-memberup.do"/>
	<c:url var="logout" value="logout.do"/>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application" />

<!-- scroll 스크립트 -->
<script>
	window.addEventListener("scroll", function(){
		var header = document.querySelector(".main_navbar");
		var topBtn = document.querySelector(".main_upIcon");
		header.classList.toggle("sticky", window.scrollY > 0);
		
		topBtn.classList.toggle("show", window.scrollY > 100);
    });
</script>

	<!-- 탑버튼 -->
	<div class="main_upIcon" onclick="$('html, body').stop().animate({scrollTop:'0'});">
		<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-angel-up-circle-thin.svg">
	</div>
	
	<!-- 관리자 버튼 -->
	<c:if test="${sessionScope.loginUser.memberAdmin eq 'Y' }">
	<div class="main_adminIcon" onclick="location.href='adminMain.do'">
		<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-gear-thin.svg">
	</div>
	</c:if>
	<!-- Navigation -->
	<nav class="main_navbar">
		<a class="main_navbar_logo" href="${mainPage }">
			<img class="mainNavImg" alt="Groominglogo" src="${contextPath }/resources/views/images/grooming_logo(100x100).png">
		</a>
		<ul class="main_flex">
			<li id="grooming" class="main_navbar_item">
				<a class="main_navbar_link" href="${groomingMain }">그루밍</a>
			</li>
			<li id="community" class="main_navbar_item">
				<a class="main_navbar_link" href="${communityMain }">커뮤니티</a>
			</li>
			<li id="studycafe" class="main_navbar_item">
				<a class="main_navbar_link" href="${studyCafeMain }">스터디카페</a>
			</li>
		</ul>
		<ul id="mainProfileArea" class="main_flex">
			<c:if test="${empty sessionScope.loginUser }">
				<li id="login_item" class="main_navbar_item">
					<a class="main_navbar_link" href="${loginPage }">로그인</a>
				</li>
				<li id="register_item" class="main_navbar_item">
					<a class="main_navbar_link" href="${registerPage }">회원가입</a>
				</li>
			</c:if>
			<c:if test="${!empty sessionScope.loginUser }">
				<li class="main_navbar_item main_messages_icon">
					<div class="main_naviIcon">
						<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-speech-bubble-thin.svg">
					</div>
					<div class="main_messages_dropdown main_dropdown">
						<div class="main_messages_header main_flex_between">
							<span>메시지</span>
							<div class="main_mIcons_container">
								<div class="main_mIcon messageBtn">
									<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-speech-bubble-comments-thin.svg">
								</div>
								<div class="main_mIcon">
									<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-x-mark-1.svg">
								</div>
							</div>
						</div>
						<div class="main_messages_body_container">
							<div class="mbody_container">
								<div class="spinner-border text-success" role="status">
									<span class="sr-only">Loading...</span>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li class="main_navbar_item main_alerts_icon">
					<div class="main_naviIcon main_aIcon">
						<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-cat-4.svg">
					</div>
					<div class="main_alerts_dropdown main_dropdown">
						<div class="main_alerts_header main_flex_between">
							<span>알림</span>
							<div class="main_aIcon">
								<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-x-mark-1.svg">
							</div>
						</div>
						<div class="main_alerts_body_container">
							<div class="abody_container">
								<div class="spinner-border text-success" role="status">
									<span class="sr-only">Loading...</span>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li id="memberNickName_item_con" class="main_navbar_item main_flex">
					<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/upprofileFiles/${loginUser.memberPhoto }"
						onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
					<a id="memberNickName_item" class="main_navbar_link" href="${myPage }">
					${loginUser.memberNickName }</a>
				</li>
				<li id="logout_item" class="main_navbar_item">
					<a class="main_navbar_link" href="${logout }">로그아웃</a>
				</li>
			</c:if>
		</ul>
	</nav>

	<script type="text/javascript">
		$(function() {
			var loginUser = "${sessionScope.loginUser}";
			if(loginUser != ""){
				console.log("네비바 인터벌");
				getUserAlert();
				getUserMessages();

				setInterval(function(){
					getUserAlert();
					getUserMessages();
				}, 10000);
				setInterval(function(){
					refreshLoginUser();
				}, 60000);
			}
		});
	</script>

	<!-- 로그인 유저 세션 갱신 -->
	<script type="text/javascript">
		function refreshLoginUser() {
			var memberEmail = "${loginUser.memberEmail}";
			$.ajax({
				url:"refreshLoginUser.do",
				data:{memberEmail:memberEmail},
				success:function(data){
					if(data == "success"){
						console.log("로그인 유저 세션 새로고침");
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		}
	</script>

	<!-- 메시지 스크립트 -->
 	<script type="text/javascript">
 		// 채팅 페이지로 이동
 		$(".messageBtn").on("click", function() {
			location.href="messagePage.do?memberNo=${loginUser.memberNo}";
			return false;
		});

		// 메시지 카운트
		function getUserMessages() {
			var memberNo = "${loginUser.memberNo}";
			$.ajax({
				url:"getUserMessagesCount.do",
				data:{memberNo:memberNo},
				success:function(data){
					console.log("메시지 카운트 : " + data);

					if(data > 0 || data == '9+') {
						// 알림 숫자 표시
						var $messagesIcon = $(".main_messages_icon");
						var $messagesCountDiv = $("<div>").addClass("main_messages_txt").text(data);

						$messagesIcon.prepend($messagesCountDiv);
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		}

		// 메시지 읽음 fn & ajax
		(function ($) {
            $.fn.readMessage = function() {
                this.each(function() {
                    var el = $(this);

                    el.parent().on('click', '.main_messages_body', function(event) {
                        // 빈값이면 동작 멈춤
                        if($(this).find("input[type=hidden]").val() == ""){
            				console.log("메시지가 없습니다.");
            				return;
            			}

						var messageNo = el.find("input[type=hidden]").val();

            			console.log("읽을 메시지 번호" + messageNo);

            			var memberNo = "${loginUser.memberNo}";

            			// 메시지 읽음
            			$.ajax({
            				url:"readUserMessage.do",
            				data:{messageNo:messageNo,memberNo:memberNo},
            				success:function(data){
            					console.log("메시지 읽음 결과 : " + data.length);
            					refreshMessageBody(data);
            				},
            				error:function(request, status, errorData){
            					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
            				}
            			});
            			event.stopPropagation();
                    });
                });
            };
        })(jQuery);

		// 메시지 리스트 생성
		function refreshMessageBody(data) {
			$("div").remove(".mbody_container");
			// 메시지 내용 추가
			if(data.length > 0) {
				console.log("메시지 추가");
				for(var i in data){
					var $main_messages_body_container = $(".main_messages_body_container");
					var $mbody_container = $('<div>').addClass("mbody_container");
					var $messages_body = $('<div>').addClass("main_messages_body");
					var $messages_bodyInput = $('<input>').attr("type","hidden").val(data[i].messageNo);
					var $messages_Img = $('<img>').addClass("main_messages_img").attr("src","${contextPath }/resources/upprofileFiles/"+(data[i].fromMemberPhoto));
					var $messages_bodyFrom = $('<div>').addClass("main_mBody_from").text(data[i].fromMemberNickname);
					var $messages_bodyContent = $('<div>').text(data[i].messageContent);
					var $messages_bodyTime = $('<div>').addClass("main_mBody_time").text(data[i].messageDate);

					$messages_bodyFrom.prepend($messages_Img);
					$messages_body.append($messages_bodyInput);
					$messages_body.append($messages_bodyFrom);
					$messages_body.append($messages_bodyContent);
					$messages_body.append($messages_bodyTime);
					$mbody_container.append($messages_body);

					$main_messages_body_container.append($mbody_container);
				}
			} else {
				console.log("메시지 없음");
				var $main_messages_body_container = $(".main_messages_body_container");
				var $mbody_container = $('<div>').addClass("mbody_container");
				var $messages_body = $('<div>').addClass("main_messages_body");
				var $messages_bodyInput = $('<input>').attr("type","hidden").val(null);
				var $messages_bodyContent = $('<div>').text("아직 메시지가 없습니다!");

				$messages_body.append($messages_bodyInput);
				$messages_body.append($messages_bodyContent);
				$mbody_container.append($messages_body);

				$main_messages_body_container.append($mbody_container);
			}
			// 클릭 읽음 기능 추가
			$(".main_messages_body").readMessage();
		}

		// 메시지 리스트 추가
 		$(".main_messages_icon").click(function() {
			var alt_container = document.querySelector('.main_messages_dropdown');
			alt_container.classList.toggle('active');

			if($(".main_messages_dropdown").hasClass("active") === true){
				// 메시지 수 삭제
				$(".main_messages_txt").remove();

				var memberNo = "${loginUser.memberNo}";

				console.log("메시지 아이콘 클릭");
				$.ajax({
					url:"getUserMessage.do",
					data:{memberNo:memberNo},
					dateType:"json",
					success:function(data){
						console.log("메시지 확인 결과 : " + data.length);
						refreshMessageBody(data);
					},
					error:function(request, status, errorData){
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
					}
				});
			}
			return false;
		});
	</script>

	<!-- 알림 스크립트 -->
	<script type="text/javascript">
		// 알림 카운트
		function getUserAlert() {
			var memberNo = "${loginUser.memberNo}";

			$.ajax({
				url:"getUserAlertCount.do",
				data:{memberNo:memberNo},
				success:function(data){
					console.log("알림 카운트 : " + data);

					var $alertIcon = $(".main_alerts_icon");

					if(data > 0 || data == '9+') {
						// 알림 숫자 표시
						var $alertDiv = $("<div>").addClass("main_alerts_txt").text(data);

						$alertIcon.prepend($alertDiv);
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		}

		// 알림 읽음 fn & ajax
		(function ($) {
            $.fn.readAlert = function() {
                this.each(function() {
                    var el = $(this);

                    el.parent().on('click', '.main_alerts_body', function(event) {
                        // 빈값이면 동작 멈춤
                        if($(this).find("input[type=hidden]").val() == ""){
            				console.log("알림이 없습니다.");
            				return;
            			}

            			var alertNo = el.find("input[type=hidden]").val();
            			var memberNo = "${loginUser.memberNo}";

            			console.log("읽을 알람 번호 : " + alertNo);

            			// 알림 삭제
            			$.ajax({
            				url:"readUserAlert.do",
            				data:{alertNo:alertNo,memberNo:memberNo},
            				success:function(data){
            					console.log("알림 읽음 결과 : " + data.length);
            					refreshAlertBody(data);
            				},
            				error:function(request, status, errorData){
            					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
            				}
            			});
            			event.stopPropagation();
                    });
                });
            };
        })(jQuery);

		// 알림 리스트 생성
		function refreshAlertBody(data) {
			$("div").remove(".abody_container");
			// 알림 내용 추가
			if(data.length > 0) {
				console.log("알림 추가");
				for(var i in data){
					var $main_alerts_body_container = $(".main_alerts_body_container");
					var $abody_container = $('<div>').addClass("abody_container");
					var $alerts_body = $('<div>').addClass("main_alerts_body");
					var $alerts_bodyInput = $('<input>').attr("type","hidden").val(data[i].alertNo);
					var $alerts_bodyContent = $('<div>').text(data[i].alertContent);
					var $alerts_bodyTime = $('<div>').addClass("main_aBody_time").text(data[i].alertCreateDate);

					$alerts_body.append($alerts_bodyInput);
					$alerts_body.append($alerts_bodyContent);
					$alerts_body.append($alerts_bodyTime);
					$abody_container.append($alerts_body);
					
					$main_alerts_body_container.append($abody_container);
				}
			} else {
				console.log("알림 없음");
				var $main_alerts_body_container = $(".main_alerts_body_container");
				var $abody_container = $('<div>').addClass("abody_container");
				var $alerts_body = $('<div>').addClass("main_alerts_body");
				var $alerts_bodyInput = $('<input>').attr("type","hidden").val(null);
				var $alerts_bodyContent = $('<div>').text("아직 알림이 없습니다!");

				$alerts_body.append($alerts_bodyInput);
				$alerts_body.append($alerts_bodyContent);
				$abody_container.append($alerts_body);

				$main_alerts_body_container.append($abody_container);
			}
			// 클릭 읽음 기능 추가
			$(".main_alerts_body").readAlert();
		}

		// 알림 리스트 추가
 		$(".main_alerts_icon").click(function() {
			var alt_container = document.querySelector('.main_alerts_dropdown');
			alt_container.classList.toggle('active');

			if($(".main_alerts_dropdown").hasClass("active") === true){
				// 알림 수 삭제
				$("div").remove(".main_alerts_txt");

				var memberNo = "${loginUser.memberNo}";

				$.ajax({
					url:"getUserAlert.do",
					data:{memberNo:memberNo},
					dateType:"json",
					success:function(data){
						console.log("알림 확인 결과 : " + data.length);
						refreshAlertBody(data);
					},
					error:function(request, status, errorData){
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
					}
				});
			}
			return false;
		});
	</script>

</body>
</html>