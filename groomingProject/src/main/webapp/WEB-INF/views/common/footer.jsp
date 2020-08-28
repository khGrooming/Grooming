<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style type="text/css">
/* 풋터 최하단에 위치하도록 하는 css */
section
{
	padding-top: 6.25rem;
	min-height: calc(100vh - 3.5rem);
}
footer
{
	width: 100%;
}
.footer_container
{
	height: 3.5rem;
}
.footer_question
{
	color: white;
}
</style>
</head>
<body>
	<footer>
		<div class="footer_container container-fulid bg-dark">
			<div class="navbar navbar-dark">
				<a class="ml-auto nav-link text-white">Copyright &copy; Grooming 2020</a>
				<a class="footer_question mr-auto nav-link" href="#">문의 하기</a>
			</div>
		</div>
	</footer>
</body>
</html>