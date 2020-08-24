<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<!-- -------------- style 부분------------- -->
<style type="text/css">
	.table_ra>tbody>tr>td, .table_ra>tbody>tr>th, .table_ra>tfoot>tr>td, .table_ra>tfoot>tr>th, .table_ra>thead>tr>td, .table_ra>thead>tr>th {
    	vertical-align: middle;
    	text-align:center;
	}
	#noticeIcon {
    	vertical-align: bottom;
    	color: red;
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
			<!-- ------------------ 수정 ------------------- -->
			<div class="col-sm-1"></div>
			<div class="col-sm-8">
				<form id="fm-notice" action="communityUpdate.do" method="post" enctype="Multipart/form-data">
					<table align="center">
						<tr>
							<td>제목</td>
							<td><input type="text" class="form-control" value="${board.boardTitle }" size="50" name="boardTitle" placeholder="제목을 입력해 주세요"></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td><input type="text" class="form-control" name="memberNickName" value="${loginUser.memberNickName }" readonly></td>
						</tr>
						<tr>
							<td>작성내용</td>
							<td><textarea name="boardContent" id="summernote" rows="10" cols="80">${board.boardContent }</textarea></td>
							<td><input type="hidden" name="memberNo" value="${loginUser.memberNo }"></td>
							<td><input type="hidden" name="bCategoryNo" value="${bCategoryNo}"></td>
							<td><input type="hidden" name="boardNo" value="${board.boardNo}"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="수정 하기">&nbsp;
								<input type="reset" value="수정 취소">
							</td>
						</tr>
					</table>	
				</form>
			</div>
			<div class="col-sm-3"></div>
			
			<!--summerNote-->
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
			<script>
    			$(document).ready(function() {
        			$('#summernote').summernote({
            			height: 300,                 // set editor height
            			minHeight: null,             
						maxHeight: null,             
            			focus: true  
        			})
    			});
			</script>
			<!-- ------------------ 수정 ------------------- -->
		</div>
		<!-- ----------------------- 메인 화면 테이블 ------------------ -->
</body>
</html>