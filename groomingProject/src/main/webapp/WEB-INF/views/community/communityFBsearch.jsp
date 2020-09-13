<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Grooming</title>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png">

<!-- jQuery -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
<!--datatable-->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" /> -->
<!-- -------------- style 부분------------- -->
<style type="text/css">
	.table_ra>tbody>tr>td, .table_ra>tbody>tr>th, .table_ra>tfoot>tr>td, .table_ra>tfoot>tr>th, .table_ra>thead>tr>td, .table_ra>thead>tr>th {
    	vertical-align: middle;
    	text-align:center;
	}
</style>
<!-- ------ 검색 ------- -->
<style type="text/css">
    	section { padding-top: 6.25rem; min-height: calc(100vh - 3.5rem); }
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
div.dataTables_wrapper {
    width: 70rem;
    margin: 0 auto;
}
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>
<header>
<jsp:include page="../common/mainNavigationBar.jsp" />
	<br><br>
</header>
<!--내용 시작-->
<!-- <section style="padding-top: 0.10rem;"> -->
<section>
	<div class="container-fluid">
    	<div class="row">
    		<div class="col-12">
	<br>
	<h1 align="center">조회된 게시글</h1>
	<br><br>
    		
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
								<c:url var="communityMainBack" value="communityFBSearch.do">
									<c:param name="communitySearch" value="${communitySearch }"/>
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
									<c:url var="communityMainCheck" value="communityFBSearch.do">
										<c:param name="communitySearch" value="${communitySearch }"/>
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
								<c:url var="communityMainAfter" value="communityFBSearch.do">
									<c:param name="communitySearch" value="${communitySearch }"/>
									<c:param name="page" value="${fpi.currentPage +1 }"></c:param>
								</c:url>
								<a href="${communityMainAfter }">[이후]</a>
							</c:if>	
						</td>
					</tr>
			</table>
		</div>
	    		</div>
   		</div>
	</div>
</section>
	
	<!-- 검색 -->
	<c:url var="communityFreeBoardURL" value="/community/communityFreeBoard"></c:url>
	
	<script>
		$(function(){
			$("#btnSearch").on("click", function(){
				var communitySearch = $("#communitySearch").val();
				
				if(communitySearch == ""){
					alert("한 글자 이상 검색해주셔야 합니다^^")
				}else{
					location.href="communityFBSearch.do?communitySearch="+communitySearch;

				}
			})
		})
	</script>

	
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
		
<script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>
	
</body>
</html>