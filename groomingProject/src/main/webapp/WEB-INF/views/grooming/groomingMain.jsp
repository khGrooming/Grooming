<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Grooming</title>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png">

<!-- jQuery -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<!-- jQuery cookie -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-cookie/jquery.cookie.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<!-- 아이콘 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<!-- Bootstrap4 TagsInput -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.css" rel="stylesheet">

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">

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

<style type="text/css">
.cards_bundle {
	text-align: center
}

.cards_bundle .card_container {
	padding: 0.5rem;
}

.cards_bundle .card_container .card_box {
	cursor: pointer;
	width: 100%;
	border-radius: 0.3rem;
	border: 0.2rem solid skyblue;
	transition: 0.4s;
}

.cards_bundle .card_container .card_box:hover .card_header {
	border-bottom: 0.1rem solid #7991E8;
	transition: 0.4s;
}

.cards_bundle .card_container .card_box:hover {
	border: 0.2rem solid #7991E8;
	transition: 0.6s;
}

.cards_bundle .card_container .card_header {
	position: relative;
	height: 12.5rem;
	border-bottom: 0.1rem solid skyblue;
	border-radius: 15px 15px 0px 0px;
	transition: 0.4s;
}

.cards_bundle .card_container .card_header img {
	object-fit: cover;
	height: 100%;
	width: 100%;
}

.cards_bundle .card_container .card_header .card_dDay {
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

.cards_bundle .card_container .card_header .card_dDay.card_dDay_red {
	font-size: 1rem;
	background: white;
	color: red;
	border: thin solid red;
}

.cards_bundle .card_container .card_header .card_dDay.card_dDay_orange {
	font-size: 0.8rem;
	background: white;
	color: orange;
	border: thin solid orange;
}

.cards_bundle .card_container .card_header .card_dDay.card_dDay_green {
	font-size: 0.8rem;
	background: white;
	color: green;
	border: thin solid green;
}

.cards_bundle .card_container .card_header .card_dDay.card_dDay_black {
	font-size: 0.8rem;
	background: white;
	color: black;
	border: thin solid black;
}

.cards_bundle .card_container .card_body {
	height: 11rem;
	width: 100%;
}

.cards_bundle .card_container .card_body .card_title {
	text-align: left;
	font-size: 1.5rem;
	line-height: 1.5rem;
	margin: 0.1rem 0;
	padding: 0.5rem 0.4rem 0.3rem;
	color: #007bff;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.cards_bundle .card_container .card_body .card_tags {
	text-align: left;
	margin: 0;
	padding: 0.3rem;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.cards_bundle .card_container .card_body .card_tags .form-control {
	display: none;
}

.cards_bundle .card_container .card_body .card_tags .badge {
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
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
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

.cards_bundle .card_container .card_body .card_intro {
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

.cards_bundle .card_container .card_body .card_between {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.cards_bundle .card_container .card_body .card_between p {
	margin: 0.4rem;
	padding: 0;
}
</style>

<!--     <style>
        #tab-menu li {
            width: 100px;
            font-size: large;
            font-weight: bold;
        }
        #tab-menu li a {
            text-align: center;
            color: black;
        }
        img {
            max-width: 100%;
            max-height: 100%;
        }
        #circle {
            width: 50px;
            height: 50px;
            border-radius: 100px;
            background: white;
            color:black;
            text-align: center;
            margin-left: 15px; 
            margin-top: 10px;
            border: 2px solid blue;
            display:table-cell;
            vertical-align:middle;
            line-height: 50px;
            top: 0;
    		left: 0;
            position:absolute;
        }
        
        #day{
        	position:relative;
        }
        .top-img{
          
            background-size: cover;
            height: 200px;
            border: 2px solid skyblue;
            border-radius: 15px 15px 0px 0px;
        }
        .groupType{
            margin-left: 100px;
        }
        .card{
            border: 2px solid skyblue;
            border-radius: 15px;
        }
        .card-deck{
            margin-top: 30px;
        }
		label{
			font-size:20px;
		}
	
	   
	   .card-deck{
	   	margin-right:auto;
	   	margin-left:auto;
	   	width: 100%;
	   }
	   
	   #end, #now{
	   	display:hidden;
	   }
    </style> -->
</head>

