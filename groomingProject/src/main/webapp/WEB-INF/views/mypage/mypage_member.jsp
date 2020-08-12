<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	
	.MsectionDiv {
		display: none;
		padding: 20px 10px 10px 10px;
		border: 3px solid rgba(167, 167, 167, 1);
		height: 500px;
		background: rgba(175, 202, 202, 1); /* 변경 */
	}
	
	 /*라디오버튼 숨김*/
	.MinputBar {
		display: none;
	}
	
	.Mlabel {
		display: inline-block;
		margin: 0 0 -4px;
		padding: 15px 25px;
		font-weight: 600;
		text-align: center;
		color: rgba(160, 160, 160, 1);
		border: 1px solid rgba(167, 167, 167, 1);
		border-top-left-radius: 6px;
		border-top-right-radius: 6px;
		background: rgba(175, 202, 202, 1); /* 변경 */
	
	}
	
	.Mlabel:hover {
	    color: rgba(59, 117, 117, 1); /* 변경 */
	    cursor: pointer;}
	
	/*input 클릭시, label 스타일*/
	.MinputBar:checked + .Mlabel {
		color: #555;
		border: 3px solid rgba(167, 167, 167, 1);
		/* border-top: 2px solid #2e9cdf; */
		border-bottom: 3px solid rgba(175, 202, 202, 1);  /* 변경 */
	}
	
	#Mtab1:checked ~ #Mcontent1,
	#Mtab2:checked ~ #Mcontent2,
	#Mtab3:checked ~ #Mcontent3 {
	    display: block;
	}
	
	
	#member_tb{
		height: 330px;
	}
	#member_tb th label{
		width: 180px;
		padding-right: 10%;
	}
	#member_tb th{
		text-align: right;	
	}
	#member_tb tr {
		margin-bottom: 10px;	
	}
