<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	border: 3px solid rgba(175, 202, 202, 1);
	height: 550px;
	/* 변경 */
	background: white;
	/* 		background: rgba(175, 202, 202, 1);  */
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
	border: 1px solid rgba(175, 202, 202, 1);
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
	/* 변경 */
	background: white;
	/* 		background: rgba(175, 202, 202, 1);  */
}

.Mlabel:hover {
	/* 변경 */
	color: rgba(59, 117, 117, 1);
	cursor: pointer;
}

/*input 클릭시, label 스타일*/
.MinputBar:checked+.Mlabel {
	color: #555;
	border: 3px solid rgba(175, 202, 202, 1);
	/* border-top: 2px solid #2e9cdf; */
	/* 변경 */
	border-bottom: 3px solid white;
	/* 		border-bottom: 3px solid rgba(175, 202, 202, 1);  */
}

#Mtab1:checked ~ #Mcontent1, #Mtab2:checked ~ #Mcontent2, #Mtab3:checked 
	~ #Mcontent3 {
	display: block;
}

#member_tb {
	height: 330px;
}

#member_tb th label {
	width: 180px;
	padding-right: 10%;
}

#member_tb th {
	text-align: right;
}

#member_tb tr {
	margin-bottom: 10px;
}

#memberupForm input {
	width: 50%;
}

.mLabel {
	text-align: right;
	width: 35%;
	margin-right: 2%;
}

.spacIconTd {
	width: 50px;
}


