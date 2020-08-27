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
</style>
<!-- -------------- style 부분------------- -->
</head>
<body>
	<div class="container" align="center">
	<!-- ------------------ 랭킹 시스템 -------------------- -->
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<table class="table table_ra">
				<thead>
					<tr>
						<th>순위</th>
						<th>닉네임</th>
						<th>채택 수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><img class="Img_ra" alt="1st" src="${contextPath }/resources/views/images/1st.PNG"></td>
						<td>이아라</td>
						<td>100</td>
					</tr>
					<tr>
						<td><img class="Img_ra" alt="2st" src="${contextPath }/resources/views/images/2st.PNG"></td>
						<td>이아라</td>
						<td>100</td>
					</tr>
					<tr>
						<td><img class="Img_ra" alt="3st" src="${contextPath }/resources/views/images/3st.PNG"></td>
						<td>이아라</td>
						<td>100</td>
					</tr>
				</tbody>
			</table>	
		</div>
		<div class="col-sm-3"></div>
	<!-- ------------------ 랭킹 시스템 -------------------- -->
	
	<!-- ------------------ 정렬 ------------------------- -->
		<div class="container" align="left">
			<input type="radio" id="rf_1_ra" name="filter_ra"><label for="rf_1_ra">&nbsp;최신순</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" id="rf_2_ra" name="filter_ra"><label for="rf_2_ra">&nbsp;조회순</label>&nbsp;&nbsp;&nbsp;
			<input type="radio" id="rf_3_ra" name="filter_ra"><label for="rf_3_ra">&nbsp;댓글순</label>
		</div>
	<!-- ------------------ 정렬 ------------------------- -->
	<!-- ------------------ 게시글 리스트 ------------------- -->
		<div class="container" align="center">
			<table class="table table_ra">
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
							<td>${n.boardModifyDate }</td>
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