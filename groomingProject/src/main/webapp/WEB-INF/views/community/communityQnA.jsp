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
	/* 해시태그 */
	.tagKind {
	    color: blue;
    	padding: 5px;
    	margin-right: 50px;
    	margin-left: 30px;
    	font-size: 13px;
	}
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>
	<!-- ------------------ 해시태그 검색 -------------------- -->
		
	<!-- ------------------ 정렬 ------------------- -->
		<div class="container" align="left">
			<input type="radio" id="Qfilter_1" name="Qfilter"  checked><label for="Qfilter_1">&nbsp;최신순</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" id="Qfilter_2" name="Qfilter"><label for="Qfilter_2">&nbsp;조회순</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" id="Qfilter_4" name="Qfilter"><label for="Qfilter_4">&nbsp;채택순</label>&nbsp;&nbsp;&nbsp;
			<c:if test="${!empty loginUser }">
				<input type="button" value="질문하기" class="btn btn-info" style="float: right;"
						onclick="location.href='communityInsertView.do?bCategoryNo=BC00005'">
			</c:if>
		</div>
		<br>
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
				<tbody>
					<c:forEach var="n" items="${qlist }">
						<tr>
							<td>${n.boardNo }</td>
							<td>
								<a href="#" class="tagKind">#스터디</a>
								<br>
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
							<c:if test="${qpi.currentPage eq 1 }">
								[이전]&nbsp;
							</c:if>		
							<c:if test="${qpi.currentPage gt 1 }">
								<c:url var="communityMainBack" value="communityMain.do">
									<c:param name="bCategoryNo" value="BC00005"/>
									<c:param name="page" value="${qpi.currentPage -1 }"></c:param>
								</c:url>
								<a href="${communityMainBack }">[이전]</a>
							</c:if>		
					<!-- [번호들] -->
							<c:forEach var="p" begin="${qpi.startPage }" end="${qpi.endPage }">
								<c:if test="${p eq qpi.currentPage }">
									<font color="red" size="4"><b>${p}</b></font>
								</c:if>
								<c:if test="${p ne qpi.currentPage }">
									<c:url var="communityMainCheck" value="communityMain.do">
										<c:param name="bCategoryNo" value="BC00005"/>
										<c:param name="page" value="${p}"></c:param>
									</c:url>
									<a href="${communityMainCheck }">${p}</a>
								</c:if>
							</c:forEach>			
					<!-- [이후] -->
							<c:if test="${qpi.currentPage eq qpi.maxPage }">
								&nbsp;[이후]
							</c:if>		
							<c:if test="${qpi.currentPage lt qpi.maxPage }">
								<c:url var="communityMainAfter" value="communityMain.do">
									<c:param name="bCategoryNo" value="BC00005"/>
									<c:param name="page" value="${qpi.currentPage +1 }"></c:param>
								</c:url>
								<a href="${communityMainAfter }">[이후]</a>
							</c:if>	
						</td>
					</tr>
			</table>
		</div>
	
</body>
</html>