</style>
</head>
<body>
			<input class="MinputBar" id="Mtab1" type="radio" name="Mtabs" checked> <!--디폴트 메뉴-->
            <label class="Mlabel" for="Mtab1">회원정보 수정</label>
        
            <input class="MinputBar" id="Mtab2" type="radio" name="Mtabs">
            <label class="Mlabel" for="Mtab2">멘토 신청</label>
        
            <input class="MinputBar" id="Mtab3" type="radio" name="Mtabs">
            <label class="Mlabel" for="Mtab3">탈퇴 하기</label>
     		
            <div class="MsectionDiv"  id="Mcontent1" style="text-align: center;">
            	<div style="margin-right:50px; width: 60%; margin-left: auto; margin-right: auto;">
            	<form>
	            	<label>이메일</label>
	            			<input type="text" id="memberEmail" name="memberEmail" readonly value="${loginUser.memberEmail }"><br>
	            		<label id="pwdlabel">비밀번호</label>
	            				<input type="password" id="memberPwd" name="memberPwd"><br>           				
	            			
	            		<label id="pwdchecklabel">변경할 비밀번호</label>
	            			<input type="password" id="pwdRevised" name="pwdRevised" readonly><br>
	            		
	            			<label id="pwdchecklabel2">변경할 비밀번호 확인</label>
	            			<input type="password" id="pwdRevisedCheck" name="pwdRevisedCheck" readonly><br>
	            			
	            		<label>닉네임</label> <input type="text" id="memberNickName" name="memberNickName" value="${loginUser.memberNickName }"><br>
	            		
	            		<label>이름</label><input type="text" id="memberEmail" name="memberEmail" readonly value="${loginUser.memberEmail }"><br>
	            		
	            		<label>성별</label><input type="radio" id="genderM" name="gender" value="M"><label for="genderM">남</label>
									   <input type="radio" id="genderF" name="gender" value="F"><label for="genderF">여</label><br>
									   
	            		<label>휴대전화 번호</label> 
	            			<input type="text" id="memberPhone" name="memberPhone" value="${loginUser.memberPhone }">
	            		
            	</form><br>            	
				</div>
				<button>수정하기</button> 
             </div>
             <script>
             	$(function(){
             		var genderChecked = "${loginUser.memberGender}"
             		
             		if(genderChecked == "M"){
             			$("#genderM").attr("checked",true);
             		}else{
             			$("#genderF").attr("checked",true);             			
             		}
             	})
             	
             	

             	$(function(){
             		
             		$("#memberPwd").keyup(function(){
             			var inputPwd = $(this).val();
             			alert(inputPwd);
             			/* if (!regexPwd.test(inputPwd)) {
             				alert("비밀번호를 정확히 입력하세요");
             			}else{
             				 */
             				$.ajax({
              					url:"pwdCheck.do",
              					type:"post",
              					data:{inputPwd:inputPwd},
              					success : function(data) {
              						if(data == "Y"){
        	      						$("#pwdRevised").attr("readonly",false);
        	      						$("#pwdRevisedCheck").attr("readonly",false);
              						}else{
              							alert("비밀번호가 틀립니다")
              						}
        			            },
        			            error : function(data) {  
        			               alert("code:"+request.status+"\n"+"error:"+error);
        			            }
              				})
             				
             			/* } */
             		})
             	/* 비밀번호 정규식 */
             		let regexPwd = /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-zA-Z]{1,}).{8,16}$/;
             		$("#pwdRevised").keyup(function(){
             			var pwd = $("#pwdRevised").val();
             			
             			if (!regexPwd.test($("#pwdRevised").val())) {
             					$("#pwdchecklabel").css("color","red");
             			}else{
             				$("#pwdchecklabel").css("color","green");
             				
             			}
             		})
             		$("#pwdRevisedCheck").keyup(function(){
             			
             			
             			if($("#pwdRevised").val() == $("#pwdRevisedCheck").val()){
             				$("#pwdchecklabel2").css("color","green");
             			}else{
             				$("#pwdchecklabel2").css("color","red");
             			}
             		})      		
             	})
             	</script>
        
            <div class="MsectionDiv"  id="Mcontent2">
                <span style="font-size: 25px;font-weight: 800;margin-right: 5%;">바난나킥</span><span>Lv.25</span>
                <p>tab menu2의 내용</p>
            </div>
        
            <div class="MsectionDiv"  id="Mcontent3" style="text-align: center;">
               <div id="pwdCheckDiv" style="margin-top:12%">
               
				<p>정말 탈퇴하시겠습니까?
				<p>탈퇴하기 위해서 계정의 비밀번호를 입력하십시오.
				<br>
				<br>
				<input type="password" name="pwd" id="pwd"required style="margin-right:3%;"><button onclick="pwdCheck();">입력</button>
               </div>
               <div id="testtest"  style="text-align:left; margin-left:5%; margin-top:2%; display:none;">
               		<h3>탈퇴 안내</h3>
               		<p style="font-size:12px;">회원 탈퇴를 신청하기 전에 안내사항을 꼭 확인해 주세요
               		<br>
               		<p style="    margin-bottom: 2px;">1.탈퇴 후 계정 복구나 재사용은 불가능합니다. 
               		<p style="font-size: 10px; color: red;">탈퇴 후에는 본인과 타인 모두 복구및 재사용이 불가능하오니 신중하게 선택해 주시기 바랍니다
               		<br>
               		<br>
               		<br>
               		<p>2.탈퇴 후 사용자의 개인적인 이용내역은 모두 삭제됩니다.
               		<br>
               		<br>
               		<br>
               		<p  style="    margin-bottom: 2px;">3.충전하신 포인트는 반환되지 않습니다.
               		<p style="font-size: 10px; color: red; margin-bottom: 2px;">탈퇴 전 환급하지 않은 포인트는 자동으로 반한되지 않습니다.
					<p  style="font-size: 10px;">포인트 정책에 따라 자동으로 환급되지 않으므로 탈퇴 전 반드시 환급신청을 해주시기 바랍니다.
					<br>
               		<br>
               		<br>
               		<br>
               		<div style="text-align:center">
               		
               		<input type="checkBox" id="agree" > <label for="agree"style="font-size:13px;">  안내사항을 모두 확인했으며, 이에 동의합니다.</label>
               		<br>
               		<button onclick="memberdel();">탈퇴하기</button>
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

</body>
</html>




