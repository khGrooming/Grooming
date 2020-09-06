<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#content {
	width: 1000px;
	height: 600px;
	margin: 0 auto;
}
.subcontent {
	position: relative;
	height : 550px;
	margin-right: 2%;
	border: 1px solid lightgray;
	padding: 3%;
	border-radius: 20px;
}
.textTitle{
	font-size: 20px;
}
#delBtn{
	width:70px;
	border-radius: 10px;
	margin-left: 40%;
}
</style>
<body>
<jsp:include page="./mypageinfo.jsp" />
	<div id="content">
		<div class="subcontent">
		<h4 style="position: absolute; top:-10px; background: white;width: 150px;text-align: center;">탈퇴하기</h4>
		<div style="width: 65%; margin-right: auto; margin-left: auto;">
			<div class="MsectionDiv" id="Mcontent3" style="text-align: center;">
		<div id="pwdCheckDiv" style="margin-top: 12%">
			<img src='${contextPath }/resources/views/images/sadimg.PNG' width="300px"><br>
			<h4>정말 탈퇴하시겠습니까?</h4>
			<p>
				탈퇴하기 위해서 계정의 비밀번호를 입력하십시오. <br> <br> <input
					type="password" name="pwd" id="pwd" required
					style="margin-right: 3%;">
				<button onclick="pwdCheck();">입력</button>
		</div>
		<div id="testtest"
			style="text-align: left; display: none;">
			<br>
			<h3>탈퇴 안내</h3>
			<p style="font-size: 12px;">
				회원 탈퇴를 신청하기 전에 안내사항을 꼭 확인해 주세요 <br>
			<ol>
				<li><p class=".textTitle">탈퇴 후 계정 복구나 재사용은 불가능합니다.</p>
					<p  style="color: red;">탈퇴 후에는 본인과 타인 모두 복구및 재사용이 불가능하오니 신중하게 선택해 주시기 바랍니다.</p>
				</li>
				<li><p class=".textTitle">탈퇴 후 사용자의 개인적인 이용내역은 모두 삭제됩니다.</p>
					
				</li>
				<li><p class=".textTitle">충전하신 포인트는 반환되지 않습니다.</p>
					<p style="color: red; margin-bottom: 2px;">탈퇴 전 환급하지 않은 포인트는 자동으로 반한되지 않습니다.</p>
					<p style="margin-bottom: 2px;">포인트 정책에 따라 자동으로 환급되지 않으므로 탈퇴 전 반드시 환급신청을 해주시기 바랍니다.</p></li>
			
			
			</ol>
			<br>
			<br>
			<br>
			<div style="text-align: center">

				<input type="checkBox" id="agree"> <label for="agree"
					style="font-size: 13px;"> 안내사항을 모두 확인했으며, 이에 동의합니다.</label> <br>
			</div>
			<div style="width: 100%; margin-top:2%;">
				<button id="delBtn" onMouseover="t()" onclick="memberdel();" >탈퇴하기</button>
			</div>
			<script>
			var count=0;
			function t()
			{
				
			   var ranNum = Math.floor(Math.random()*(95-1+1)) + 1;
			   if(count!=20){
			   $("#delBtn").css("margin-left", ranNum+"%");
			   
			    count +=1;
			  
			   }
			}
			</script>

		</div>

	</div>
	</div>
	<script>
      			function pwdCheck(){
      				var inputPwd = $("#pwd").val();

      			 	$.ajax({
      					url:"pwdCheck.do",
      					type:"post",
      					data:{inputPwd:inputPwd},
      					success : function(data) {
      						if(data == "Y"){
	      						$("#pwdCheckDiv").css("display","none");
	          					$("#testtest").css("display","block");	
      						}else{
      							alert("비밀번호가 틀립니다")
      						}
			            },
			            error : function(data) {  
			               alert("code:"+request.status+"\n"+"error:"+error);
			            }
      				})
      				
      			/* 	if(inputPwd == "qwe"){
      					$("#pwdCheckDiv").css("display","none");
      					$("#testtest").css("display","block");
      				}else{
      					
      				}  */
      			}
      			
      			function memberdel(){
      				if($("#agree").is(":checked")){
      					
      					var checked = confirm("탈퇴하시겠습니까?");
      					if(checked){
      						location.href="memberDel.do";
      					}else{
      						alert("취소하셨습니다.");
      					}
      				}else{
      					alert("체크하세요");
      				}
      			}
      		</script>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
</body>
</html>