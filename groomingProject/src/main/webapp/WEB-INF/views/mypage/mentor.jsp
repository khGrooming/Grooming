<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#content {
	width: 75%;
	height: 1000px;
	margin: 3% auto;
}
</style>
<body>
<jsp:include page="./mypageinfo.jsp" /> 
<div id="content">
<div style="width: 65%; margin-right: auto; margin-left: auto;">
	<c:if test="${mentor eq 'F' }">
	<div class="MsectionDiv" id="Mcontent2">
		<div
			style="margin-right: 50px; width: 100%; margin-left: auto; margin-top: 5%; margin-right: auto;">
			<h4>멘토 신청</h4>
			<p style="font-size: 13px;">
				멘토 신청에 관한 설명 약관 어쩌구 신청할 경우 요금? <br>이 있고 신고 당할경우 다시 멘토신청 할 수 없고
				등등 <br>승인이 완료 될 때 까지 몇일이 걸린다~
			</p>
			<br> <br>
			<p>-스펙</p>
			<table id="ment"style="width: 80%;" >
				<tr>
					<td class="spacIconTd" style="width: 50px;">이미지</td>
					<th style="width: 50px;">학교</th>
					<td id="schoolApply" style="width: 80px;">
					</td>
					
					<td class="schoolinput" style="width: 200px;">
						<form id="sForm" method="post" enctype="Multipart/form-data" >
						<input type="hidden" id="specCName" name="specCName" value="SC00001" style="display: none;">
						<input type="hidden" id="memberNo" name="memberNo" value="${loginUser.memberNo }" style="display: none;">
						
						<input type="text" id="specName" name="specName" placeholder="학교 이름을 입력하세요" required>
						<input type="file" id="SspecFileName" name="specFileName1" onchange="" accept=".gif, .jpg, .png" style="width: 30%"required>
						<button onclick="specFileClick('SspecFileName');">업로드</button>	
						</form>
					</td>
					
				</tr>
				
				<tr>
					<td class="spacIconTd">이미지</td>
					<th>자격증</th>
					<td id="certificateApply">
					</td>
					
					<td class="certificateinput" >
							<form id="ceForm" method="post" enctype="Multipart/form-data">
							<input type="hidden" id="specCName" name="specCName" value="SC00002">
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
					<td id="careerApply" ></td>
					
					<td class="careerinput">
						
							<form id="caForm" method="post" enctype="Multipart/form-data">
							<input type="hidden" id="specCName" name="specCName" value="SC00003">
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
					case 'CaspecFileName':
						formData = new FormData($('#caForm')[0]);
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
							if(("${schoolconfirm[0]}" != "")&&("${certificateList[0]}" != "")&&("${careerconfirm[0]}" != "")){
								
								alert("신청이 완료되었습니다.");
								location.href = "mentorApply.do"; 
							}else{
								alert("스펙을 등록해야 합니다.")
							}
							
						} else {
							alert("취소하셨습니다.");
						}
					} else {
						alert("체크하세요");
					}         
				}
			</script></div></div>
			</c:if>
			<c:if test="${mentor eq 'N' }">
				<div style="width: 100%; text-align: center; margin-top: 20%">
				<h3>심사중입니다.</h3>
				</div>
			</c:if>
			<c:if test="${mentor eq 'Y' }">
			<div style="width: 100%; text-align: center; margin-top: 20%">
				<h3>이미 멘토입니다.</h3>
				</div>
			</c:if>
	</div>
	</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>