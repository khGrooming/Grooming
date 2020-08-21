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

<!-- jQuery cookie -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-cookie/jquery.cookie.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<!-- Bootstrap4 TagsInput -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.css" rel="stylesheet">

<!-- 카카오 로그인 연결 (리소스) -->
<script	src="${pageContext.servletContext.contextPath }/resources/js/kakaologin/kakaoLogin.js"></script>	
<script>
	Kakao.init('a2db16454e8a262c90d8aca3da57b23e');
	Kakao.isInitialized();

	console.log('카카오');
	console.log('카카오' + Kakao.isInitialized());
</script>

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
	/* margin-top: auto;
	margin-bottom: auto; */
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
	transition: 0.5s;
}
section .form_container .user .imgBx img
{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: contain;
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
	/* font-size: 18px; */
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
    font-weight: lighter;
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
section .form_container .user .form-group form .signup-block
{
	margin-top: 5px;
	text-align: center;
}
section .form_container .user .form-group form .signup a
{
	cursor: pointer;
	font-weight: 600;
	text-decoration: none;
	color: #677eff;
}
section .form_container .user .form-group form .signup-block a
{
	font-weight: lighter;
}
#idSaveCheckPopover
{
	cursor: pointer;
	outline: none;
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
				<div class="imgBx"><img alt="로그인이미지" src="${contextPath }/resources/views/images/login.png"></div>	
				<div class="form-group">
					<form>
						<h2>로그인</h2>
						<div class="input-group">
							<input type="text" id="loginEmail" name="memberEmail" value="" required>
							<span>이메일</span>
							<div class="chkVali" id="loginEmailChk">올바른 이메일을 입력해주세요.</div>
						</div>
						<div class="input-group">
						<input type="password" id="loginPwd" autocomplete="off" name="memberPwd" required>
							<span>비밀번호</span>
							<div class="chkVali" id="loginPwdChk">비밀번호를 입력해주세요.</div>
						</div>
						<div class="input-group">
							<input type="checkbox" id="idSaveCheck" name="idSaveCheck">
								<a tabindex="0" id="idSaveCheckPopover" data-toggle="popover" data-trigger="focus" data-content="개인정보 보호를 위해 개인 PC에서만 사용해 주세요.">
									<p>아이디 기억하기</p>
								</a>
							<div class="chkVali" id="loginError">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</div>
						</div>
						<input type="button" onclick="login()" value="로그인">
						<input type="button" onclick="kakaoLogin()" class="kakaoLogin" value="">
						<p class="signup">로그인에 문제가 있나요 ? 
							<a href="#" onclick="location.href='findAccount.do'">아이디 /비밀번호 찾기</a>
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
						<div class="registerError" id="registerError">잠시 후 다시 시도해 주세요.</div>
						<input type="button" onclick="register()" value="아래 약관을 동의하며 회원 가입">
						<p class="signup signup-block">
							<a  data-toggle="modal" data-toggle="modal" data-target="#userAgreement">회원가입약관</a> / <a data-toggle="modal" data-target="#userPrivacy">개인정보취급방침</a>
						</p>
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
							<input type="file" id="profileImgInput" class="hideItem" name="profileFile" onchange="loadImg(this)">
						</div>
						<div class="input-group">
							<input type="text" id="optionName" name="memberName" required>
							<span>이름</span>
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
							<input type="text" id="optionPhone" name="memberPhone" required>
							<span>휴대전화</span>
							<div class="chkVali" id="optionPhoneChk">올바른 휴대전화 번호를 입력해 주세요</div>
							<div class="chkVali chkValiComp" id="optionPhoneComp">사용가능 합니다.</div>
						</div>
						<div class="input-group">
							<input type="text" id="optionMemo" name="memberMemo" maxlength="30" required>
							<span>상태 메시지</span>
						</div>
						<div>
							<p class="tagP">관심있는 태그를 남겨주세요.</p>
						</div>
						<div>
							<input type="text" name="memberTagName" value="" placeholder="Tags," data-role="tagsinput" class="form-control" id="tagName" style="display: none;">
						</div>
						<div class="registerError" id="">잠시후 다시 시도해 주세요.</div>
						<input type="button" onclick="registerComp()" value="완료">
						<p class="signup">마이페이지에서 하겠습니다. <a onclick="goBackPage()">Skip</a></p>
					</form>
				</div>
				<div class="imgBx"><img alt="회원가입이미지" src="${contextPath }/resources/views/images/2853458.jpg"></div>	
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
			
			// 쿠키에서 아이디 가져오기
			if($.cookie("userCheck") != null) {
				$("#loginEmail").val($.cookie("userCheck"));
				$("input:checkbox[id='idSaveCheck']").prop("checked", true);
			}
			
		});
		
		$("#idSaveCheckPopover").popover({
			trigger: 'hover'
		}).on("click", function(){
			$("input:checkbox[id='idSaveCheck']").trigger("click");
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
			} else if(url.indexOf("newPwd") != -1) {
				location.href="home.do";
			} else if(url.indexOf("OptionUpdate") != -1) {
				location.href="home.do";
			} else if(url == "") {
				location.href="home.do";
			} else {
				location.href="${url}";
			}
		}
	</script>

	<!-- 로그인 -->
	<script>
		$("#loginPwd").keyup(function(e){
			if(e.keyCode == 13){
				login();
			}
		});

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
			} else {
	 			let idSaveCheck = $("#idSaveCheck").is(":checked");
				memberEmail = $("#loginEmail").val();
				memberPwd = $("#loginPwd").val();
				
				$.ajax({
					url:"memberLogin.do",
					data:{memberEmail:memberEmail, memberPwd:memberPwd, idSaveCheck:idSaveCheck},
					success:function(data){
						console.log("로그인 결과 : " + data);
						if(data == "success"){
							// 아이디 저장이 체크상태이면 쿠키에 아이디 저장
							if($("#idSaveCheck").is(":checked")){
								$.cookie("userCheck", memberEmail);
								console.log($.cookie("userCheck"));
							} else {
								$.removeCookie("userCheck");
							}

							goBackPage();
						} else {
							$("#loginError").css("display","block");
						}
					},
					error:function(request, status, errorData){
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
					}
				});
			}
		}
	</script>

	<!-- 카카오 로그인 -->	
	<script>
		// 카카오 로그인 스크립트 => 자동 회원가입 기능 (ajax)
		function kakaoLogin(){
			Kakao.Auth.loginForm({
				success : function(response) {
					console.log("카카오 로그인 : 성공");

					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response) {
							console.log(response);

							memberEmail = response.id;
							memberNickName = response.properties.nickname;

							$.ajax({
								url:"kakaoLogin.do",
								data:{memberEmail:memberEmail, memberNickName:memberNickName},
								success:function(data){
									console.log("회원가입 결과 : " + data);
									if(data == "success"){
										goBackPage();
									} else {
										$.ajax({
											url:"memberInsertkakao.do",
											data:{memberEmail:memberEmail, memberNickName:memberNickName},
											success:function(data){
												console.log("로그인kakao 결과 : " + data);
												if(data == "success"){
													goBackPage();
												} else {
													$("#loginError").css("display","block");
												}
											},
											error:function(request, status, errorData){
												alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
											}
										});
									}
								},
								error:function(request, status, errorData){
									alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
									
									
									//		+"error: " + errorData);
								}
							});
						},
						fail : function(error) {
							console.log("카카오 정보 요청 실패" + error);
						}
					});
				},
				fail : function(error) {
					console.log("카카오 로그인 실패" + error);
				},
			});
		}
	</script>

	<!-- 회원가입 -->
	<script>
		$("#regiNickName").keyup(function(e){
			if(e.keyCode == 13){
				register();
			}
		});
		
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
					}
				});
			}
		}
		// 키이벤트 닉네임 확인
		$("#regiNickName").on("keyup change", function () {
			regiNickName();
		});

		// 회원가입(필수)
		function register(){			
			$("#registerError").css("display","none");
			// 입력여부 확인
			regiEmail();
			regiPwd();
			regiPwdDupl();
			regiNickName();
			
			console.log("회원가입 이메일 결과 : " + regiEmailPass);
			console.log("회원가입 비밀번호 결과 : " + regiPwdPass);
			console.log("회원가입 닉네임 결과 : " + regiNickNamePass);
			
			if(!regiEmailPass){
				$("#regiEmail").focus();
			} else if(!regiPwdPass){
				$("#regiPwd").focus();
			} else if(!regiPwdPass){
				$("#regiPwdDupl").focus();
			} else if(!regiNickNamePass){
				$("#regiNickName").focus();
			} else {
				console.log("회원가입(필수)");

				memberEmail = $("#regiEmail").val();
				memberPwd = $("#regiPwd").val();
				memberNickName = $("#regiNickName").val();
				
				$.ajax({
					url:"memberInsert.do",
					data:{memberEmail:memberEmail
						, memberPwd:memberPwd
						, memberNickName:memberNickName},
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
					}
				});
			}
		}
	</script>

	<!-- 회원가입(추가입력) -->
	<script>
		// 회원가입(추가입력) 페이지로 변경
		function registerOption() {
			$("#regiFst").css("display","none");
			$("#regiSnd").css("display","flex");
		};

		// 추가입력 취소
		function optionSkip(){
			goBackPage();
		}

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
			
			memberPhoto = value.files[0].name;
			console.log("업로드 파일명 : " + memberPhoto);

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

		// 프로필 이미지 삭제
		function deleteImg() {
			$("#profileImg").prop("src","${contextPath }/resources/views/images/MEMBER_SAMPLE_IMG.png");
			$("#deleteImg").css("disabled","disabled");
			$("#deleteImg").css("background","grey");
		}
		// 프로필 이미지 삭제 버튼 엑션
		$("#deleteImg").on("click", function(){
			deleteImg();
		});

		// 전화번호 정규화 확인, 전화번호 중복 확인(ajax)
		function opionPhone() {
			// 전화번호 - 제거
			memberPhone = ($("#opionPhone").val()).replace(/-/gi,"");

			if (!regexPhone.test(memberPhone)) {
				$("#optionPhoneChk").css("display","block");
				$("#optionPhoneComp").css("display","none");
			} else {
				$("#optionPhoneChk").css("display","none");
				$("#optionPhoneComp").css("display","block");
			}
		}
		// 키이벤트 휴대전화 확인
		$("#opionPhone").on("keyup change", function () {
			opionPhone();
		});

		// 회원가입(추가입력)
		function registerComp() {
			$("#optionEmail").val(memberEmail);
			//TODO 옵션 등록 가야함
			console.log("이멜 : " + memberEmail);
			console.log("사진 : " + memberPhoto);
			console.log("이름 : " + $("#optionName").val());
			console.log("성별 : " + $("input[name=memberGender]").val());
			console.log("전화 : " + $("#optionPhone").val());
			console.log("메모 : " + $("#optionMemo").val());
			console.log("태그 : " + $("#tagName").val());
			
			// 추가입력 완료
			$("#optionUpdateForm").submit();
		}
	</script>

