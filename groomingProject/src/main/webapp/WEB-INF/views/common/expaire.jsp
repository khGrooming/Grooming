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

</style>

</head>
<body>
	<jsp:include page="common/mainNavigationBar.jsp" />
<section>
	<div>만료된 페이지 입니다.</div>
</section>

<script type="text/javascript">
	var page = 1;
	var pageloading = true;
	$(function() {
		//console.log("메인 페이지");
	});
	
	// 커뮤니티 디테일 페이지 이동
	$(document).on("click", ".right_spotlight_item", function(){
		var el = $(this);

		var boardNo = el.find("input[type=hidden]").val();

		location.href = "communityDetailView.do?boardNo=" + boardNo;

	});
	
	// 그루밍 디테일 페이지 이동
	$(document).on("click", ".card_container", function(){
		var el = $(this);

		var gMemberNo = "${loginUser.memberNo }";
		var groomingNo = el.find("input[type=hidden]").val();

		location.href = "groomingDetail.do?groomingNo=" + groomingNo + "&memberNo="+ gMemberNo;

	});

	// 스크롤 로딩
	window.onscroll = function(e) {
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	// ajax + 카드 추가
	    	if(pageloading){
	    		pageloading = false;
		    	loadGroomingData();
	    	}
	    }
	};

	// 그루밍 데이터 가져오기
	function loadGroomingData() {
		page++;
		$.ajax({
			url:"addAllGroomingList.do",
			data:{page:page},
			success:function(data){
				console.log("그루밍 가져오기 결과 : " + data.length);
				// 그루밍 내용 추가
				loadGrooming(data);
			},
			error:function(request, status, errorData){
				page--;
				alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
			}
		});
	}

	// 그루밍 출력
	function loadGrooming(data) {
		// 그루밍 내용 추가
		if(data.length > 0) {
			console.log("그루밍 리스트 추가");
	
			for(var i in data){
				var card_dDay_color = "card_dDay_black";
				var card_dDay_text = "D-" + data[i].groomingDday;

				// d-day에 따른 css 클래스명 선택
				if(data[i].groomingDday == 0){
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
		pageloading = true;
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
