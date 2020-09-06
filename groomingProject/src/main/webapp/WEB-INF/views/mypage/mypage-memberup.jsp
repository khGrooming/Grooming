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
#content {
	width: 1100px;
	margin: 0 auto;
	
	height: 800px;
}




.spacIconTd {
	width: 50px;
}
.subcontent {
	position: relative;
	width: 48%;
	height : 650px;
	float: left;
	margin-right: 2%;
	border: 1px solid lightgray;
	padding: 3%;
	border-radius: 20px;
}
.subTitle{
position: absolute; 
top:-10px; 
background: white;
width: 150px;
text-align: center;
}
.profile_my {
	position: relative;
	margin-top: 3%;
	width: 30%;
	float: left;
}
.profile_img {
	width: 125px;
	height: 125px;
	border-radius: 50%;
	position: absolute;
}
#expBox {
	position: relative;
	width: 75%;
	height: 15px;
	margin-top: 1%;
	margin-bottom: 3%;
	border: 1px solid gray;
	text-align: center;
}

#expBar {
	width: 25%;
	height: 13px;
	background-color: yellow;
	position: absolute;
}

#memo {
	width: 100%;
	height: 100px;
}

#memoTextArea {
	width: 100%;
	height: 50px;
	font-size: 12px;
}

.sstitle{
font-size: 20px; 
font-weight: 900; 
margin-bottom: 5px; 
}

#specTb{
	width: 100%;
}

#specTb tr{
	text-align: center;
	font-size: 20px;
} 
#specTb th{
font-size: 20px;
}
#specTb td{
font-size: 14px;
}
#memberInfoTb{
    border-collapse: separate;
    border-spacing: 0 10px;
}
#memberInfoTb tr > td:first-child {
	text-align: right;
	font-size:15px;

}
.infoInput{
	width: 100%;
	border-radius: 7px;
}

#fileView {
	width: 155px;
	height: 155px;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid gray;
}

