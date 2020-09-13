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
	width: 70%;
	height: 500px;
	margin: 5% auto;
}
</style>
<body>
<jsp:include page="./mypageinfo.jsp" />
	<div id="content">
		<div style="width: 65%; margin-right: auto; margin-left: auto;">
			<div class="MsectionDiv" id="Mcontent3" style="text-align: center;">
		<div id="pwdCheckDiv" style="margin-top: 12%">
			<img src='${contextPath }/resources/views/images/sadimg.PNG' width="500px">
			<h4>정말 탈퇴하시겠습니까?</h4>
			<p>
				탈퇴하기 위해서 계정의 비밀번호를 입력하십시오. <br> <br> <input
					type="password" name="pwd" id="pwd" required style="margin-right: 3%;">
				<button onclick="pwdCheck();">입력</button>
		</div>
		<div id="testtest"
			style="text-align: left; margin-left: 5%; margin-top: 2%; display: none;">
			<h3>탈퇴 안내</h3>
			<p style="font-size: 12px;">
				회원 탈퇴를 신청하기 전에 안내사항을 꼭 확인해 주세요 <br>
			<p style="margin-bottom: 2px;">1.탈퇴 후 계정 복구나 재사용은 불가능합니다.
			<p style="font-size: 12px; color: red;">
				탈퇴 후에는 본인과 타인 모두 복구및 재사용이 불가능하오니 신중하게 선택해 주시기 바랍니다 <br> <br>
				<br>
			<p>
				2.탈퇴 후 사용자의 개인적인 이용내역은 모두 삭제됩니다. <br> <br> <br>
			<p style="margin-bottom: 2px;">3.충전하신 포인트는 반환되지 않습니다.
			<p style="font-size: 12px; color: red; margin-bottom: 2px;">탈퇴 전
				환급하지 않은 포인트는 자동으로 반한되지 않습니다.
			<p style="font-size: 12px;">
				포인트 정책에 따라 자동으로 환급되지 않으므로 탈퇴 전 반드시 환급신청을 해주시기 바랍니다. <br> <br>
				<br> <br>
			<div style="text-align: center">

				<input type="checkBox" id="agree"> <label for="agree"
					style="font-size: 13px;"> 안내사항을 모두 확인했으며, 이에 동의합니다.</label> <br>
				<button onclick="memberdel();" id="delBtb"  onMouseover="t();" style=" width:10%;height:40px; border-radius:10px;">탈퇴하기</button>
			</div>

		</div>

	</div>
	</div>
	<script>

	var flag = 1;
	var count = 0;
	function t()
	{
	    var random = Math.floor(Math.random()*(90-10+1)) + 10;
	   if( count != 20 )
	   {
	      $("#delBtb").css("margin-left",random+"%") ;
	      count+=1;
	   }
	  
	  
	}

	
	</script>
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
      					$("#CheckDiv").css("display","none");
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
		<jsp:include page="../common/footer.jsp" />
</body>
</html>