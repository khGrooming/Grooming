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
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	padding: 0;
	color: #707070;
	font-size: 18px;
}
.srch_bar .input-group-addon
{
	margin: 0 0 0 -20px;
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
	border-bottom: 1px solid #c4c4c4;
	margin: 0;
	padding: 10px;
}
.inbox_chat
{
	height: 630px;
	overflow-y: auto;
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
	font-size: 12px;
	margin: 8px 0 0;
}
.received_withd_msg
{
    width: 47%;
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
    visibility: hidden;
	display: inline-block;
	margin-right: 5px;
	width: 40px;
}
.mesgs_header p
{
    visibility: hidden;
	margin: 0;
	font-size: 30px;
	line-height: 40px;
}
.mesgs
{
	float: left;
	padding: 15px;
	width: 75%;
	border-left: thin solid lightgrey;
}
.sent_msg p {
    background: #05728f;
    border-radius: 3px;
    font-size: 14px;
    margin: 0;
    color: #fff;
    padding: 5px 10px 5px 12px;
    width: 100%;
}
.outgoing_msg
{
    overflow: hidden;
    margin: 26px 8px;
}
.date_divider_msg
{
	position: relative;
    overflow: hidden;
    margin: 26px 8px;
    text-align: center;
}
.date_divider_msg .divider_date
{
	margin: 0 auto -27px;
    background-color: darkslategray;
    width: 138px;
    color: white;
    border-radius: 3px;
}
.sent_msg {
    float: right;
    width: 46%;
}
.input_msg_write input
{
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	border: medium none;
	color: #4c4c4c;
	font-size: 15px;
	min-height: 48px;
	width: 100%;
}
.type_msg
{
	border-top: 1px solid #c4c4c4;
	position: relative;
}
.msg_send_btn
{
	background: #05728f none repeat scroll 0 0;
	border: medium none;
	border-radius: 50%;
	color: #fff;
	cursor: pointer;
	font-size: 5px;
	height: 33px;
	position: absolute;
	right: 0;
	top: 11px;
	width: 33px;
}
.msg_history
{
	height: 600px;
	overflow-y: auto;
}
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
                        <%-- <div class="srch_bar">
                            <div class="stylish-input-group">
                                <input type="text" class="search-bar" placeholder="Search">
                                <span class="input-group-addon">
                                    <button type="button">
										<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-search-thin.svg">
									</button>
                                </span>
							</div>
                        </div> --%>
                    </div>

					<div class="inbox_chat">
					
				<c:if test="${empty mList  }">
					<div class="empty_chat">
						<h4>나중에 꾸미자...</h4>
						<h4>대화가 없습니다.</h4>
						<button type="button"> 메시지 보내기</button>
					</div>
				</c:if>
				<c:if test="${!empty mList }">
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
					<div class="mesgs_header_img">
						<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG"
							onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
					</div>
					<p class="mesgs_nickname">Tester</p>
				</div>
                <div class="mesgs">
                    <div class="msg_history">
                    
                        <div class="incoming_msg">
                            <div class="incoming_msg_img">
								<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG"
								onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
                            </div>
                            <div class="received_msg">
                                <div class="received_withd_msg">
                                    <p>Test which is a new approach to have all
                                        solutions</p>
                                    <span class="time_date"> 11:01 AM | June 9</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="outgoing_msg">
                            <div class="sent_msg">
                                <p>Test which is a new approach to have all
                                    solutions</p>
                                <span class="time_date"> 11:01 AM | June 9</span>
                            </div>
                        </div>
                        
                        
                    </div>
                    <div class="type_msg">
                        <div class="input_msg_write">
                            <input type="text" class="write_msg" placeholder="Type a message" />
                            <button class="msg_send_btn" type="button"> 전송 </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</section>

	<script type="text/javascript">
		$(".chat_list").on("click",function(){
			var el = $(this);
			
			var toMemberNo = "${loginUser.memberNo }";
			var fromMemberNo = el.find("input[type=hidden].memberNo").val();
			var fromMemberNickname = el.find("input[type=hidden].memberNickname").val();
			var fromMemberImg = el.find(".proFile_img").attr("src");
			
			console.log("대화 회원 번호 : " + fromMemberNo + " / 닉네임 : " + fromMemberNickname + " / 사진경로 : " + fromMemberImg);
			
			$(".incoming_msg_img img.proFile_img").prop("src",fromMemberImg);
			$(".mesgs_header p.mesgs_nickname").text(fromMemberNickname);
			$(".mesgs_header_img").css("visibility","visible");
			$(".mesgs_nickname").css("visibility","visible");
			
			$("div").remove(".incoming_msg");
			$("div").remove(".outgoing_msg");
			// 채팅 데이터 가져오기  띄우기
			$.ajax({
				url:"loadChat.do",
				data:{fromMemberNo:fromMemberNo,toMemberNo:toMemberNo},
				success:function(data){
					console.log("채팅 대화 가져오기 결과 : " + data.length);
					loadChat(data);
				},
				error:function(request, status, errorData){
					alert("서버가 혼잡합니다. 잠시 후 시도해 주세요.");
				}
			});
		});
		
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

					// 메시지 추가
					if(data[i].fromMemberNo == memberNo){
						// outgoing	
						var $outgoing_msg = $('<div>').addClass("outgoing_msg");
						var $sent_msg = $('<div>').addClass("sent_msg");
						var $pMessageContent = $('<p>').text(data[i].messageContent);
						var $time_date = $('<span>').addClass("time_date").text(messageDate[1]);

						$sent_msg.append($pMessageContent);
						$sent_msg.append($time_date);
						$outgoing_msg.append($sent_msg);

						$msg_history.append($outgoing_msg);

					} else {
						// incoming
						var $incoming_msg = $('<div>').addClass("incoming_msg");
						var $incoming_msg_img = $('<div>').addClass("incoming_msg_img");
						var $proFile_img = $('<img>').addClass("proFile_img").attr({"alt":"프로필사진","src":"${contextPath }/resources/upprofileFiles/"+data[i].fromMemberPhoto,"onerror":"this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'"});
						var $received_msg = $('<div>').addClass("received_msg");
						var $received_withd_msg = $('<div>').addClass("received_withd_msg");
						var $pMessageContent = $('<p>').text(data[i].messageContent);
						var $time_date = $('<span>').addClass("time_date").text(messageDate[1]);
						
						$incoming_msg_img.append($proFile_img);
						$received_withd_msg.append($pMessageContent);
						$received_withd_msg.append($time_date);
						$received_msg.append($received_withd_msg);
						$incoming_msg.append($incoming_msg_img);
						$incoming_msg.append($received_msg);
						
						$msg_history.append($incoming_msg);
						
					}

					messageDateTemp = messageDate[0];

				}
			} else {
				console.log("내용 없음");
			}
		}
	</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>