#profileFile{
	width: 200px;
	height: 200px;
	margin: 0 auto;
	border: 1px solid gray;
}
</style>
</head>
<body>
<jsp:include page="./mypageinfo.jsp" />
	<div id="content">
		<div class="subcontent">
			<c:url var="profilePage" value="profilePage.do">
	         <c:param name="pfMemberNo" value="${loginUser.memberNo }" />
	      </c:url>
			<h4 class="subTitle" onclick="location.href='${profilePage}'">프로필 수정</h4>
			<div class="profile_my">
				<!--toEJ 클릭하면 모달창 띄우고 사진편집할 수 있으면 넣고 못하면 미리보기로 대체 모달창에서 프로필사진 등록/삭제로 해서 고치셈 -->
				
				<img src='${contextPath }/resources/views/icons/profileIcon.png'   style="height:130px; z-index: 3;"class="profile_img" data-toggle="modal" data-target="#mtProfile">
				<img src="${contextPath}/resources/upprofileFiles/${profileInfo.memberPhoto }" class="profile_img" id="profileImg">	
				<div class="modal fade" id="mtProfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">

								<h4 class="modal-title" id="myModalLabel">프로필 사진 변경</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
						<form id="testForm" action="upproimg.do" method="post" enctype="multipart/form-data">
							<div class="modal-body">
								
								<div id="profileFile" style="position: relative;">
									<img src='${contextPath }/resources/views/images/testProfile.png' id="profileImgIcon2" width="200px" style="z-index: 3; position: absolute;" >
									<img src="${contextPath}/resources/upprofileFiles/${profileInfo.memberPhoto }" style="position: absolute; width: 200px; height: 200px;" id="profileView">	
									
								</div>
										<input type="hidden" name="memberPhoto" id="memberPhoto" value="${profileInfo.memberPhoto }">
										<input type="hidden" name="memberNo" id="memberNo" value="${profileInfo.memberNo}"> 
										<input type="file" accept=".gif, .jpg, .png" name="profileFile" id="profileFile0" style="display: none;" onchange="test2();">
								<br>
							
								<button type="button" onclick="srcReset();" style="width: 200px; height: 50px;  border-radius: 10px; margin-left:30%;">프로필 삭제하기</button>
							
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">확인</button>
								<button type="button" id="btn-delete" class="btn btn-default" data-dismiss="modal">취소</button>
							</div>
							</form>
						</div>
					</div>
				</div>	
								
				<script>
				/*이미지 클릭해도 파일첨부 뜨도록  */
				$(function(){
					$("#profileImgIcon2").on("click",function(){
						$("#profileFile0").click();
						
					})
				})
				function resetInputFile($input, $preview) {
						var agent = navigator.userAgent.toLowerCase();
						if ((navigator.appName == 'Netscape' && navigator.userAgent
								.search('Trident') != -1)
								|| (agent.indexOf("msie") != -1)) {
							// ie 일때
							$input.replaceWith($input.clone(true));
							$preview.empty();
						} else {
							//other
							$input.val("");
							$preview.empty();
						}
					}


							// 등록 이미지 등록 미리보기
							function readInputFile1(input) {
								if (input.files && input.files[0]) {
									var reader = new FileReader();
									reader.onload = function(e) {
										$('#profileView').attr("src",e.target.result);
									}
									reader.readAsDataURL(input.files[0]);
								}
							}
							$("#profileFile0").on('change', function() {
								readInputFile1(this);
							});
					function profilechange(){
						var formData = new FormData($('#testForm')[0]);
						$.ajax({
							type : 'POST',
							url : "upproimg.do",
							enctype : 'multipart/form-data', // 필수 
							data : formData, // 필수 
							processData : false, // 필수 
							contentType : false, // 필수 
							processData : false,
							contentType : false,
							success : function(data) {
								alert(data);
								$("#profileImg").attr(
										"src",
										"${contextPath}/resources/upprofileFiles/"
												+ data);
								$("memberPhoto").val(data);
							},
							error : function(data) {
								alert("code:" + request.status + "\n"
										+ "error:" + error);
							}
						});
						
					}
					
					/* 프로필사진 삭제하기 */
					function srcReset(){
						$("#profileView").attr("src","${contextPath}/resources/upprofileFiles/MEMBER_SAMPLE_IMG.JPG");
					}
					
				</script>
			</div>
			<br>
			<br>
			<div style="margin-left:35%">
				<c:if test="${mentor eq 'Y' }">
				<span><img src='${contextPath }/resources/views/icons/mentorIcon.png' style="width: 25px;margin-bottom: 10px;"></span>&nbsp;
				</c:if>		
				<span style="font-size: 25px; font-weight: 800; margin-right: 2%;">${profileInfo.memberNickName}</span>
				<span>&nbsp;&nbsp;</span> <span style="font-size: 15px; color: darkgray">Lv.${profileInfo.lvl }</span>
				<br>
				<div id="expBox">
				<div style="font-size: 10px; position: absolute; z-index: 100; margin-left:35%"> ${profileInfo.memberExp } / ${profileInfo.lvlMaxExp }</div>
				<div id="expBar"></div>
				<script>
					$(function() {
						var maxExp = "${profileInfo.lvlMaxExp }";
						var memberExp = "${profileInfo.memberExp }";
						var empPercent = 2;
						empPercent = (100 / maxExp) * memberExp;
						if (empPercent < 5) {
							/* 5%보다 작을경우 화면에 표시되는게 너무 작아서 눈에 쉽게 보이지 않음 */
							$("#expBar").css("width", "5%");
						} else {
							$("#expBar").css("width", empPercent + "%");
						}

					})
				</script>
				</div>
				<p id="MemberEmail" style="color: rgba(120, 120, 120, 1); letter-spacing: 0.3em">${profileInfo.memberEmail }</p>
			</div>
			<br clear="both">
			<div id="memo" style="position: relative;">
				<p class="sstitle">상태메시지</p>
				<textarea id="memoTextArea" style="letter-spacing: 0.3em" maxlength="100"><c:if test="${profileInfo.memberMemo ne 'NULL' }">${profileInfo.memberMemo}</c:if></textarea>
				<span id="counter" style="position: absolute; top: 70%; left: 90%;">###</span>
				<script>
						$(function() {
							var content = $("#memoTextArea").val();
							$('#counter').html(content.length + '/100');
							$('#memoTextArea').keyup(function(e) {
								content = $(this).val();
								$('#counter').html(content.length + '/100');
							});
							$('#content').keyup();
							$('#memoTextArea').change(
									function() {
										alert(content);
										var save = confirm("상태메시지를 저장하시겠습니까?");
										if (save) {
											$.ajax({
												url : "upMemo.do",
												type : "post",
												data : {memberMemo : $(this).val()},
												success : function(data) {
													alert("변경되었습니다");
												},
												error : function(data) {
													alert("code:"+ request.status+ "\n"
															+ "error:"+ error);
												}

											})
										} else {
											alert("취소하였습니다");
											if ("${profileInfo.memberMemo}" == "NULL") {
												$('#memoTextArea').val("");
											} else {
												$('#memoTextArea').val("${profileInfo.memberMemo}");
											}
										}

									})

						});
					</script>
			</div>
			<div style="margin-top: 2%;">
				<p class="sstitle" >G포인트</p>
				<p style="font-size: 30px; font-weight: bold; margin-bottom: auto; height: 50px; letter-spacing: 0.3em;">${profileInfo.nowPoint } G</p>
			</div>

			<br clear="both">
			<div>
				<p class="sstitle">스펙</p>
					<div class="grayBox" style="padding:2%;">
						<table id="specTb">
							<tr>
								<th valign=top style="width: 35%;">학교</th>
								<th valign=top style="width: 35%;">자격증</th>
								<th valign=top style="width: 35%;">경력</th>
							</tr>
							<tr>
								<td class="specTd" id="school0"></td>
								<td class="specTd" id="certificate0"></td>
								<td class="specTd" id="career0"></td>
							
							</tr>
							<tr>
								<td class="specTd" id="school1"></td>
								<td class="specTd" id="certificate1"></td>
								<td class="specTd" id="career1"></td>
							</tr>
							
							<tr>
								<td class="specTd" id="school2"></td>
								<td class="specTd" id="certificate2"></td>
								<td class="specTd" id="career2"></td>
							</tr>
						</table>
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">

												<h4 class="modal-title" id="myModalLabel">모달 타이틀</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
											</div>
												<form id="modelForm" action="insertSpec.do" method="post" enctype="Multipart/form-data">
											<div class="modal-body">
												<p>파일 미리보기</p>
												<div id="fileView"></div>
													<input type="hidden" id="specCName" name="specCName"><br>
													<input type="hidden" id="memberNo" name="memberNo"	value="${loginUser.memberNo }"><br>
													<table style="width: 300px; text-align: left; margin-left:auto; margin-right: auto;">
														<tr>
															<td style="width: 150px;"><label id="specNameLable"></label></td>
															<td style="width: 250px;"><input type="text"
																id="specName" name="specName" required></td>
														</tr>
														<tr>
															<td><label id="specFileNameLable">파일첨부</label></td>
															<td><input type="file" accept=".gif, .jpg, .png" id="specFileName" name="specFileName1" style="width: 100%;" required onchange="setThumbnail(event);" /></td>
														<tr>
													</table>
													<br>
												
													
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-primary">확인</button>
												<button type="button" id="btn-delete"
													class="btn btn-default" data-dismiss="modal">취소</button>
											</div>
											</form>
										</div>
									</div>
								</div>
								
						<script>
							function resetInputFile($input, $preview) {
								var agent = navigator.userAgent.toLowerCase();
								if ((navigator.appName == 'Netscape' && navigator.userAgent
										.search('Trident') != -1)
										|| (agent.indexOf("msie") != -1)) {
									// ie 일때
									$input.replaceWith($input.clone(true));
									$preview.empty();
								} else {
									//other
									$input.val("");
									$preview.empty();
								}
							}

							$("#btn-delete").click(function(event) {
								var $input = $("#specFileName");
								var $preview = $('#fileView');
								resetInputFile($input, $preview);
							});

							// 등록 이미지 등록 미리보기
							function readInputFile(input) {
								if (input.files && input.files[0]) {
									var reader = new FileReader();
									reader.onload = function(e) {
										$('#fileView')
												.html(
														"<img src="+ e.target.result +" style='width:150px; height:150px; margin-left:auto; margin-right:auto;'>");
									}
									reader.readAsDataURL(input.files[0]);
								}
							}

							$("#specFileName").on('change', function() {
								readInputFile(this);
							});

							$(function() {
								var $tdId;
								var school = new Array();
								var schoolCon = new Array();
								school[0] = "${schoolList[0]}";
								school[1] = "${schoolList[1]}";
								school[2] = "${schoolList[2]}";
								schoolCon[0] = "${schoolconfirm[0]}";
								schoolCon[1] = "${schoolconfirm[1]}";
								schoolCon[2] = "${schoolconfirm[2]}";
								/* $tdId=$("#school1");
								$tdId.text(school[0]); */
								for (var i = 0; i < school.length; i++) {
									var $tdId;
									switch (i) {
									case 0:
										$tdId = $("#school0");
										break;
									case 1:
										$tdId = $("#school1");
										break;
									case 2:
										$tdId = $("#school2");
										break;

									default:
										break;
									}
									if (school[i] != "") {
										if(schoolCon[i] == "N"){
											
											$tdId.text(school[i]).css("color","lightgrey");
										}else{
											$tdId.text(school[i]).css("color","black");
										}
									} else {
										
										$tdId.attr("valign", "top"); 
										$tdId
												.html("<img src='${contextPath }/resources/views/icons/plusIcon.png'"
                    							 +"style='width:15px; text-align:top;'>");
										$tdId.attr("data-toggle", "modal");
										$tdId.attr("data-target", "#myModal");

										$tdId.on("click", function() {
											$("#myModalLabel").text("학교 추가");
											$("#specCName").val("SC00001");
											$("#specNameLable").text("학교 이름");
										})
										break;
									}

								}

								var certificate = new Array();
								var certificateconfirm = new Array();
								certificate[0] = "${certificateList[0]}";
								certificate[1] = "${certificateList[1]}";
								certificate[2] = "${certificateList[2]}";
								certificateconfirm[0] = "${certificateconfirm[0]}";
								certificateconfirm[1] = "${certificateconfirm[1]}";
								certificateconfirm[2] = "${certificateconfirm[2]}";

								for (var i = 0; i < certificate.length; i++) {
									var $tdId;
									switch (i) {
									case 0:
										$tdId = $("#certificate0");
										break;
									case 1:
										$tdId = $("#certificate1");
										break;
									case 2:
										$tdId = $("#certificate2");
										break;

									default:
										break;
									}
									if (certificate[i] != "") {
										if(certificateconfirm[i] == "N"){
											
											$tdId.text(certificate[i]).css("color","lightgrey");
										}else{
											$tdId.text(certificate[i]).css("color","black");
										}
									} else {
										$tdId.attr("valign", "top");
										$tdId
												.html("<img src='${contextPath }/resources/views/icons/plusIcon.png'"
                    							 +"style='width:15px; text-align:top;'>");
										$tdId.attr("data-toggle", "modal");
										$tdId.attr("data-target", "#myModal");

										$tdId.on("click", function() {
											$("#myModalLabel").text("자격증 추가");
											$("#specCName").val("SC00002");
											$("#specNameLable").text("자격증 이름");
										})
										break;
									}

								}

								var career = new Array();
								var careerconfirm = new Array();
								career[0] = "${careerList[0]}";
								career[1] = "${careerList[1]}";
								career[2] = "${careerList[2]}";
								careerconfirm[0] = "${careerconfirm[0]}";
								careerconfirm[1] = "${careerconfirm[1]}";
								careerconfirm[2] = "${careerconfirm[2]}";

								for (var i = 0; i < career.length; i++) {
									var $tdId;
									switch (i) {
									case 0:
										$tdId = $("#career0");
										break;
									case 1:
										$tdId = $("#career1");
										break;
									case 2:
										$tdId = $("#career2");
										break;

									default:
										break;
									}
									if (career[i] != "") {
										if(certificateconfirm[i] == "N"){
											
											$tdId.text(career[i]).css("color","lightgrey");
										}else{
											$tdId.text(career[i]).css("color","black");
										}
									} else {
										$tdId.attr("valign", "top");
										$tdId
												.html("<img src='${contextPath }/resources/views/icons/plusIcon.png'"
                    							 +"style='width:15px; text-align:top;'>");
										$tdId.attr("data-toggle", "modal");
										$tdId.attr("data-target", "#myModal");

										$tdId.on("click", function() {
											$("#myModalLabel").text("경력추가");
											$("#specCName").val("SC00003");
											$("#specNameLable").text("경력 작성");
										})
										break;
									}

								}

							})
						</script>
					</div>	
					
			</div>		
		</div>
		
		
		
		
		<div class="subcontent">
			<h4 class="subTitle">개인정보 수정</h4>
			<br>
			<br>
			<form id="memberupForm" action="memberup.do" method="get" onsubmit="return memberInfoSubmit()">
				<input type="hidden" name="memberNo" value="${loginUser.memberNo }">
				<table id="memberInfoTb"style="width: 100%">
					<tr>
						<td style="width: 30%;" valign="middle">이메일</td>
						<td style="width: 5%;"></td>
						<td><input type="text" class="infoInput" id="memberEmail" name="memberEmail" readonly value="${loginUser.memberEmail }"></td>
					</tr>
					<tr>
						<td style="width: 30%;" valign="middle">비밀번호</td>
						<td style="width: 5%;"></td>
						<td><input type="password"  class="infoInput" id="memberPwdBefor" name="memberPwdBefor"></td>
					</tr>
					<tr>
						<td style="width: 30%;" valign="middle"></td>
						<td style="width: 5%;"></td>
						<td><p id="pwderror" style="font-size: 11px;">※비밀번호를 변경하기 위하여 현재 비밀번호를 입력해주세요</p></td>
					</tr>
					<tr>
						<td style="width: 30%;" valign="middle">변경할 비밀번호</td>
						<td style="width: 5%;"></td>
						<td><input type="password"  class="infoInput" id="pwdRevised" name="pwdRevised" readonly></td>
					</tr>
					<!-- PasswordErrorMsg -->
					<tr>
						<td style="width: 30%;" valign="middle"></td>
						<td style="width: 5%;"></td>
						<td><p id="pwdCheckerror"style="font-size: 11px;"></p></td>
					</tr>
					<tr>
						<td style="width: 30%;" valign="middle">변경할 비밀번호 확인</td>
						<td style="width: 5%;"></td>
						<td><input type="password"  class="infoInput" id="memberPwd" name="memberPwd" readonly></td>
					</tr>
					<!-- PasswordErrorMsg -->
					<tr>
						<td style="width: 30%;" valign="middle"></td>
						<td style="width: 5%;"></td>
						<td><p id="pwdCheckerror2" style="font-size: 11px;"></p></td>
					</tr>
					<tr>
						<td style="width: 30%;" valign="middle">닉네임</td>
						<td style="width: 5%;"></td>
						<td><input type="text" class="infoInput" id="memberNickName" name="memberNickName" value="${loginUser.memberNickName }" required></td>
					</tr>
					<tr>
						<td style="width: 30%;" valign="middle">이름</td>
						<td style="width: 5%;"></td>
						<td><input type="text"  class="infoInput" id="memberName" name="memberName" value="${loginUser.memberName }"></td>
					</tr>
					<tr>
						<td style="width: 30%;" valign="middle">성별</td>
						<td style="width: 5%;"></td>
						<td style="padding-top:5px; height: 30px;" valign="middle"><input type="radio" id="genderM" name="memberGender" value="M" style="width: 5%;"><label for="genderM">남</label>
											<input	type="radio" id="genderF" name="memberGender" value="F"	style="width: 5%; margin-left:15%;"><label for="genderF">여</label></td>
					</tr>
				
					<tr>
						<td style="width: 30%;" valign="middle">휴대전화 번호</td>
						<td style="width: 5%;"></td>
						<td><input type="text"  class="infoInput" id="memberPhone" name="memberPhone" value="${loginUser.memberPhone }"></td>
					</tr>
					<tr>
						
						<td colspan="3" style="text-align: center; padding:10%;"><button style=" width:50%;height:40px; border-radius:10px; margin: 0 auto;">수정하기</button></td>
					</tr>
				
				</table>

			</form>
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
             				$("#pwdCheckerror").text("사용 가능한 비밀번호 입니다").css("color","green");
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
                 				$("#pwdCheckerror2").text("");
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
	
	
	</div>

<jsp:include page="../common/footer.jsp" />	

</body>
</html>




