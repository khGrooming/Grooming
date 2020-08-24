<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content-op{
	width: 70%;
	height: 1000px;
	margin: 5% auto;
}

</style>
</head>
<body>
<jsp:include page="./mypageinfo.jsp" />
<div class="content-op"><br><br>
<h3>개설한 그룹</h3><br>
<c:if test="${listCount ne 0 }">

	<c:forEach var="op" items="${openGroomingList }">
	   <c:url var="gdetail" value="groomingDetail.do">
			<c:param name="groomingNo" value="${op.groomingNo }"/>
			<%-- <c:param name="page" value="${pi.currentPage }"/> --%>
			<!-- 현재 보던 페이지 정보도 넘기자 -->
		</c:url>
		<div style="border:3px solid #17a2b8; width: 23%;float: left; margin-left:5px; margin-right: 10px; border-radius: 20px;" onclick="location.href='${gdetail}'">
			<img src="${contextPath }/resources/views/images/${op.groomingImg}" style="width: 100%;border-bottom: 2px solid #17a2b8"><br><br>
			<div style="width: 97%; margin-left: auto; margin-right: auto;">
			<p style="font-size: 20px; ">${op.groomingTitle}</p>
			<div style="width: 97%; height: 100px;">
			
			<p style="font-size: 10px;">${op.groomingIntroduce}</p><br>
			</div>
			<div>
			<span>${op.groomingType}</span>
			<span style="float: right;">${op.currentP}/${op.groomingP}</span>
			
			</div>
			</div>
			
			
			
		<br>
		</div>
		
	</c:forEach>
	
	
	<br>
	<br>
	<br><br>
	<br>
	<br><br>
	<br>
	<br><br>
	<br>
	<br><br>
	<br>
	<br clear="both">
	<div style="margin-left: auto; margin-right: auto; width: 100%; text-align: center; margin-top:5%;">
	
		<c:if test="${pi.currentPage eq 1 }">
			[이전]&nbsp;
		</c:if>
		<c:if test="${pi.currentPage gt 1 }">
			<c:url var="opengroomingBack" value="opengrooming.do">
				<c:param name="page" value="${pi.currentPage -1 }"/>
			</c:url>
			<a href="${opengroomingBack }">[이전]</a>
		</c:if>
		<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
			<c:if test="${p eq pi.currentPage }">
				<font color="red" size="4"><b>[${p }]</b></font>
			</c:if>
			<c:if test="${p ne pi.currentPage }">
				<c:url var="opengroomingCheck" value="opengrooming.do">
				<c:param name="page" value="${p }"/>
				</c:url>
				<a href="${opengroomingCheck }">${p }</a>
			</c:if>
		</c:forEach>
		<c:if test="${pi.currentPage eq pi.maxPage }">
			&nbsp;[이후]
		</c:if>
		<c:if test="${pi.currentPage lt pi.maxPage }">
			<c:url var="opengroomingAfter" value="opengrooming.do">
				<c:param name="page" value="${pi.currentPage +1 }"/>
			</c:url>
			<a href="${opengroomingAfter }">[이후]</a>
		</c:if>
	</div>	
</c:if>
<c:if test="${listCount eq 0 }">
	개설한 그룹이 없습니다.
</c:if>

</div>
<br>
<br>
<jsp:include page="../common/footer.jsp" />
</body>
</html>