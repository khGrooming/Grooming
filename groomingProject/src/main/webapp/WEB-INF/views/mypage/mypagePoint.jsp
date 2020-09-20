<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grooming</title>
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.servletContext.contextPath }/resources/views/images/grooming_logo(100x100).png">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
#content {
	width: 75%;
	height: 800px;
	margin: 0 auto;
}

.flip-card {
	margin-right: 3px;
	background-color: transparent;
	width: 5.5vw;
	height: 110px;
	border: 1px solid #f1f1f1;
	perspective: 1000px; /* Remove this if you don't want the 3D effect */
	float: left;
}

/* This container is needed to position the front and back side */
.flip-card-inner {
	position: relative;
	width: 100%;
	height: 100%;
	text-align: center;
	transition: transform 0.8s;
	transform-style: preserve-3d;
}

/* Do an horizontal flip when you move the mouse over the flip box container */
.flip-card:hover .flip-card-inner {
	transform: rotateY(180deg);
}

/* Position the front and back side */
.flip-card-front, .flip-card-back {
	position: absolute;
	width: 100%;
	height: 100%;
	-webkit-backface-visibility: hidden; /* Safari */
	backface-visibility: hidden;
}

/* Style the front side (fallback if image is missing) */
.flip-card-front {
	background-color: #bbb;
	color: black;
}

/* Style the back side */
.flip-card-back {
	background-color: #ffd91e;
	color: black;
	transform: rotateY(180deg);
}

.cardfont {
	margin-top: 45%;
	font-size: 100%;
}

.subcontent {
	position: relative;
	width: 48%;
	height : 550px;
	float: left;
	margin-right: 2%;
	border: 1px solid lightgray;
	padding: 3%;
	border-radius: 20px;
}
</style>
</head>
<body>

