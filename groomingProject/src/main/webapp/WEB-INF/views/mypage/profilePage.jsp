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
<!-- Bootstrap4 TagsInput -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.css" rel="stylesheet">
<%-- <link href="${pageContext.servletContext.contextPath }/resources/views/css/memberLoginRegistration.css" rel="stylesheet"> --%>
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
<style>
.main_container
{
	padding: 1rem 1rem 2rem;
	background-color: #fff;
	margin-bottom: 1rem;
	font-family: 'Jua', sans-serif;
}
.cards_bundle
{
	text-align: center;
}
.cards_bundle .card_container
{
	padding: 0.5rem;
}
.cards_bundle .card_container .card_box
{
    cursor: pointer;
    width: 100%;
	border-radius: 0.3rem;
	border: 0.2rem solid skyblue;
    transition: 0.4s;
}
.cards_bundle .card_container .card_box:hover .card_header
{
	border-bottom: 0.1rem solid #7991E8;
    transition: 0.4s;
}
.cards_bundle .card_container .card_box:hover
{
	border: 0.2rem solid #7991E8;
    transition: 0.6s;
}
.cards_bundle .card_container .card_header
{
	position: relative;
	height: 12.5rem;
	border-bottom: 0.1rem solid skyblue;
	border-radius: 15px 15px 0px 0px;
    transition: 0.4s;
}
.cards_bundle .card_container .card_header img
{
	object-fit: cover;
	height: 100%;
	width: 100%;
}
.cards_bundle .card_container .card_header .card_dDay
{
	position: absolute;
	top: 0;
	left: 0;
	width: 2.5rem;
	height: 2.5rem;
	margin: 0.3rem;
	border-radius: 50%;
	text-align: center;
	line-height: 2.5rem;
}
.cards_bundle .card_container .card_header .card_dDay.card_dDay_deadline
{
	font-size: 0.65rem;
	background: white;
	color: red;
	border: thin solid red;
}
.cards_bundle .card_container .card_header .card_dDay.card_dDay_red
{
	font-size: 1rem;
	background: white;
	color: red;
	border: thin solid red;
}
.cards_bundle .card_container .card_header .card_dDay.card_dDay_orange
{
	font-size: 0.8rem;
	background: white;
	color: orange;
	border: thin solid orange;
}
.cards_bundle .card_container .card_header .card_dDay.card_dDay_green
{
	font-size: 0.8rem;
	background: white;
	color: green;
	border: thin solid green;
}
.cards_bundle .card_container .card_header .card_dDay.card_dDay_black
{
	font-size: 0.8rem;
	background: white;
	color: black;
	border: thin solid black;
}
.cards_bundle .card_container .card_body
{
    height: 11rem;
    width: 100%;
}
.cards_bundle .card_container .card_body .card_title
{
	text-align: left;
	font-size: 1.5rem;
	line-height: 1.5rem;
	margin: 0.5rem 0;
	padding: 0.5rem 0.4rem 0.3rem;
    color: #007bff;
   	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.cards_bundle .card_container .card_body .card_tags
{
	text-align: left;
	margin: 0;
	padding: 0.3rem;
   	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.cards_bundle .card_container .card_body .card_tags .form-control
{
	display: none;
}
.cards_bundle .card_container .card_body .card_tags .badge
{
	margin: 0 3px;
    font-weight: lighter;
    padding: 5px 8px;
	color: #fff;
    background-color: #17a2b8;
	display: inline-block;
    padding: .25em .4em;
    font-size: 0.7rem;
    font-weight: 700;
    line-height: 1;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: .25rem;
	font-family: 'Nanum Gothic', sans-serif;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.cards_bundle .card_container .card_body .card_tags .bootstrap-tagsinput
{
	margin: 0;
	padding: 0;
	border: none;
    box-shadow: none;
    cursor: pointer;
	
}
.cards_bundle .card_container .card_body .card_tags .bootstrap-tagsinput span:not(.badge),
.cards_bundle .card_container .card_body .card_tags .bootstrap-tagsinput input
{
	display: none;
}
.cards_bundle .card_container .card_body .card_intro
{
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 0.7rem;
	text-align: left;
	margin: 0;
	padding: 0.3rem;
	min-height: 4.5rem;
	max-height: 4.5rem;
	overflow-y: auto;
}
/* 스크롤바 css */
.cards_bundle .card_container .card_body .card_intro::-webkit-scrollbar
{
	width: 0.45rem;
}
.cards_bundle .card_container .card_body .card_intro::-webkit-scrollbar-thumb
{
	background-color: darkorange;
    border-radius: 0.4rem;
    background-clip: padding-box;
    border: 2px solid transparent;
}
.cards_bundle .card_container .card_body .card_intro::-webkit-scrollbar-track
{
    background-color: skyblue;
    border-radius: 0.225rem;
    box-shadow: inset 0px 0px 5px white;
}
.cards_bundle .card_container .card_body .card_between
{
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.cards_bundle .card_container .card_body .card_between p
{
	margin: 0.4rem;
	padding: 0;
}
.spinner-border
{
	display: none;
	margin: 0 auto;
}
@media (min-width: 0px) and (max-width: 991px)
{
	.cards_bundle .card_container .card_box:hover .card_header
	{
		border-bottom: none;
	}
	.cards_bundle .card_container .card_box
	{ 
		display: flex;
		justify-content: space-between;
		align-items: center; 
	}
	.cards_bundle .card_container .card_box .card_header{ border: none; }
	.cards_bundle .card_container .card_box .card_header,
	.cards_bundle .card_container .card_box .card_body
	{
		width: 50%;
	}
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
						
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
						<form id="reportForm" name="reportForm" action="memberReport.do" method="post">
							<div class="modal-body">
								<div style="margin-left: 2%;">
								<p>어떤 문제가 있나요?</p>
								<input type="hidden" name="memberNo" value="${loginUser.memberNo}">
								<input type="hidden" name="declarationCNo" value="1">
								<input type="hidden" name="declarationNNo" value="${profileInfo.memberNo  }">
								<input type="radio" name="reRadio" class="reRadio" id="r1" value="r1"><label for="r1">괴롭힘 및 사이버 폭력</label><br>
								<input type="radio" name="reRadio" class="reRadio" id="r2" value="r2"><label for="r2">개인정보 침해</label><br>
								<input type="radio" name="reRadio" class="reRadio" id="r3" value="r3"><label for="r3">명의 도용</label><br>
								<input type="radio" name="reRadio" class="reRadio" id="r4" value="r4"><label for="r4">폭력적 위헙</label><br>
								<input type="radio" name="reRadio" class="reRadio" id="r5" value="r5"><label for="r5">스팸 및 사기</label><br>
								<input type="radio" name="reRadio" class="reRadio" id="r6" value="r6"><label for="r6">기타</label><br>
								<textarea rows="3" cols="50" id="dContent" name="declarationContent" style="display: none;"></textarea>
								</div>
								<script>
									$(function(){
										
										$("input:radio[name='reRadio']").change(function(){
											var check=$(this).val();
											
											switch (check) {
											case "r1":
												$("#dContent").val("괴롭힘 및 사이버 폭력").css("display","none");												
												break;
											case "r2":
												$("#dContent").val("개인정보 침해").css("display","none");		
												break;
											case "r3":
												$("#dContent").val("명의 도용").css("display","none");		
												break;
											case "r4":
												$("#dContent").val("폭력적 위헙").css("display","none");		
												break;
											case "r5":
												$("#dContent").val("스팸 및 사기").css("display","none");		
												break;
											case "r6":
												$("#dContent").val("").css("display","block");
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
		<div style="border:1px solid lightgray; height: 90%; border-radius: 10px; ">
					<c:if test="${!empty hpgList }">
	<div class="main_container grayBox1" >
		<div class="cards_bundle row">
			
		<c:forEach var="g" items="${hpgList }">
			<div class="card_container col-lg-3">
				<input type="hidden" value="${g.groomingNo}"></input>
				<div class="card_box">
					<!-- 그룹 이미지 -->
					<div class="card_header">
						<img alt="그루밍 사진" src="${contextPath }/resources/upGroomingFiles/${g.groomingImg }"
						onerror="this.src='${contextPath }/resources/views/images/grooming_logo.png'">
						<!-- 그룹 d-day 태그 -->
					<c:choose>
 							<c:when test="${g.groomingDday eq 0 }">
								<c:set var="card_dDay_color" value="card_dDay_deadline"/>
								<c:set var="card_dDay_text" value="마감임박"/>
 							</c:when>
 							<c:when test="${g.groomingDday le 7 }">
								<c:set var="card_dDay_color" value="card_dDay_red"/>
								<c:set var="card_dDay_text" value="D-${g.groomingDday }"/>
 							</c:when>
 							<c:when test="${g.groomingDday le 15 }">
								<c:set var="card_dDay_color" value="card_dDay_orange"/>
								<c:set var="card_dDay_text" value="D-${g.groomingDday }"/>
 							</c:when>
 							<c:when test="${g.groomingDday le 25 }">
								<c:set var="card_dDay_color" value="card_dDay_green"/>
								<c:set var="card_dDay_text" value="D-${g.groomingDday }"/>
 							</c:when>
							<c:otherwise>
								<c:set var="card_dDay_color" value="card_dDay_black"/>
								<c:set var="card_dDay_text" value="D-${g.groomingDday }"/>
							</c:otherwise>
 						</c:choose> 
						<div class="card_dDay ${card_dDay_color}">
							<span>${card_dDay_text }</span>
						</div>
					</div>
					<!-- 그룹 본문 -->
					<div class="card_body">
						<!-- 그룹 제목 -->
						<div class="card_title">${g.groomingTitle }</div>
						<div class="card_tags">
							<div>
								<input type="text" name="memberTagName" value="${g.groomingTagName }" placeholder="Tags," data-role="tagsinput" class="form-control" style="display: none;">
							</div> 
						</div>
						<!-- 그룹 한줄 소개  -->
						<div class="card_intro">${g.groomingIntroduce }</div>
						<div class="card_between mt-0">
							<p class="card_np">인원 ${g.groomingMemberCount }/${g.groomingParti }</p>
							<p class="card_gt">${g.groomingType }</p>
						</div>
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
				<h4 style=" width: 30%; margin: 10% auto">개설한 스터디가 없습니다.</h4>
			</c:if>
			</div>
		</div>
		<br clear="both">
	
	</div>
</section>



<jsp:include page="../common/footer.jsp" />	

</body>
</html>