<!-- userAgreement Modal -->
<div class="modal fade" id="userAgreement" tabindex="-1" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="userAgreementLabel">회원가입약관</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<p style="font-weight:lighter;">
<p align="center">공정거래위원회 표준약관 제10023호<br><br><p>
(2014. 9. 19. 개정)<br><br>
제1조(목적) 이 약관은 주식회사 이브레인 회사(GROOMING)가 운영하는 주식회사 이브레인 개발자 커뮤니티(이하 "GROOMING"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버 GROOMING과 이용자의 권리?의무 및 책임사항을 규정함을 목적으로 합니다.<br><br>
  ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」<br><br>
제2조(정의)<br>
  ① "GROOMING"이란 주식회사 이브레인 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 GROOMING을 운영하는 사업자의 의미로도 사용합니다.<br>
  ② “이용자”란 "GROOMING"에 접속하여 이 약관에 따라 "GROOMING"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
  ③ ‘회원’이라 함은 "GROOMING"에 회원등록을 한 자로서, 계속적으로 "GROOMING"이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br><br>
  ④ ‘비회원’이라 함은 회원에 가입하지 않고 "GROOMING"이 제공하는 서비스를 이용하는 자를 말합니다.<br>
제3조 (약관 등의 명시와 설명 및 개정) <br><br>
  ① "GROOMING"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호?모사전송번호?전자우편주소, 사업자등록번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 GROOMING의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
  ② "GROOMING"은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
  ④ "GROOMING"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 GROOMING의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.  이 경우 "GROOMING“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. <br>
  ⑤ "GROOMING"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 "GROOMING"에 송신하여 "GROOMING"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>
  ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는 상관례에 따릅니다.<br><br>
제4조(서비스의 제공 및 변경) <br><br>
  ① "GROOMING"은 다음과 같은 업무를 수행합니다.<br>
    1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br>
    2. 구매계약이 체결된 재화 또는 용역의 배송<br>
    3. 기타 "GROOMING"이 정하는 업무<br>
  ② "GROOMING"은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br>
  ③ "GROOMING"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br>
  ④ 전항의 경우 "GROOMING"은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "GROOMING"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br><br>
제5조(서비스의 중단) <br><br>
  ① "GROOMING"은 컴퓨터 등 정보통신설비의 보수점검?교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br>
  ② "GROOMING"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, "GROOMING"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>
  ③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 "GROOMING"은 제8조에 정한 방법으로 이용자에게 통지하고 당초 "GROOMING"에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, "GROOMING"이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 "GROOMING"에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.<br>
제6조(회원가입) <br><br>
  ① 이용자는 "GROOMING"이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br>
  ② "GROOMING"은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br>
    1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "GROOMING"의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br>
    2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br>
    3. 기타 회원으로 등록하는 것이 "GROOMING"의 기술상 현저히 지장이 있다고 판단되는 경우<br>
  ③ 회원가입계약의 성립 시기는 "GROOMING"의 승낙이 회원에게 도달한 시점으로 합니다.<br>
  ④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 "GROOMING"에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.<br><br>
제7조(회원 탈퇴 및 자격 상실 등) <br>
  ① 회원은 "GROOMING"에 언제든지 탈퇴를 요청할 수 있으며 "GROOMING"은 즉시 회원탈퇴를 처리합니다.<br>
  ② 회원이 다음 각 호의 사유에 해당하는 경우, "GROOMING"은 회원자격을 제한 및 정지시킬 수 있습니다.<br>
    1. 가입 신청 시에 허위 내용을 등록한 경우<br>
    2. "GROOMING"을 이용하여 구입한 재화 등의 대금, 기타 "GROOMING"이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br>
    3. 다른 사람의 "GROOMING" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br>
    4. "GROOMING"을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br>
  ③ "GROOMING"이 회원 자격을 제한?정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "GROOMING"은 회원자격을 상실시킬 수 있습니다.<br>
  ④ "GROOMING"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br><br>
제8조(회원에 대한 통지)<br>
  ① "GROOMING"이 회원에 대한 통지를 하는 경우, 회원이 "GROOMING"과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.<br>
  ② "GROOMING"은 불특정다수 회원에 대한 통지의 경우 1주일이상 "GROOMING" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.<br><br>
제9조(구매신청) <br>
  ① "GROOMING"이용자는 "GROOMING"상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, "GROOMING"은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.<br>
      1. 재화 등의 검색 및 선택<br>
      2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력<br>
      3. 약관내용, 청약철회권이 제한되는 서비스, 배송료?설치비 등의 비용부담과 관련한 내용에 대한 확인<br>
      4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)<br>
      5. 재화 등의 구매신청 및 이에 관한 확인 또는 "GROOMING"의 확인에 대한 동의<br>
      6. 결제방법의 선택<br>
  ② "GROOMING"이 제3자에게 구매자 개인정보를 제공·위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 "GROOMING"은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유?이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.<br><br>
