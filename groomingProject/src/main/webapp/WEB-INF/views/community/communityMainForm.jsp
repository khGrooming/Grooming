<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- -------------- style 부분------------- -->
<style type="text/css">
	.Img_ra{
		width:40px;
		height:40px;
	}
	.table_ra>tbody>tr>td, .table_ra>tbody>tr>th, .table_ra>tfoot>tr>td, .table_ra>tfoot>tr>th, .table_ra>thead>tr>td, .table_ra>thead>tr>th {
    	vertical-align: middle;
    	text-align:center;
	}
	/* 해시태그 */
	.tagKind {
	    color: blue;
    	padding: 5px;
    	margin-right: 50px;
    	margin-left: 30px;
    	font-size: 13px;
	}
	
	.paginationCSS a {
   		color: #2b2b2b;
    	text-decoration: none;
    	background-color: transparent;
    	padding: .5em 1em;
	}	
	.aTag{
		line-height:64px;
	}
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>
	<div class="container" align="center">
	<!-- ------------------ 랭킹 시스템 -------------------- -->
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<table class="table table_ra" id="communityTopList">
				<thead>
					<tr>
						<th>순위</th>
						<th>게시물</th>
						<th>조회 수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><img class="Img_ra" alt="1st" src="${contextPath }/resources/views/images/1st.PNG"></td>

					</tr>
					<tr>
						<td><img class="Img_ra" alt="2st" src="${contextPath }/resources/views/images/2st.PNG"></td>

					</tr>
					<tr>
						<td><img class="Img_ra" alt="3st" src="${contextPath }/resources/views/images/3st.PNG"></td>

					</tr>
				</tbody>
			</table>	
		</div>
		<div class="col-sm-3"></div>
		
		<script>
			function communityTopList(){
				// ajax 관련 코드
				$.ajax({
					url:"topList.do",
					dataType:"json",
					
					success:function(data){
						$tableBody = $("#communityTopList tbody");
						$tableBody.html(
								'<tr id="ranking1">' +
								'<td><img class="Img_ra" alt="1st" src="${contextPath }/resources/views/images/1st.PNG"></td>' +
								'</tr>' +
								
								'<tr id="ranking2">' +
								'<td><img class="Img_ra" alt="2st" src="${contextPath }/resources/views/images/2st.PNG"></td>' +
								'</tr>' +
								
								'<tr id="ranking3">' +
								'<td><img class="Img_ra" alt="3st" src="${contextPath }/resources/views/images/3st.PNG"></td>'+
								'</tr>');	
						
						for(var i = 0; i < data.length; i++){
							var boardNo = "${boardNo}";
							//console.log(data[i].boardNo);
							var $boardTitle = $("<td>");
							var $aTag = $("<a>").attr("href","communityDetailView.do?boardNo="+data[i].boardNo)
												.text(data[i].boardTitle)
												.addClass("aTag");
							var $boardVcount = $("<td>").text(data[i].boardVcount);
							$boardTitle.append($aTag);
							if(i ==0) $("#ranking1").append($boardTitle).append($boardVcount);
							if(i ==1) $("#ranking2").append($boardTitle).append($boardVcount);
							if(i ==2) $("#ranking3").append($boardTitle).append($boardVcount);
						}
					},
					error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
				})		
			}
			
			$(function(){
				communityTopList();
				
				setInterval(function(){
					communityTopList();
				}, 600000);
			})
			
		</script>		
	<!-- ------------------ 랭킹 시스템 -------------------- -->
	
	<!-- ------------------ 정렬 ------------------------- -->
	<!--	<div class="container filterBoard" align="left">
			<input type="radio" id="filterBoard_1" name="filterBoard" checked><label for="filterBoard_1">&nbsp;최신순</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" id="filterBoard_2" name="filterBoard"><label for="filterBoard_2">&nbsp;조회순</label>&nbsp;&nbsp;&nbsp;
		</div> -->
	<!-- ------------------ 게시글 리스트 ------------------- -->
		<div class="container" align="center">
			<table class="table table-hover table_ra">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>글 제목</th>
						<th>닉네임</th>
						<th>조회 수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${list }">
						<tr>
							<td>${n.boardNo }</td>
							<td>															
								<c:url var="communityDetailView" value="communityDetailView.do">
									<c:param name="boardNo" value="${n.boardNo }" />
								</c:url>
								<a href="${communityDetailView }">${n.boardTitle }</a>
							</td>
							<td>${n.memberNickName }</td>
							<td>${n.boardVcount }</td>
							<td>${n.boardModifyDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 페이징 처리 부분 -->
			<table>
					<tr class="paginationCSS" height="20">
						<td colspan="5">
					<!-- [이전] -->
							<c:if test="${pi.currentPage eq 1 }">
								[이전]&nbsp;
							</c:if>		
							<c:if test="${pi.currentPage gt 1 }">
								<c:url var="communityMainBack" value="communityMain.do">
									<c:param name="bCategoryNo" value="${bCategoryNo}"/>
									<c:param name="page" value="${pi.currentPage -1 }"></c:param>
								</c:url>
								<a href="${communityMainBack }">[이전]</a>
							</c:if>		
					<!-- [번호들] -->
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<c:if test="${p eq pi.currentPage }">
									<font color="red" size="4"><b>${p}</b></font>
								</c:if>
								<c:if test="${p ne pi.currentPage }">
									<c:url var="communityMainCheck" value="communityMain.do">
										<c:param name="bCategoryNo" value="${bCategoryNo}"/>
										<c:param name="page" value="${p}"></c:param>
									</c:url>
									<a href="${communityMainCheck }">${p}</a>
								</c:if>
							</c:forEach>			
					<!-- [이후] -->
							<c:if test="${pi.currentPage eq pi.maxPage }">
								&nbsp;[이후]
							</c:if>		
							<c:if test="${pi.currentPage lt pi.maxPage }">
								<c:url var="communityMainAfter" value="communityMain.do">
									<c:param name="bCategoryNo" value="${bCategoryNo}"/>
									<c:param name="page" value="${pi.currentPage +1 }"></c:param>
								</c:url>
								<a href="${communityMainAfter }">[이후]</a>
							</c:if>	
						</td>
					</tr>
			</table>
		</div>
	</div>
	
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>

</body>
</html>