<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.container
{
	max-width: 1170px;
	margin: auto;
}
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
	margin: 20px 0;
}
.massage_container .chat_img img,
.massage_container .profile_img img,
.massage_container .incoming_msg_img img
{
	width: 100%;
	border: thin solid lightgrey;
	border-radius: 50%;
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
	width: 20%;
}
.chat_ib
{
	float: left;
	padding: 0 0 0 5px;
	width: 80%;
}
.chat_people
{
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
	height: 100%;
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
    width: 57%;
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
.mesgs_header .profile_img
{
	display: inline-block;
	margin-right: 5px;
	width: 40px;
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
.outgoing_msg {
    overflow: hidden;
    margin: 26px 8px;
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
                        <div class="srch_bar">
                            <div class="stylish-input-group">
                                <input type="text" class="search-bar" placeholder="Search">
                                <span class="input-group-addon">
                                    <button type="button">
										<img class="img_svg" src="${contextPath }/resources/views/images/svg/iconmonstr-search-thin.svg">
									</button>
                                </span> </div>
                        </div>
                    </div>
                    <div class="inbox_chat">
                    
                        <div class="chat_list">
                            <div class="chat_people">
                                <div class="chat_img">
									<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/upprofileFiles/${loginUser.memberPhoto }"
									onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
                                </div>
                                <div class="chat_ib">
                                    <h5>nickname <span class="chat_date">2020/09/01</span></h5>
                                    <p>Test, which is a new approach to have all solutions
                                        astrology under one roof.</p>
                                </div>
                            </div>
                        </div>
                        

                        
                    </div>
                </div>
                <div class="mesgs_header">
                    <div class="profile_img">
						<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/upprofileFiles/${loginUser.memberPhoto }"
						onerror="this.src='${contextPath }/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG'">
                    </div>
                    <p>Tester</p>
                </div>
                <div class="mesgs">
                    <div class="msg_history">
                    
                        <div class="incoming_msg">
                            <div class="incoming_msg_img">
								<img class="proFile_img" alt="프로필사진" src="${contextPath }/resources/upprofileFiles/${loginUser.memberPhoto }"
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
	
	</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>