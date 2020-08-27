<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Grooming</title>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png">

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<%-- <link href="${pageContext.servletContext.contextPath }/resources/views/css/memberLoginRegistration.css" rel="stylesheet"> --%>
<style type="text/css">
<!-- 기본 스타일 -->
*
{
	margin: 0;
	padding: 0;
}
section
{
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0;
}
section .form_container
{
	position: relative;
	width: 1000px;
	height: 700px;
	border: 1px solid lightgrey;
	background: #fff;
	box-shadow: 0 15px 50px rgba(0,0,0,0.1);
	overflow: hidden;
	
}
section .form_container .findAccount
{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
}
section .form_container .findAccount .imgBx
{
	position: relative;
	width: 50%;
	height: 100%;
	min-width: 400px;
	transition: 0.5s;
}
section .form_container .findAccount .imgBx img
{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: contain;
}
section .form_container .findAccount .form-group
{
	position: relative;
	flex-wrap: wrap;
	width: 50%;
	height: 100%;
	min-width: 400px;
	background: #fff;
	display: flex;
	justify-centent: center;
	align-items: center;
	padding: 40px 60px;
	transition: 0.5s;
}
section .form_container .findAccount .form-group .find_container
{
	width: 100%;
	margin: 0;
}
section .form_container .findAccount .form-group .find_container form p
{
	font-size: 1rem;
	font-weight: 100;
}
section .form_container .findAccount .form-group .find_container form a,
section .form_container .findAccount .form-group .find_container form input
{
	position: relative;
	width: 100%;
	height: 45px;
	padding: 10px;
	border-radius: 4px;
	background-color: #fff;
	border: 1px solid #ccc;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	color: #333;
	outline: none;
	box-shadow: none;
	font-size: 14px;
}
section .form_container .findAccount .form-group .find_container form .input-group span
{
    position: absolute;
    top: 10px;
    left: 25px;
    padding: 0;
    transition: 0.5s;
    pointer-events: none;
    background: #fff;
    text-transform: uppercase;
}
section .form_container .findAccount .form-group .find_container form .input-group.hint
{
	margin: 5px;
	display: none;
	text-align: center;
}
section .form_container .findAccount .form-group .find_container form .input-group #emailHint
{
	color: green;
	font-size: 1.1rem;
}
section .form_container .findAccount .form-group .find_container form .input-group .chkVali
{
	font-size: 13px;
	width: 100%;
	color: red;
	text-align: left;
	padding: 5px;
	display: none;
}
section .form_container .findAccount .form-group .find_container form .input-group input:focus ~ span,
section .form_container .findAccount .form-group .find_container form .input-group input:valid ~ span
{
	top: -15px;
	left: 20px;
	font-size: 13px;
	padding: 2px 5px;
}
section .form_container .findAccount .form-group .find_container form a,
section .form_container .findAccount .form-group .find_container form input[type="button"]
{
	text-align: center;
	text-decoration: none;
	outline: none;
	border: 1px solid lightgrey;
	background: #677eff;
	color: #fff;
	cursor: pointer;
	font-size: 14px;
	font-weight: 400;
	letter-spacing: 1px;
	transition: 0.5s;
}
section .form_container .findAccount .form-group .find_container form input[type="button"].btn_next
{
	background: grey;
}
#certiNumberSpan
{
	color: grey;
}
</style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />

	<section>
		<div class="form_container">
			<div class="findAccount">
				<div class="imgBx"><img alt="회원 정보 찾기 이미지" src="${contextPath }/resources/views/images/find_account.png"></div>	
				<div class="form-group">
				
					<div class="find_container">
						<form>
							<div>
								<h2>가입 이메일 찾기</h2>
								<p>회원 가입에 사용한 닉네임으로<br> 가입한 이메일의 일부 정보를 드립니다.</p>
							</div>
							<div class="input-group">
								<input type="text" id="certiNickName" name="memberNickName" required>
								<span>닉네임</span>
								<div class="chkVali" id="certiNickNameChk">올바른 닉네임을 입력해주세요.</div>
							</div>
							<div>
								<input type="button" class="col-12 btn_find" value="이메일 찾기">
							</div>
							<div class="input-group hint">
								<p>이메일은 [ <strong id="emailHint"></strong> ] 입니다.</p>
							</div>
						</form>
					</div>
					
					<div class="find_container">
						<form action="changePwdPage.do" method="post" id="changePwdForm">
							<div>
								<h2>비밀번호 변경</h2>
								<p>회원 가입에 사용한 이메일로 인증번호를 보내드립니다.</p>
							</div>
							<div class="email-group">
								<div class="email-input input-group">
									<input type="text" id="certiEmail" name="memberEmail" required>
									<span>이메일 주소</span>
									<div class="chkVali" id="certiEmailChk">올바른 이메일을 입력해주세요.</div>
								</div>
								<div class="input-group">
									<a tabindex="0" class="btn_send popover_send_btn" role="button" 
										data-toggle="popover" data-trigger="focus" data-placement="top" title="인증번호를 발송 안내" 
										data-content="인증번호가 오지 않았으면 입력하신 정보가 회원정보와 일치하는지 확인해 주세요.">인증 번호 받기</a>
								</div>
							</div>
							<div class="input-group">
								<p>인증번호 유지 시간 : &nbsp;</p><p id="timer">10:00</p>
								<p id="sendmail"></p>
							</div>
							<div class="input-group">
								<input type="text" id="certiNumberInput" name="certiNumber" required disabled>
								<span id="certiNumberSpan">인증번호</span>
								<div class="chkVali" id="certiNumberChk">올바른 인증번호를 입력해주세요.</div>
							</div>
							<input type="button" class="btn_next" onclick="findAccountFn()" value="다음">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		let memberNickName = "";
		let memberEmail = "";
		let certiNumber = "";
		let expireTime = 10;
		// 정규식
		let certiEmailPass = false;
		let certiCodePass = false;
		let certiEmailpass = false;
		let regexEmail = new RegExp("[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*");
		let regexCertiNum = /^\d{6,6}$/;
		
		// 닉네임 검사
		function certiNickName() {
			if ($.trim($("#certiNickName").val()) == "") {
				$("#certiNickNameChk").css("display","block");
			} else {
				$("#certiNickNameChk").css("display","none");
			}
		}
		$("#certiNickName").on("keyup change", function () {
			certiNickName();
		});
		$("#certiNickName").keyup(function(e){
			if(e.keyCode == 13){
				$(".btn_find").click();
			}
		});
		
		// 닉네임 검사
		$(".btn_find").on("click", function() {
			if($.trim($("#certiNickName").val()) == ""){
				console.log("올바른 닉네임을 입력해 주세요.");
				$("#certiNickNameChk").css("display","block");
				$("#certiNickName").focus();
				return;
			}

			memberNickName = $("#certiNickName").val();

			console.log("닉네임 으로 이메일 찾기 시작");

			//닉네임 찾기
			$.ajax({ 
				url:"findEmail.do",
				data:{memberNickName:memberNickName},
				success:function(data){
					console.log("닉네임 확인 결과 : " + data);
					if(data != ""){
						console.log("이메일 착기 : 성공");
	
						// css 설정
						$("#emailHint").text(data);
						$(".hint").css("display","flex");
						
					} else {
						alert("입력하신 닉네임과 일치하는 정보가 없습니다.");
					}
				},
				error:function(request, status, errorData){
					certiEmailpass = false;
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		});

		// 이메일 검사
		function certiEmail() {
			if (!regexEmail.test($("#certiEmail").val())) {
				certiEmailPass = false;
				$("#certiEmailChk").css("display","block");
			} else {
				certiEmailPass = true;
				$("#certiEmailChk").css("display","none");
			}
		}
		$("#certiEmail").on("keyup change", function () {
			certiEmail();
		});

		// 인증번호 검사
		function certiNumberFn() {
			if (!regexCertiNum.test($("#certiNumberInput").val())) {
				certiCodePass = false;
				$("#certiNumberChk").css("display","block");
			} else {
				certiCodePass = true;
				$("#certiNumberChk").css("display","none");
			}
		}
		$("#certiNumberInput").on("keyup change", function () {
			certiNumberFn();
		});

		// 이메일 정보 팝업
		$('.popover_send_btn').popover({ trigger: 'focus' });

		// 이메일 입력 창에서 엔터키로 이메일 전송
		$("#certiEmail").keyup(function(e){
			if(e.keyCode == 13){
				$(".btn_send").click();
			}
		});

		// 이메일 전송
		$(".btn_send").on("click", function() {
			if(!$("#certiEmail")[0].checkValidity()){
				console.log("이메일을 입력해 주세요.");
				certiEmailPass = false;
				$("#certiEmailChk").css("display","block");
				$("#certiEmail").focus();
				return;
			}

			memberEmail = $("#certiEmail").val();

			if(!certiEmailPass){
				return;
			} else if(certiEmailpass){
				alert("이미 이메일이 전송되었습니다. 잠시만 기다려 주세요.");
				return;
			}

			console.log("인증 메일 전송");
			certiEmailpass = true;

			//email 전송
			$.ajax({ 
				url:"sendCertiEmail.do",
				data:{memberEmail:memberEmail},
				success:function(data){
					console.log("이메일 전송 결과 : " + data);
					if(data == "success"){
						console.log("이메일 전송 결과 : 완료");

						// 타이머 설정
						clearTime(expireTime);
						setTimer();	
						// css 설정
						$(".btn_next").css("background","#677eff");
						$(".btn_send").css("background","grey");
						$("#certiNumberInput").prop("disabled","");
						$("#certiNumberSpan").css("color","black");
						
					} else if(data == "retry"){
						console.log("이메일 전송 결과 : 실패");
						certiEmailpass = false;
						alert("정상적으로 처리되지 않았습니다. 잠시 후 다시 해주세요.");
					} else {
						console.log("이메일 전송 결과 : 일치하는 정보 없음");
						certiEmailpass = false;
						alert("입력하신 이메일과 일치하는 정보가 없습니다.");
					}
				},
				error:function(request, status, errorData){
					certiEmailpass = false;
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		});
		
		// 인증번호 입력창에서 엔터키로 인증번호 확인
		$("#certiNumberInput").keyup(function(e){
			if(e.keyCode == 13){
				findAccountFn();
			}
		});

		// 인증 번호 확인
		function findAccountFn() {
			console.log("인증번호 검증 시작 : 입력 확인");
			if(!$("#certiEmail")[0].checkValidity()){
				certiEmailPass = false;
				$("#certiEmailChk").css("display","block");
				$("#certiEmail").focus();
				return;
			} else if(!$("#certiNumberInput")[0].checkValidity()){
				certiCodePass = false;
				$("#certiNumberChk").css("display","block");
				$("#certiNumberInput").focus();
				return;
			}
			console.log("인증번호 검증 시작 : 입력 제약조건 확인");
			console.log("인증번호 검증 시작 (이멜): " + certiEmailPass);
			console.log("인증번호 검증 시작 (코드): " + certiCodePass);

			if(certiEmailPass){
				console.log("인증번호 검증 시작 : 입력 제약조건 이메일 확인");
			} else if(certiCodePass){
				console.log("인증번호 검증 시작 : 입력 제약조건 인증코드 확인");
			} else {
				return;
			}

			console.log("인증 번호 확인 시작")
			memberEmail = $("#certiEmail").val();
			certiNumber = $("#certiNumberInput").val();

			$.ajax({ 
				url:"certiChk.do",
				data:{memberEmail:memberEmail
					 ,certiNumber:certiNumber
					 ,expireTime:expireTime},
				success:function(data){
					console.log("인증번호 확인 결과 : " + data);
					if(data == "success"){
						console.log("인증번호 결과 : 완료");
						$("#changePwdForm").submit();
					} else {
						console.log("이메일 전송 결과 : 일치하지 않음");
						alert("잘못된 인증번호입니다. 인증번호를 확인한 다음 다시 입력해 주세요.");
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		}
	</script>

	<!-- 타이머 -->
	<script>
		// 시간설정 변수
		let initMinute;
		let remainSecond;
		function clearTime(min) {
			initMinut = min;
			remainSecond = min*60;
		}
		function setTimer() {
			remainMinute_ = parseInt(remainSecond/60);
			remainSecond_ = remainSecond%60;
			
			if(remainSecond >= 0){
				$("#timer").empty();
				$("#timer").append(Lpad(remainMinute_,2) + ":" + Lpad(remainSecond_,2));
				remainSecond--;
				setTimeout("setTimer()",1000);
			} else {
				$("#timer").empty();
				$("#timer").append(expireTime+":00");
				$(".btn_next").css("background","grey");
				$(".btn_send").css("background","#677eff");
				$("#certiNumberInput").prop("disabled","disabled");
				$("#certiNumberSpan").css("color","grey");
				certiEmailpass = false;
				alert("인증 번호가 만료 되었습니다. 인증번호를 다시 받으세요.");
			}
		}
		function Lpad(str,len) {
			str = str+"";
			while(str.length<len){
				str = "0" + str;
			}
			return str;
		}
	</script>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>