제10조 (계약의 성립)<br>
  ①  "GROOMING"은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<br>
    1. 신청 내용에 허위, 기재누락, 오기가 있는 경우<br>
    2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우<br>
    3. 기타 구매신청에 승낙하는 것이 "GROOMING" 기술상 현저히 지장이 있다고 판단하는 경우<br>
  ② "GROOMING"의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br>
  ③ "GROOMING"의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.<br><br>
제11조(지급방법) "GROOMING"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, "GROOMING"은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도  추가하여 징수할 수 없습니다.<br>
    1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 <br>
    2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제<br>
    3. 온라인무통장입금<br>
    4. 전자화폐에 의한 결제<br>
    5. 수령 시 대금지급<br>
    6. 마일리지 등 "GROOMING"이 지급한 포인트에 의한 결제<br>
    7. "GROOMING"과 계약을 맺었거나 "GROOMING"이 인정한 상품권에 의한 결제  <br>
    8. 기타 전자적 지급 방법에 의한 대금 지급 등<br><br>
제12조(수신확인통지?구매신청 변경 및 취소)<br>
  ① "GROOMING"은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br>
  ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 "GROOMING"은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.<br><br>
제13조(재화 등의 공급)<br>
  ① "GROOMING"은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, "GROOMING"이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다.  이때 "GROOMING"은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.<br>
  ② "GROOMING"은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "GROOMING"이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 "GROOMING"이 고의?과실이 없음을 입증한 경우에는 그러하지 아니합니다.<br>
