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

#dday_div {
	position: absolute;
	top: 10px;
	left: 10px;
	width: 50px;
	height: 50px;
	border-radius: 50px;
	background: white;
}

#dday_div div {
	margin: 27% 5%;
	font-size: 15px;
}

#gCard {
	position: relative;
	border: 3px solid #17a2b8;
	width: 23%;
	float: left;
	margin-left: 5px;
	margin-right: 10px;
	border-radius: 20px;
}
</style>
</head>
<body>
<jsp:include page="./mypageinfo.jsp" />
<div id="content">
	<h3>신청 내역</h3>
	<div>
	 		<c:forEach var="app" items="${appList }">
	   <c:url var="gdetail" value="groomingDetail.do">
			<c:param name="groomingNo" value="${app.groomingNo }"/>
			<%-- <c:param name="page" value="${pi.currentPage }"/> --%>
			<!-- 현재 보던 페이지 정보도 넘기자 -->
		</c:url>
			
		         <fmt:formatDate value="${app.groomingNd }" var="nowDate1" pattern="yyyyMMdd"/>	   	
	 	 		<fmt:formatDate value="${app.groomingEd }" var="endDate1" pattern="yyyyMMdd"/>	 	 		
	 	 		<fmt:parseDate value="${nowDate1 }" var="nowDate2" pattern="yyyyMMdd" />
	 	 		<fmt:parseDate value="${endDate1 }" var="endDate2" pattern="yyyyMMdd" />	 	 		
		    	<fmt:parseNumber value="${(endDate2.time - nowDate2.time)/ ( 24*60*60*1000)}" integerOnly="true" var="difDate"/> 
		<div id="gCard"onclick="location.href='${groupPage}'">
			<c:if test="${app.applyStatus eq 'Y' }">
		
				<c:if test="${app.groomingEd gt app.groomingNd }">
					<div id="dday_div" style="border:3px solid green;">
						<div style="font-size:13px;">
							&nbsp;심사중
						</div>
					</div>
				</c:if>
				<c:if test="${app.groomingEd lt app.groomingNd }">
					<div id="dday_div" style="border:3px solid grey;background: lightgrey;">
						<div>
							&nbsp;마감
						</div>
					</div>
				</c:if>
			</c:if>	
			<c:if test="${app.applyStatus eq 'C' }">
				<div id="dday_div" style="border:3px solid blue;">
						<div>
							&nbsp;합격
						</div>
					</div>
			</c:if>
			<c:if test="${app.applyStatus eq 'D' }">
				<div id="dday_div" style="border:3px solid blue;">
						<div>
							&nbsp;탈락
						</div>
					</div>
			</c:if>
			<div style="position: absolute;  right: 5%;" onclick="deleteAppli('${app.gApplyNo}');">
				<img src="${contextPath }/resources/views/icons/XIcon.png" style="width: 15px;">
			</div>
				
			<br>
			<br>
			<div style="width: 100%;border-bottom: 2px solid #17a2b8;">
				<img src="${contextPath }/resources/views/images/${app.groomingImg}" style=" width: 90%; margin-left: 5%;"><br><br>
			</div>
			<div style="width: 97%; margin-left: auto; margin-right: auto;">
			<p style="font-size: 20px; ">${app.groomingTitle}</p>
				<div style="width: 97%; height: 80px;">
				
					<p style="font-size: 10px;">${app.groomingIntroduce}</p><br>
				</div>
				<div style="margin:2px 5px;">
					<span>${app.groomingType}</span>
					<span style="float: right;">${app.currentP}/${app.groomingP}</span>
				
				</div> 
			</div>
			

		</div>
		
	</c:forEach> 
	</div>
	<br>
	<br>
	<br clear="both">
	<script>
		function deleteAppli(gaNo){
			var check = confirm("신청을 취소 하시겠습니까?");
			if(check){
				$.ajax({
					url:"deleteAppl.do",
					type:"post",
					data:{gaNo:gaNo,mNo:"${loginUser.memberNo}",page:"${pi.currentPage }"},
					success:function(data) {
						if(data == "Y"){
							alert("삭제되었습니다");
						}
					},
					error:function(data) {
						alert("code:" +request.status +"\n"+
								+ "error:"+ error);
					}

				})
			
			}else{
				alert("취소하였습니다.");
			}
		}
	</script>
	
	<div style="margin-left: auto; margin-right: auto; width: 100%; text-align: center; margin-top:5%;">
	
		<c:if test="${pi.currentPage eq 1 }">
			[이전]&nbsp;
		</c:if>
		<c:if test="${pi.currentPage gt 1 }">
			<c:url var="gApplicantBack" value="gApplicant.do">
				<c:param name="page" value="${pi.currentPage -1 }"/>
			</c:url>
			<a href="${gApplicantBack }">[이전]</a>
		</c:if>
		<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
			<c:if test="${p eq pi.currentPage }">
				<font color="red" size="4"><b>[${p }]</b></font>
			</c:if>
			<c:if test="${p ne pi.currentPage }">
				<c:url var="gApplicantCheck" value="gApplicant.do">
				<c:param name="page" value="${p }"/>
				</c:url>
				<a href="${gApplicantCheck }">${p }</a>
			</c:if>
		</c:forEach>
		<c:if test="${pi.currentPage eq pi.maxPage }">
			&nbsp;[이후]
		</c:if>
		<c:if test="${pi.currentPage lt pi.maxPage }">
			<c:url var="gApplicantAfter" value="gApplicant.do">
				<c:param name="page" value="${pi.currentPage +1 }"/>
			</c:url>
			<a href="${gApplicantAfter }">[이후]</a>
		</c:if>
	</div>	
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>