</style>
</head>
<body>
	<input class="MinputBar" id="Mtab1" type="radio" name="Mtabs" checked>
	<!--디폴트 메뉴-->
	<label class="Mlabel" for="Mtab1">회원정보 수정</label>

	<input class="MinputBar" id="Mtab2" type="radio" name="Mtabs">
	<label class="Mlabel" for="Mtab2">멘토 신청</label>

	<input class="MinputBar" id="Mtab3" type="radio" name="Mtabs">
	<label class="Mlabel" for="Mtab3">탈퇴 하기</label>

	<div class="MsectionDiv" id="Mcontent1" style="text-align: center;">
		<!-- 회원정보 수정-------회원정보 수정-------회원정보 수정-------회원정보 수정-------회원정보 수정--------회원정보 수정-----회원정보 수정---회원정보 수정--- -->
		<div
			style="margin-right: 50px; width: 65%; margin-left: 10%; margin-top: 5%; margin-right: auto;">

			<form id="memberupForm" action="memberup.do" method="get"
				onsubmit="return memberInfoSubmit()">
				<input type="hidden" name="memberNo" value="${loginUser.memberNo }">
				<label class="mLabel">이메일</label> <input type="text"
					id="memberEmail" name="memberEmail" readonly
					value="${loginUser.memberEmail }"><br> <label
					class="mLabel" id="pwdlabel">비밀번호</label> <input type="password"
					id="memberPwdBefor" name="memberPwdBefor"><br>
				<!-- PasswordErrorMsg -->
				<div
					style="width: 56%; float: right; text-align: left; height: 10%;">
					<p id="pwderror" style="font-size: 10px; margin: 0;">※비밀번호를
						변경하기 위하여 현재 비밀번호를 입력해주세요.</p>
				</div>
				<br clear="both"> <label class="mLabel" id="pwdchecklabel">변경할
					비밀번호</label> <input type="password" id="pwdRevised" name="pwdRevised"
					readonly><br>

				<!-- PasswordErrorMsg -->
				<div id="pwdCheckErrorDiv"
					style="width: 56%; float: right; text-align: left; display: none;">
					<p id="pwdCheckerror" style="font-size: 10px;"></p>
				</div>
				<br id="pwdCheckBr" style="width: 0; margin: 0; display: none;"
					clear="both"> <label class="mLabel" id="pwdchecklabel2">변경할
					비밀번호 확인</label> <input type="password" id="memberPwd" name="memberPwd"
					readonly><br>

				<!-- PasswordErrorMsg -->
				<div id="pwdCheckErrorDiv2"
					style="width: 56%; float: right; text-align: left; display: none;">
					<p id="pwdCheckerror2" style="font-size: 10px;"></p>
				</div>
				<br id="pwdCheckBr2" style="width: 0; margin: 0; display: none;"
					clear="both"> <label class="mLabel">닉네임</label> <input
					type="text" id="memberNickName" name="memberNickName"
					value="${loginUser.memberNickName }" required><br> <label
					class="mLabel">이름</label> <input type="text" id="memberName"
					name="memberName" value="${loginUser.memberName }"><br>


				<label class="mLabel">성별</label>
				<div style="width: 50%; margin: 0; float: right; text-align: left;">
					<input type="radio" id="genderM" name="memberGender" value="M"
						style="width: 5%;"><label for="genderM">남</label> <input
						type="radio" id="genderF" name="memberGender" value="F"
						style="width: 5%; margin-left: 20%;"><label for="genderF">여</label><br>
				</div>
				<br> <label class="mLabel">휴대전화 번호</label> <input type="text"
					id="memberPhone" name="memberPhone"
					value="${loginUser.memberPhone }"> <br> <br>
				<button>수정하기</button>

			</form>
			<br>
		</div>
	</div>
	<script>
             		var changeinfo="N";
             	$(function(){
             		var genderChecked = "${loginUser.memberGender}";
             		
             		if(genderChecked == "M"){
             			$("#genderM").attr("checked",true);
             		}else{
             			$("#genderF").attr("checked",true);             			
             		}
             		
             		
             		
             		if($("#pwdRevised").prop("readonly")){
             			
             			$("#pwdRevised").css("background","lightgray");
             			$("#memberPwd").css("background","lightgray");
             		}
             	})
             	
             	function memberInfoSubmit(){
             		
             		var memberGender = $("input[name=memberGender]:checked").val();
             		if(memberGender != "${loginUser.memberGender}"){
             			changeinfo="Y";
             		}
             		
         			alert(changeinfo);
             		if(changeinfo =="Y"){
             			var updateCheck = confirm("수정된 내용을 변경하겠습니까?");
             			if(updateCheck){             				
	             			
             				changeinfo="N";
	             			return true;
             			}else{
             				alert("변경을 취소하였습니다");
             				changeinfo = "N";
             				return false;
             			}
             		}else{
             			alert("수정된 내용이 없습니다.");
             			return false;
             		}
             	}

             	$(function(){
             		
             		$("#memberPwdBefor").keyup(function(){
             			var inputPwd = $(this).val();
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
              							$("#pwderror").text("비밀번호가 일치합니다").css("color","green");
        	      						$("#pwdRevised").attr("readonly",false);
        	      						$("#pwdRevised").css("background"," white");
        	      						
              						}else{
              							$("#pwderror").text("비밀번호가 다릅니다").css("color","red");
              							
              							
              						}
        			            },
        			            error : function(data) {  
        			               alert("code:"+request.status+"\n"+"error:"+error);
        			            }
              				})
             				
             			/* } *//* 이전 비밀번호 정규화 지켰는지 확인해줌 */
             			
             			$("input[name=memberGender]").change(function(){
             				
             			})
             			
             		})
             	/* 비밀번호 정규식 */
             		let regexPwd = /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-zA-Z]{1,}).{8,16}$/;
       
             		$("#pwdRevised").keyup(function(){
             			var pwd = $("#pwdRevised").val();
             			
             			if (!regexPwd.test($("#pwdRevised").val())) {
             					$("#pwdCheckBr").css("display","block");
             					$("#pwdCheckErrorDiv").css("display","block");             					
             					$("#pwdCheckerror").text("사용할 수 없는 비밀번호 입니다").css("color","red");
             			}
             			else if($("#memberPwdBefor").val() == $("#pwdRevised").val()){
             				alert("입력하신 비밀번호는 사용하시는 비밀번호와 같습니다");
             				$("#pwdRevised").val("");
             			}
             			else{
             				$("#pwdCheckBr").css("display","none");
         					$("#pwdCheckErrorDiv").css("display","none");   
      						$("#memberPwd").attr("readonly",false);
      						$("#memberPwd").css("background"," white");
      						
             				
             			}
             		})
             		
             		$("#memberPwd").keyup(function(){      
             			if($("#pwdRevised").val() == $("#memberPwd").val()){
             				$("#pwdCheckBr2").css("display","none");
         					$("#pwdCheckErrorDiv2").css("display","none");  
         					if($("#memberPwd").val() != $("#memberPwdBefor").val()){
                 				changeinfo="Y";
                 				alert("비번 변경됨"+changeinfo);
                 			}
             			}else{
             				$("#pwdCheckBr2").css("display","block");
         					$("#pwdCheckErrorDiv2").css("display","block");             					
         					$("#pwdCheckerror2").text("변경할 비밀번호와 일치하지 않습니다").css("color","red");
             			}
             			
	             	
             		})  
             		
             	
             	})
             	
             	
             	/* 닉네임 정규식 */
             	let regexNickName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*].{1,10}$/;
             	$("#memberNickName").keyup(function(){
             		
             		var memberNickName = $(this).val();
             		if (!regexNickName.test($("#memberNickName").val())) {
             				$("#memberNickName").css("color","red");
             		}else{
             			
             			$.ajax({
             				url:"nickNameDuplicateChk.do",
             				data:{memberNickName:memberNickName},
             			success:function(data){
    						if(data == "success"){
    							$("#memberNickName").css("color","green");
    							if($("#memberNickName").val() != "${loginUser.memberNickName}"){
    								changeinfo="Y";
    							}
    						} else {
    							$("#memberNickName").css("color","red");
    						}
             			},
    					error:function(request, status, errorData){
    						regiNickNamePass = false;
    						alert("error code: " + request.status + "\n"
    								+"message: " + request.responseText
    								+"error: " + errorData);
    					}
             				
             			})
             			
             		}
             		
             	})
             	
             	
             	let regexPhone = /^\d{10,11}$/;
             	$("#memberPhone").keyup(function(){
             	// 전화번호 - 제거
        			memberPhone = ($("#memberPhone").val()).replace(/-/gi,"");

        			if (!regexPhone.test(memberPhone)) {
        				$("#memberPhone").css("color","red");
        			} else {
        				$.ajax({
        					url:"phoneDuplicateChk.do",
        					data:{memberPhone:memberPhone},
        					success:function(data){
        						console.log("회원가입 전화번호 결과 : " + data);
        						if(data == "success"){
        							$("#memberPhone").css("color","green");
        							if($("#memberPhone").val() != "${loginUser.memberPhone}"){
        								changeinfo="Y";
        							}
        						} else {
        							$("#memberPhone").css("color","red");
        						}
        					},
        					error:function(request, status, errorData){
        						alert("error code: " + request.status + "\n"
        								+"message: " + request.responseText
        								+"error: " + errorData);
        					}
        				});
        			}
             	})
             	
             	
             	
             	
             	</script>

	<!-- 회원정보 수정-------회원정보 수정-------회원정보 수정-------회원정보 수정-------회원정보 수정--------회원정보 수정-----회원정보 수정---회원정보 수정--- -->

	<div class="MsectionDiv" id="Mcontent2">
		<div
			style="margin-right: 50px; width: 80%; margin-left: auto; margin-top: 5%; margin-right: auto;">
			<h4>멘토 신청</h4>
			<p style="font-size: 11px;">
				멘토 신청에 관한 설명 약관 어쩌구 신청할 경우 요금? <br>이 있고 신고 당할경우 다시 멘토신청 할 수 없고
				등등 <br>승인이 완료 될 때 까지 몇일이 걸린다~
			</p>
			<br> <br>
			<p>-스펙</p>
			<table id="ment"style="width: 80%; height: 50%;" >
				<tr>
					<td class="spacIconTd">이미지</td>
					<th style="width: 10%;">학교</th>
					<td id="schoolApply" style="width: 80px;">
					</td>
					<td class="schoolinput" style="width: 200px;">
						<form id="sForm" method="post" enctype="Multipart/form-data">
						<input type="hidden" id="specCName" name="specCName" value="SC00001"><br>
						<input type="hidden" id="memberNo" name="memberNo" value="${loginUser.memberNo }">
						<input type="text" id="specName" name="specName" placeholder="학교 이름을 입력하세요" required>
						<input type="file" id="SspecFileName" name="specFileName1" onchange="" accept=".gif, .jpg, .png" style="width: 30%"required>
						<button onclick="specFileClick('SspecFileName');">업로드</button>	
						</form>
					</td>
					
				</tr>
				
				<tr>
					<td class="spacIconTd">이미지</td>
					<th>자격증</th>
					<td id="certificateApply" style="width: 80px;"></td>
					
					<td class="certificateinput" style="width: 200px;">
						<form id="ceForm" method="post" enctype="Multipart/form-data">
							<input type="hidden" id="specCName" name="specCName" value="SC00002"><br>
							<input type="hidden" id="memberNo" name="memberNo" value="${loginUser.memberNo }">
							<input type="text" id="specName" name="specName" placeholder="자격증을 입력하세요" required>
							<input type="file" id="CespecFileName" name="specFileName1"accept=".gif, .jpg, .png" required style="width: 30%">
							<button onclick="specFileClick('CespecFileName');">업로드</button>
						</form>
					
					</td>
					
					
				</tr>
				<tr>
					<td class="spacIconTd">이미지</td>
					<th>경력</th>
					<td id="careerApply" style="width: 80px;" ></td>
					<td class="careerinput">
						<form>
							<input type="hidden" id="specCName" name="specCName" value="SC00003"><br>
							<input type="hidden" id="memberNo" name="memberNo" value="${loginUser.memberNo }">
							<input type="text" id="specName" name="specName" placeholder="경력을 입력하세요"required>
							<input type="file" id="CAspecFileName" name="specFileName1"accept=".gif, .jpg, .png" required style="width: 30%;">						
							<button onclick="specFileClick('CaspecFileName');">업로드</button>
						</form>
					</td>
					
				</tr>
			</table>
			<div style="text-align: center; margin-top:10%;">

				<input type="checkBox" id="agree"> <label for="agree"
					style="font-size: 13px;"> 안내사항을 모두 확인했으며, 이에 동의합니다.</label> <br>
				<button onclick="mentorApply();">신청하기</button>
			</div>
			
			
			<script>
				function specFileClick(type){
					
					var formData;
					
					switch (type) {
					case 'SspecFileName':
						
						formData = new FormData($('#sForm')[0]);
						break;
					case 'CespecFileName':
						formData = new FormData($('#ceForm')[0]);
						break;
					case 'CAspecFileName':
						break;

					default:
						break;
					}	
					

					$.ajax({
						type : 'POST',
						url : "mentorA.do",
						enctype : 'multipart/form-data', // 필수 
						data : formData, // 필수 
						processData : false, // 필수 
						contentType : false, // 필수 
						processData : false,
						contentType : false,
						success : function(data) {
							$(".MinputBar").attr("checked",false);
							alert($("#Mtab1").prop("checked"));
							$("#Mtab2").click();
						},
						error : function(data) {
							alert("code:" + request.status + "\n"
									+ "error:" + error);
						}
					});
					
					
					
				}
				$(function() {
					
					if ("${schoolList[0]}" == "") {
						$("#schoolApply").	text("인증하기").css("color", "red");
						

					} else {
						if ("${schoolconfirm[0]}" == "N") {
							$("#schoolApply").text("인증대기").css("color", "blue");
							$(".schoolinput").css("display", "none");
							

						} else {

							$("#schoolApply").text("인증완료").css("color", "green");
							$(".schoolinput").css("display", "none");
						}
					}
					if ("${certificateList[0]}" == "") {
						$("#certificateApply").text("인증하기").css("color", "red");

					} else {
						if ("${certificateconfirm[0]}" == "N") {
							$("#certificateApply").text("인증대기").css("color","blue");
							$(".certificateinput").css("display", "none");

						} else {

							$("#certificateApply").text("인증완료").css("color","green");
							$(".certificateinput").css("display", "none");
						}
					}
					if ("${careerList[0]}" == "") {
						$("#careerApply").text("인증하기").css("color", "red");
					
						
					} else {
						if ("${careerconfirm[0]}" == "N") {
							$("#careerApply").text("인증대기").css("color", "blue");
							$(".careerinput").css("display", "none");


						} else {

							$("#careerApply").text("인증완료").css("color", "green");
							$(".careerinput").css("display", "none");
						}

					}

				})
				function mentorApply() {

					if ($("#agree").is(":checked")) {

						var checked = confirm("신청하시겠습니까?");
						if (checked) {
							location.href = "mentorApply.do";
						} else {
							alert("취소하셨습니다.");
						}
					} else {
						alert("체크하세요");
					}
				}
			</script></div>
	</div>
	<!-- 탈퇴하기----------탈퇴하기----------탈퇴하기----------탈퇴하기----------탈퇴하기----------탈퇴하기----------탈퇴하기----------탈퇴하기------------>
	<div class="MsectionDiv" id="Mcontent3" style="text-align: center;">
		<div id="pwdCheckDiv" style="margin-top: 12%">

			<p>정말 탈퇴하시겠습니까?
			<p>
				탈퇴하기 위해서 계정의 비밀번호를 입력하십시오. <br> <br> <input
					type="password" name="pwd" id="pwd" required
					style="margin-right: 3%;">
				<button onclick="pwdCheck();">입력</button>
		</div>
		<div id="testtest"
			style="text-align: left; margin-left: 5%; margin-top: 2%; display: none;">
			<h3>탈퇴 안내</h3>
			<p style="font-size: 12px;">
				회원 탈퇴를 신청하기 전에 안내사항을 꼭 확인해 주세요 <br>
			<p style="margin-bottom: 2px;">1.탈퇴 후 계정 복구나 재사용은 불가능합니다.
			<p style="font-size: 10px; color: red;">
				탈퇴 후에는 본인과 타인 모두 복구및 재사용이 불가능하오니 신중하게 선택해 주시기 바랍니다 <br> <br>
				<br>
			<p>
				2.탈퇴 후 사용자의 개인적인 이용내역은 모두 삭제됩니다. <br> <br> <br>
			<p style="margin-bottom: 2px;">3.충전하신 포인트는 반환되지 않습니다.
			<p style="font-size: 10px; color: red; margin-bottom: 2px;">탈퇴 전
				환급하지 않은 포인트는 자동으로 반한되지 않습니다.
			<p style="font-size: 10px;">
				포인트 정책에 따라 자동으로 환급되지 않으므로 탈퇴 전 반드시 환급신청을 해주시기 바랍니다. <br> <br>
				<br> <br>
			<div style="text-align: center">

				<input type="checkBox" id="agree"> <label for="agree"
					style="font-size: 13px;"> 안내사항을 모두 확인했으며, 이에 동의합니다.</label> <br>
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
	<!-- 탈퇴하기----------탈퇴하기----------탈퇴하기----------탈퇴하기----------탈퇴하기----------탈퇴하기----------탈퇴하기----------탈퇴하기------------>
</body>
</html>




