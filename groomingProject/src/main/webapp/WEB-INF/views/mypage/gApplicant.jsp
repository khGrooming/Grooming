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
.content-op{
width: 80%;
height:100%;
margin-right: auto; 
margin-left: auto; 
}
#ta{
	width:80%;
	min-width: 1000px;
	margin-left: auto;
	margin-right: auto;
}
#ta tr:nth-child(n+2){
	height:130px;
	border-bottom: 1px solid black;
}
#ta th{
	font-size: 20px;
}
#ta th{
	text-align: center;
}
#ta tr td{
text-align: center;
}
#ta tr td:nth-child(3){
text-align: left;
}
pre{

 font-family: 'Jua', sans-serif;
}
</style>
</head>

<body>
<jsp:include page="./mypageinfo.jsp" />
<div class="content-op">
<h3 style="width: 80%; margin:0 auto;">신청내역</h3>
<br>
	<div style="height: 700px;">
	<c:if test="${!empty aplist }">
		<table id="ta">
			<tr style="border-bottom: 2px solid;border-top:2px solid; height: 55px ">
				
				<th>타입</th>
				<th>그룹 정보</th>
				<th>예치금</th>
				<th>신청서</th>
				<th>심사결과</th>
				
			
			</tr>
			<c:forEach var="list" items="${aplist }">
				<c:url var="gdetail" value="groomingDetail.do">
					<c:param name="groomingNo" value="${list.groomingNo }"/>
					<%-- <c:param name="page" value="${pi.currentPage }"/> --%>
					<!-- 현재 보던 페이지 정보도 넘기자 -->
				</c:url>
	                        
	           <tr>
				
				<td>
				  ${list.groomingType }
				</td>
				<td onclick="location.href='${gdetail}'" style="width: 700px; padding-left: 10px;" >
					<div style="float: left; margin-right: 20px;">
					<img alt="그루밍 사진" src="${contextPath }/resources/upGroomingFiles/${list.groomingImg }"
						onerror="this.src='${contextPath }/resources/views/images/grooming_logo.png'" width="100px;" height="80px;">
					</div>
					<div  style="float: left; text-align: left;">
					
				
					<p>제목:${list.groomingTitle}</p>
					<div style="width:500px; font-size:10px; overflow: auto;">
					${list.groomingIntroduce }
					</div>
					</div>
					</td>
				<td>
					<c:if test="${list.money eq 0 }">
						-
					</c:if>
					<c:if test="${list.money ne 0 }">
						${list.money }
					</c:if>
				</td>
				<td><p style="cursor: pointer; margin:0;" data-toggle="modal" data-target="#gaContent">신청서보기</p></td>
				
				<td style="position: relative;">
					<c:if test="${list.applyStatus eq 'Y' }">
						<p style="color:#c8ce60;">심사중</p>
					</c:if>
					<c:if test="${list.applyStatus eq 'C' }">
						<p style="color:blue;">합격</p>
					</c:if>
					<c:if test="${list.applyStatus eq 'D' }">
						
						<p style="cursor:pointer; width: 10px; position: absolute; top: 0; right: 0;" onclick="apdelete('${list.gApplicantNo}')">X</p>
						<p style="color:gray">탈락</p>
						
					</c:if>
				
			
				</td>
				
				</tr>
			<div class="modal fade" id="gaContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document" style=" margin-top:200px;">
						<div class="modal-content">
							<div class="modal-header">

								<h4 class="modal-title" id="myModalLabel">작성한 신청서</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
						
							<div class="modal-body">
								<div style="overflow: auto; height: 300px;">
									<pre>${list.gaContent }</pre>
								</div>
							</div>
							
						</div>
					</div>
				</div>	
			</c:forEach>
		
		</table>
		<script>
			function apdelete(gApplicantNo){
				var check = confirm("삭제하시겠습니까?");
				if(check){
					location.href='gAppDelete.do?gApplicantNo='+gApplicantNo+"&page="+${pi.currentPage};
					
				}else{
					alert("취소하였습니다");
				} 
			}
		</script>
	</c:if>
	<c:if test="${empty aplist }">
		<p style="font-size: 25px; text-align: center;">신청내역이 없습니다.</p>
		<p style="text-align: center; cursor: pointer;" onclick="location.href='groomingMain.do'">그루밍 메인으로 가기</p>

	</c:if>
	</div>
	
<br>


<script>
$(function(){
	var day=$("span[id=day]").text();
})



</script>

<br>
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
<br>
<br>
<br>
<br>
</div>
<jsp:include page="../common/footer.jsp" />
</html>