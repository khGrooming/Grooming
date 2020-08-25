<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#content {
	width: 70%;
	height: 1000px;
	margin: 3% auto;
}
.grayBox1{
	position:relative;
	width: 100%;
	border:1px solid gray;
	border-radius: 10px;
	
}
#dday_div {
	position: absolute;
	top: 10px;
	left: 10px;
	width: 40px;
	height: 40px;
	border-radius: 50px;
	background: white;
}
#dday_div div {
	margin: 25% 5%;
	font-size: 12px;
}
</style>
</head>
<body>

<jsp:include page="./mypageinfo.jsp" />
<div id="content">
<br>
<br>
	<p>내가 만든 스터디</p>
		<c:if test="${!empty hpgList }">
	<div class="grayBox1" >
		<div style="width: 90%; margin:1% auto;">
 		<c:forEach var="hpg" items="${hpgList }">
	  		<c:url var="groupPage" value="groupPage.do">
				<c:param name="groomingNo" value="${hpg.groomingNo}"/>
			</c:url>
		<div style="position:relative; border:3px solid #17a2b8; width: 23%; height:100%;float: left; margin-left:5px; margin-right: 10px; border-radius: 20px;" onclick="location.href='${groupPage}'">
			<div id="dday_div" style="border:3px solid gray;">
				<div>
					${hpg.groomingType}
				</div>
			</div>

			<div style="width: 100%;border-bottom: 2px solid #17a2b8;">
				<br>
				<img src="${contextPath }/resources/views/images/${hpg.groomingImg}" style=" width:70%; margin-left: 13%;"><br><br>
			</div>
			<div style="width: 97%; margin-left: auto; margin-right: auto;">
			<p style="font-size: 20px; ">${hpg.groomingTitle}</p>
				
				<div style="margin:2px 5px;">
					<span>${hpg.groomingType}</span>
				
				</div> 
			</div>
		</div>
		
			</c:forEach>
			</div>
			<br clear="both">
			<div style="margin-left: auto; margin-right: auto; width: 100%; text-align: center; margin-top:1%;">
	
		<c:if test="${pih.currentPage eq 1 }">
			[이전]&nbsp;
		</c:if>
		<c:if test="${pih.currentPage gt 1 }">
			<c:url var="gApplicantBack" value="gApplicant.do">
				<c:param name="pageh" value="${pih.currentPage -1 }"/>
				<c:param name="page" value="${pi.currentPage}"/>
			</c:url>
			<a href="${gApplicantBack }">[이전]</a>
		</c:if>
		<c:forEach var="p" begin="${pih.startPage }" end="${pih.endPage }">
			<c:if test="${p eq pih.currentPage }">
				<font color="red" size="4"><b>[${p }]</b></font>
			</c:if>
			<c:if test="${p ne pih.currentPage }">
				<c:url var="gApplicantCheck" value="gApplicant.do">
				<c:param name="pageh" value="${p }"/>
				<c:param name="page" value="${pi.currentPage}"/>
				</c:url>
				<a href="${gApplicantCheck }">${p }</a>
			</c:if>
		</c:forEach>
		<c:if test="${pih.currentPage eq pih.maxPage }">
			&nbsp;[이후]
		</c:if>
		<c:if test="${pih.currentPage lt pih.maxPage }">
			<c:url var="gApplicantAfter" value="gApplicant.do">
				<c:param name="pageh" value="${pih.currentPage +1 }"/>
				<c:param name="page" value="${pi.currentPage}"/>
			</c:url>
			<a href="${gApplicantAfter }">[이후]</a>
		</c:if>
	</div>	
		</div>
	</c:if>
	<c:if test="${empty hpgList }">
		<div class="grayBox1" style="height: 300px;">
			<p>스터디 만들러 가기</p>
		</div>
	</c:if>
		
	<br>
	<br>
	<br clear="both">
	<p>참여 중인 스터디</p>
	<c:if test="${!empty mpgList }">
	<div class="grayBox1" >
		<div style="width: 90%; margin:1% auto;">
 		<c:forEach var="mpg" items="${mpgList }">
	   <c:url var="groupPage" value="groupPage.do">
				<c:param name="groomingNo" value="${mpg.groomingNo}"/>
			</c:url>
		<div style="position:relative; border:3px solid #17a2b8; width: 23%; height:100%;float: left; margin-left:5px; margin-right: 10px; border-radius: 20px;" onclick="location.href='${groupPage}'">
			<div id="dday_div" style="border:3px solid gray;">
				<div>
					${mpg.groomingType}
				</div>
			</div>

			<div style="width: 100%;border-bottom: 2px solid #17a2b8;">
				<br>
				<img src="${contextPath }/resources/views/images/${mpg.groomingImg}" style=" width:70%; margin-left: 13%;"><br><br>
			</div>
			<div style="width: 97%; margin-left: auto; margin-right: auto;">
			<p style="font-size: 20px; ">${mpg.groomingTitle}</p>
				
				<div style="margin:2px 5px;">
					<span>${mpg.groomingType}</span>
				
				</div> 
			</div>
		</div>
		
			</c:forEach>
			</div>
			<br clear="both">
			<div style="margin-left: auto; margin-right: auto; width: 100%; text-align: center; margin-top:1%;">
	
		<c:if test="${pi.currentPage eq 1 }">
			[이전]&nbsp;
		</c:if>
		<c:if test="${pi.currentPage gt 1 }">
			<c:url var="mpgroomingBack" value="mpgrooming.do">
				<c:param name="page" value="${pi.currentPage -1 }"/>
				<c:param name="pageh" value="${pih.currentPage}"/>
			</c:url>
			<a href="${mpgroomingBack }">[이전]</a>
		</c:if>
		<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
			<c:if test="${p eq pi.currentPage }">
				<font color="red" size="4"><b>[${p }]</b></font>
			</c:if>
			<c:if test="${p ne pi.currentPage }">
				<c:url var="mpgroomingCheck" value="mpgrooming.do">
				<c:param name="page" value="${p }"/>
				<c:param name="pageh" value="${pih.currentPage}"/>
				</c:url>
				<a href="${mpgroomingCheck }">${p }</a>
			</c:if>
		</c:forEach>
		<c:if test="${pi.currentPage eq pi.maxPage }">
			&nbsp;[이후]
		</c:if>
		<c:if test="${pi.currentPage lt pi.maxPage }">
			<c:url var="mpgroomingAfter" value="mpgrooming.do">
				<c:param name="page" value="${pi.currentPage +1 }"/>
				<c:param name="pageh" value="${pih.currentPage}"/>
			</c:url>
			<a href="${mpgroomingAfter }">[이후]</a>
		</c:if>
	</div>	
		</div>
		</c:if>
		<c:if test="${empty mpgList }">
		<div class="grayBox1" style="height: 300px;">
			<p>스터디 가입하러 가기</p>
		</div>
		</c:if>
	</div>	
         `

<jsp:include page="../common/footer.jsp" />
</body>
</html>