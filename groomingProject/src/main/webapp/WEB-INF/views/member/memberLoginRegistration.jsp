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

<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

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
	margin-top: 50px;
	position: relative;
	min-height: 91vh;
	/* background: #fee648; */
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}
section .form_container
{
	margin-top: auto;
	margin-bottom: auto;
	position: relative;
	width: 1000px;
	height: 700px;
	border: 1px solid lightgrey;
	background: #fff;
	box-shadow: 0 15px 50px rgba(0,0,0,0.1);
	overflow: hidden;
}
section .form_container .user
{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
}
section .form_container .user .imgBx
{
	position: relative;
	width: 50%;
	height: 100%;
	background: #ff0;
	transition: 0.5s;
}
section .form_container .user .imgBx img
{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}
section .form_container .user .form-group
{
	position: relative;
	width: 50%;
	height: 100%;
	background: #fff;
	display: flex;
	justify-centent: center;
	align-items: center;
	padding: 40px;
	transition: 0.5s;
}
section .form_container .user .form-group form
{
	width: 100%;
}
section .form_container .user .form-group form h2
{
	font-size: 18px;
	font-weight: 600;
	text-transform: uppercase;
	letter-spaceing: 2px;
	text-align: center;
	width: 100%;
	margin-bottom: 10px;
	color: #555;
}
section .form_container .user .form-group form .input-group
{
	font-size: 18px;
	width: 100%;
	text-align: center;
	margin-bottom: 10px;
	color: #555;
}
section .form_container .user .form-group form .input-group .chkVali
{
	font-size: 13px;
	width: 100%;
	color: red;
	text-align: left;
	padding: 0 5px;
	display: none;
}
section .form_container .user .form-group form .input-group .chkValiComp
{
	color: green;
}
section .form_container .user .form-group form input
{
	position: relative;
	width: 100%;
	padding: 10px;
	/* background: #f5f5f5; */
	color: #333;
	border: 1px solid #000;
	outline: none;
	box-shadow: none;
	margin: 8px 0 0;
	font-size: 14px;
}
section .form_container .user .form-group form .input-group span
{
    position: absolute;
    top: 15px;
    left: 20px;
    padding: 0;
    transition: 0.5s;
    pointer-events: none;
    background: #fff;
    text-transform: uppercase;
}
section .form_container .user .form-group form .input-group input:focus ~ span,
section .form_container .user .form-group form .input-group input:valid ~ span
{
	top: -7px;
	left: 12px;
	font-size: 13px;
	padding: 2px 5px;
}
section .form_container .user .form-group form input[type="checkbox"]
{
	width: 15px;
	margin: 3px;
}
section .form_container .user .form-group form .input-group p
{
	font-size: 12px;
	margin: 0;
}
section .form_container .user .form-group form input[type="button"]
{
	/* max-width: 100px; */
	border: 1px solid lightgrey;
	background: #677eff;
	color: #fff;
	cursor: pointer;
	font-size: 14px;
	font-weight: 500;
	letter-spacing: 1px;
	transition: 0.5s;
}
section .form_container .user .form-group form input[class=kakaoLogin]
{
	background-image: url("${contextPath }/resources/views/images/kakao_login_medium_wide.png");
	background-repeat: no-repeat;
	background-color: #FEE500;
	background-position: center;
}
section .form_container .user .form-group form .signup
{
	position: relative;
	margin-top: 20px;
	font-size: 12px;
	letter-spacing: 1px;
	color: #555;
	text-transform: uppercase;
	font-weight: 300;
}
section .form_container .user .form-group form .signup a
{
	cursor: pointer;
	font-weight: 600;
	text-decoration: none;
	color: #677eff;
}
section .form_container .user .form-group form .signup a:hover
{
	color: green;
}
section .form_container .singupBx
{
	pointer-events: none;
}
section .form_container.active .singupBx
{
	pointer-events: initial;
}

section .form_container .singupBx .form-group
{
	left: 100%;
}
section .form_container.active .singupBx .form-group
{
	left: 0;
}
section .form_container .singupBx .imgBx
{
	left: -100%;
}
section .form_container.active .singupBx .imgBx
{
	left: 0;
}

