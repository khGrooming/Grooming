<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
<!--datatable-->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

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
<header>
		<jsp:include page="../common/mainNavigationBar.jsp"/>
	
		<br><br><br><br><br><br><br>
</header>
<!--내용 시작-->
<section>
	<h2 class="text-center">게시글 보기</h2><p>&nbsp;</p>	
	
	<div class="container" align="center">
	
	<c:if test="${empty board.declarationNo}">
		<p class="text-right">
			<a href="#declareForm" data-toggle='modal'>
			<img style="vertical-align: bottom;" alt="dep" 
					src="${pageContext.servletContext.contextPath }/resources/views/images/dd.PNG"> 신고</a>
		</p>
	</c:if>
						
	<!-- 신고모달 -->
	<div class="modal fade" id="declareForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
			style="margin-top: 100px;">
		<div class="modal-dialog">
			<form action="declareB.do" method="post">
				<div class="modal-content" style="width: auto; height: auto;">
					<input type="hidden" value="${board.boardNo }" name="dnNo">
					<input type="hidden" value="${loginUser.memberNo }" name="memberNo">
					<input type="hidden" value="${board.bCategoryNo }" name="bCategoryNo">
					<!-- 모달 제목 -->
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">신고 사유</h5>
							<button type="button" class="close" data-dismiss="modal"aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
					</div>
					<!-- 모달 본문 내용 -->
					<div class="modal-body container">								
						<textarea cols="100" rows="10" placeholder="신고 사유를 입력하세요. "
								id="summernote" name="dContent" class="form-control" required></textarea>								
					</div>
					<div style="text-align:center; margin-bottom:10px;">
						<button type="sumbit" id="sumbit">제출</button>
						<button type="button" data-dismiss="modal">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
		<script>
			$("#sumbit").on("click", function(){
				alert("게시물이 신고 되었습니다.");
			})
		</script>
	
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
					<c:param name="bCategoryNo" value="${board.bCategoryNo }" />
				</c:url>
				<c:url var="communityDelete" value="communityDelete.do">
					<c:param name="boardNo" value="${board.boardNo }" />
					<c:param name="bCategoryNo" value="${board.bCategoryNo }" />
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
        	<c:if test="${!empty loginUser }">
        	
        	<!-- 댓글 입력 -->
        	<form id="fm-reply" action="replyInsert.do" method="post" enctype="Multipart/form-data">
        		<input type="hidden" name="boardNo" value="${board.boardNo }">
        		<input type="hidden" name="memberNo" value="${loginUser.memberNo }">
				<input type="hidden" name="bCategoryNo" value="${board.bCategoryNo}">
        		<table>
        			<tr>
        				<td style="vertical-align: middle;">${loginUser.memberNickName }</td>
						<td align="center">
							<textarea name="replyContent" rows="3" cols="100" placeholder="댓글을 입력해주세요" style="resize: none;"></textarea>
						</td>
						<td style="vertical-align: middle;">
							<input type="submit" value="등록" class="btn btn-info">
						</td>
					</tr>
        		</table>
        	</form>
        	</c:if>
        	<c:if test="${empty loginUser }">
  	        	<form id="fm-reply" action="replyInsert.do" method="post" enctype="Multipart/form-data">
        			<table>
        				<tr>
        					<td style="vertical-align: middle;">${loginUser.memberNickName }</td>
							<td align="center">
								<a href="http://localhost:8888/groomingProject/loginPage.do?url=%2fgroomingProject%2fhome.do" class="link">로그인</a>을 하시면 댓글 을 등록할 수 있습니다.
							</td>
						</tr>
        			</table>
        		</form>
        	</c:if>
        	
        	<!-- 댓글 목록 -->
        	<table class="table table-responsive-xl" align="center" style="width: 80%">
        		<tr>
        			<th>작성자</th>
        			<th>내용</th>
        			<th>작성일</th>
        			<th></th>
        		</tr>

        		<c:forEach var="r" items="${replyList }">
        			<tr>
        				<td>${r.memberNickName}</td>
        				<td>${r.replyContent }
        				
						<c:url var="replyDelete" value="replyDelete.do">
							<c:param name="boardNo" value="${board.boardNo }" />
							<c:param name="bCategoryNo" value="${board.bCategoryNo }" />
							<c:param name="replyNo" value="${r.replyNo }" />
						</c:url>
        					
        				<c:url var="replyUpdate" value="replyUpdate.do">
							<c:param name="boardNo" value="${board.boardNo }" />
							<c:param name="bCategoryNo" value="${board.bCategoryNo }" />
							<c:param name="replyNo" value="${r.replyNo }" />
							<c:param name="replyContent" value="${r.replyContent }" />
						</c:url> 		
        					
        					<form action="${replyUpdate}" style="display: flex;" method = "post" id="rUpdate${r.replyNo }">
        					
        						<textarea rows="3" cols="70" style="display:none;" class="rUpdate" name="rUpdate" id="1update${r.replyNo }">${r.replyContent }</textarea>
        						<input type="submit" style="display:none;" class="rUpdate_btn" id="2update${r.replyNo }" value="수정">
        						<input type="button" style="display:none;" class="rClose_btn" id="3update${r.replyNo }" onclick="close();" value="취소">
        					</form>
        				</td>
        				<td>${r.replyModifyDate }</td>
                      	<c:if test="${loginUser.memberNo eq r.memberNo }">	
        				<!-- 수정/삭제 버튼-->
        					<td>
								<div class="dropdown open">
                            		<a href="javascript://" data-toggle="dropdown" aria-expanded="true">
                            			<i class="fa fa-cog" data-toggle="tooltip" data-placement="left" title="" data-original-title="댓글설정" style="color: gray;"></i>
                            		</a>
                               		<ul class="dropdown-menu" role="menu">
                                		<li style="text-align: center;">
                                			<a class="note-edit-btn replyUpdate" id="update${r.replyNo }">수정</a>
                                		</li>
                                    	<li style="text-align: center;">
                                    		<a href="${replyDelete }" class="note-delete-btn" id="replyDelete">삭제</a>
                                   	 	</li>
    								</ul>
                     			</div>
                     		</td>
                     	</c:if> 
					</tr> 
					
					<script>
						$(function(){
							debugger;
							$("#update${r.replyNo }").on("click",function(){
								// 톱니바퀴 버튼 안의 "수정" 누르면 실행되는 구문
								// 내가 누른 댓글 수정하기
								// #1update (수정하려고 만든 input,textarea의 id들) ${r.replyNo} (로그인한 유저의 댓글의 댓글 번호) 
								$('#1update${r.replyNo }').css('display','block'); // 댓글 text
								$('#2update${r.replyNo }').css('display','block'); // 수정
								$('#3update${r.replyNo }').css('display','block'); // 삭제
							})			
						})
					</script>
 					<script>
 					// 취소
						$(function(){
							$("#3update${r.replyNo }").on("click",function(){
								$('#1update${r.replyNo }').css('display','none'); // 댓글 text
								$('#2update${r.replyNo }').css('display','none'); // 수정
								$('#3update${r.replyNo }').css('display','none'); // 삭제
							})
						})
					</script> 
                 		
       	 		</c:forEach>
        	</table>
        	<hr>
		</div>
	</div>		
</section>

</body>
</html>