<jsp:include page="./mypageinfo.jsp" />
<div id="content">
	<h3>포인트</h3>
	<br>
	<div class="subcontent">
		<h4 style="position: absolute; top:-10px; background: white;width: 150px;text-align: center;">포인트 내역</h4>
		<c:if test="${!empty pList }">
		
		<table style="width: 95%;">
			<tr>
				<th style="width: 35%;text-align: center;">날짜</th>
				<th>내용</th>
				<th style="width: 25%;text-align: center;">포인트</th>
			</tr>
		</table>
		<div style=" height:400px;width: 95%; overflow:auto; " id="tableDiv">
		<table style="width: 100%;" id="pointListTb">
			<c:forEach var="p" items="${pList }">
				<tr style="border-bottom: 1px solid gray; height: 30px; ">
				<td style="width: 35%;text-align: center;">${p.pointDate }</td>
				<td>${p.pointList }</td>
				<c:if test="${p.addPoint lt 0 }">
				<td style="width: 25%;text-align: center; color:red;">${p.addPoint }</td>
				</c:if>
				<c:if test="${p.addPoint gt 0 }">
				<td style="width: 25%;text-align: center; color:blue;">${p.addPoint }</td>
				</c:if>
				</tr>
			</c:forEach>
		
		</table>
		
		</div>
		<div style="width: 73%; margin-top:5%; margin-left: 2%;">
			<span style="font-size:25px;">총 합계:</span><span style="float: right;font-size:25px;" id="nowPoint">${profileInfo.nowPoint }G</span>
			
		</div>
		</c:if>
		<c:if test="${empty pList }">
		<table style="width: 95%;">
			<tr style="border-bottom: 1px solid lightgray;">
				<th style="width: 35%;text-align: center;">날짜</th>
				<th>내용</th>
				<th style="width: 25%;text-align: center;">포인트</th>
			</tr>
		</table>
		<div style="margin: 0 auto; width: 95%;  height:400px; border-bottom: 1px solid lightgray; padding:35%;"><p >내역이 없습니다.</p></div>
		<div style="width: 73%; margin-top:5%; margin-left: 2%;">
			<span style="font-size:25px;">총 합계:</span><span style="float: right;font-size:25px;" id="nowPoint">0G</span>
			
		</div>
		</c:if>
		<script>
			$(function(){
				$("#tableDiv").scrollTop($("#tableDiv")[0].scrollHeight);
			})
		</script>
	</div>
	
	<div class="subcontent">
		<h4 style="position: absolute; top:-10px; background: white;width: 150px;text-align: center;">포인트 충전</h4>
		<h5>G포인트 충전하기</h5>
		<p style="font-size:13px;">포인트 충전 시 유의사항<br>
			1원당 10포인트가 충전됩니다.<br>
			최대 200만 포인트(적립+충전)까지 보유 가능합니다.<br>
			충전 취소 및 환불은 불가능하니 유의하시고 결제해야 합니다.<br>
			<br>
			환급시 유의사항<br>
			<br>
		
			충전 포인트의 환급은 본인 명의 계좌로만 가능합니다.<br>
			포인트 환급 시 수수료 없이 모든 포인트가 환급 가능합니다.</p>
		<div style="width: 100%; height:auto; margin: 0 auto;">
			<div class="flip-card" onclick="point(1000);" >
			  <div class="flip-card-inner">
			    <div class="flip-card-front">
			      <p class="cardfont">100G</p>
			    </div>
			    <div class="flip-card-back">
			      <p class="cardfont">1,000원</p>
			    </div>
			  </div>
			</div>
			<div class="flip-card" onclick="point(5000);">
			  <div class="flip-card-inner">
			    <div class="flip-card-front">
			      <p class="cardfont">500G</p>
			    </div>
			    <div class="flip-card-back">
			      <p class="cardfont">5,000원</p>
			    </div>
			  </div>
			</div>
			<div class="flip-card" onclick="point(10000);">
			  <div class="flip-card-inner">
			    <div class="flip-card-front">
			      <p class="cardfont">1000G</p>
			    </div>
			    <div class="flip-card-back">
			      <p class="cardfont">10,000원</p>
			    </div>
			  </div>
			</div>
			<div class="flip-card" onclick="point(50000);">
			  <div class="flip-card-inner">
			    <div class="flip-card-front">
			     <p class="cardfont">5000G</p>
			    </div>
			    <div class="flip-card-back">
			      <p class="cardfont">50,000원</p>
			    </div>
			  </div>
			</div>
			<div class="flip-card" onclick="point(100000);">
			  <div class="flip-card-inner">
			    <div class="flip-card-front">
			      <p class="cardfont">10000G</p>
			    </div>
			    <div class="flip-card-back">
			      <p class="cardfont">100,000원</p>
			    </div>
			  </div>
			</div>
		</div>
	<br clear="both">
	<br>
	<table style="width: 90%;">
		<tr>
			<td style="width: 50%;"><span style="font-size: 25px;">포인트:</span><span id="moneyInput"></span></td>
			<td style="width: 50%;"><span style="font-size: 25px;">결제 금액:</span><span id="money" style="font-size: 23px;">0</span><span style="font-size: 25px;">원</span></td>
		</tr>
	</table>
	
	<br clear="both">
	<div style="width:60%; margin:0 auto;">
		<input type="checkbox" id="agreeCheck" >&nbsp;&nbsp;&nbsp;<label for="agreeCheck">이용안내 및 결제 진행에 동의합니다.</label>
	</div>
	<div style="width:50%; margin:0 auto;">
	<button id="check_module" type="button" style="width:100%; font-size: 30px; margin:0 auto; border-radius:10px; ">결제하기</button>
	</div>
<script>
	
	var money;
	function point(pointNum){	
		money=pointNum;
		$("#moneyInput").html("");
			$("#moneyInput").append("<span style='margin:0; font-size:25px;'>"+(pointNum/10)+"G<br>");
			$("#money").text(pointNum);
		
		
	}
	
	</script>
	

