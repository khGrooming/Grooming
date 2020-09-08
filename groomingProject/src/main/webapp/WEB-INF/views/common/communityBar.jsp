<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.servletContext.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 폰트 (https://fonts.google.com/specimen/Jua?subset=korean&sidebar.open=true&selection.family=Jua) -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- -------------- style 부분------------- -->
<style type="text/css">
/* font start */
* {
   font-family: 'Jua', sans-serif;
}
/* font end */
</style>

<style type="text/css">
	/* 사이드 카테고리 바 스타일 */
	.floating_ra{
		width:200px;
		display:inline;
		float:left;
		margin-left:10px;
		margin-right:10px;
		padding:10px;
		color:green;
		text-align: right;
		position: fixed;
	}
	.floating2_ra{
		color: black;
		padding:10px;
	}
	.floating2_ra, a {
		font-size: 17px;
	}
	/* 사이드 카테고리 바 스타일 */
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>

	<c:url var="communityMainForm2" value="communityMainForm2.do" />
	<c:url var="communityNotice" value="communityNotice.do" />
	<c:url var="communityFreeBoard" value="communityFreeBoard.do" />
	<c:url var="communityStudyPromotion" value="communityStudyPromotion.do" />
	<c:url var="communityStudyConfirm" value="communityStudyConfirm.do" />
	<c:url var="communityQnA" value="communityQnA.do" />
	
	<div class="container col-sm-12">
		<br><br><br><br>
		<!-- ----------------------- 사이드 카테고리바 ----------------- -->
		<div class="col-sm-2">
			<div id="sidebar_ra" class="floating_ra">
				<h1 align="center">커뮤니티</h1>
				<hr>
					<p><a href="${communityMainForm2 }">All&nbsp;&nbsp;&nbsp;</a></p>
					<p><a href="${communityNotice }?bCategoryNo=BC00001 ">공지사항&nbsp;&nbsp;&nbsp;</a></p>
					<p><a href="${communityFreeBoard }?bCategoryNo=BC00002 ">자유 게시판&nbsp;&nbsp;&nbsp;</a></p>
					<p><a href="${communityStudyPromotion }?bCategoryNo=BC00003 ">내 스터디 홍보&nbsp;&nbsp;&nbsp;</a></p>
					<p><a href="${communityStudyConfirm } ">스터디 인증&nbsp;&nbsp;&nbsp;</a></p>
					<p><a href="${communityQnA }?bCategoryNo=BC00005 ">Q&A&nbsp;&nbsp;&nbsp;</a></p>
			</div> 
		</div>
		<!-- ----------------------- 사이드 카테고리바 ----------------- -->
	</div>
</body>
</html>