section .form_container .singinBx .form-group
{
	left: 0;
}
section .form_container.active .singinBx .form-group
{
	left: 100%;
}
section .form_container .singinBx .imgBx
{
	left: 0;
}
section .form_container.active .singinBx .imgBx
{
	left: -100%;
}
</style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />
	
	<section>
	<c:if test="${loginCheck == 'register'}">
		<div class="signup form_container active"><!-- active toggle -->
	</c:if> 
		<div class="signup form_container"><!-- active toggle -->
			<div class="user singinBx">
				<div class="imgBx"><img alt="로그인이미지" src="${contextPath }/resources/views/images/Sign_In.png"></div>	
				<div class="form-group">
					<!-- <form action="memberLogin.do" method="post" id="loginForm"> -->
					<form>
						<h2>로그인</h2>
						<div class="input-group">
							<input type="text" id="loginEmail" name="memberEmail" required="required">
							<span>이메일</span>
							<div class="chkVali" id="loginEmailChk">올바른 이메일을 입력해주세요.</div>
						</div>
						<div class="input-group">
						<input type="password" id="loginPwd" name="memberPwd" required="required">
							<span>비밀번호</span>
							<div class="chkVali" id="loginPwdChk">비밀번호를 입력해주세요.</div>
						</div>
						<div class="input-group">
							<input type="checkbox" name="idSaveCheck"><p>아이디 기억하기</p>
							<div class="chkVali" id="loginError">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</div>
						</div>
						<input type="button" onclick="login()" value="로그인">
						<input type="button" onclick="kakaoLogin()" class="kakaoLogin" value="">
						<p class="signup">로그인에 문제가 있나요 ? 
							<a href="#" onclick="findAccount()">아이디 찾기</a>
							/
							<a href="#" onclick="findPassword()">비밀번호 찾기</a>
						</p>
						<p class="signup">아직 회원이 아니세요 ? <a onclick="toggleForm()">회원가입</a></p>
					</form>
				</div>
			</div>
 			<div class="user singupBx">
				<div class="form-group">
					<form action="memberInsert.do" method="post" id="registerForm">
						<h2>회원가입</h2>
						<div class="input-group">
							<input type="text" id="regiEmail" name="memberEmail" required="required">
							<span>이메일</span>
							<div class="chkVali" id="regiEmailChk">올바른 이메일을 입력해주세요.</div>
							<div class="chkVali" id="regiEmailDupl">이미 사용 중입니다.</div>
							<div class="chkVali chkValiComp" id="regiEmailComp">멋진 아이디네요!</div>
						</div>
						<div class="input-group">
							<input type="password" id="regiPwd" name="memberPwd" required="required">
							<span>비밀번호</span>
							<div class="chkVali" id="regiPwdChk">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
							<div class="chkVali chkValiComp" id="regiPwdComp">사용 가능합니다.</div>
						</div>
						<div class="input-group">
							<input type="password" id="regiPwdDupl" required="required">
							<span>비밀번호 재확인</span>
							<div class="chkVali" id="regiPwdDuplChk">비밀번호가 일치하지 않습니다.</div>
							<div class="chkVali chkValiComp" id="regiPwdChkComp">비밀번호가 일치합니다.</div>
						</div>
						<div class="input-group">
							<input type="text" id="regiNickName" name="memberNickName" required="required">
							<span>닉네임</span>
							<div class="chkVali" id="regiNickNameChk">최대 10자 한글, 영어, 숫자를 사용하세요.</div>
							<div class="chkVali" id="regiNickNameDupl">이미 사용 중 입니다.</div>
							<div class="chkVali chkValiComp" id="regiNickNameComp">멋진 닉네임이네요!</div>
						</div>
						<div class="input-group">
							<input type="text" id="regiPhone" name="memberPhone" required="required">
							<span>휴대전화</span>
							<div class="chkVali" id="regiPhoneChk">올바른 휴대전화 번호를 입력해 주세요</div>
							<div class="chkVali" id="regiPhoneDupl">이미 사용 중입니다.</div>
							<div class="chkVali chkValiComp" id="regiPhoneComp">사용가능 합니다.</div>
						</div>
						<input type="button" onclick="register()" value="회원가입">
						<p class="signup">이미 회원 이신가요 ? <a onclick="toggleForm()">로그인</a></p>
					</form>
				</div>
				<div class="imgBx"><img alt="회원가입이미지" src="${contextPath }/resources/views/images/Sign_Up.jpg"></div>	
			</div>
		</div>
	pageHistory = ${pageHistory }
	</section>
	<script>
		var loginEmailPass = 0;

		function toggleForm() {
			var container = document.querySelector('.form_container');
			container.classList.toggle('active');
		}

		// 로그인 유효성 검사
		$("#loginEmail").on("keyup change", function () {
			var regex = new RegExp("[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*");

			loginEmailPass = 0;
			
			if (!regex.test($(this).val())) {
				$("#loginEmailChk").css("display","block");
			} else {
				$("#loginEmailChk").css("display","none");
				loginEmailPass = 1;
			}
		});
		
		$("#loginPwd").on("keyup change", function () {
			if(!$("#loginPwd")[0].checkValidity()){
				$("#loginPwdChk").css("display","block");
			} else {
				$("#loginPwdChk").css("display","none");
			}
		});

		function login() {
			/* 입력여부 확인 */
 			if(!$("#loginEmail")[0].checkValidity() || loginEmailPass == 0){
				$("#loginEmailChk").css("display","block");
			} else {
				$("#loginEmailChk").css("display","none");
				loginEmailPass = 1;
			}
			if(!$("#loginPwd")[0].checkValidity()){
				$("#loginPwdChk").css("display","block");
			} else {
				$("#loginPwdChk").css("display","none");
			}

			/* 로그인 및 입력 없으면 포커스 */
 			if(!$("#loginEmail")[0].checkValidity() || loginEmailPass == 0){
				$("#loginEmail").focus();
			} else if(!$("#loginPwd")[0].checkValidity()){
				$("#loginPwd").focus();
			} else{
				/* $("#loginForm").submit(); */
				var memberEmail = $("#loginEmail").val();
				var memberPwd = $("#loginPwd").val();
				
				$.ajax({
					url:"memberLogin.do",
					data:{memberEmail:memberEmail, memberPwd:memberPwd},
					success:function(data){
						console.log(data);
						if(data == "success"){
							//TODO 이전 페이지로 돌아가는 처리 해야함
							location.href="home.do";
						} else{
							$("#loginError").css("display","block");
						}
						
					},
					error:function(request, status, errorData){
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
						/* alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData); */
					}
				});
			}
		}

	</script>
		
	<script>
		// 회원가입 유효성 검사
		var regiEmailPass = 0;
		var regiPwdPass = 0;
		var regiNickNamePass = 0;
		var regiPhonePass = 0;
		var regexEmail = new RegExp("[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*");
		var regexPwd = /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-zA-Z]{1,}).{8,16}$/;
		var regexNickName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*].{1,10}$/;
		var regexPhone = /^\d{10,11}$/;

		// 이메일 확인
		$("#regiEmail").on("keyup change", function () {
			regiEmailPass = 0;
			var memberEmail = $(this).val();
			
			if (!regexEmail.test(memberEmail)) {
				$("#regiEmailChk").css("display","block");
				$("#regiEmailDupl").css("display","none");
				$("#regiEmailComp").css("display","none");
			} else {
				$.ajax({
					url:"emailDuplicateChk.do",
					data:{memberEmail:memberEmail},
					success:function(data){
						if(data == "success"){
							$("#regiEmailChk").css("display","none");
							$("#regiEmailDupl").css("display","none");
							$("#regiEmailComp").css("display","block");
							loginEmailPass = 1;
						} else {
							$("#regiEmailChk").css("display","none");
							$("#regiEmailDupl").css("display","block");
							$("#regiEmailComp").css("display","none");
						}
					},
					error:function(request, status, errorData){
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
				});
			}
		});

		// 비밀번호 확인
		$("#regiPwd").on("keyup change", function () {
			if (!regexPwd.test($(this).val())) {
				$("#regiPwdChk").css("display","block");
				$("#regiPwdComp").css("display","none");
			} else {
				$("#regiPwdChk").css("display","none");
				$("#regiPwdComp").css("display","block");
			}
			if ($("#regiPwd").val() != $("#regiPwdDupl").val()) {
				$("#regiPwdDuplChk").css("display","block");
				$("#regiPwdChkComp").css("display","none");
			} else {
				$("#regiPwdDuplChk").css("display","none");
				$("#regiPwdChkComp").css("display","block");
				regiPwdPass = 1;
			}
		});

		// 비밀번호 재확인
		$("#regiPwdDupl").on("keyup change", function () {
			if ($("#regiPwd").val() != $("#regiPwdDupl").val()) {
				$("#regiPwdDuplChk").css("display","block");
				$("#regiPwdChkComp").css("display","none");
			} else {
				$("#regiPwdDuplChk").css("display","none");
				$("#regiPwdChkComp").css("display","block");
				regiPwdPass = 1;
			}
		});

		// 닉네임 확인
		$("#regiNickName").on("keyup change", function () {
			regiNickNamePass = 0;

			if (!regexNickName.test($(this).val())) {
				$("#regiNickNameChk").css("display","block");
				$("#regiNickNameDupl").css("display","none");
				$("#regiNickNameComp").css("display","none");
			} else {
				var memberNickName = $("#regiNickName").val();

				$.ajax({
					url:"nickNameDuplicateChk.do",
					data:{memberNickName:memberNickName},
					success:function(data){
						if(data == "success"){
							$("#regiNickNameChk").css("display","none");
							$("#regiNickNameDupl").css("display","none");
							$("#regiNickNameComp").css("display","block");
							regiNickNamePass = 1;
						} else {
							$("#regiNickNameChk").css("display","none");
							$("#regiNickNameDupl").css("display","block");
							$("#regiNickNameComp").css("display","none");
						}
					},
					error:function(request, status, errorData){
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
				});
			}
		});

		// 휴대전화 확인
		$("#regiPhone").on("keyup change", function () {
			regiPhonePass = 0;
			var memberPhone = ($(this).val()).replace(/-/gi,"");

			console.log(memberPhone);
			console.log(!regexPhone.test(memberPhone));
			
			if (!regexPhone.test(memberPhone)) {
				$("#regiPhoneChk").css("display","block");
				$("#regiPhoneDupl").css("display","none");
				$("#regiPhoneComp").css("display","none");
			} else {
				$.ajax({
					url:"phoneDuplicateChk.do",
					data:{memberPhone:memberPhone},
					success:function(data){
						if(data == "success"){
							$("#regiPhoneChk").css("display","none");
							$("#regiPhoneDupl").css("display","none");
							$("#regiPhoneComp").css("display","block");
							regiPhonePass = 1;
						} else {
							$("#regiPhoneChk").css("display","none");
							$("#regiPhoneDupl").css("display","block");
							$("#regiPhoneComp").css("display","none");
						}
					},
					error:function(request, status, errorData){
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
				});
			}
		});
		
		function register(){
			/* 입력여부 확인 */
 			if(!$("#regiEmail")[0].checkValidity() || regiEmailPass == 0){
				$("#regiEmailChk").css("display","block");
			} else {
				$("#loginEmailChk").css("display","none");
				loginEmailPass = 1;
			}
			if(!$("#loginPwd")[0].checkValidity()){
				$("#loginPwdChk").css("display","block");
			} else {
				$("#loginPwdChk").css("display","none");
			}
			
			
			/* $("#registerForm").submit(); */
		}
		
		function kakaoLogin(){
			
		}

	</script>
	
		<!-- /.container -->
	<jsp:include page="../common/footer.jsp" />

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!--
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
 -->
</body>
</html>