<script>
    $("#check_module").click(function () {
    	if(money != null){
	    	if($("#agreeCheck").prop("checked")){
	    		 $("#check_module").click(function () {
	    		    	if(money != null){
	    			    	if($("#agreeCheck").prop("checked")){
	    			    		var IMP = window.IMP; // 생략가능
	    			            IMP.init('imp30301342'); 
	    			            // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	    			            // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	    			            IMP.request_pay({
	    			                pg: 'kakao', // version 1.1.0부터 지원.
	    			                /* 
	    			                    'kakao':카카오페이, 
	    			                    html5_inicis':이니시스(웹표준결제)
	    			                        'nice':나이스페이
	    			                        'jtnet':제이티넷
	    			                        'uplus':LG유플러스
	    			                        'danal':다날
	    			                        'payco':페이코
	    			                        'syrup':시럽페이
	    			                        'paypal':페이팔
	    			                    */
	    			                pay_method: 'card',
	    			                /* 
	    			                    'samsung':삼성페이, 
	    			                    'card':신용카드, 
	    			                    'trans':실시간계좌이체,
	    			                    'vbank':가상계좌,
	    			                    'phone':휴대폰소액결제 
	    			                */
	    			                merchant_uid: 'merchant_' + new Date().getTime(),
	    			                /* 
	    			                    merchant_uid에 경우 
	    			                    https://docs.iamport.kr/implementation/payment
	    			                    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	    			                    참고하세요. 
	    			                    나중에 포스팅 해볼게요.
	    			                 */
	    			                name: '그루밍 포인트 충전',
	    			                //결제창에서 보여질 이름
	    			                amount: money, 
	    			                //가격 
	    			                buyer_email: "${loginUser.memberEmail}",
	    			                buyer_name: "${loginUser.memberEmail}",
	    			                buyer_tel: "${loginUser.memberPhone}",
	    			                buyer_addr: '',
	    			                buyer_postcode: '',
	    			                m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	    			                /*  
	    			                    모바일 결제시,
	    			                    결제가 끝나고 랜딩되는 URL을 지정 
	    			                    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
	    			                    */
	    			            }, function (rsp) {
	    			                //console.log(rsp);
	    			                if (rsp.success) {
	    			                    var msg = '결제가 완료되었습니다.';
	    			                    msg += '결제 금액 : ' + rsp.paid_amount;
	    			                    $.ajax({
	    			    	             	url:"pointPay.do",
	    			    	             	dataType:"json",
	    			    	             	data:{mNo:"${loginUser.memberNo}", money:money},
	    			    	             	success:function(data){
	    			    	             		 $("#pointListTb").append(
	    			    	      	             		"<tr style='border-bottom: 1px solid gray; height: 30px; '>"+
	    			    	      	    				"<td style='width: 35%;text-align: center;'>"+data.pointDate+
	    			    	      	    				"<td>"+data.pointList+
	    			    	      	    				"<td style='width: 25%;text-align: center;'>"+data.addPoint);
	    			    	      	             		 var nowPoint = Number("${profileInfo.nowPoint}")+data.addPoint;
	    			    	      	             		 $("#nowPoint").text(nowPoint+"G");
	    			    	      	             		$("#tableDiv").scrollTop($("#tableDiv")[0].scrollHeight);
	    			    	             	},
	    			    	             	error:function(request, status, errorData){
	    			    							alert("error code: " + request.status + "\n"
	    			    									+"message: " + request.responseText
	    			    									+"error: " + errorData);
	    			    						}	
	    			    	             	
	    			    	             })
	    			                } else {
	    			                    var msg = '결제를 취소하였습니다.';
	    			                }
	    			                alert(msg);
	    			            });
	    			    		
	    			    	}else{
	    			    		alert("이용안내에 체크하십시오.");
	    			    	}
	    		    	}else{
	    		    		alert("충전할 포인트를 선택하세요");
	    		    	}
	    		    });
	    		
	    		
	    		
	    		
	    	}else{
	    		alert("이용안내에 체크하십시오.");
	    	}
    	}else{
    		alert("충전할 포인트를 선택하세요");
    	}
    });
    
</script>
	
	</div>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>