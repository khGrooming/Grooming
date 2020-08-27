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
     
<title>Insert title here</title>
<style>
    /*datatable css*/
    div.dataTables_wrapper {
        width: 70rem;
        margin: 0 auto;
    }
</style>
</head>
<body>
		<jsp:include page="../common/mainNavigationBar.jsp"/>
	
			<br><br><br><br><br><br><br>
				
				<form id="fm-notice" action="communityUpdate.do" method="post" enctype="Multipart/form-data">
					<table align="center">
						<tr>
							<td>제목</td>
							<td><input type="text" class="form-control" value="${board.boardTitle }" size="50" name="boardTitle"></td></td>
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