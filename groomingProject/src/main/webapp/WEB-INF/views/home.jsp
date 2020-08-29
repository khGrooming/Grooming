<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Grooming</title>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png">

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<!-- jQuery cookie -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-cookie/jquery.cookie.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<!-- Bootstrap4 TagsInput -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.css" rel="stylesheet">

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">

<!-- Custom styles for this css -->
<%-- <link href="${pageContext.servletContext.contextPath }/resources/views/css/main.css" rel="stylesheet"> --%>

<!-- 오른쪽 컨테이너 스타일 -->
<style type="text/css">
section{ background-color: #f2f2f2; }
.right_container .right_spotlight_body .right_spotlight_category,
.right_container .right_spotlight_body .right_spotlight_content strong
{
	font-family: 'Nanum Gothic', sans-serif;
}
.right_container
{
	background-color: white;
	margin: 2.5rem 5% 0;
	float: right;
    width: 10rem;
    border-radius: 0.25rem;
	border: 1px solid lightgrey;
	/* box-shadow: 0px 0.5rem 1rem 0px rgba(0,0,0,0.2); */
}
.right_container .right_spotlight_title
{
	text-align: center;
	padding: 0.6rem;
	border-bottom: thin dashed;
}
.right_container .right_spotlight_item:hover
{
	background-color: #f0f0f0;
}
.right_container .right_spotlight_title h3
{
	margin: auto;
}
.right_container .right_spotlight_body
{
	font-size: 0.7rem;
	margin: 0.25rem 0;
}
.right_container .right_spotlight_body .right_spotlight_item
{
	display: block;
    margin: 0.8rem 0.2rem;
	color: black;
    text-decoration: none;
    letter-spacing: 1px;
	border-bottom: thin dashed;
    transition: 0.6s;
}
.right_container .right_spotlight_body .right_spotlight_item .right_spotlight_content
{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis; 
}
</style>

<!-- 메인 컨테이너 -->
<style type="text/css">
.main_container
{
	padding: 1rem 1rem 2rem;
	background-color: #fff;
	margin-bottom: 1rem;
	font-family: 'Jua', sans-serif;
}
.main_container.main_fst_container
{
	margin-top: 2.5rem;
}
</style>

<!-- 카드 스타일 -->
<style>
.cards_bundle
{
	text-align: center
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
	/* box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); */
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
	object-fit: scale-down;
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
.
</style>

</head>
<body>
	<jsp:include page="common/mainNavigationBar.jsp" />
<section>

<c:if test="${!empty hBoardList }">
	<div class="right_container">
		<div class="right_spotlight_title">
			<h3>시끌벅적</h3>
		</div>
		<c:forEach var="b" items="${hBoardList }">
		<div class="right_spotlight_body">
			<a href="communityDetailView.do?boardNo=${b.boardNo }">
				<div class="right_spotlight_item">
					<div class="right_spotlight_category">[ ${b.bCategoryName } ]</div>
					<div class="right_spotlight_content">
						<strong>${b.boardTitle }</strong>
					</div>
				</div>
			</a>
		</div>
		</c:forEach>
	</div>
</c:if>

<c:if test="${!empty gMList }">
	<!-- 멘토 그루밍 컨테이너 -->
	<div class="main_container main_fst_container container">
		<div class="container_header">
			<h2 class="mt-auto mb-auto">멘토 그루밍</h2>
			<h6 class="font-weight-lighter">실력있는 멘토와 함께하는 스터디 그룹입니다.</h6>
		</div>

		<!-- 그루밍 카드 -->
		<div class="cards_bundle row text-center">
			
		<c:forEach var="g" items="${gMList }">
			<div class="card_container col-lg-3">
				<input type="hidden" value="${g.groomingNo}"></input>
				<div class="card_box">
					<!-- 그룹 이미지 -->
					<div class="card_header">
						<img alt="그루밍 사진" src="${contextPath }/resources/upGroomingFiles/${g.groomingImg }"
							onerror="this.src='${contextPath }/resources/views/images/grooming_logo.png'">
						<!-- 그룹 d-day 태그 -->
						<c:choose>
 							<c:when test="${g.groomingDday le 7 }">
								<c:set var="card_dDay_color" value="card_dDay_red"/>
 							</c:when>
 							<c:when test="${g.groomingDday le 15 }">
								<c:set var="card_dDay_color" value="card_dDay_orange"/>
 							</c:when>
 							<c:when test="${g.groomingDday le 25 }">
								<c:set var="card_dDay_color" value="card_dDay_green"/>
 							</c:when>
							<c:otherwise>
								<c:set var="card_dDay_color" value="card_dDay_black"/>
							</c:otherwise>
 						</c:choose>
						<div class="card_dDay ${card_dDay_color}">
							<span>D-${g.groomingDday }</span>
						</div>
					</div>
					<!-- 그룹 본문 -->
					<div class="card_body">
						<!-- 그룹 제목 -->
						<div class="card_title">${g.groomingTitle }</div>
						<div class="card_tags">
							<div>
								<input type="text" name="memberTagName" value="${g.groomingTagName }" placeholder="Tags," data-role="tagsinput" class="form-control" id="tagName" style="display: none;">
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
	</div> <!-- 컨테이너 끝 -->
</c:if>


<c:if test="${!empty gPList }">
	<!-- 인기 그루밍 컨테이너 -->
	<div class="main_container container">
		
		<div class="container_header">
			<h2 class="mt-auto mb-auto">인기 그루밍</h2>
			<h6 class="font-weight-lighter">요즘 화제의 스터디 그룹입니다.</h6>
		</div>

		<!-- 그루밍 카드 -->
		<div class="cards_bundle row text-center">
			
		<c:forEach var="g" items="${gPList }">
			<div class="card_container col-lg-3">
				<input type="hidden" value="${g.groomingNo}"></input>
				<div class="card_box">
					<!-- 그룹 이미지 -->
					<div class="card_header">
						<img alt="그루밍 사진" src="${contextPath }/resources/upGroomingFiles/${g.groomingImg }"
							onerror="this.src='${contextPath }/resources/views/images/grooming_logo.png'">
						<!-- 그룹 d-day 태그 -->
						<c:choose>
 							<c:when test="${g.groomingDday le 7 }">
								<c:set var="card_dDay_color" value="card_dDay_red"/>
 							</c:when>
 							<c:when test="${g.groomingDday le 15 }">
								<c:set var="card_dDay_color" value="card_dDay_orange"/>
 							</c:when>
 							<c:when test="${g.groomingDday le 25 }">
								<c:set var="card_dDay_color" value="card_dDay_green"/>
 							</c:when>
							<c:otherwise>
								<c:set var="card_dDay_color" value="card_dDay_black"/>
							</c:otherwise>
 						</c:choose>
						<div class="card_dDay ${card_dDay_color}">
							<span>D-${g.groomingDday }</span>
						</div>
					</div>
					<!-- 그룹 본문 -->
					<div class="card_body">
						<!-- 그룹 제목 -->
						<div class="card_title">${g.groomingTitle }</div>
						<div class="card_tags">
							<div>
								<input type="text" name="memberTagName" value="${g.groomingTagName }" placeholder="Tags," data-role="tagsinput" class="form-control" id="tagName" style="display: none;">
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
	</div> <!-- 컨테이너 끝 -->
</c:if>

<c:if test="${!empty gDList }">
	<!-- 마감임박 그루밍 컨테이너 -->
	<div class="main_container container">
		
		<div class="container_header">
			<h2 class="mt-auto mb-auto">마감임박 그루밍</h2>
			<h6 class="font-weight-lighter">모집기간이 얼마 안남은 스터디 그룹입니다.</h6>
		</div>

		<!-- 그루밍 카드 -->
		<div class="cards_bundle row text-center">
			
		<c:forEach var="g" items="${gDList }">
			<div class="card_container col-lg-3">
				<input type="hidden" value="${g.groomingNo}"></input>
				<div class="card_box">
					<!-- 그룹 이미지 -->
					<div class="card_header">
						<img alt="그루밍 사진" src="${contextPath }/resources/upGroomingFiles/${g.groomingImg }"
							onerror="this.src='${contextPath }/resources/views/images/grooming_logo.png'">
						<!-- 그룹 d-day 태그 -->
						<c:choose>
 							<c:when test="${g.groomingDday le 7 }">
								<c:set var="card_dDay_color" value="card_dDay_red"/>
 							</c:when>
 							<c:when test="${g.groomingDday le 15 }">
								<c:set var="card_dDay_color" value="card_dDay_orange"/>
 							</c:when>
 							<c:when test="${g.groomingDday le 25 }">
								<c:set var="card_dDay_color" value="card_dDay_green"/>
 							</c:when>
							<c:otherwise>
								<c:set var="card_dDay_color" value="card_dDay_black"/>
							</c:otherwise>
 						</c:choose>
						<div class="card_dDay ${card_dDay_color}">
							<span>D-${g.groomingDday }</span>
						</div>
					</div>
					<!-- 그룹 본문 -->
					<div class="card_body">
						<!-- 그룹 제목 -->
						<div class="card_title">${g.groomingTitle }</div>
						<div class="card_tags">
							<div>
								<input type="text" name="memberTagName" value="${g.groomingTagName }" placeholder="Tags," data-role="tagsinput" class="form-control" id="tagName" style="display: none;">
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
	</div> <!-- 컨테이너 끝 -->
</c:if>

</section>

<script type="text/javascript">
	$(function() {
		console.log("메인 페이지");
		//loadChatListData();
	
	});

	//TODO 그루밍 데이터 가져오기(스크롤)
	function loadGroomingData() {
		$.ajax({
			url:"loadGroomingData.do",
			data:{fromMemberNo:fromMemberNo,toMemberNo:toMemberNo},
			success:function(data){
				console.log("그루밍 가져오기 결과 : " + data.length);
				// 그루밍 내용 추가
				loadGrooming(data);
			},
			error:function(request, status, errorData){
				alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
			}
		});
	}
	
	//TODO 그루밍 출력
	function loadGrooming(data) {
	
		// 그루밍 내용 추가
		if(data.length > 0) {
			console.log("채팅 내용 추가");
			var memberNo = "${loginUser.memberNo}";
			var messageDateTemp = "";
	
			for(var i in data){
				var $msg_history = $(".msg_history");
				
				// 날짜 계산 & 추가
				var messageDate = data[i].messageDate.split(',');
				if(messageDateTemp == "" || messageDateTemp != messageDate[0]){
					var $date_divider_msg = $('<div>').addClass("date_divider_msg");
					var $divider_date = $('<div>').addClass("divider_date").text( messageDate[0]);
					var $hrMessageDate = $('<hr>')
					
					$date_divider_msg.append($divider_date);
					$date_divider_msg.append($hrMessageDate);
					$msg_history.append($date_divider_msg);
				}
				messageDateTemp = messageDate[0];

				// outgoing	
				var $outgoing_msg = $('<div>').addClass("outgoing_msg");
				var $sent_msg = $('<div>').addClass("sent_msg");
				var $pMessageContent = $('<p>').text(data[i].messageContent);
				var $time_date = $('<span>').addClass("time_date").text(messageDate[1]);

				$sent_msg.append($pMessageContent);
				$sent_msg.append($time_date);
				$outgoing_msg.append($sent_msg);

				$msg_history.append($outgoing_msg);

			}
		} else {
			console.log("내용 없음");
		}
	}
</script>

<script type="text/javascript">
/* 주소 변경 */
	$(document).ready(function() {
		history.replaceState(null, null, '${contextPath }/home.do');
	});
</script>

	<jsp:include page="common/footer.jsp" />
</body>
</html>
