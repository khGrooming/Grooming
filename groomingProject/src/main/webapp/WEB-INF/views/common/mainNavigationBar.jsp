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
header
{
    font-family: 'Jua', sans-serif
}
.main_navbar
{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: 0.6s;
    padding: 20px 100px;
	border-bottom: 1px solid lightgrey;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 10;
}
.main_navbar .main_navbar_logo
{
	margin-top: auto;
	margin-bottom: auto;
}
.main_navbar .mainNavImg
{
	padding: 3px;
	height: 50px;
    transition: 0.6s;
}
.main_navbar #mainProfileArea
{
	margin-left: auto;
}
.main_navbar .proFile_img
{
	margin-top: auto;
	margin-bottom: auto;
	margin-left: 3px;
	height: 35px;
	width: 35px;
	border-radius: 50%;
	border: 1px solid grey;
}
.main_navbar ul,
.main_navbar ul#mainProfileArea
{
	margin-top: auto;
	margin-bottom: auto;
}
.main_navbar ul li
{
    list-style: none;
}
.main_navbar ul li a
{
	font-size: 26px;
    margin: 0 15px;
    text-decoration: none;
    color: black;
    letter-spacing: 1px;
    transition: 0.6s;
}
.main_navbar ul li:hover
{
    border: thin solid green;
	outline: thin solid lightyellow;
    border-radius: 3px;
}
.main_navbar ul li:hover a
{
    color: green;
}
.main_navbar.sticky
{
    padding: 5px 200px;
}
.main_navbar.sticky ul li a
{
	font-size: 22px;
}
.main_navbar.sticky .mainNavImg
{
	height: 25px;
}
/* 네비바 기본 스타일 끝 */
.main_navbar .main_flex_between_center
{
    display: flex;
    justify-content: space-between;
	align-content: center;
}
/* 메시지 알림창 */
.main_messages_icon,
.main_alerts_icon
{
	cursor: pointer;
	margin-top: auto;
	margin-bottom: auto;
	margin-left: 15px;
	margin-right: 15px;
	padding: 3px;
	position: relative;
}
.main_messages_icon .main_naviIcon .img_svg,
.main_alerts_icon .main_naviIcon .img_svg
{
	width: 28px;
	height: 28px;
}
.main_messages_txt,
.main_alerts_txt
{
	line-height: 20px;
	padding: 4px;
	color: white;
	width: 25px;
	height: 25px;
	background: #cc0000;
	border-radius: 50%;
	text-align: center;
	font-size: 18px;
	position: absolute;
	top: -5px;
	left: 31px;
}
.main_dropdown
{
	display: none;
	overflow: auto;
	position: absolute;
	border-radius: 5px;
	background-color: #F9F9F9;
	min-width: 300px;
	padding: 8px 0;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	z-index: 10000;
}
.main_messages_dropdown
{
	right: 10px;
}
.main_messages_dropdown.active,
.main_alerts_dropdown.active
{
	display: block;
}
.main_messages_header,
.main_alerts_header
{
	padding: 0 8px;
	border-bottom: 1px solid grey; 
}
.main_mIcons_container
{
	display: flex;
}
.main_mIcons_container .main_mIcon
{
	margin-left: 5px;
}
.main_messages_body,
.main_alerts_body
{
	font-weight: lighter;
	font-size: 16px;
	width: 100%;
	display: block;
	padding: 8px;
}
.main_messages_body > div
{
	padding: 0 0 3px 0;
}
.main_messages_img
{
	padding: 4px 4px 0 0;
	height: 25px;
	width: 25px;
	object-fit: contain;
}
.main_mBody_time,
.main_aBody_time
{
	font-size: 12px;
	min-width: auto;
	color: grey;
}
.main_messages_body:hover,
.main_alerts_body:hover
{
	background-color: #cbcbcb;
}
.main_messages_header .main_mIcon .img_svg,
.main_alerts_header .main_aIcon .img_svg
{
	width: 20px;
	height: 20px;
	margin: 0 0 10px 0;
}
.main_messages_header .main_mIcon > .img_svg:hover,
.main_alerts_header .main_aIcon > .img_svg:hover
{
	background-color: lightgrey;
	border-radius: 50%;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	transition: 0.2s;
}
header .main_upIcon
{
	display: none;
	position: fixed;
	bottom: 30px;
	right: 30px;
	z-index: 99;
	font-size: 18px;
	border: none;
	outline: none;
	cursor: pointer;
}
header .main_upIcon .img_svg
{
	width: 30px;
	height: 30px;
}
header .main_upIcon.show
{
	display: block;
}
</style>
</head>
<body>
	<c:url var="mainPage" value="home.do"/>
	<c:url var="groomingMain" value="groomingMain.do"/>
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
	<header>
	<!-- Navigation -->
	<nav class="main_navbar">
		<a class="main_navbar_logo" href="${mainPage }">
			<img class="mainNavImg" alt="Groominglogo" src="${contextPath }/resources/views/images/grooming_logo(100x100).png">
		</a>
		<ul class="main_flex_between_center">
			<li class="main_navbar_item">
				<a class="main_navbar_link" href="${groomingMain }">그루밍</a>
			</li>
			<li class="main_navbar_item">
				<a class="main_navbar_link" href="${communityMain }">커뮤니티</a>
			</li>
			<li class="main_navbar_item">
				<a class="main_navbar_link" href="${studyCafeMain }">스터디카페</a>
			</li>
		</ul>
		<ul id="mainProfileArea" class="main_flex_between_center">
			<c:if test="${empty sessionScope.loginUser }">
				<li class="main_navbar_item">
					<a class="main_navbar_link" href="${loginPage }">로그인</a>
				</li>
				<li class="main_navbar_item">
					<a class="main_navbar_link" href="${registerPage }">회원가입</a>
				</li>
			</c:if>
			<c:if test="${!empty sessionScope.loginUser }">
				<li class="main_navbar_item main_messages_icon">
					<div class="main_naviIcon">
						<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-speech-bubble-thin.svg">
					</div>
					<div class="main_messages_dropdown main_dropdown">
						<div class="main_messages_header main_flex_between_center">
							<span>메시지</span>
							<div class="main_mIcons_container">
								<div class="main_mIcon">
									<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-speech-bubble-comments-thin.svg">
								</div>
								<div class="main_mIcon">
									<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-x-mark-1.svg">
								</div>
							</div>
						</div>
						<div class="main_messages_body_container">
							<div class="main_messages_body">
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
						<div class="main_alerts_header main_flex_between_center">
							<span>알림</span>
							<div class="main_aIcon">
								<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-x-mark-1.svg">
							</div>
						</div>
						<div class="main_alerts_body">
							<div class="spinner-border text-success" role="status">
								<span class="sr-only">Loading...</span>
							</div>
						</div>
					</div>
				</li>
				<li class="main_navbar_item main_flex_between_center">
					<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/upprofileFiles/${loginUser.memberPhoto }"
						onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
					<a class="main_navbar_link" href="${myPage }">${loginUser.memberNickName }</a>
				</li>
				<li class="main_navbar_item">
					<a class="main_navbar_link" href="${logout }">로그아웃</a>
				</li>
			</c:if>
		</ul>
	</nav>
	<div class="main_upIcon" onclick="$('html, body').stop().animate({scrollTop:'0'});">
		<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-angel-up-circle-thin.svg">
	</div>
	</header>
	<script type="text/javascript">
		<c:if test="${!empty sessionScope.loginUser }">
		let memberNo = "${loginUser.memberNo}";
		$(function() {
			getUserAlert();
			getUserMessages();
			
			// 디버깅 때 테스트
			/* setInterval(function(){
				getUserAlert();
				getUserMessages();
			}, 100000); */
		});
		</c:if>
	</script>
	
	<!-- 메시지 스크립트 -->
 	<script type="text/javascript">
		// 메시지 카운트
		function getUserMessages() {
			$.ajax({
				url:"getUserMessagesCount.do",
				data:{memberNo:memberNo},
				success:function(data){
					console.log("메시지 카운트 : " + data);
					
					var $messagesIcon = $(".main_messages_icon");
					
					if(data > 0) {
						// 알림 숫자 표시
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
        			console.log($(this));
                    var el = $(this);

                    el.parent().on('click', '.main_messages_body', function(event) {
                        console.log(el.val());
                        // 빈값이면 동작 멈춤
                        if($(this).find("input[type=hidden]").val() == ""){
            				console.log("메시지가 없습니다.");
            				return;
            			}

						var messageNo = el.find("input[type=hidden]").val();

            			console.log("읽을 메시지 번호" + messageNo);
            			
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
			$("div").remove(".main_messages_body");
			// 메시지 내용 추가
			if(data.length > 0) {
				console.log("메시지 추가");
				for(var i in data){
					var $messages_dropdown = $(".main_messages_dropdown");
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
					
					$messages_dropdown.append($mbody_container);
				}
			} else {
				console.log("메시지 없음");
				var $messages_dropdown = $(".main_messages_dropdown");
				var $mbody_container = $('<div>').addClass("mbody_container");
				var $messages_body = $('<div>').addClass("main_messages_body");
				var $messages_bodyInput = $('<input>').attr("type","hidden").val(null);
				var $messages_bodyContent = $('<div>').text("아직 메시지가 없습니다!");
				
				$messages_body.append($messages_bodyInput);
				$messages_body.append($messages_bodyContent);
				$mbody_container.append($messages_body);

				$messages_dropdown.append($mbody_container);
			}
			// 클릭 읽음 기능 추가
			$(".main_messages_body").readMessage();
		}

		// 알림 리스트 추가
 		$(".main_messages_icon").click(function() {
			var alt_container = document.querySelector('.main_messages_dropdown');
			alt_container.classList.toggle('active');

			if($(".main_messages_dropdown").hasClass("active") === true){
				// 메시지 수 삭제
				$(".main_messages_txt").remove();
	
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
			$.ajax({
				url:"getUserAlertCount.do",
				data:{memberNo:memberNo},
				success:function(data){
					console.log("알림 카운트 : " + data);

					var $alertIcon = $(".main_alerts_icon");

					if(data > 0) {
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
        			console.log($(this));
                    var el = $(this);

                    el.parent().on('click', '.main_alerts_body', function(event) {
                        console.log(el.val());
                        // 빈값이면 동작 멈춤
                        if($(this).find("input[type=hidden]").val() == ""){
            				console.log("알림이 없습니다.");
            				return;
            			}

            			var alertNo = el.find("input[type=hidden]").val();

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
			$("div").remove(".main_alerts_body");
			// 알림 내용 추가
			if(data.length > 0) {
				console.log("알림 추가");
				for(var i in data){
					var $alerts_dropdown = $(".main_alerts_dropdown");
					var $abody_container = $('<div>').addClass("abody_container");
					var $alerts_body = $('<div>').addClass("main_alerts_body");
					var $alerts_bodyInput = $('<input>').attr("type","hidden").val(data[i].alertNo);
					var $alerts_bodyContent = $('<div>').text(data[i].alertContent);
					var $alerts_bodyTime = $('<div>').addClass("main_aBody_time").text(data[i].alertCreateDate);
					
					$alerts_body.append($alerts_bodyInput);
					$alerts_body.append($alerts_bodyContent);
					$alerts_body.append($alerts_bodyTime);
					$abody_container.append($alerts_body);
					
					$alerts_dropdown.append($abody_container);
				}
			} else {
				console.log("알림 없음");
				var $alerts_dropdown = $(".main_alerts_dropdown");
				var $abody_container = $('<div>').addClass("abody_container");
				var $alerts_body = $('<div>').addClass("main_alerts_body");
				var $alerts_bodyInput = $('<input>').attr("type","hidden").val(null);
				var $alerts_bodyContent = $('<div>').text("아직 알림이 없습니다!");
				
				$alerts_body.append($alerts_bodyInput);
				$alerts_body.append($alerts_bodyContent);
				$abody_container.append($alerts_body);
				
				$alerts_dropdown.append($abody_container);
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