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

<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.css" rel="stylesheet">

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
section .form_container .user .form-group form .imgArea
{
    display: flex;
    justify-content: center;
}
section .form_container .user .form-group form .registerError,
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
section .form_container .user .form-group form .input-group .profileImgArea
{
	position: relative;
	border-radius: 100px;
    width: 100%;
    display: flex;
    justify-content: center;
}
section .form_container .user .form-group form .input-group .profileImgArea .profileImg
{
	border: 1px solid #ccc;
	width: 150px;
	height: 150px;
	border-radius: 50%;
}
section .form_container .user .form-group form input,
section .form_container .user .form-group form .divRadio
{
	position: relative;
	width: 100%;
	padding: 10px;
	border-radius: 4px;
	background-color: #fff;
	border: 1px solid #ccc;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	color: #333;
	outline: none;
	box-shadow: none;
	margin: 5px 0 0;
	font-size: 14px;
}
section .form_container .user .form-group form .input-group .divRadio
{
	padding: 6px 10px 10px 20px;
	text-align: left;
	height: 43px;
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
section .form_container .user .tagP
{
	margin: 0 0 3px;
	padding-left: 10px;
}
section .form_container .user .bootstrap-tagsinput .badge
{
	margin: 0 3px;
}
section .form_container .user .form-group form .input-group p
{
	font-size: 12px;
	margin: 0;
}
section .form_container .imgBtn,
section .form_container .user .form-group form input[type="button"]
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
section .form_container .imgBtn
{
	margin-top: 5px;
}
section .form_container .imgBtn.deleteImg
{
	margin-left: 5px;
	background: grey;
} 
section .form_container .user .form-group form .input-group .divRadio .pRadio
{
	font-size: 18px;
}
section .form_container .user .form-group form input[type="radio"]
{
	width: 30px;
	margin: 0;
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
section .form_container .user #regiFst
{
	display: flex;
}
section .form_container .user #regiSnd
{
	display: none;
}
section .form_container .hideItem
{
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />
	
	<section>
		<c:if test="${loginCheck == 'register'}">
			<div class="signup form_container active"><!-- active toggle -->
		</c:if>

		<div class="signup form_container">

			<!-- 로그인 -->
			<div class="user singinBx">
				<div class="imgBx"><img alt="로그인이미지" src="${contextPath }/resources/views/images/Sign_In.png"></div>	
				<div class="form-group">
					<!-- <form action="memberLogin.do" method="post" id="loginForm"> -->
					<form>
						<h2>로그인</h2>
						<div class="input-group">
							<input type="text" id="loginEmail" name="memberEmail" required>
							<span>이메일</span>
							<div class="chkVali" id="loginEmailChk">올바른 이메일을 입력해주세요.</div>
						</div>
						<div class="input-group">
						<input type="password" id="loginPwd" autocomplete="off" name="memberPwd" required>
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
							<!-- <a href="#" onclick="findPassword()">비밀번호 찾기</a> -->
							<a href="#" onclick="goBackPage()">비밀번호 찾기</a>
						</p>
						<p class="signup">아직 회원이 아니세요 ? <a onclick="toggleForm()">회원가입</a></p>
					</form>
				</div>
			</div>
			
			<!-- 회원가입(필수) -->
 			<div class="user singupBx">
				<div class="form-group" id="regiFst">
					<form>
						<h2>회원가입</h2>
						<div class="input-group">
							<input type="text" id="regiEmail" name="memberEmail" required>
							<span>이메일</span>
							<div class="chkVali" id="regiEmailChk">올바른 이메일을 입력해주세요.</div>
							<div class="chkVali" id="regiEmailDupl">이미 사용 중입니다.</div>
							<div class="chkVali chkValiComp" id="regiEmailComp">멋진 아이디네요!</div>
						</div>
						<div class="input-group">
							<input type="password" id="regiPwd" autocomplete="off" name="memberPwd" required>
							<span>비밀번호</span>
							<div class="chkVali" id="regiPwdChk">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
							<div class="chkVali chkValiComp" id="regiPwdComp">사용 가능합니다.</div>
						</div>
						<div class="input-group">
							<input type="password" id="regiPwdDupl" autocomplete="off" required>
							<span>비밀번호 재확인</span>
							<div class="chkVali" id="regiPwdDuplChk">비밀번호가 일치하지 않습니다.</div>
							<div class="chkVali chkValiComp" id="regiPwdChkComp">비밀번호가 일치합니다.</div>
						</div>
						<div class="input-group">
							<input type="text" id="regiNickName" name="memberNickName" required>
							<span>닉네임</span>
							<div class="chkVali" id="regiNickNameChk">최대 10자 한글, 영어, 숫자를 사용하세요.</div>
							<div class="chkVali" id="regiNickNameDupl">이미 사용 중 입니다.</div>
							<div class="chkVali chkValiComp" id="regiNickNameComp">멋진 닉네임이네요!</div>
						</div>
						<div class="input-group">
							<input type="text" id="regiPhone" name="memberPhone" required>
							<span>휴대전화</span>
							<div class="chkVali" id="regiPhoneChk">올바른 휴대전화 번호를 입력해 주세요</div>
							<div class="chkVali" id="regiPhoneDupl">이미 사용 중입니다.</div>
							<div class="chkVali chkValiComp" id="regiPhoneComp">사용가능 합니다.</div>
						</div>
						<div class="registerError" id="registerError">잠시 후 다시 시도해 주세요.</div>
						<input type="button" onclick="register()" value="회원가입">
						<p class="signup">이미 회원 이신가요 ? <a onclick="toggleForm()">로그인</a></p>
					</form>
				</div>
				
				<!-- 회원가입(추가 입력) -->
				<div class="form-group" id="regiSnd">
					<form action="memberOptionUpdate.do" method="post" id="optionUpdateForm" enctype="multipart/form-data">
						<h2>추가 입력</h2>
						<input type="hidden" id="optionEmail" name="memberEmail">
						<div class="input-group imgArea">
							<div class="profileImgArea">
								<img id="profileImg" class="profileImg" src="${contextPath }/resources/views/images/MEMBER_SAMPLE_IMG.png">
							</div>
							<button type="button" id="inputImg" class="imgBtn inputImg">사진 등록</button>
							<button type="button" id="deleteImg" class="imgBtn deleteImg" disabled="disabled">삭제</button>
							<input type="file" id="profileImgInput" class="hideItem" name="uploadFile" onchange="loadImg(this)">
						</div>
						<div class="input-group">
							<input type="text" id="optionName" name="memberName" required>
							<span>이름</span>
							<div class="chkVali chkValiComp" id="optionNameChk"></div>
						</div>
						<div class="input-group">
							<div class="divRadio">
								<p class="pRadio">성별
								<input type="radio" id="genderM" class="inputRadio" name="memberGender" value="M"><label for="genderM">남성</label>
								<input type="radio" id="genderF" class="inputRadio" name="memberGender" value="F"><label for="genderF">여성</label>
								</p>
							</div>
						</div>
						<div class="input-group">
							<input type="text" id="optionMemo" name="memberMemo" maxlength="30" required>
							<span>한줄 소개</span>
						</div>
						<div>
							<p class="tagP">관심있는 태그를 남겨주세요.</p>
						</div>
						<div>
							<input type="text" name="tagName" value="" placeholder="Tags," data-role="tagsinput" class="form-control" id="tagName" style="display: none;">
						</div>
						<div class="registerError" id="">잠시후 다시 시도해 주세요.</div>
						<input type="button" onclick="registerComp()" value="완료">
						<p class="signup">마이페이지에서 하겠습니다. <a onclick="goBackPage()">Skip</a></p>
					</form>
				</div>
				<div class="imgBx"><img alt="회원가입이미지" src="${contextPath }/resources/views/images/Sign_Up.jpg"></div>	
			</div>
		</div>
	</section>
	
	<!-- 공용 스크립트 -->
	<script>
		// 이전 페이지 
		let pageHistory = "${pageHistory }";
		// 입력 값
		let memberEmail = "";
		let memberPwd = "";
		let memberNickName = "";
		let memberPhone = "";
		let memberName = "";
		let memberGender = "";
		let memberMemo = "";
		let memberPhoto = "";
		// 로그인 유효성 검사
		let loginEmailPass = false;
		// 회원가입 유효성 검사
		let regiEmailPass = false;
		let regiPwdPass = false;
		let regiNickNamePass = false;
		let regiPhonePass = false;
		// 정규식
		let regexEmail = new RegExp("[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*");
		let regexPwd = /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-zA-Z]{1,}).{8,16}$/;
		let regexNickName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*].{1,10}$/;
		let regexPhone = /^\d{10,11}$/;
		let regexPhoneNum = /^\d{3}-\d{3,4}-\d{4}$/;
		
		function toggleForm() {
			var container = document.querySelector('.form_container');
			container.classList.toggle('active');
		}

		$(function() {
			// 이전페이지 출력
			console.log("이전페이지 : ${url}");
		});
		
		// 돌아갈 페이지가 로그인, 회원가입, 로그아웃 이라면 홈으로
		function goBackPage() {
			let url = "${url}";
			if(url.indexOf("login") != -1){
				location.href="home.do";
			} else if(url.indexOf("register") != -1) {
				location.href="home.do";
			} else if(url.indexOf("logout") != -1) {
				location.href="home.do";
			} else {
				location.href="${url}";
			}
		}
		
	</script>

	<!-- 로그인 -->
	<script>
		// 로그인 이메일 검사
		function loginEmail() {
			if (!regexEmail.test($("#loginEmail").val())) {
				loginEmailPass = false;
				$("#loginEmailChk").css("display","block");
			} else {
				loginEmailPass = true;
				$("#loginEmailChk").css("display","none");
			}
		}

		$("#loginEmail").on("keyup change", function () {
			loginEmail();
		});
		
		// 로그인 비밀번호 검사
		function loginPwd() {
			if(!$("#loginPwd")[0].checkValidity()){
				$("#loginPwdChk").css("display","block");
			} else {
				$("#loginPwdChk").css("display","none");
			}
		}
		
		$("#loginPwd").on("keyup change", function () {
			loginPwd();
		});

		// 로그인
		function login() {
			/* 조건 display 확인 */
 			loginEmail();
 			loginPwd();

			/* 로그인 조건이 안맞으면 포커스 이동 */
 			if(!loginEmailPass){
				$("#loginEmail").focus();
			} else if(!$("#loginPwd")[0].checkValidity()){
				$("#loginPwd").focus();
			} else{
				memberEmail = $("#loginEmail").val();
				memberPwd = $("#loginPwd").val();
				
				$.ajax({
					url:"memberLogin.do",
					data:{memberEmail:memberEmail, memberPwd:memberPwd},
					success:function(data){
						console.log("로그인 결과 : " + data);
						if(data == "success"){
							goBackPage();
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

	<!-- 카카오 로그인 -->	
	<script>
		function kakaoLogin(){
			
		}
	</script>

	<!-- 회원가입 -->
	<script>
		// 이메일 정규화로 확인, 이메일 중복 확인(ajax)
		function regiEmail() {
			memberEmail = $("#regiEmail").val();
			
			if (!regexEmail.test(memberEmail)) {
				regiEmailPass = false;
				$("#regiEmailChk").css("display","block");
				$("#regiEmailDupl").css("display","none");
				$("#regiEmailComp").css("display","none");
			} else {
				$.ajax({
					url:"emailDuplicateChk.do",
					data:{memberEmail:memberEmail},
					success:function(data){
						console.log("회원가입 이메일 결과 : " + data)
						if(data == "success"){
							regiEmailPass = true;
							console.log("regiEmailPass : "+ regiEmailPass);
							$("#regiEmailChk").css("display","none");
							$("#regiEmailDupl").css("display","none");
							$("#regiEmailComp").css("display","block");
						} else {
							regiEmailPass = false;
							$("#regiEmailChk").css("display","none");
							$("#regiEmailDupl").css("display","block");
							$("#regiEmailComp").css("display","none");
						}
					},
					error:function(request, status, errorData){
						regiEmailPass = false;
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
						/* alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData); */
					}
				});
			}
		}
		// 키이벤트 이메일 확인
		$("#regiEmail").on("keyup change", function () {
			regiEmail();
		});

		// 비밀번호 정규화로 확인, 비밀번호 확인과 동일 여부 확인
		function regiPwd() {
			if (!regexPwd.test($("#regiPwd").val())) {
				regiPwdPass = false;
				$("#regiPwdChk").css("display","block");
				$("#regiPwdComp").css("display","none");
			} else {
				$("#regiPwdChk").css("display","none");
				$("#regiPwdComp").css("display","block");
			}
			if ($("#regiPwd").val() != $("#regiPwdDupl").val()) {
				$("#regiPwdDuplChk").css("display","block");
				$("#regiPwdChkComp").css("display","none");
				regiPwdPass = false;
					console.log("비밀번호 불일치");
			} else {
				$("#regiPwdDuplChk").css("display","none");
				$("#regiPwdChkComp").css("display","block");
				if (regexPwd.test($("#regiPwd").val())) {
					regiPwdPass = true;
					console.log("regiPwdPass : "+ regiPwdPass);
					console.log("비밀번호 일치");
				}
			}
		}
		// 키이벤트 비밀번호 확인
		$("#regiPwd").on("keyup change", function () {
			regiPwd();
		});

		// 비밀번호와 동일 여부 확인
		function regiPwdDupl() {
			if ($("#regiPwd").val() != $("#regiPwdDupl").val()) {
				regiPwdPass = false;
				$("#regiPwdDuplChk").css("display","block");
				$("#regiPwdChkComp").css("display","none");
				console.log("비밀번호 불일치");
			} else {
				$("#regiPwdDuplChk").css("display","none");
				$("#regiPwdChkComp").css("display","block");
				if (regexPwd.test($("#regiPwd").val())) {
					regiPwdPass = true;
					console.log("regiPwdPass : "+ regiPwdPass);
					console.log("비밀번호 일치");
				}
			}
		}
		// 키이벤트 비밀번호 재확인
		$("#regiPwdDupl").on("keyup change", function () {
			regiPwdDupl();
		});

		// 닉네임 정규화 확인, 닉네임 중복확인(ajax)
		function regiNickName() {
			if (!regexNickName.test($("#regiNickName").val())) {
				$("#regiNickNameChk").css("display","block");
				$("#regiNickNameDupl").css("display","none");
				$("#regiNickNameComp").css("display","none");
				regiNickNamePass = false;
			} else {
				memberNickName = $("#regiNickName").val();
				$.ajax({
					url:"nickNameDuplicateChk.do",
					data:{memberNickName:memberNickName},
					success:function(data){
						if(data == "success"){
							regiNickNamePass = true;
							$("#regiNickNameChk").css("display","none");
							$("#regiNickNameDupl").css("display","none");
							$("#regiNickNameComp").css("display","block");
						} else {
							regiNickNamePass = false;
							$("#regiNickNameChk").css("display","none");
							$("#regiNickNameDupl").css("display","block");
							$("#regiNickNameComp").css("display","none");
						}
					},
					error:function(request, status, errorData){
						regiNickNamePass = false;
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
						/* alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData); */
					}
				});
			}
		}
		// 키이벤트 닉네임 확인
		$("#regiNickName").on("keyup change", function () {
			regiNickName();
		});

		// 전화번호 정규화 확인, 전화번호 중복 확인(ajax)
		function regiPhone() {
			// 전화번호 - 제거
			memberPhone = ($("#regiPhone").val()).replace(/-/gi,"");

			if (!regexPhone.test(memberPhone)) {
				regiPhonePass = false;
				$("#regiPhoneChk").css("display","block");
				$("#regiPhoneDupl").css("display","none");
				$("#regiPhoneComp").css("display","none");
			} else {
				$.ajax({
					url:"phoneDuplicateChk.do",
					data:{memberPhone:memberPhone},
					success:function(data){
						console.log("회원가입 전화번호 결과 : " + data);
						if(data == "success"){
							regiPhonePass = true;
							$("#regiPhoneChk").css("display","none");
							$("#regiPhoneDupl").css("display","none");
							$("#regiPhoneComp").css("display","block");
						} else {
							regiPhonePass = false;
							$("#regiPhoneChk").css("display","none");
							$("#regiPhoneDupl").css("display","block");
							$("#regiPhoneComp").css("display","none");
						}
					},
					error:function(request, status, errorData){
						regiPhonePass = false;
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
						/* alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData); */
					}
				});
			}
		}
		// 키이벤트 휴대전화 확인
		$("#regiPhone").on("keyup change", function () {
			regiPhone();
		});

		// 회원가입(필수)
		function register(){
			// 추가 입력 테스트 용
			registerOption();
			
			/* $("#registerError").css("display","none");
			// 입력여부 확인
			regiEmail();
			regiPwd();
			regiPwdDupl();
			regiNickName();
			regiPhone();
			
			console.log("회원가입 이메일 결과 : " + regiEmailPass);
			console.log("회원가입 비밀번호 결과 : " + regiPwdPass);
			console.log("회원가입 닉네임 결과 : " + regiNickNamePass);
			console.log("회원가입 전화번호 결과 : " + regiPhonePass);
			
			if(!regiEmailPass){
				$("#regiEmail").focus();
			} else if(!regiPwdPass){
				$("#regiPwd").focus();
			} else if(!regiPwdPass){
				$("#regiPwdDupl").focus();
			} else if(!regiNickNamePass){
				$("#regiNickName").focus();
			} else if(!regiPhonePass){
				$("#regiPhone").focus();
			} else {
				console.log("회원가입(필수)");

				memberEmail = $("#regiEmail").val();
				memberPwd = $("#regiPwd").val();
				memberNickName = $("#regiNickName").val();
				memberPhone = $("#regiPhone").val();
				
				$.ajax({
					url:"memberInsert.do",
					data:{memberEmail:memberEmail
						, memberPwd:memberPwd
						, memberNickName:memberNickName
						, memberPhone:memberPhone},
					success:function(data){
						console.log("회원가입 결과 : " + data);
						if(data == "success"){
							registerOption();
						} else {
							$("#registerError").css("display","block");
						}
					},
					error:function(request, status, errorData){
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
						// alert("error code: " + request.status + "\n"
						//		+"message: " + request.responseText
						//		+"error: " + errorData);
					}
				});
			} */
		}
	</script>

	<!-- 회원가입(추가입력) -->
	<script>
		// 파일첨부 열기
		$("#inputImg").on("click", function() {
			$("#profileImgInput").click();
		});
		// 파일 섬네일, 파일이 이미지가 아니면 삭제
		function loadImg(value){
			console.log(!value.files[0].type.match("image.*"));

			if(!value.files[0].type.match("image.*")) {
				console.log("업로드는 이미지만 가능합니다.");
				deleteImg();
				return;
			}

			console.log("업로드 파일명 : " + value.files[0].name);

			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){
					$("#profileImg").prop("src",e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
				$("#deleteImg").prop("disabled","");
				$("#deleteImg").css("background","#677eff");
			}
		}
		
		function deleteImg() {
			$("#profileImg").prop("src","${contextPath }/resources/views/images/MEMBER_SAMPLE_IMG.png");
			$("#deleteImg").css("disabled","disabled");
			$("#deleteImg").css("background","grey");
		}
		//TODO 파일 삭제
		$("#deleteImg").on("click", function(){
			deleteImg();
		});
	
		// 회원가입(추가입력) 페이지로 변경
		function registerOption() {
			$("#regiFst").css("display","none");
			$("#regiSnd").css("display","flex");
		};
		
		// 추가입력 취소
		function optionSkip(){
			goBackPage();
		}

		// 회원가입(추가입력)
		function registerComp() {
			$("#optionEmail").val(memberEmail);
			//TODO 옵션 등록 가야함
			console.log("이멜 : " + memberEmail);
			console.log("이름 : " + $("#optionName").val());
			console.log("성별 : " + $("input[name=memberGender]").val());
			console.log("메모 : " + $("#optionMemo").val());
			console.log("태그 : " + $("#tagName").val());

			//TODO 추가입력 완료
			//$("#optionUpdateForm").submit();
		}
	</script>

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