<body>
	<!-- 헤더시작 -->
	<jsp:include page="../common/mainNavigationBar.jsp" />

	<!-- 섹션 시작 -->
	<section>
		<!-- 컨테이너 -->
		<div class="main_container main_fst_container container">
			<!-- 필터와 검색 -->
			<div class="row">
				<div class="cols-3 search_filter" style="width: 20%; text-align: right; line-height: 30px;">
					<input type="radio" name="search_filter" id="mentor">&nbsp;<label for="mentor" style="margin: 0;">멘토 타입</label>
					<input type="radio" name="search_filter" id="money">&nbsp;<label for="money" style="margin: 0;">예치금 존재</label>
				</div>
				<div class="cols-9" style="width: 80%; text-align: right; padding-right: 5px;">
					<select id="search"  style="height: 30px;">
						<option value="title" id="title" selected>제목</option>
						<option value="writer" id="writer">작성자</option>
						<option value="content" id="content">내용</option>
					</select>
					<input type="text" size="30px" id="keyword" required>
					<button id="find">검색</button>
					<c:if test="${!empty loginUser }">

						<button type="button" id="writeG">글쓰기</button>

					</c:if>
				</div>
			</div>
			
			<!-- 스터디 그룹 리스트 -->
			<div style="margin-top: 20px;">

				<!-- all 그루밍 컨테이너 -->
				<div class="main_container container">
					<!-- 그루밍 카드 -->
					<div id="allGroooming_bundle" class="cards_bundle row">

						<c:forEach var="g" items="${glist }">

							<div class="card_container col-lg-3">
								<input type="hidden" value="${g.groomingNo}"></input>
								<div class="card_box">
									<!-- 그룹 이미지 -->
									<div class="card_header">
										<img alt="그루밍 사진" src="${contextPath }/resources/upGroomingFiles/${g.groomingImg }"
											onerror="this.src='${contextPath }/resources/views/images/grooming_logo.png'">
										<!-- 그룹 d-day 태그 -->
										<c:choose>
				 							<c:when test="${g.groomingDday le 0 }">
												<c:set var="card_dDay_color" value="card_dDay_black"/>
												<c:set var="card_dDay_text" value="마감"/>
				 							</c:when>
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



				</div>

			</div>

			<table class="paging" align="center">
				<!-- 페이징 처리 부분 -->
				<tr align="center" height="20">
					<td colspan="6">
						<!-- [이전] -->
						<c:if test="${pi.currentPage eq 1 }">
							[이전]&nbsp;
						</c:if>
						<c:if test="${pi.currentPage gt 1 }">
							<c:url var="glistBack" value="groomingMain.do">
								<c:param name="page" value="${pi.currentPage - 1 }" />
								<c:param name="memberNo" value="${loginUser.memberNo}" />
							</c:url>
							<a href="${glistBack }">[이전]</a>
						</c:if>
						<!-- [번호들] -->
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:if test="${p eq pi.currentPage }">
								<font color="red" size="4"> <b>[${p}]</b> </font>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<c:url var="glistCheck" value="groomingMain.do">
									<c:param name="page" value="${p}" />
									<c:param name="memberNo" value="${loginUser.memberNo}" />
								</c:url>
								<a href="${ glistCheck}">${p }</a>
							</c:if>
						</c:forEach>
						<!-- [이후] -->
						<c:if test="${pi.currentPage eq pi.maxPage }">
							&nbsp;[이후]
						</c:if>
						<c:if test="${pi.currentPage lt pi.maxPage }">
							<c:url var="glistAfter" value="groomingMain.do">
								<c:param name="page" value="${pi.currentPage + 1 }" />
								<c:param name="memberNo" value="${loginUser.memberNo}" />
							</c:url>
							<a href="${glistAfter }">[이후]</a>
						</c:if>
					</td>
				</tr>
			</table>
		</div>

		<input type="hidden" value="${selectG }" id="selectG">
		<input type="hidden" value="${selectS }" id="selectS">
		<input type="hidden" value="${loginUser.memberNo }" id="memberNo">

	</section>
	<!-- 필터 -->

<script>
   	$(function(){
    	var gmemberNo = $("#selectG").val();
    	var smemberNo = $("#selectS").val();
    	var memberNo = $("#memberNo").val();
    	
    	// 그루밍 작성
    	$("#writeG").on("click",function(){
    	
    		$.ajax({
				url:'groomingDecide.do',
				type:'post',
				data:{memberNo:memberNo},
				success : function (data){
					if(data == "success"){
		    			alert("이미 작성하신 스터디 게시글이 있습니다.");
		    		}else if(data == "false"){
		    			var result = confirm("임시저장된 글이 있습니다. 불러오시겠습니까?");
		    			if(result){
		    				location.href='groomingSaveInsert.do?memberNo='+memberNo;
		    			}else{
		    				event.preventDefault();
		    			}
		    			
		    		}else {
		    			location.href='groomingInsert.do';
		    		}
					
				},error:function(request, status, errorData){
					alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
				}
			});
    	});
   	});
</script>

