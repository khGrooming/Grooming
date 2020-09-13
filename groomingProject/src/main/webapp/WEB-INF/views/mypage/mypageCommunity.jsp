<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#content {
	width:73%;
	height: 800px;
	margin: 0 auto;
}
.subcontent {
	position: relative;
	height : 650px;
	padding: 2%;
	border-radius: 20px;
}
#communityTb{
	width: 100%; 
	text-align: center;
}
#communityTb tr{
	height: 45px;
	
	border-bottom: 1px solid gray;
}
#communityTb th{

	letter-spacing: 0.3em;
	font-size:20px;
}

#communityTb td{
	font-size:16px;
}
</style>
</head>
<body>
<jsp:include page="./mypageinfo.jsp" />
		<div id="content">
		<h4>내가 쓴 게시글</h4>
			<div class="subcontent">
			<div style="width: 100%; height:580px; margin:0 auto;">
			<table id="communityTb">	
				<tr>
					<th >NO</th>
					<th>분류</th>
					<th style="width: 40%">제목</th>
					<th>조회수</th>
					<th>좋아요</th>
					<th>채택</th>
					<th>작성일</th>
				</tr>		
		<c:if test="${!empty blist }">
			<c:forEach var="b" items="${blist}">
				<tr >
					<c:url var="communityDetailView" value="communityDetailView.do">
						<c:param name="boardNo" value="${b.boardNo }" />
					</c:url>
					<td>${b.boardNo }</td>
					<td>${b.bCategoryNo }</td>
					<td onclick="location.href='${communityDetailView}'">${b.boardTitle }</td>
					<td>${b.boardVcount }</td>
					<td>${b.boardGcount }</td>
					<td>${b.boardSelecStatus }</td>
					<td>${b.boardCreateDate }</td>
				</tr>			
			</c:forEach>
		</c:if>
		
			</table>
		<c:if test="${empty blist }">			
		<div style="width:20%; margin:2% auto;">
		작성한 게시글이 없습니다.
		</div>
		</c:if>
			</div>
		<c:if test="${!empty pi }">
				<div style="margin-left: auto; margin-right: auto; width: 100%; text-align: center; margin-top:1%;">
				
					<c:if test="${pi.currentPage eq 1 }">
						[이전]&nbsp;
					</c:if>
					<c:if test="${pi.currentPage gt 1 }">
						<c:url var="mypageCommunityBack" value="mypageCommunity.do">
							<c:param name="page" value="${pi.currentPage -1 }"/>
						</c:url>
						<a href="${mypageCommunityBack }">[이전]</a>
					</c:if>
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<font color="red" size="4"><b>[${p }]</b></font>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="mypageCommunityCheck" value="mypageCommunity.do">
							<c:param name="page" value="${p }"/>
							</c:url>
							<a href="${mypageCommunityCheck }">${p }</a>
						</c:if>
					</c:forEach>
					<c:if test="${pi.currentPage eq pi.maxPage }">
						&nbsp;[이후]
					</c:if>
					<c:if test="${pi.currentPage lt pi.maxPage }">
						<c:url var="mypageCommunityAfter" value="mypageCommunity.do">
							<c:param name="page" value="${pi.currentPage +1 }"/>
						</c:url>
						<a href="${mypageCommunityAfter }">[이후]</a>
					</c:if>
				</div>	
				
			
			</c:if>
			</div>
		</div>
<jsp:include page="../common/footer.jsp" />	
</body>
</html>