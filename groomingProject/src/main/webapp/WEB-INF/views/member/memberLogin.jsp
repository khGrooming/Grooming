<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.servletContext.contextPath }/resources/views/css/memberLogin.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />
	<section>
		<div class="container">
			<div class="user singinBx">
				<div class="imgBx"><img alt="로그인이미지" src="${contextPath }/resources/views/images/20171220_1537051.png"></div>	
				<div class="formBx">
					<form>
						<h2>Sign In</h2>
						<input type="text" name="" placeholder="UserName">
						<input type="password" name="" placeholder="Password">
						<input type="submit" name="" value="Login">
						<p class="signup">Don't have an account? <a href="#" onclick="toggleForm()">Sign Up</a></p>
					</form>
				</div>
			</div>
			<div class="user singupBx">
				<div class="formBx">
					<form>
						<h2>Create an account</h2>
						<input type="text" name="" placeholder="UserName">
						<input type="email" name="" placeholder="Email address">
						<input type="password" name="" placeholder="Create Password">
						<input type="password" name="" placeholder="Confirm Password">
						<input type="submit" name="" value="Sign Up">
						<p class="signup">Already have an account ? <a href="#" onclick="toggleForm()">Sign in</a></p>
					</form>
				</div>
				<div class="imgBx"><img alt="회원가입이미지" src="${contextPath }/resources/views/images/9968AA3A5BACE4751C.jpg"></div>	
			</div>
		</div>
	</section>
	<script type="text/javascript">
		function toggleForm() {
			var container = document.querySelector('.container');
			container.classList.toggle('active');
		}
	</script>
</body>
</html>