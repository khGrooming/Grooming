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
</style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />

	<section>
		<div class="form_container">
			<div class="user singinBx">
				<div class="form-group">
					<form>
						<h2>회원정보 찾기</h2>
						<input type="radio" id="certFst" name="certification"><label for="certFst">회원정보에 등록된 휴대전화로 인증()</label>
						<input type="radio" id="certSnd" name="certification"><label for="certSnd">본인 확인 메일로 인증()</label>
					</form>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		
	</script>

	<jsp:include page="../common/footer.jsp" />

</body>
</html>