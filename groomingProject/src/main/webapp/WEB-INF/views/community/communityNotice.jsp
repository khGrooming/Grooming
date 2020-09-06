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
<!-- -------------- style 부분------------- -->
</head>
<body>
<div class="container" align="center">
	<c:if test="${ loginUser.memberAdmin eq 'Y' }">
		<div class="container" align="center">
			<input type="button" value="글쓰기" class="btn btn-info" style="margin-left: 640px;"
					onclick="location.href='communityInsertView.do?bCategoryNo=BC00001'">
		</div>
		<br>
	</c:if>
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
					<c:forEach var="n" items="${nlist }">
						<tr>
							<td>${n.boardNo }</td>
							<td>															
								<c:if test="${!empty loginUser }">
									<c:url var="communityDetailView" value="communityDetailView.do">
										<c:param name="boardNo" value="${n.boardNo }" />
									</c:url>
									<a href="${communityDetailView }">${n.boardTitle }</a>
								</c:if>
								<c:if test="${empty loginUser }">
									${n.boardTitle }
								</c:if>
							</td>
							<td>${n.memberNickName }</td>
							<td>${n.boardVcount }</td>
							<td>${n.boardCreateDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>

</body>
</html>