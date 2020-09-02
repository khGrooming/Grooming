<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Grooming</title>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png">

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
  
<%-- <link href="${pageContext.servletContext.contextPath }/resources/views/css/messagePage.css" rel="stylesheet"> --%>
<style type="text/css">
section
{
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0;
}
.massage_container
{
	max-width: 1170px;
	max-height: 750px;
	margin: 10 px auto;
}
.massage_container .chat_img img,
.massage_container .mesgs_header_img img,
.massage_container .incoming_msg_img img
{
	height: 100%;
	width: 100%;
	border: thin solid lightgrey;
	border-radius: 50%;
    margin-top: auto;
    margin-bottom: auto;
	object-fit: cover;
}
.inbox_people
{
	float: left;
	overflow: hidden;
	width: 25%;
	height: 100%;
}
.inbox_msg
{
	border: 1px solid #c4c4c4;
	clear: both;
	overflow: hidden;
}
.top_spac
{
	margin: 20px 0 0;
}
.recent_heading
{
	float: left;
	width: 100%;
}
.srch_bar
{
	display: inline-block;
	text-align: right;
	width: 100%;
	padding: 5px;
}
.headind_srch
{
	padding: 10px;
	overflow: hidden;
	border-bottom: thin solid lightgrey;
}
.recent_heading h4
{
	line-height: 40px;
	color: #05728f;
	font-size: 21px;
	margin: 0;
}
.srch_bar .stylish-input-group
{
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.srch_bar input
{
	outline: none;
	margin: 0 5px;
	border: 1px solid #cdcdcd;
	border-width: 0 0 1px 0;
	width: 80%;
	padding: 5px;
	background: none;
}
.srch_bar .input-group-addon button
{
	outline: none;
	background: none;
	border: medium none;
	padding: 0;
	color: #707070;
	font-size: 18px;
}
.srch_bar .input-group-addon
{
	margin: 0;
}
.chat_ib h5
{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 15px;
	color: #464646;
	margin: 0 0 2px 0;
}
.chat_ib h5 span
{
	font-size: 13px;
	float: right;
}
.chat_ib p
{
	font-size: 14px;
	color: #989898;
	margin: auto;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.chat_img
{
	float: left;
	height: 40px;
	width: 40px;
	min-width: 40px;
}
.chat_ib
{
	float: left;
	padding: 0 0 0 5px;
	width: 80%;
}
.chat_people
{
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden;
	clear: both;
}
.chat_list
{
	position: relative;
	border-bottom: 1px solid #c4c4c4;
	margin: 0;
	padding: 10px;
}
.chat_list.active
{
    background-color: gainsboro;
}
.chat_list .new_icon
{
    position: absolute;
    bottom: 0;
    right: 0;
    background-color: gold;
    color: black;
    border: 0.01rem solid black;
    border-radius: 50%;
    height: 1.5rem;
    width: 1.5rem;
    text-align: center;
    margin: 0 0.4rem 0.4rem;
    line-height: 1.3rem;
}
.inbox_chat
{
	height: 630px;
	overflow-y: auto;
}
.empty_chat
{
	display: block;
}
.empty_chat div
{
	margin: 1.5em 1em 0.5em;
}
.chat_list:hover
{
	background: #ebebeb;
	cursor: pointer;
}
.incoming_msg_img
{
	display: inline-block;
	height: 30px;
	width: 30px;
}
.received_msg
{
	display: inline-block;
	padding: 0 0 0 10px;
	vertical-align: top;
	width: 92%;
}
.received_withd_msg p
{
	background: #ebebeb none repeat scroll 0 0;
	border-radius: 3px;
	color: #646464;
	font-size: 14px;
	margin: 0;
	padding: 5px 10px 5px 12px;
	width: 100%;
}
.time_date
{
	color: #747474;
	display: block;
	font-size: 0.75rem;
	margin: 0.5rem 0 0;
}
.received_withd_msg
{
    width: 47%;
}
.sent_msg,
.received_withd_msg
{
    position: relative;
}
.sent_msg .msgBox_add,
.received_withd_msg .msgBox_add
{
    position: absolute;
    display: block;
    width: 1rem;
    height: 1rem;
    transform: rotate(45deg);
    z-index: -1;
}
.sent_msg .msgBox_add
{
	top: 0.3rem;
    right: -0.3rem;
    background-color: #05728f;
}
.received_withd_msg .msgBox_add
{
	top: 0.45rem;
    left: -0.3rem;
    background-color: #ebebeb;
}


.mesgs_header
{
	float: left;
	display: flex;
	padding: 10px 15px;
	width: 75%;
	border-bottom: thin solid lightgrey;
	border-left: thin solid lightgrey;
}
.mesgs_header .mesgs_header_img
{
	display: inline-block;
	margin-right: 0.31rem;
	width: 2.5rem;
}
.mesgs_header p
{
	margin: 0;
	font-size: 30px;
	line-height: 40px;
}
.mesgs
{
	float: left;
	padding: 0.8rem 0.1rem 0.8rem 0.8rem;
	width: 75%;
	border-left: thin solid lightgrey;
}
.sent_msg p {
    background: #05728f;
    border-radius: 0.18rem;
    font-size: 0.875rem;
    margin: 0;
    color: #fff;
    padding: 5px 10px 5px 12px;
    width: 100%;
}
.outgoing_msg
{
    overflow: hidden;
    margin: 1.625rem 0;
    padding: 0 1rem;
}
.date_divider_msg
{
	position: relative;
    overflow: hidden;
    margin: 1.625rem 1rem;
    text-align: center;
}
.date_divider_msg .divider_date
{
	margin: 0 auto -27px;
    background-color: darkslategray;
    width: 8.625rem;
    color: white;
    border-radius: 0.18rem;
}
.sent_msg {
    float: right;
    width: 46%;
}
.input_msg_write
{
	margin-top: 0.1rem;
	width: 100%;	
}
.input_msg_write input
{
	outline: none;
	border: medium none;
	color: #4c4c4c;
	font-size: 15px;
	min-height: 48px;
	width: 100%;
}
.type_msg
{
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-top: 1px solid #c4c4c4;
}
.msg_send_btn
{
	background: #05728f none repeat scroll 0 0;
	border: medium none;
	border-radius: 5%;
	color: #fff;
	font-size: 0.6rem;
	height: 2rem;
	right: 0;
	top: 0.8rem;
	width: 2rem;
    min-width: 2rem;
}
.msg_history
{
	height: 600px;
	overflow-y: auto;
}
.msg_history::-webkit-scrollbar
{
	width: 0.6rem;
}
.msg_history::-webkit-scrollbar-thumb
{
	background-color: skyblue;
    background-clip: padding-box;
    border: 0.1rem solid transparent;
}
.msg_history::-webkit-scrollbar-track {}
</style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />

<section>

	<div class="massage_container container">
        <div class="messaging">
            <div class="inbox_msg">
                <div class="inbox_people">

                    <div class="headind_srch">
                        <div class="recent_heading">
                            <h4>메시지</h4>
                        </div>
                        <div class="srch_bar">
                            <div class="stylish-input-group">
                                <input type="text" class="search_bar" placeholder="Search">
                                <span class="input-group-addon">
                                    <button type="button">
										<img class="img_svg" src="${contextPath }/resources/views/images/svg/speech-bubble-plus-thin.svg">
									</button>
                                </span>
							</div>
                        </div>
                    </div>

					<div class="inbox_chat">
					
				<c:if test="${empty mList  }">
					<div class="empty_chat">
						<div>아직 메시지가 없습니다.</div>
						<div>닉네임을 검색해<br> 채팅을 시작해 보세요.</div>
					</div>
				</c:if>
				<c:if test="${!empty mList }">
					<!-- 이건 필요 없어짐... -->
                   	<c:forEach var="m" items="${mList }">
						<div class="chat_list">
						<c:set var="calcDate" value="${mLresult }"/>
						<!-- NOW DATE  -->
						<jsp:useBean id="now" class="java.util.Date"/>
						<fmt:formatDate var="nowDate" value="${now}" type="time" pattern="yyyyMMdd"/>
						<fmt:formatDate var="nowYear" value="${now}" type="time" pattern="yyyy"/>
						<fmt:formatDate var="nowMonth" value="${now}" type="time" pattern="MM"/>
						<fmt:formatDate var="nowDay" value="${now}" type="time" pattern="dd"/>
						<fmt:formatDate var="nowHour" value="${now}" type="time" pattern="HH"/>
						<fmt:formatDate var="nowMinute" value="${now}" type="time" pattern="mm"/>
						<fmt:formatDate var="nowSecond" value="${now}" type="time" pattern="ss"/>
						<!-- DB DATE -->
						<fmt:parseDate var="parseDate" value="${m.messageDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<fmt:formatDate var="mLDate" value="${parseDate}" type="time" pattern="yyyyMMdd"/>
						<fmt:formatDate var="mLYear" value="${parseDate}" type="time" pattern="yyyy"/>
						<fmt:formatDate var="mLMonth" value="${parseDate}" type="time" pattern="MM"/>
						<fmt:formatDate var="mLDay" value="${parseDate}" type="time" pattern="dd"/>
						<fmt:formatDate var="mLHour" value="${parseDate}" type="time" pattern="HH"/>
						<fmt:formatDate var="mLMinute" value="${parseDate}" type="time" pattern="mm"/>
						<fmt:formatDate var="mLSecond" value="${parseDate}" type="time" pattern="ss"/>
						<fmt:formatDate var="mLresult" value="${parseDate}" type="both"/>
						<fmt:formatDate var="mLTime" value="${parseDate}" type="time" pattern="a hh:mm"/>
		
						<c:choose>
 							<c:when test="${newYear == mLYear }">
								<c:set var="calcDate" value="${nowYear - mLYear}년 전"/>
 							</c:when>
 							<c:when test="${nowMonth ne mLMonth}">
								<c:set var="calcDate" value="${nowMonth - mLMonth}달 전"/>
 							</c:when>
 							<c:when test="${nowDay ne mLDay}">
								<c:set var="calcDate" value="${nowDay - mLDay}일 전"/>
 							</c:when>
 							<%-- <c:when test="${nowHour ne mLHour}">
								<c:set var="calcDate" value="${nowHour - mLHour}시간 전"/>
 							</c:when>
 							<c:when test="${nowMinute ne mLMinute}">
								<c:set var="calcDate" value="${nowMinute - mLMinute}분 전"/>
 							</c:when>
 							<c:when test="${nowSecond ne mLSecond}">
								<c:set var="calcDate" value="${nowSecond - mLSecond}초 전"/>
 							</c:when> --%>
							<c:otherwise>
								<c:set var="calcDate" value="${mLTime }"/>
							</c:otherwise>
 						</c:choose>
						
						<c:if test="${m.fromMemberNo eq loginUser.memberNo }">
							<input type="hidden" class="memberNo" value="${m.toMemberNo}"></input>
							<input type="hidden" class="memberNickname" value="${m.toMemberNickname}"></input>
							<div class="chat_people">
								<div class="chat_img">
									<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/upprofileFiles/${m.toMemberPhoto }"
										onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
								</div>
								<div class="chat_ib">
									<h5>${m.toMemberNickname } <span class="chat_date">${calcDate}</span></h5>
									<p>${m.messageContent }</p>
								</div>
							</div>
						</c:if>
						<c:if test="${m.fromMemberNo ne loginUser.memberNo }">
							<input type="hidden" class="memberNo" value="${m.fromMemberNo}"></input>
							<input type="hidden" class="memberNickname" value="${m.fromMemberNickname}"></input>
							<div class="chat_people">
								<div class="chat_img">
									<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/upprofileFiles/${m.fromMemberPhoto }"
										onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
								</div>
								<div class="chat_ib">
									<h5>${m.fromMemberNickname } <span class="chat_date">${calcDate }</span></h5>
									<p>${m.messageContent }</p>
								</div>
							</div>
						</c:if>
                        </div>
					</c:forEach>
				</c:if>
                    </div>
                </div>
                
				<div class="mesgs_header">
					<input type="hidden" class="memberNo" value=""></input>
					<div class="mesgs_header_img">
						<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/views/images/grooming_logo(100x100).png"
							onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
					</div>
					<p class="mesgs_nickname">그루밍</p>
				</div>
                <div class="mesgs">
                    <div class="msg_history">

						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/views/images/grooming_logo(100x100).png"
								onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
                            </div>
                            <div class="received_msg">
                                <div class="received_withd_msg">
                                	<div class="msgBox_add"></div>
                                    <p>안녕하세요. 회원님~ 공부는 잘되가나요?</p>
                                    <span class="time_date">AM 10시 30분</span>
                                </div>
                            </div>
                        </div>

                        <div class="outgoing_msg">
                            <div class="sent_msg">
                               	<div class="msgBox_add"></div>
                                <p>네~ 덕분에 이번에 자격증 취득했어요~ 너무너무 감사해요.</p>
                                <span class="time_date">PM 01시 30분</span>
                            </div>
                        </div>
                        
                        <div class="incoming_msg">
							<div class="incoming_msg_img">
								<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/views/images/grooming_logo(100x100).png"
								onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
                            </div>
                            <div class="received_msg">
                                <div class="received_withd_msg">
                                	<div class="msgBox_add"></div>
                                    <p>아마도 애니메이션 작업 할꺼에요... //TODO </p>
                                    <span class="time_date">PM 02시 22분</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="outgoing_msg">
                            <div class="sent_msg">
                                	<div class="msgBox_add"></div>
                                <p>닉네임을 검색 후 채팅을 시작해요. </p>
                                <span class="time_date">PM 03시 33분</span>
                            </div>
                        </div>

                    </div>
                    <div class="type_msg">
                        <div class="input_msg_write">
                            <input type="text" class="write_msg" placeholder="Type a message" required>
                        </div>
						<button class="msg_send_btn" type="button"> 전송 </button>
                    </div>
                </div>
            </div>

        </div>
    </div>

</section>

	<script type="text/javascript">
		let activeChat = "";
	
		$(function() {
			console.log("채팅 페이지");
			loadChatListData();
			
			// 테스트 중
			setInterval(function(){
				loadChatListData();
				
				if($(".mesgs_header").find("input[type=hidden].memberNo").val() != ""){
					console.log("인터벌 챗 가져오기");
					// 전송 값 변수 저장
					var fromMemberNo = $(".mesgs_header").find("input[type=hidden].memberNo").val();
					var toMemberNo = "${loginUser.memberNo }";
					
					loadChatData(fromMemberNo,toMemberNo);
				}
			}, 5000);
		});
	</script>

	<!-- 채팅방 생성 스크립트 -->
	<script type="text/javascript">
		// 검색 창에서 enter키로 채팅방 생성
		$(".search_bar").keyup(function(e){
			if(e.keyCode == 13){
				createChatRoom();
			}
		});
	
		// 생성 버튼으로 채팅방 생성
		$(".input-group-addon").on("click", function() {
			createChatRoom();
		});
	
		// 채팅 생성
		function createChatRoom() {
			var memberNickName = "${loginUser.memberNickName}";
			if($.trim($(".search_bar").val()) == ""){
				alert("닉네임을 입력해 주세요.");
				return;
			} else if($.trim($(".search_bar").val()) == memberNickName){
				alert("다른 사용자의 닉네임을 입력해 주세요.");
				return;
			}
			console.log("닉네임 검사 시작 ");
			memberNickName = $(".search_bar").val();
			
			$.ajax({
				url:"createChatRoom.do",
				data:{memberNickName:memberNickName},
				success:function(data){
					if(data.fromMemberNo != null){
						console.log(memberNickName + " 닉네임 사용자가 있습니다");
	
						$("div").remove(".incoming_msg");
						$("div").remove(".outgoing_msg");
						$("div").remove(".date_divider_msg");
						
						$(".mesgs_header input.memberNo").val(data.fromMemberNo);
						$(".mesgs_header img.proFile_img").attr("src","${contextPath }/resources/upprofileFiles/"+data.fromMemberPhoto);
						$(".mesgs_header p.mesgs_nickname").text(data.fromMemberNickname);
						
						$(".write_msg").focus();
	
					} else {
						alert("닉넴임을 확인해 주세요.");
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		}
	</script>

	<!-- 채팅리스트 스크립트 -->
	<script type="text/javascript">	
		// 채팅 리스트에서 채팅창 열기
		$(document).on("click", ".chat_list", function(){
			var el = $(this);

			var toMemberNo = "${loginUser.memberNo }";
			var fromMemberNo = el.find("input[type=hidden].memberNo").val();
			var fromMemberNickname = el.find("input[type=hidden].memberNickname").val();
			var fromToChk = el.find("input[type=hidden].fromTo").val();
			var fromMemberImg = el.find(".proFile_img").attr("src");

			console.log("대화 회원 번호 : " + fromMemberNo + " / 닉네임 : " + fromMemberNickname + " / 사진경로 : " + fromMemberImg);

			// 채팅창 해더값 입력
			$(".mesgs_header input.memberNo").val(fromMemberNo);
			$(".mesgs_header img.proFile_img").attr("src",fromMemberImg);
			$(".mesgs_header p.mesgs_nickname").text(fromMemberNickname);
			
			activeChat = fromMemberNo;
			$(".chat_list").removeClass("active");
			el.addClass("active");

			el.find('.new_icon').css("display","none");

			console.log("활성 챗 : " + activeChat);
			console.log("fromToChk 챗 : " + fromToChk);

			// 보내기만한 채팅방의 값을 변경해서 데이터 가져오기
			if(fromToChk == "T"){
				var temp = fromMemberNo;
				fromMemberNo = toMemberNo;
				toMemberNo = temp;
			}
			
			// 채팅 데이터 가져오기
			loadChatData(fromMemberNo,toMemberNo);
		});

		// 로드 채팅 리스트(ajax)
		function loadChatListData() {
			console.log("채팅 리스트 가져오기 시작");
			var memberNo = "${loginUser.memberNo}";

			$.ajax({
				url:"loadChatList.do",
				data:{memberNo:memberNo},
				success:function(data){
					console.log("채팅 리스트 불러오기 결과 : " + data.length);
					if(data.length > 0){
						// 채팅 리스트 추가
						loadChatList(data);
					} else {
						console.log("채팅 없음");
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		}

		//채팅 리스트 화면 추가
		function loadChatList(data) {
			$("div").remove(".chat_list");
			$("div").remove(".empty_chat");
			
			// 채팅 리스트 추가
			if(data.length > 0) {
				console.log("채팅 리스트 추가");
				var memberNo = "${loginUser.memberNo}";
				var today = new Date();
				var year = today.getFullYear();
				var month = today.getMonth() + 1;
				var date = today.getDate();
				var hours = today.getHours();
				var minutes = today.getMinutes();
				var seconds = today.getSeconds();
				
				if((month + "").length < 2){ 
			        month = "0" + month;
			    }
				
				console.log("활성 채팅 확인 : " + activeChat);
				
				// 채팅 리스트 추가 반복문
				for(var i in data){
					var $inbox_chat = $(".inbox_chat");
					
					// 날짜 계산 & 추가
					var msgDate = data[i].messageDate.split(',');	// 0년, 1달, 2월, 3일, 4시, 5분, 6초
					var showDate = msgDate[0] + "년" + msgDate[1] + "월" + msgDate[2] + "일 " + msgDate[3] + "시" + msgDate[4] + "분" + msgDate[5] + "초";

					if(year != msgDate[0] || month != msgDate[1] || date != msgDate[2]){	// 년월일이 다른경우
						if(year != msgDate[0]){	// 년도가 다르면
							showDate = year - msgDate[0] + " 년 전";
							if(date - msgDate[0] == 1){	// 1년전 인 경우
								showDate = "작년";
							} else {
								showDate = year - msgDate[0] + " 년 전";
							}
						} else if(month == msgDate[1] && date != msgDate[2]){	// 월이 같으면서 일이 다른 경우
							if(date - msgDate[2] == 1){	
								showDate = "어제";
							} else {
								showDate = msgDate[1] + "월 " + msgDate[2] + "일";
							}
						} else {
							showDate = msgDate[0] + "년 " + msgDate[1] + "월 " + msgDate[2] + "일";
						}
					// 시간 계산 부분
					} else if(hours == msgDate[3] && minutes == msgDate[4] && seconds == msgDate[5]){	// 시분초가 같은경우
						showDate = "방금 전";
					} else if(hours == msgDate[3] && minutes != msgDate[4]){	// 분이 다른경우
						showDate = minutes - msgDate[4] + "분 전";
					} else if(hours == msgDate[3] && minutes == msgDate[4]){	// 초가 다른경우
						showDate = seconds - msgDate[5] + "초 전";
					} else {
						showDate = msgDate[3] + msgDate[4] + msgDate[5];
						if(msgDate[3] > 12){	// 오전 오후 표시
							showDate = "오후 " + (msgDate[3]*1 - 12) + ":" + msgDate[4];
						} else {
							showDate = "오전 " + msgDate[3] + ":" + msgDate[4];
						}
					}
					
					// 채팅 리스트 변수 생성 & 값 추가
					var $chat_list = $('<div>').addClass("chat_list");
					var $iMessageNo = $('<input>').addClass("messageNo").attr("type","hidden").val(data[i].messageNo);
					var $new_icon = $('<div>').addClass("new_icon").text("N");
					var $chat_people = $('<div>').addClass("chat_people");
					var $chat_img = $('<div>').addClass("chat_img");
					var $chat_ib = $('<div>').addClass("chat_ib");
					var $spanDate = $('<span>').addClass("chat_date").text(showDate);
					var $pContent = $('<p>').text(data[i].messageContent);

					if(data[i].fromMemberNo == memberNo){ // 보내기만 한 채팅
						if(activeChat == data[i].toMemberNo){
							$chat_list = $('<div>').addClass("chat_list active");
						}
						// 읽지 않은 메시지라면 new 아이콘 추가
						if(data[i].toMConfirm == "N") {
							$chat_list.append($new_icon);
						}
						// 받은 메시지 없이
						var $iMemberNo = $('<input>').addClass("memberNo").attr("type","hidden").val(data[i].toMemberNo);
						var $iNickname = $('<input>').addClass("memberNickname").attr("type","hidden").val(data[i].toMemberNickname);
						var $ifromTo = $('<input>').addClass("fromTo").attr("type","hidden").val("T");	// 채팅방 구별용
						var $proFile_img = $('<img>').addClass("proFile_img").attr({"alt":"프로필사진","src":"${contextPath }/resources/upprofileFiles/"+data[i].toMemberPhoto,"onerror":"this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'"});
						var $h5Nickname = $('<h5>').text(data[i].toMemberNickname);
					} else {	// 상호 채팅
						if(activeChat == data[i].fromMemberNo){
							$chat_list = $('<div>').addClass("chat_list active");
						}
						// 읽지 않은 메시지라면 new 아이콘 추가
						if(data[i].fromMConfirm == "N") {
							$chat_list.append($new_icon);
						}
						var $iMemberNo = $('<input>').addClass("memberNo").attr("type","hidden").val(data[i].fromMemberNo);
						var $iNickname = $('<input>').addClass("memberNickname").attr("type","hidden").val(data[i].fromMemberNickname);
						var $ifromTo = $('<input>').addClass("fromTo").attr("type","hidden").val("F");
						var $proFile_img = $('<img>').addClass("proFile_img").attr({"alt":"프로필사진","src":"${contextPath }/resources/upprofileFiles/"+data[i].fromMemberPhoto,"onerror":"this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'"});
						var $h5Nickname = $('<h5>').text(data[i].fromMemberNickname);
					}
					
					// 화면에 추가
					$chat_list.append($iMessageNo);
					$chat_list.append($iMemberNo);
					$chat_list.append($iNickname);
					$chat_list.append($ifromTo);


					$chat_img.append($proFile_img);
					$h5Nickname.append($spanDate);
					$chat_ib.append($h5Nickname);
					$chat_ib.append($pContent);
					$chat_people.append($chat_img);
					$chat_people.append($chat_ib);
					$chat_list.append($chat_people);

					$inbox_chat.append($chat_list);

				}
			} else {
				console.log("내용 없음");
			}
		}

	</script>

	<!-- 메시지 전송 스크립트 -->
	<script type="text/javascript">
		// 메시지 입력창에서 enter키로 메시지 전송
		$(".write_msg").keyup(function(e){
			if(e.keyCode == 13){
				sendMsg();
			}
		});

		// 전송 버튼 클릭으로 메시지 전송
		$(".msg_send_btn").on("click", function() {
			sendMsg();
		});

		// 채팅 보내기
		function sendMsg(){
			// 채팅 조건 확인
			if($.trim($(".write_msg").val()) == ""){
				console.log("내용을 입력해 주세요.");
				return;
			} if($(".mesgs_header").find("input[type=hidden].memberNo").val() == ""){
				$(".search_bar").focus();
				alert("닉네임을 적은 후 메시지를 입력하세요.");
				return;
			}

			// 전송 값 변수 저장
			var fromMemberNo = "${loginUser.memberNo }";
			var toMemberNo = $(".mesgs_header").find("input[type=hidden].memberNo").val();
			var messageContent = $(".write_msg").val();

			console.log("[전송] " + fromMemberNo + "이 " + toMemberNo + "에게 "  + messageContent);

			// 채팅 보내기
			$.ajax({
				url:"sendChat.do",
				data:{fromMemberNo:fromMemberNo,toMemberNo:toMemberNo,messageContent:messageContent},
				success:function(data){
					console.log("채팅 보내기 결과 : " + data);
					if(data == "success"){
						$(".write_msg").val("");
						// 채팅 내용 추가
						loadChatData(fromMemberNo,toMemberNo);
						loadChatListData();
					} else {
						alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
					}
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
			// 글입력창으로 포커스 이동
			$(".write_msg").focus();
		}

		// 채팅 데이터 가져오기
		function loadChatData(fromMemberNo,toMemberNo) {
			$.ajax({
				url:"loadChat.do",
				data:{fromMemberNo:fromMemberNo,toMemberNo:toMemberNo},
				success:function(data){
					console.log("채팅 대화 가져오기 결과 : " + data.length);
					// 채팅 내용 추가
					loadChat(data);
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		}

		// 채팅 출력
		function loadChat(data) {
			$("div").remove(".incoming_msg");
			$("div").remove(".outgoing_msg");
			$("div").remove(".date_divider_msg");

			// 채팅 내용 추가
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

					// 메시지 추가
					if(data[i].fromMemberNo == memberNo){
						// outgoing
						var $iMessageNo = $('<input>').addClass("messageNo").attr("type","hidden").val(data[i].messageNo);
						var $outgoing_msg = $('<div>').addClass("outgoing_msg");
						var $sent_msg = $('<div>').addClass("sent_msg");
						var $msgBox_add = $('<div>').addClass("msgBox_add");
						var $pMessageContent = $('<p>').text(data[i].messageContent);
						var $time_date = $('<span>').addClass("time_date").text(messageDate[1]);

						$sent_msg.append($iMessageNo);
						$sent_msg.append($msgBox_add);
						$sent_msg.append($pMessageContent);
						$sent_msg.append($time_date);
						$outgoing_msg.append($sent_msg);

						$msg_history.append($outgoing_msg);

					} else {
						// incoming
						var $iMessageNo = $('<input>').addClass("messageNo").attr("type","hidden").val(data[i].messageNo);
						var $incoming_msg = $('<div>').addClass("incoming_msg");
						var $incoming_msg_img = $('<div>').addClass("incoming_msg_img");
						var $proFile_img = $('<img>').addClass("proFile_img").attr({"alt":"프로필사진","src":"${contextPath }/resources/upprofileFiles/" + data[i].fromMemberPhoto, "onerror":"this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'"});
						var $received_msg = $('<div>').addClass("received_msg");
						var $received_withd_msg = $('<div>').addClass("received_withd_msg");
						var $msgBox_add = $('<div>').addClass("msgBox_add");
						var $pMessageContent = $('<p>').text(data[i].messageContent);
						var $time_date = $('<span>').addClass("time_date").text(messageDate[1]);
						
						$incoming_msg_img.append($iMessageNo);
						$incoming_msg_img.append($proFile_img);
						$received_withd_msg.append($msgBox_add);
						$received_withd_msg.append($pMessageContent);
						$received_withd_msg.append($time_date);
						$received_msg.append($received_withd_msg);
						$incoming_msg.append($incoming_msg_img);
						$incoming_msg.append($received_msg);
						
						$msg_history.append($incoming_msg);
					}
				}

			} else {
				console.log("내용 없음");
			}
			
			// 스크롤 내리기
			var his_height = $(".msg_history")[0].scrollHeight;
			$(".msg_history").scrollTop(his_height);
		}
	</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>