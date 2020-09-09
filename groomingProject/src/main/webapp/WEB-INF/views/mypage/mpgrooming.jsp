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
	height: 1300px;
	margin: 1% auto;
}
.grayBox1{

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

<jsp:include page="./mypageinfo.jsp" />
<div id="content">
	<p>내가 만든 스터디</p>
		<c:if test="${!empty hpgList }">
	<div class="main_container grayBox1" >
		<div class="cards_bundle row">
			
		<c:forEach var="h" items="${hpgList }">
		  <c:url var="groupPage" value="groupPage.do">
				<c:param name="groomingNo" value="${h.groomingNo}"/>
			</c:url>
			<div class="card_container col-lg-3" onclick="location.href='${groupPage}'">
				<input type="hidden" value="${h.groomingNo}"></input>
				<div class="card_box">
					<!-- 그룹 이미지 -->
					<div class="card_header">
						<img alt="그루밍 사진" src="${contextPath }/resources/upGroomingFiles/${h.groomingImg }"
						onerror="this.src='${contextPath }/resources/views/images/grooming_logo.png'">
						<!-- 그룹 d-day 태그 -->
				
						
					</div>
					<!-- 그룹 본문 -->
					<div class="card_body">
						<!-- 그룹 제목 -->
						<div class="card_title">${h.groomingTitle }</div>
					
						<!-- 그룹 한줄 소개  -->
						<div class="card_intro">${h.groomingIntroduce }</div>
						<div class="card_between mt-0">
							<p class="card_gt">${h.groomingType }</p>
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
		<div class="grayBox1" style="height: 300px;">
			<p onclick="gotoinsertgrooming();" style="cursor: pointer; font-size:25px; margin-top:120px; text-align: center;">스터디 만들러 가기</p>
		</div>
		<script>
			function gotoinsertgrooming(){
				var check = confirm("스터디 그룹을 생성하시겠습니까?");
				if(check){
					location.href="groomingInsert.do"
				}else{
					alert("취소하였씁니다.");
				}
			}
		</script>
	</c:if>
		
	<br>
	<br>
	<br clear="both">
	<p>참여 중인 스터디</p>
	<c:if test="${!empty mpgList }">
	<div class="main_container grayBox1" >
		<div class="cards_bundle row">
			
		<c:forEach var="mpg" items="${mpgList }">
			<c:url var="groupPage" value="groupPage.do">
				<c:param name="groomingNo" value="${mpg.groomingNo}"/>
			</c:url>
			<div class="card_container col-lg-3" onclick="location.href='${groupPage}'">
				<input type="hidden" value="${mpg.groomingNo}"></input>
				<div class="card_box">
					<!-- 그룹 이미지 -->
					<div class="card_header">
						<img alt="그루밍 사진" src="${contextPath }/resources/upGroomingFiles/${mpg.groomingImg }"
						onerror="this.src='${contextPath }/resources/views/images/grooming_logo.png'">
						<!-- 그룹 d-day 태그 -->
				
						
					</div>
					<!-- 그룹 본문 -->
					<div class="card_body">
						<!-- 그룹 제목 -->
						<div class="card_title">${mpg.groomingTitle }</div>
					
						<!-- 그룹 한줄 소개  -->
						<div class="card_intro">${mpg.groomingIntroduce }</div>
						<div class="card_between mt-0">
							<p class="card_gt">${mpg.groomingType }</p>
						</div>
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
			<p onclick="location.href='groomingMain.do'" style="cursor: pointer; font-size:25px; margin-top:120px; text-align: center;">스터디 가입하러 가기</p>
		</div>
		</c:if>
	</div>	
         `

<jsp:include page="../common/footer.jsp" />
</body>
</html>