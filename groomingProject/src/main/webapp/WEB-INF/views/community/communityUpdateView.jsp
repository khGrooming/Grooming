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
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Grooming</title>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.js"></script>
<link
	href="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.css"
	rel="stylesheet">
<style>
    /*datatable css*/
    div.dataTables_wrapper {
        width: 70rem;
        margin: 0 auto;
    }
    section .form_container .study .bootstrap-tagsinput .badge {
		margin: 0 3px;
		font-weight: lighter;
	}
</style>
</head>
<body>
		<jsp:include page="../common/mainNavigationBar.jsp"/>
	
			<br><br><br><br><br><br><br>
				
				<form id="fm-notice" action="communityUpdate.do" method="post" enctype="Multipart/form-data">
					<table align="center">
						<tr>
							<td style="text-align:left; vertical-align: middle;">제목</td>
							<td><input type="text" class="form-control" value="${board.boardTitle }" size="50" name="boardTitle"></td>
						</tr>
						<tr>
							<td style="text-align:left; vertical-align: middle;">작성자</td>
							<td><input type="text" class="form-control" name="memberNickName" value="${loginUser.memberNickName }" readonly></td>
						</tr>
						<tr>
							<td style="text-align:left; vertical-align: middle;">작성내용</td>
							<td><textarea name="boardContent" id="summernote" rows="10" cols="80">${board.boardContent }</textarea></td>
							<td><input type="hidden" name="memberNo" value="${loginUser.memberNo }"></td>
							<td><input type="hidden" name="bCategoryNo" value="${board.bCategoryNo}"></td>
							<td><input type="hidden" name="boardNo" value="${board.boardNo}"></td>
						</tr>
						<tr>
							<td style="text-align:left; vertical-align: baseline;">해시 태그</td>
							<td>	
								<input type="text" name="tagName" value="" placeholder="Tags,"
										data-role="tagsinput" class="form-control" id="tagName"
										style="display: none;" required>
										<small><span style="color: lightblue">해쉬태그는 5개 이하로 등록해주세요!</span></small>
							</td>				
						</tr>
						
						<tr>
							<td colspan="2" align="center">
								<input type="submit" value="수정 하기">&nbsp;
								<input type="reset" value="수정 취소">
							</td>
						</tr>
					</table>	
				</form>
			
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
</body>
</html>