제14조(환급) "GROOMING"은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.<br><br>
제15조(청약철회 등)<br>
  ① "GROOMING"과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.<br> 
  ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br>
    1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)<br>
    2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br>
    3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우<br>
    4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br><br>
  ③ 제2항제2호 내지 제4호의 경우에 "GROOMING"이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.<br><br>
  ④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.<br><br>
제16조(청약철회 등의 효과)<br>
  ① "GROOMING"은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 "GROOMING"이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.<br><br>
  ② "GROOMING"은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br><br>
  ③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. "GROOMING"은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 "GROOMING"이 부담합니다.<br><br>
  ④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 "GROOMING"은 청약철회 시 그 비용을  누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.<br><br>
제17조(개인정보보호)<br>
  ① "GROOMING"은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. <br><br>
  ② "GROOMING"은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br><br>
  ③ "GROOMING"은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. <br><br>
  ④ "GROOMING"은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br><br>
  ⑤ "GROOMING"이 제3항과 제4항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br><br>
  ⑥ 이용자는 언제든지 "GROOMING"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "GROOMING"은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "GROOMING"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br><br>
  ⑦ "GROOMING"은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를  최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br><br>
  ⑧ "GROOMING" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br><br>
  ⑨ "GROOMING"은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.<br><br>
제18조("GROOMING"의 의무)<br>
  ① "GROOMING"은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화?용역을 제공하는데 최선을 다하여야 합니다.<br>
  ② "GROOMING"은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br>
  ③ "GROOMING"이 상품이나 용역에 대하여 「표시?광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시?광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br>
  ④ "GROOMING"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.<br><br>
