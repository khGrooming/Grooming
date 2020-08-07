<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">

	<%-- <link href="${pageContext.servletContext.contextPath }/resources/views/css/memberLoginRegistration.css" rel="stylesheet"> --%>
<style type="text/css">
*
{
	margin: 0;
	padding: 0;
	/* box-sizind: border-box; */
}
section
{
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
	margin-top: 62px;
	position: relative;
	width: 1000px;
	height: 700px;
	border: 1px solid black;
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
	/* font-weight: 600; */
	/* text-transform: uppercase; */
	letter-spaceing: 2px;
	text-align: center;
	width: 100%;
	margin-bottom: 10px;
	color: #555;
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
	margin: 8px 0;
	font-size: 14px;
	letter-spacing: 1px;
	font-weight: 300;
}
section .form_container .user .form-group form .input-group span
{
    position: absolute;
    top: 18px;
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
	top: -10px;
	left: 12px;
	font-size: 13px;
	padding: 2px 5px;
}
section .form_container .user .form-group form input[type="submit"]
{
	max-width: 100px;
	border: 1px solid #000;
	background: #677eff;
	color: #fff;
	cursor: pointer;
	font-size: 14px;
	font-weight: 500;
	letter-spacing: 1px;
	transition: 0.5s;
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
	font-weight: 600;
	text-decoration: none;
	color: #677eff;
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
		<div class="signup form_container active"><!-- active toggle --> 
			<div class="user singinBx">
				<div class="imgBx"><img alt="로그인이미지" src="${contextPath }/resources/views/images/Sign_In.png"></div>	
				<div class="form-group">
					<form>
						<h2>로그인</h2>
						<div class="input-group">
							<input type="email" name="" required="required">
							<span>이메일</span>
						</div>
						<div class="input-group">
						<input type="password" name="" required="required">
							<span>비밀번호</span>
						</div>
						<input type="submit" name="" value="로그인">
						<p class="signup">로그인에 문제가 있나요 ? 
							<a href="#" onclick="findAccount();">아이디 찾기</a>
							/
							<a href="#" onclick="findPassword();">비밀번호 찾기</a>
						</p>
						<p class="signup">아직 회원이 아니세요 ? <a href="#" onclick="toggleForm();">회원가입</a></p>
					</form>
				</div>
			</div>
 			<div class="user singupBx">
				<div class="form-group">
					<form>
						<h2>회원가입</h2>
						<div class="input-group">
							<input type="email" name="" required="required">
							<span>이메일</span>
						</div>
						<div class="input-group">
							<input type="password" name="" required="required">
							<span>비밀번호</span>
						</div>
						<div class="input-group">
							<input type="password" name="" required="required">
							<span>비밀번호 재확인</span>
						</div>
						<div class="input-group">
							<input type="tel" name="" required="required">
							<span>휴대전화</span>
						</div>
						<input type="submit" name="" value="회원가입">
						<p class="signup">이미 회원 이신가요 ? <a href="#" onclick="toggleForm();">로그인</a></p>
					</form>
				</div>
				<div class="imgBx"><img alt="회원가입이미지" src="${contextPath }/resources/views/images/Sign_Up.jpg"></div>	
			</div>
		</div>
	</section>
	<script type="text/javascript">
		function toggleForm() {
			var container = document.querySelector('.form_container');
			container.classList.toggle('active');
		}
	</script>
	
		<!-- /.container -->
	<jsp:include page="../common/footer.jsp" />

	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>

</body>
</html>