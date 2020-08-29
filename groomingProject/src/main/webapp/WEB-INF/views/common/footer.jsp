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
	width: 100%;
	background-color: #343a40;
}
.footer_container .footer_navbar
{
	color: white;
    position: relative;
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    padding: .5rem 1rem;
}
.footer_container .footer_navbar .footer_item,
.footer_container .footer_navbar .footer_question
{
	color: white;
	margin: 0.2rem 0.5rem 0.2rem auto;
    padding: .3rem 1rem;
    display: block;
    deco
}
.footer_container .footer_navbar .footer_question
{
	margin: 0.2rem auto 0.2rem 0.5rem;
}
.footer_container .footer_navbar .footer_item:hover,
.footer_container .footer_navbar .footer_question:hover
{
    text-decoration: none;
}
.footer_container .footer_navbar .footer_question:hover
{
	color: green;
    border-bottom: thin solid green;
}
</style>
</head>
<body>
	<footer>
		<div class="footer_container">
			<div class="footer_navbar">
				<a class="footer_item">Copyright &copy; Grooming 2020</a>
				<a class="footer_question" href="#">문의 하기</a>
			</div>
		</div>
	</footer>
</body>
</html>