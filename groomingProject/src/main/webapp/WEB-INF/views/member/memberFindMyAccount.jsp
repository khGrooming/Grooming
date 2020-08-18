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
	/* box-sizind: border-box; */
}
section
{
	margin-top: 76px;
	position: relative;
	min-height: 86.3vh;
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
section .form_container .findAccount .form-group form
{
	width: 100%;
}
section .form_container .findAccount .form-group form p
{
	font-size: 1rem;
	font-weight: 100;
}
section .form_container .findAccount .form-group form input
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
section .form_container .findAccount .form-group form .input-group span
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
section .form_container .findAccount .form-group form .input-group .chkVali
{
	font-size: 13px;
	width: 100%;
	color: red;
	text-align: left;
	padding: 0 5px;
	display: none;
}
section .form_container .findAccount .form-group form .input-group input:focus ~ span,
section .form_container .findAccount .form-group form .input-group input:valid ~ span
{
	top: -15px;
	left: 20px;
	font-size: 13px;
	padding: 2px 5px;
}
section .form_container .findAccount .form-group form input[type="button"]
{
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
section .form_container .findAccount .form-group form input[type="button"].btn_next
{
	background: grey;
}
#certiNumberSpan
{
	color: grey;
}
.loading
{
	width:100%;
	height:100px;
	position:fixed; /* 스크롤 내려도 그 위치에 */
	left:0%;
	top:45%;
	background:#F2F1DF;
	text-align: center;
	z-index:1000; /* 이 값으로 레이어의 위치를 조정합니다. */
	display: none;
	border: 1px solid gray;
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
					<form class="row">
						<div class="col-12">
							<h2>회원정보 찾기</h2>
							<p>회원 가입에 사용한 이메일로 인증번호를 보내드립니다.</p>
						</div>
						<div class="input-group col-8">
							<input type="text" id="certiEmail" name="memberEmail" required>
							<span>이메일 주소</span>
							<div class="chkVali" id="certiEmailChk">올바른 이메일을 입력해주세요.</div>
						</div>
						<input type="button" class="col-4 btn_send" onclick="sendEmail()" value="인증 번호 받기">
						<div class="input-group col-12 m-1">
							<p class="m-0">인증번호 유지 시간 : &nbsp;</p><p id="timer" class="m-0">10:00</p>
						</div>
						<div class="input-group col-8 my-3">
							<input type="text" id="certiNumber" name="certiNumber" value="" required disabled>
							<span id="certiNumberSpan">인증번호</span>
							<div class="chkVali" id="certiNumberChk">올바른 인증번호를 입력해주세요.</div>
						</div>
						<input type="button" class="btn_next col-4 my-3" onclick="findPwd()" value="다음">
					</form>
				</div>
			</div>
		</div>

		<!-- 로딩 팝업창  -->
		<div class="loading">
			<br>&nbsp;로딩중입니다. <br>&nbsp;잠시만 기다려 주세요 ^-^*
			<div class="spinner-border text-primary" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>  
	</section>

	<script type="text/javascript">
		// 정규식
		let certiEmailPass = false;
		let certiNumberPass = false;
		let regexEmail = new RegExp("[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*");
		let regexCertiNum = /^\d{6,6}$/;
		
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
		function certiNumber() {
			if (!regexCertiNum.test($("#certiNumber").val())) {
				certiEmailPass = false;
				$("#certiNumberChk").css("display","block");
			} else {
				loginEmailPass = true;
				$("#certiNumberChk").css("display","none");
			}
		}
		$("#certiNumber").on("keyup change", function () {
			certiNumber();
		});
		
		function sendEmail() {
			if(!$("#certiEmail")[0].checkValidity()){
				certiEmailPass = false;
				$("#certiEmailChk").css("display","block");
				$("#certiEmail").focus();
				return;
			}

			let memberEmail = $("#certiEmail").val();

			if(certiEmailPass){
				$(".loading").show();
			} else{
				return;
			}
			console.log("인증 메일 전송")

			//TODO email 전송 만들어야함
			$.ajax({ 
				url:"sendCertiEmail.do",
				data:{memberEmail:memberEmail},
				success:function(data){
					console.log("이메일 전송 결과 : " + data);
					if(data == "success"){
						console.log("이메일 전송 결과 : 완료");
						// 타이머 설정
						clearTime(10);
						setTimer();	
						// css 설정
						$(".btn_next").css("background","#677eff");
						$(".btn_send").css("background","grey");
						$("#certiNumber").prop("disabled","");
						$("#certiNumberSpan").css("color","black");
					} else {
						console.log("이메일 전송 결과 : 일치하는 정보 없음");
						alert("입력하신 이메일과 일치하는 정보가 없습니다.");
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
			$(".loading").fadeOut();
		}
			// alert("인증번호 6자리를 정확하게 입력해 주세요.");
			// alert("잘못된 인증번호입니다. 인증번호를 확인한 다음 다시 입력해 주세요.");
	</script>

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
			
			if(remainSecond > 0){
				$("#timer").empty();
				$("#timer").append(Lpad(remainMinute_,2) + ":" + Lpad(remainSecond_,2));
				remainSecond--;
				setTimeout("setTimer()",1000);
			} else {
				alert("인증 번호가 만료 되었습니다.");
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