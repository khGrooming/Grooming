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
	margin: 5% auto;
}
</style>
</head>
<body>

<jsp:include page="./mypageinfo.jsp" />
<div id="content">
<h3>현재 진행중인 그루밍들 다 보이도록 합시다</h3>
 		<%-- <c:forEach var="app" items="${appList }">
	   <c:url var="groupPage" value="groupPage.do" />
			
		         <fmt:formatDate value="${app.groomingNd }" var="nowDate1" pattern="yyyyMMdd"/>	   	
	 	 		<fmt:formatDate value="${app.groomingEd }" var="endDate1" pattern="yyyyMMdd"/>	 	 		
	 	 		<fmt:parseDate value="${nowDate1 }" var="nowDate2" pattern="yyyyMMdd" />
	 	 		<fmt:parseDate value="${endDate1 }" var="endDate2" pattern="yyyyMMdd" />	 	 		
		    	<fmt:parseNumber value="${(endDate2.time - nowDate2.time)/ ( 24*60*60*1000)}" integerOnly="true" var="difDate"/> 
		<div style="position:relative; border:3px solid #17a2b8; width: 23%;float: left; margin-left:5px; margin-right: 10px; border-radius: 20px;" onclick="location.href='${groupPage}'">
			<c:if test="${app.applyStatus eq 'Y' }">
		
				<c:if test="${app.groomingEd gt app.groomingNd }">
					<div id="dday_div" style="border:3px solid green;">
						<div >
							D-${difDate }
						</div>
					</div>
				</c:if>
				<c:if test="${app.groomingEd lt app.groomingNd }">
					<div id="dday_div" style="border:3px solid red;">
						<div>
							&nbsp;마감
						</div>
					</div>
				</c:if>
			</c:if>	
			<c:if test="${app.applyStatus eq 'N' }">
				<div id="dday_div" style="border:3px solid blue;">
						<div>
							&nbsp;합격
						</div>
					</div>
			</c:if>
		
			<img src="${contextPath }/resources/views/images/${app.groomingImg}" style=" width: 100%;border-bottom: 2px solid #17a2b8"><br><br>
			<div style="width: 97%; margin-left: auto; margin-right: auto;">
			<p style="font-size: 20px; ">${app.groomingTitle}</p>
			<div style="width: 97%; height: 100px;">
			
			<p style="font-size: 10px;">${app.groomingIntroduce}</p><br>
			</div>
			<div>
			<span>${app.groomingType}</span>
			<span style="float: right;">${app.currentP}/${app.groomingP}</span>
			
			</div>
			</div>
			
			
			
		<br>
		</div>
		
	</c:forEach> --%>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>