제19조(회원의 ID 및 비밀번호에 대한 의무)<br>
  ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.<br>
  ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br>
  ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "GROOMING"에 통보하고 "GROOMING"의 안내가 있는 경우에는 그에 따라야 합니다.<br><br>
제20조(이용자의 의무) 이용자는 다음 행위를 하여서는 안 됩니다.<br>
    1. 신청 또는 변경시 허위 내용의 등록<br>
    2. 타인의 정보 도용<br>
    3. "GROOMING"에 게시된 정보의 변경<br>
    4. "GROOMING"이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br>
    5. "GROOMING" 기타 제3자의 저작권 등 지적재산권에 대한 침해<br>
    6. "GROOMING" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>
    7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 GROOMING에 공개 또는 게시하는 행위<br><br>
제21조(연결"GROOMING"과 피연결"GROOMING" 간의 관계)<br>
  ① 상위 "GROOMING"과 하위 "GROOMING"이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 "GROOMING"(웹 사이트)이라고 하고 후자를 피연결 "GROOMING"(웹사이트)이라고 합니다.<br>
  ② 연결"GROOMING"은 피연결"GROOMING"이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결"GROOMING"의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.<br>
제22조(저작권의 귀속 및 이용제한)<br>
  ① "GROOMING"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "GROOMING"에 귀속합니다.<br>
  ② 이용자는 "GROOMING"을 이용함으로써 얻은 정보 중 "GROOMING"에게 지적재산권이 귀속된 정보를 "GROOMING"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br>
  ③ "GROOMING"은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.<br><br>
