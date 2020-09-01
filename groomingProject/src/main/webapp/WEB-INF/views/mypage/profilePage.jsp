<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<style>
body{
	min-width: 900px;
}
* {
 font-family: 'Jua', sans-serif;
 }
#content {
	width:79%;
	height: 800px;
	margin: 4% auto;
}
.subcontent {
	position: relative;
	height : 650px;
	float: left;
	padding: 2%;
	border-radius: 20px;
}
.subTitle{
position: absolute; 
top:-10px; 
background: white;
width: 150px;
text-align: center;
}

.profile_img {
	width: 110px;
	height: 110px;
	border-radius: 50%;
	margin:0 auto;
}
#specTb td{
font-size: 14px;
}
#grayBox{
	
	border: 1px solid lightgray;
}
.gCard{
position:relative; 
border:3px solid #17a2b8; 
width: 13vw; 
height:370px;
float: left; 
margin-left:5px; 
margin-right: 5px; 
border-radius: 20px;
}
.reRadio{
	margin-right: 2%;
}

</style>
</head>
<body>
<jsp:include page="../common/mainNavigationBar.jsp" />
	<section>
	<div id="content">
		<img src="${contextPath }/resources/views/images/repotBtn.png" style="height: 22px; float: right; margin-right: 1%;" data-toggle="modal" data-target="#reportModal"   >
		<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
	
						<h4 class="modal-title" id="myModalLabel">신고하기</h4><br><br>
						<p>어떤 문제가 있나요?</p>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
						<form id="reportForm" name="reportForm" action="memberReport.do" method="post">
							<div class="modal-body">
								<div style="margin-left: 2%;">
								<input type="hidden" name="memberNo" value="${loginUser.memberNo}">
								<input type="hidden" name="declarationCNo" value="1">
								<input type="hidden" name="declarationNNo" value="${profileInfo.memberNo  }">
								<textarea rows="3" cols="50" id="dContent" name="declarationContent" style="display: none;"></textarea>
								<input type="radio" name="reRadio" class="reRadio" id="r1" value="r1"><label for="r1">괴롭힘 및 사이버 폭력</label><br>
								<input type="radio" name="reRadio" class="reRadio" id="r2" value="r2"><label for="r2">개인정보 침해</label><br>
								<input type="radio" name="reRadio" class="reRadio" id="r3" value="r3"><label for="r3">명의 도용</label><br>
								<input type="radio" name="reRadio" class="reRadio" id="r4" value="r4"><label for="r4">폭력적 위헙</label><br>
								<input type="radio" name="reRadio" class="reRadio" id="r5" value="r5"><label for="r5">스팸 및 사기</label><br>
								<input type="radio" name="reRadio" class="reRadio" id="r6" value="r6"><label for="r6">기타</label><br>
								</div>
								<script>
									$(function(){
										
										$("input:radio[name='reRadio']").change(function(){
											var check=$(this).val();
											
											switch (check) {
											case "r1":
												$("#dContent").val("괴롭힘 및 사이버 폭력");
												break;
											case "r2":
												$("#dContent").val("개인정보 침해");
												break;
											case "r3":
												$("#dContent").val("명의 도용");
												break;
											case "r4":
												$("#dContent").val("폭력적 위헙");
												break;
											case "r5":
												$("#dContent").val("스팸 및 사기");
												break;
											case "r6":
												$("#dContent").css("display","block");
												break;
											default:
												break;
											}
										})
										
										
									
									})
									
									
								
								</script>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"  id="btn-confirm">확인</button>
								<button type="button" id="btn-delete" class="btn btn-default" data-dismiss="modal">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>	
			<script>
				$(function(){
					$("#btn-confirm").on("click",function(){
						var reportForm=$("form[name='reportForm']").serialize();
						$.ajax({
							url:"memberReport.do",
							type:"post",
							data:reportForm,
							success : function(data){
				                if(data == 'Y'){
				                	$("#btn-delete").click();
				                	
				                }
				            },
						error:function(request, status, errorData){
							alert("error code: " + request.status + "\n"
									+"message: " + request.responseText
									+"error: " + errorData);
						}


						})
					})
				})
				
			
			</script>
							
		<h5 style="color:gray; letter-spacing: 0.3em;">No. ${profileInfo.memberNo }</h5>
		<hr style="color:#7b7b7b; margin:0;">
		<div class="subcontent" style="width: 25%;">
			<div style="width: 55%;  margin: 3% auto;">
				<img src="${contextPath}/resources/upprofileFiles/${profileInfo.memberPhoto }" class="profile_img" id="profileImg">	
			</div>
			<div style="width: 60%;  margin: 3% auto;">
			<c:if test="${mentor eq 'Y' }">
				<span><img src='${contextPath }/resources/views/icons/mentorIcon.png' style="width: 25px;margin-bottom: 10px;"></span>&nbsp;
				</c:if>		
				<span style="font-size: 25px; font-weight: 800; margin-right: 2%;">${profileInfo.memberNickName}</span>
				
				<span>&nbsp;&nbsp;</span> <span style="font-size: 15px; color: darkgray">Lv.${profileInfo.lvl }</span>
			</div>
			<div style="width: 100%; height:100px;white-space: normal; font-size:14px; font-weight: 200; text-align: center;">
			<c:if test="${profileInfo.memberMemo ne 'NULL' }">${profileInfo.memberMemo}</c:if>
			</div>
			<br>
			<br>
			<p style="margin: 0; font-weight: 900; font-size: 20px;">스펙</p>
			<div id="grayBox" style=" width: 100%; margin: 0 auto; padding: 2%; border-radius: 3%;">
			<table id="specTb">
								<tr>
									<th valign=top style="width: 20%;" rowspan="3">학교</th>
									<td class="specTd" id="school0">${schoolList[0]}</td>
									
									
								</tr>
								<tr>
									<td class="specTd" id="school1">${schoolList[1]}</td>
								</tr>
								<tr>
									<td class="specTd" id="school2">${schoolList[2]}</td>
									
								
								</tr>
								<tr>
								<td>&nbsp;</td>
								</tr>
								<tr>
									<th valign=top rowspan="3">자격증</th>
									<td class="specTd" id="certificate0">${certificateList[0]}</td>
									
								</tr>
								<tr>
									<td class="specTd" id="certificate1">${certificateList[1]}</td>
								</tr>
								<tr>
									<td class="specTd" id="certificate2">${certificateList[2]}</td>
								</tr>
								<tr>
								<td>&nbsp;</td>
								</tr>
								<tr>
									<th valign=top rowspan="3">경력</th>
									<td class="specTd" id="career0">${careerList[0]}</td>
									
								</tr>
								<tr>								
									<td class="specTd" id="career1">${careerList[1]}</td>
								</tr>
								<tr>									
									<td class="specTd" id="career2">${careerList[2]}</td>
								</tr>
							</table>
					</div>

						
		</div>
		<div class="subcontent" style="width: 75%; margin-top:2%;">
		<h5>${profileInfo.memberNickName}님의 개설한 스터디</h5>
		<!-- 토글버튼 하고시퍼유ㅡㅡㅜㅠ  -->
		<div style="border:1px solid lightgray; height: 90%; border-radius: 10px; padding:5% 3px;">
			<c:if test="${!empty hpgList }">
		 		<c:forEach var="hpg" items="${hpgList }">
			  		<c:url var="groupPage" value="groupPage.do">
						<c:param name="groomingNo" value="${hpg.groomingNo}"/>
					</c:url>
				<div class="gCard" onclick="location.href='${groupPage}'">
		
					<div style="width: 100%;border-bottom: 2px solid #17a2b8;">
						<br>
						<img src="${contextPath }/resources/views/images/${hpg.groomingImg}" style=" width:70%; margin-left: 13%;"><br><br>
					</div>
					<div style="width: 97%; margin-left: auto; margin-right: auto;">
					<p style="font-size: 20px; ">${hpg.groomingTitle}</p>
						<div style="width: 97%; height: 70px; overflow:auto;">
					
						<p style="font-size: 10px;height: 70px;">${hpg.groomingIntroduce}</p><br>
					</div>
						<div style="margin:2px 5px; position: absolute; bottom:0;">
							<span>${hpg.groomingType}</span>
						
						</div> 
					</div>
				</div>
				<!-- -================================================================================================ -->
					<div class="gCard" onclick="location.href='${groupPage}'">
		
					<div style="width: 100%;border-bottom: 2px solid #17a2b8;">
						<br>
						<img src="${contextPath }/resources/views/images/${hpg.groomingImg}" style=" width:70%; margin-left: 13%;"><br><br>
					</div>
					<div style="width: 97%; margin-left: auto; margin-right: auto;">
					<p style="font-size: 20px; ">${hpg.groomingTitle}</p>
						<div style="width: 97%; height: 70px; overflow:auto;">
					
						<p style="font-size: 10px;height: 70px;">${hpg.groomingIntroduce}</p><br>
					</div>
						<div style="margin:2px 5px; position: absolute; bottom:0;">
							<span>${hpg.groomingType}</span>
						
						</div> 
					</div>
				</div>
					<div class="gCard" onclick="location.href='${groupPage}'">
		
					<div style="width: 100%;border-bottom: 2px solid #17a2b8;">
						<br>
						<img src="${contextPath }/resources/views/images/${hpg.groomingImg}" style=" width:70%; margin-left: 13%;"><br><br>
					</div>
					<div style="width: 97%; margin-left: auto; margin-right: auto;">
					<p style="font-size: 20px; ">${hpg.groomingTitle}</p>
						<div style="width: 97%; height: 70px; overflow:auto;">
					
						<p style="font-size: 10px;height: 70px;">${hpg.groomingIntroduce}</p><br>
					</div>
						<div style="margin:2px 5px; position: absolute; bottom:0;">
							<span>${hpg.groomingType}</span>
						
						</div> 
					</div>
				</div>
					<div class="gCard" onclick="location.href='${groupPage}'">
		
					<div style="width: 100%;border-bottom: 2px solid #17a2b8;">
						<br>
						<img src="${contextPath }/resources/views/images/${hpg.groomingImg}" style=" width:70%; margin-left: 13%;"><br><br>
					</div>
					<div style="width: 97%; margin-left: auto; margin-right: auto;">
					<p style="font-size: 20px; ">${hpg.groomingTitle}</p>
						<div style="width: 97%; height: 70px; overflow:auto;">
					
						<p style="font-size: 10px;height: 70px;">${hpg.groomingIntroduce}</p><br>
					</div>
						<div style="margin:2px 5px; position: absolute; bottom:0;">
							<span>${hpg.groomingType}</span>
						
						</div> 
					</div>
				</div>
				<!-- ================================================================================================================ -->
		
				
					</c:forEach>
					<br clear="both">
					<br>
					<br>
					<c:if test="${!empty pih }">
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
				
			
			</c:if>
			</c:if>
			
			
			
			</div>
		</div>
		<br clear="both">
	
	</div>
</section>



<jsp:include page="../common/footer.jsp" />	

</body>
</html>




