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
<!-- -------------- style 부분------------- -->
<style>
    /*datatable css*/
    div.dataTables_wrapper {
        width: 70rem;
        margin: 0 auto;
    }
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>
		<jsp:include page="../common/mainNavigationBar.jsp"/>
	
		<br><br><br><br><br><br><br>
		<h2 class="text-center">게시글 보기</h2><p>&nbsp;</p>
		
	<div class="container" align="center">
		<div class="table table-responsive">
        	<table class="table">
        		<tr>
            		<th class="success">글번호</th>
            		<td>${board.boardNo }</td>
            		<th class="success">조회수</th>
            		<td>${board.boardVcount }</td>
        		</tr>
        		<tr>
            		<th class="success">작성자</th>
            		<td>${board.memberNickName }</td>
            		<th class="success">작성일</th>
            		<td>${board.boardCreateDate }</td>
        		</tr>
        		<tr>
            		<th class="success">제목</th>
            		<td colspan="3">${board.boardTitle }</td>
        		</tr>  
        		<tr>
            		<th class="success">글 내용</th>
            		<td colspan="3">${board.boardContent }</td>
        		</tr>
				<c:url var="communityUpdateView" value="communityUpdateView.do">
					<c:param name="boardNo" value="${board.boardNo }" />
				</c:url>
				<c:url var="communityDelete" value="communityDelete.do">
					<c:param name="boardNo" value="${board.boardNo }" />
				</c:url>
				<c:if test="${loginUser.memberNo eq board.memberNo }">	
					<tr>
						<td colspan="2" align="center">
							<a href="${communityUpdateView }">수정하기</a>
						</td>
						<td colspan="2" align="center">
							<a href="${communityDelete }">삭제하기</a>
						</td>
					</tr>
				</c:if> 
        	</table>
        	<hr>
        	
        	<!-- 댓글 목록 보기 -->
			<table align="center" width="70%" id="replyList">
				<thead>

				</thead>
				<tbody>
		
				</tbody>
			</table> 
	
        	<!-- 댓글 등록하기 -->
			<table align="center" width="70%" id="replyAdd">
				<tr>
					<td>${loginUser.memberNickName }</td>
					<td><textarea rows="3" cols="60" id="replyContent" placeholder=" 댓글을 작성해주세요"></textarea></td>
					<td>
						<button id="replySubmit">등록하기</button>
					</td>
				</tr>
			</table>
			
			<script>
				$(function(){
					getReplyList();
					
					setInterval(function(){
						getReplyList();
					}, 10000);	// 실시간
					
					$("#replySubmit").on("click",function(){
						var replyContent = $("#replyContent").val();
						var replyNo = ${board.boardNo};
						
						$.ajax({
							url:"replyAdd.do",
							data:{replyContent:replyContent, replyNo:replyNo},
							
							success:function(data){
								if(data == "success"){
									getReplyList();
									
									$("#replyContent").val("");
									
								}
							},
							error:function(request, status, errorData){
								alert("error code: " + request.status + "\n"
										+"message: " + request.responseText
										+"error: " + errorData);
							}
						})
					})
				})
				
				function getReplyList(){
					var boardNo = ${board.boardNo};
					
					$.ajax({
						url:"replyList.do",
						data:{boardNo:boardNo},
						dataType:"json",
						
						success:function(data){
							$tableBody = ${"#replyList tbody"};
							$tableBody.html("");
							
							var $tr;
							var $memberNo;
							var replyContent;
							var replyCreateDate;
							
							if(data.length > 0){
								for(var i in data){
									$tr = $("<tr>");
									$memberNo = $("<td width='400'>").text(data[i].memberNo);
									$replyContent = $("<td>").text(data[i].replyContent);
									$replyCreateDate = $("<td width='400'>").text(data[i].replyCreateDate);
									
									$tr.append($memberNo);
									$tr.append($replyContent);
									$tr.append($replyCreateDate);
									$tableBody.append($tr);
								}
							}else{
								$tr = $("<tr");
								$replyContent = $("<td colspan='3'>").text("등록 된 댓글이 없습니다");
								
								$tr.append($replyContent);
								$tableBody.append($tr);
							}
						},
						error:function(request, status, errorData){
							alert("error code: " + request.status + "\n"
									+"message: " + request.responseText
									+"error: " + errorData);
						}
					})
				}	
			</script>
			
    	</div>
	</div>	

</body>
</html>