제23조(분쟁해결)<br>
  ① "GROOMING"은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치?운영합니다.<br>
  ② "GROOMING"은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.<br>
  ③ "GROOMING"과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.<br><br>
제24조(재판권 및 준거법)<br>
  ① "GROOMING"과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br>
  ② "GROOMING"과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.<br>
</p>
      </div>
      <div class="modal-footer"></div>
    </div>
  </div>
</div>

<!-- userPrivacy Modal -->
<div class="modal fade" id="userPrivacy" tabindex="-1" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="userPrivacyLabel">회원가입약관</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<p style="font-weight:lighter;">
&lt;주식회사 그루밍&gt;('GroomingProject'이하 'GROOMING')은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.<br><br>
&lt;주식회사 그루밍&gt;('GROOMING') 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br><br>
○ 본 방침은부터 2015년 1월 1일부터 시행됩니다.<br><br>
1. 개인정보의 처리 목적 <주식회사 그루밍>('GroomingProject'이하 'GROOMING')은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.<br><br>
가. 홈페이지 회원가입 및 관리<br><br>
회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.<br><br>
나. 민원사무 처리<br><br>
민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.<br><br>
다. 재화 또는 서비스 제공<br><br>
서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.<br><br>
라. 마케팅 및 광고에의 활용<br><br>
신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 , 인구통계학적 특성에 따른 서비스 제공 및 광고 게재 , 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.<br><br><br>
2. 개인정보 파일 현황<br><br>
1. 개인정보 파일명 : grooming_privacy<br><br>
- 개인정보 항목 : 비밀번호, 로그인ID, 이름, 이메일, 접속 IP 정보, 쿠키, 서비스 이용 기록, 접속 로그<br><br>
- 수집방법 : 홈페이지<br><br>
- 보유근거 : 개인정보처리방침<br><br>
- 보유기간 : 3년<br><br>
- 관련법령 : 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년, 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년, 대금결제 및 재화 등의 공급에 관한 기록 : 5년, 계약 또는 청약철회 등에 관한 기록 : 5년, 표시/광고에 관한 기록 : 6개월<br><br><br>
3. 개인정보의 처리 및 보유 기간<br><br>
① &lt;주식회사 그루밍&gt;('GROOMING')은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.<br><br>
② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br><br>
1.&lt;홈페이지 회원가입 및 관리&gt;<br><br>
&lt;홈페이지 회원가입 및 관리&gt;와 관련한 개인정보는 수집.이용에 관한 동의일로부터<3년>까지 위 이용목적을 위하여 보유.이용됩니다.<br><br>
-보유근거 : 개인정보처리방침<br><br>
-관련법령 : 1)소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br><br>
2) 대금결제 및 재화 등의 공급에 관한 기록 : 5년<br><br>
3) 표시/광고에 관한 기록 : 6개월<br><br>
4. 개인정보의 제3자 제공에 관한 사항<br><br>
① &lt;주식회사 그루밍&gt;('GroomingProject'이하 'GROOMING')은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br><br>
② &lt;주식회사 그루밍&gt;('GroomingProject')은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.<br><br>
1. &lt;주식회사 그루밍&gt;<br><br>
- 개인정보를 제공받는 자 : 주식회사 그루밍<br><br>
- 제공받는 자의 개인정보 이용목적 : 비밀번호, 로그인ID, 이름, 이메일<br><br>
- 제공받는 자의 보유.이용기간: 준영구<br><br>
5. 개인정보처리 위탁<br><br>
① &lt;주식회사 그루밍&gt;('GROOMING')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.<br><br>
② &lt;주식회사 그루밍&gt;('GroomingProject'이하 'GROOMING')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적?관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리?감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.<br><br>
③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.<br><br>
6. 정보주체의 권리,의무 및 그 행사방법 이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.<br><br>
① 정보주체는 주식회사 그루밍('GroomingProject'이하 'GROOMING) 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.<br><br>
1. 개인정보 열람요구<br><br>
2. 오류 등이 있을 경우 정정 요구<br><br>
3. 삭제요구<br><br>
4. 처리정지 요구<br><br>
② 제1항에 따른 권리 행사는주식회사 그루밍('GroomingProject'이하 'GROOMING) 에 대해 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 <기관/회사명>('사이트URL'이하 '사이트명) 은(는) 이에 대해 지체 없이 조치하겠습니다.<br><br>
③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 <기관/회사명>('사이트URL'이하 '사이트명) 은(는) 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.<br><br>
④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br><br>
7. 처리하는 개인정보의 항목 작성 <br><br>
① <주식회사 그루밍>('GroomingProject'이하 'GROOMING')은(는) 다음의 개인정보 항목을 처리하고 있습니다.<br><br>
1<홈페이지 회원가입 및 관리><br><br>
- 필수항목 : 비밀번호, 로그인ID, 이메일, 접속 IP 정보, 쿠키, 서비스 이용 기록, 접속 로그<br><br>
8. 개인정보의 파기<주식회사 그루밍>('GROOMING')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.<br><br>
-파기절차<br><br>
이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.<br><br>
-파기기한<br><br>
이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.<br><br>
-파기방법<br><br>
전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.<br><br>
종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br><br>
9. 개인정보의 안전성 확보 조치 &lt;주식회사 그루밍&gt;('GROOMING')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.<br><br>
① 정기적인 자체 감사 실시<br><br>
개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.<br><br>
② 내부관리계획의 수립 및 시행<br><br>
개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.<br><br>
③ 개인정보의 암호화<br><br>
이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.<br><br>
④ 개인정보에 대한 접근 제한<br><br>
개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.<br><br>
⑤ 접속기록의 보관 및 위변조 방지<br><br>
개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.<br><br>
10. 개인정보관리책임자 및 담당자의 연락처<br><br>
귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. <br><br>
회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.<br><br>
개인정보 관리책임자<br><br>
이 름 : 그루밍	<br><br>
소 속 : GROOMING/운영팀<br><br>
전 화 : 010-****-****	<br><br>
메 일 : info@Grooming.kh<br><br>
기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br><br>
- 개인정보침해신고센터 (privacy.kisa.or.kr / 국번없이 118)<br><br>
- 대검찰청 사이버범죄수사단 (www.spo.go.kr / 02-3480-3571)<br><br>
- 경찰청 사이버안전국 (www.ctrc.go.kr / 국번없이 182)<br><br>
</p>
      </div>
      <div class="modal-footer"></div>
    </div>
  </div>
</div>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>