<script>
$(function(){
	// 그루밍 디테일 페이지 이동
	$(document).on("click", ".card_container", function(){
		var el = $(this);

		var gMemberNo = "${loginUser.memberNo }";
		var groomingNo = el.find("input[type=hidden]").val();

		location.href = "groomingDetail.do?groomingNo=" + groomingNo + "&memberNo="+ gMemberNo;

	});
	
	// 멘토 표시
	$("#mentor").click(function(){
		$("div").remove(".card_container");
		$.ajax({
			url : 'groomingMe.do',
			type : 'post',
			dataType:"json",
			success : function (data){
				console.log("그루밍 가져오기 결과 : " + data.length);
				// 그루밍 내용 추가
				loadGrooming(data);
				$(".paging").css("display","none");

			},error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
					+"message: " + request.responseText
					+"error: " + errorData);
			}
		});
	});

	// 예치금 표시
	$("#money").click(function(){
		$.ajax({
			url : 'groomingMo.do',
			type : 'post',
			dataType:"json",
			success : function (data){
				console.log("그루밍 가져오기 결과 : " + data.length);
				// 그루밍 내용 추가
				loadGrooming(data);
				$(".paging").css("display","none");

			},error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
					+"message: " + request.responseText
					+"error: " + errorData);
			}
		});
	});
	
	$("#keyword").keyup(function(e){
		if(e.keyCode == 13){
			search();
		}
	});
	
	$("#find").on("click", function() {
		search();
	});
	// 검색
	function search() {
		var search = $('#search option:selected').val();
		var keyword = $('#keyword').val();

		console.log("구르밍 검색 : " + search + " / " + keyword);
		
		if(keyword == "") {
			alert("한 글자 이상 검색해주세요!");
		} else {
			$.ajax({
				url:'search.do',
				type:'post',
				data:{search : search, keyword : keyword},
				dataType:"json",
				success:function(data) {
					console.log("그루밍 가져오기 결과 : " + data.length);
					if(data.length > 0){
						// 그루밍 내용 추가
						loadGrooming(data);
						$(".paging").css("display","none");
					} else {
						alert("검색한 그루밍이 없습니다.");
					}

				},
				error : function(request, status, errorData) {
					alert("error code: " + request.status + "\n"
						+ "message: " + request.responseText
						+ "error: " + errorData);
				}

			}); // ajax end

		}
	} // click end
	
	// 그루밍 출력
	function loadGrooming(data) {
		// 그루밍 내용 추가
		if(data.length > 0) {
			console.log("그루밍 리스트 추가");
			
			$(".cards_bundle").html("");
	
			for(var i in data){
				// 시간 변수
				var card_dDay_color = "card_dDay_black";
				var card_dDay_text = "D-" + data[i].groomingDday;

				// d-day에 따른 css 클래스명 선택
				if(data[i].groomingDday < 0){
					card_dDay_color = "card_dDay_black";
					card_dDay_text = "마감";
				} else if(data[i].groomingDday == 0){
					card_dDay_color = "card_dDay_deadline";
					card_dDay_text = "마감임박";
				} else if(data[i].groomingDday <= 7){
					card_dDay_color = "card_dDay_red";
				} else if(data[i].groomingDday <= 15){
					card_dDay_color = "card_dDay_orange";
				} else if(data[i].groomingDday <= 25){
					card_dDay_color = "card_dDay_green";
				} else {
					card_dDay_color = "card_dDay_black";
				}

				// bundle
				var $allGroooming_bundle = $("#allGroooming_bundle");
				
				// container
				var $card_container = $('<div>').addClass("card_container col-lg-3");
				var $iGroomingNo = $('<input>').attr("type","hidden").val(data[i].groomingNo);
				$card_container.append($iGroomingNo);
				
				// card_box
				var $card_box = $('<div>').addClass("card_box");
				$card_container.append($card_box);
				
				// header
				var $card_header = $('<div>').addClass("card_header");
				var $imgGroomingImg = $('<img>').attr({"alt":"그루밍 사진","src":"${contextPath }/resources/upGroomingFiles/"+data[i].groomingImg,"onerror":"this.src='${contextPath }/resources/views/images/grooming_logo.png'"});
				var $card_dDay = $('<div>').addClass("card_dDay " + card_dDay_color);
				var $card_dDay_text = $('<span>').text(card_dDay_text);
				$card_box.append($card_header);
				$card_header.append($imgGroomingImg);
				$card_header.append($card_dDay);
				$card_dDay.append($card_dDay_text);

				// card_body
				var $card_body = $('<div>').addClass("card_body");
				// title
				var $card_title = $('<div>').addClass("card_title").text(data[i].groomingTitle);
				$card_box.append($card_body);
				$card_body.append($card_title);
				
				// tags
				var $card_tags = $('<div>').addClass("card_tags");
				var $tag_wrap = $('<div>');
				
				var $bTagsinput = $('<div>').addClass("bootstrap-tagsinput");

				var tagName = (data[i].groomingTagName).split(",");
				for(var j in tagName){
					var $sBadge = $('<span>').addClass("badge badge-info").text(tagName[j]);
					$bTagsinput.append($sBadge);
				}
				
				$card_body.append($card_tags);
				$card_tags.append($tag_wrap);
				$tag_wrap.append($bTagsinput);

				// intro
				var $card_intro = $('<div>').addClass("card_intro").text(data[i].groomingIntroduce);
				$card_body.append($card_intro);
				
				// between
				var $card_between = $('<div>').addClass("card_between mt-0");
				var $card_np = $('<p>').addClass("card_np").text("인원" + data[i].groomingMemberCount + "/" + data[i].groomingParti);
				var $card_gt = $('<p>').addClass("card_gt").text(data[i].groomingType);
				$card_body.append($card_between);
				$card_between.append($card_np);
				$card_between.append($card_gt);
				
				$allGroooming_bundle.append($card_container);

			}
		} else {
			console.log("내용 없음");
		}
	}

});
	
</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>