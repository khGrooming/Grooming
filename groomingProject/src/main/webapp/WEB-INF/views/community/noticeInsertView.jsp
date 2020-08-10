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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/21.0.0/classic/ckeditor.js"></script>
<!-- -------------- style 부분------------- -->
<style type="text/css">
/* font start */
	@font-face { 
		font-family: 'TmoneyRoundWindExtraBold'; 
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') 
			format('woff');
		font-weight: normal; 
		font-style: normal; 
	}
	
	* {
		font-family:"TmoneyRoundWindExtraBold";
	}
/* font end */
</style>

<style type="text/css">
	.table_ra>tbody>tr>td, .table_ra>tbody>tr>th, .table_ra>tfoot>tr>td, .table_ra>tfoot>tr>th, .table_ra>thead>tr>td, .table_ra>thead>tr>th {
    	vertical-align: middle;
    	text-align:center;
	}
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>
		<jsp:include page="../common/mainNavigationBar.jsp"/>
		<div class="col-sm-2">
			<jsp:include page="../common/communityBar.jsp"/>
		</div>
		<!-- ----------------------- 메인 화면 테이블 ------------------ -->
		<div class="col-sm-10">
			<h1 align="center">글 작성하기</h1>
			
			<form action="#" method="post" enctype="Multipart/form-data">
				<table align="center" border="1" cellspacing="0" width="400">
					<tr>
						<td>제목</td>
						<td><input type="text" size="50" name="nTitle"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="nWriter" value="${loginUser.id }" readonly></td>
					</tr>
					<tr>
						<td>작성내용</td>
						<td><textarea rows="7" cols="50" name="nContent"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="등록 하기">&nbsp;
							<input type="reset" value="등록 취소">
						</td>
					</tr>
				</table>	
			</form>
	
			<p align="center">
				<a href="home.do">시작 페이지로 이동</a>
				<a href="nlist.do">목록 보기로 이동</a>
			</p>		
		</div>
		<!-- ----------------------- 메인 화면 테이블 ------------------ -->
		<script src="${pageContext.request.contextPath}/resources/common/js/ckeditor.js"></script>
</body>
</html>