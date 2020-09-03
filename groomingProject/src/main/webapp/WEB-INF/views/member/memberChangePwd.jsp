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

<!-- recaptcha 나중에... -->
<!-- <script src="https://www.google.com/recaptcha/api.js?render=6LdYz8AZAAAAAFCliYQlMH778UwYbDfnrV-X8YGk"></script>

<script>
	grecaptcha.ready(function() {
		grecaptcha.execute('6LdYz8AZAAAAAFCliYQlMH778UwYbDfnrV-X8YGk', {action: 'changePwd.do'}).then(function(token) {
			//TODO 하자 나중에...
			// pass the token to the backend script for verification
		});
	});
</script> -->
  
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
section .form_container .findAccount .form-group form .input-group .chkValiComp
{
	color: green;
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
</style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />

	<section>
		<div class="form_container">
			<div class="findAccount">
				<div class="imgBx"><img alt="회원 비밀번호 변경 이미지" src="${contextPath }/resources/views/images/changePwd.png"></div>	
				<div class="form-group">
					<form action="newPwd.do" method="post" id="newPwdForm">
						<div>
							<h2>비밀번호 재설정</h2>
							<p>비밀번호를 변경해 주세요.</p>
							<p>다른 아이디나 사이트에서 사용한 적 없는 안전한 비밀번호로 변경해 주세요.</p>
						</div>
						<input type="hidden" name="memberEmail" value="${memberEmail }">
						<div class="input-group mb-3">
							<input type="password" id="new_pw" autocomplete="off" name="memberPwd" required>
							<span>새 비밀번호</span>
							<div class="chkVali" id="new_pwChk">8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
							<div class="chkVali chkValiComp" id="new_pwComp">사용 가능합니다.</div>
						</div>
						<div class="input-group">
							<input type="password" id="new_conf_pw" autocomplete="off" required>
							<span>새 비밀번호 확인</span>
							<div class="chkVali" id="new_conf_pwChk">비밀번호가 일치하지 않습니다.</div>
							<div class="chkVali chkValiComp" id="new_conf_pwComp">비밀번호가 일치합니다.</div>
						</div>
						<input type="button" class="btn_next my-3" onclick="findAccountFn()" value="확인">
					</form>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		// 정규식
		let newPwdPass = false;
		let regexPwd = /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-zA-Z]{1,}).{8,16}$/;
		let regexCertiNum = /^\d{6,6}$/;
		

		// 비밀번호 정규화로 확인, 비밀번호 확인과 동일 여부 확인
		function newPwd() {
			if (!regexPwd.test($("#new_pw").val())) {
				newPwdPass = false;
				$("#new_pwChk").css("display","block");
				$("#new_pwComp").css("display","none");
			} else {
				$("#new_pwChk").css("display","none");
				$("#new_pwComp").css("display","block");
			}
			if ($("#new_pw").val() != $("#new_conf_pw").val()) {
				$("#new_conf_pwChk").css("display","block");
				$("#new_conf_pwComp").css("display","none");
				newPwdPass = false;
				console.log("비밀번호 불일치");
			} else {
				$("#new_conf_pwChk").css("display","none");
				$("#new_conf_pwComp").css("display","block");
				if (regexPwd.test($("#new_pwChk").val())) {
					newPwdPass = true;
					console.log("changePwdPass : "+ changePwdPass);
					console.log("비밀번호 일치");
				}
			}
		}
		// 키이벤트 비밀번호 확인
		$("#new_pw").on("keyup change", function () {
			newPwd();
		});

		// 비밀번호와 동일 여부 확인
		function newPwdDupl() {
			if ($("#new_pw").val() != $("#new_conf_pw").val()) {
				newPwdPass = false;
				$("#new_conf_pwChk").css("display","block");
				$("#new_conf_pwComp").css("display","none");
				console.log("비밀번호 불일치");
			} else {
				$("#new_conf_pwChk").css("display","none");
				$("#new_conf_pwComp").css("display","block");
				if (regexPwd.test($("#new_pw").val())) {
					newPwdPass = true;
					console.log("newPwdPass : "+ newPwdPass);
					console.log("비밀번호 일치");
				}
			}
		}
		// 키이벤트 비밀번호 재확인
		$("#new_conf_pw").on("keyup change", function () {
			newPwdDupl();
		});

		$("#new_conf_pw").keyup(function(e){
			if(e.keyCode == 13){
				findAccountFn();
			}
		});

		function findAccountFn() {
			newPwd();

			if(!newPwdPass){
				$("#new_pw").focus();
				return;
			} else {
				console.log("비밀번호 업데이트 submit")
				$("#newPwdForm").submit();
			}
		}
	</script>


	<jsp:include page="../common/footer.jsp" />

</body>
</html>