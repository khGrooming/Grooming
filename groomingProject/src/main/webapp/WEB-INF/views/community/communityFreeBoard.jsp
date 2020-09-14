<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- -------------- style 부분------------- -->
<style type="text/css">
	.table_ra>tbody>tr>td, .table_ra>tbody>tr>th, .table_ra>tfoot>tr>td, .table_ra>tfoot>tr>th, .table_ra>thead>tr>td, .table_ra>thead>tr>th {
    	vertical-align: middle;
    	text-align:center;
	}
</style>
<!-- ------ 검색 ------- -->
<style type="text/css">
.d1 {
  position: relative;
  width: 300px;
  margin: 0 auto;
}
.d1 input {
  width: 100%;
  height: 42px;
  padding-left: 10px;
  border: 2px solid #7BA7AB;
  border-radius: 5px;
  outline: none;
  background: #F9F0DA;
  color: #9E9C9C;
}
.d1 button {
  position: absolute; 
  top: 0;
  right: 0px;
  width: 42px;
  height: 42px;
  border: none;
  background: #7BA7AB;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
}
.d1 button:before {
  content: "\f002";
  font-family: FontAwesome;
  font-size: 16px;
  color: #F9F0DA;
}
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>
	<div class="d1">
  		<input type="text" placeholder="제목으로 검색해주세요" name="communitySearch" id="communitySearch">
  		<button name="btnSearch" id="btnSearch"></button>
	</div>
	<!-- ------------------ 검색 -------------------- -->
	<!-- ------------------ 정렬 ------------------- -->
		<div class="container" align="left">
			<c:if test="${!empty loginUser }">
				<input type="button" value="글쓰기" class="btn btn-info" style="float: right;"
						onclick="location.href='communityInsertView.do?bCategoryNo=BC00002'">
			</c:if>
		</div>
		<br><br>
	<!-- ------------------ 게시판 -------------------------- -->
		<div class="container" align="center">
			<table class="table table-hover table_ra">
				<thead>
					<tr>
						<th>글 번호</th>
						<th>글 제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				
				<tbody id="searchTbody">
					<c:forEach var="n" items="${flist }">
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
							<td>${n.boardCreateDate }</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
			<!-- 페이징 처리 부분 -->
			<table>
					<tr class="paginationCSS" height="20">
						<td colspan="5">
					<!-- [이전] -->
							<c:if test="${fpi.currentPage eq 1 }">
								[이전]&nbsp;
							</c:if>		
							<c:if test="${fpi.currentPage gt 1 }">
								<c:url var="communityMainBack" value="communityMain.do">
									<c:param name="bCategoryNo" value="BC00002"/>
									<c:param name="page" value="${fpi.currentPage -1 }"></c:param>
								</c:url>
								<a href="${communityMainBack }">[이전]</a>
							</c:if>		
					<!-- [번호들] -->
							<c:forEach var="p" begin="${fpi.startPage }" end="${fpi.endPage }">
								<c:if test="${p eq fpi.currentPage }">
									<font color="red" size="4"><b>${p}</b></font>
								</c:if>
								<c:if test="${p ne fpi.currentPage }">
									<c:url var="communityMainCheck" value="communityMain.do">
										<c:param name="bCategoryNo" value="BC00002"/>
										<c:param name="page" value="${p}"></c:param>
									</c:url>
									<a href="${communityMainCheck }">${p}</a>
								</c:if>
							</c:forEach>			
					<!-- [이후] -->
							<c:if test="${fpi.currentPage eq fpi.maxPage }">
								&nbsp;[이후]
							</c:if>		
							<c:if test="${fpi.currentPage lt fpi.maxPage }">
								<c:url var="communityMainAfter" value="communityMain.do">
									<c:param name="bCategoryNo" value="BC00002"/>
									<c:param name="page" value="${fpi.currentPage +1 }"></c:param>
								</c:url>
								<a href="${communityMainAfter }">[이후]</a>
							</c:if>	
						</td>
					</tr>
			</table>
		</div>
	<!-- 검색 -->
	<c:url var="communityFreeBoardURL" value="/community/communityFreeBoard"></c:url>
	<script>
		$("#btnSearch").on("click", function(){
			search();
		})
		$("#communitySearch").keyup(function(e){
			if(e.keyCode == 13){
				search();
			}
		});
		function search(){
			var communitySearch = $("#communitySearch").val();
			
			if(communitySearch == ""){
				alert("한 글자 이상 검색해주셔야 합니다^^")
			}else{
				// communityFBSearch.do 쪽으로 communitySearch를 get방식으로 보냄
				location.href="communityFBSearch.do?communitySearch="+communitySearch;
			}
		}
	</script>
	
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
	
</body>
</html>