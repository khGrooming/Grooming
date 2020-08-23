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
	border-radius: 14% / 50%;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	transition: 0.2s;
}
.mainNavImg
{
	height: 50px;
}
.main_messages_icon,
.main_alerts_icon
{
	cursor: pointer;
	padding: 5px 15px;
	position: relative;
}
.main_messages_icon .main_naviIcon .img_svg,
.main_alerts_icon .main_naviIcon .img_svg
{
	width: 30px;
	height: 30px;
}
.main_alerts_icon .main_naviIcon > .img_svg:hover,
.main_messages_icon .main_naviIcon > .img_svg:hover
{
	background-color: #F9F9F9;
	border-radius: 50%;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	transition: 0.2s;
}
.main_messages_txt,
.main_alerts_txt
{
	padding: 4px;
	color: white;
	width: 25px;
	height: 25px;
	background: #cc0000;
	border-radius: 50%;
	font-size: 18px;
	position: absolute;
	top: -5px;
	left: 31px;
}
.main_messages_dropdown
{
	/* display: none; */
	right: 0;
	overflow: auto;
	position: absolute;
	border-radius: 5px;
	background-color: #F9F9F9;
	min-width: 300px;
	padding: 8px 0;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}
.main_alerts_dropdown
{
	display: none;
	overflow: auto;
	position: absolute;
	border-radius: 5px;
	background-color: #F9F9F9;
	min-width: 300px;
	padding: 8px 0;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
.main_navbar .proFile_img
{
	height: 35px;
	width: 35px;
	border-radius: 50%;
	border: 1px solid grey;
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

	<!-- Navigation -->
	<nav class="main_navbar navbar navbar-expand-sm navbar-light font-weight-bold h5 fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${mainPage }">
				<img class="mainNavImg" alt="groominglogo" src="${contextPath }/resources/views/images/grooming_logo(100x100).png">
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
					<li class="nav-item main_messages_icon" onclick="messageChk()">
						<div class="main_naviIcon">
							<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-speech-bubble-thin.svg">
						</div>
						<div class="main_messages_dropdown">
							<div class="main_messages_header d-flex justify-content-between align-items-center">
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
					<li class="nav-item main_alerts_icon mr-2">
						<div class="main_naviIcon main_aIcon">
							<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-cat-4.svg">
						</div>
						<div class="main_alerts_dropdown">
							<div class="main_alerts_header d-flex justify-content-between align-items-center">
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
					<li class="nav-item mr-2 d-flex justify-content-between align-items-center">
						<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/upprofileFiles/${loginUser.memberPhoto }"
							onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
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
		function messageChk() {
			var msg_container = document.querySelector('.main_messages_dropdown');
			msg_container.classList.toggle('active');
			return false;
		}
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
						var $messagesCountDiv = $("<div>").addClass("main_messages_txt text-center").text(data);

						$messagesIcon.prepend($messagesCountDiv);
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		}

		// 메시지 리스트 생성
		function refreshMessageBody(data) {
			var $messages_dropdown = $(".main_messages_body");
			var $messages_dropdown_container = $(".main_messages_body_container");
			$messages_dropdown_container.html("");
			
			// 메시지 내용 추가
			if(data.length > 0) {
				for(var i in data){
					console.log("메시지 추가 시작");
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
					
					$messages_dropdown_container.append($messages_body);
				}
			} else {
				var $messages_body = $('<div>').addClass("main_messages_body");
				var $messages_bodyInput = $('<input>').attr("type","hidden").val(null);
				var $messages_bodyContent = $('<div>').text("아직 메시지가 없습니다!");
				
				$messages_body.append($messages_bodyInput);
				$messages_body.append($messages_bodyContent);
				
				$messages_dropdown_container.append($messages_body);
			}
		}

		// 메시지 리스트 불러오기 ajax
		$(".main_messages_icon").on("click",function(){
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
		});

		// 메시지 읽음 ajax
		$(".main_messages_body").on("click",function(e){
			console.log($(this));
			if($(this).find("input[type=hidden]").val() == ""){
				console.log("메시지가 없습니다.");
				return false;
			}
			
			var messagBody = $(this);
			var messageNo = $(this).find("input[type=hidden]").val();

			console.log("읽을 메시지 번호" + messageNo);
			
			// 메시지 삭제
			$.ajax({
				url:"readUserMessage.do",
				data:{messagesNo:memberNo,memberNo:memberNo},
				success:function(data){
					console.log("메시지 읽음 결과 : " + data.length);
					refreshMessageBody(data);
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
			
			return false;
			// 이벤트 전파 막기(창닫기x)
			e.stopPropagation();
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
						var $alertDiv = $("<div>").addClass("main_alerts_txt text-center").text(data);

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

                    el.parent().on('click', '.main_alerts_body', function () {
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
                    });
                });
            };
        })(jQuery);

		// 알림 리스트 생성
		function refreshAlertBody(data) {
			console.log("알림 추가 시작");
			$("div").remove(".main_alerts_body");
			// 알림 내용 추가
			if(data.length > 0) {
				for(var i in data){
					var $alerts_dropdown = $(".main_alerts_dropdown");
					var $alerts_body = $('<div>').addClass("main_alerts_body");
					var $alerts_bodyInput = $('<input>').attr("type","hidden").val(data[i].alertNo);
					var $alerts_bodyContent = $('<div>').text(data[i].alertContent);
					var $alerts_bodyTime = $('<div>').addClass("main_aBody_time").text(data[i].alertCreateDate);
					
					$alerts_body.append($alerts_bodyInput);
					$alerts_body.append($alerts_bodyContent);
					$alerts_body.append($alerts_bodyTime);
					
					$alerts_dropdown.append($alerts_body);
				}
			} else {
				var $alerts_dropdown = $(".main_alerts_dropdown");
				var $alerts_body = $('<div>').addClass("main_alerts_body");
				var $alerts_bodyInput = $('<input>').attr("type","hidden").val(null);
				var $alerts_bodyContent = $('<div>').text("아직 알림이 없습니다!");
				
				$alerts_body.append($alerts_bodyInput);
				$alerts_body.append($alerts_bodyContent);
				
				$alerts_dropdown.append($alerts_body);
			}
			$(".main_alerts_body").readAlert();
			/* $(".main_alerts_body").on("click",function() {
				readAlert();
			}); */
		}

		// 알림 리스트 추가
 		$(".main_aIcon").click(function() {
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