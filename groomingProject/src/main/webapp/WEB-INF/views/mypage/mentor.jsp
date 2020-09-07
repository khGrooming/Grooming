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
	width: 1050px;
	height: 1000px;
	margin: 0 auto;
}
.subcontent {
	width:450px;
	position: relative;
	float: left;
	height : 550px;
	margin: 0 auto;
	border: 1px solid lightgray;
	padding: 5%;
	border-radius: 20px;
}
.subTitle{
	position: absolute; 
	top:-10px; 
	background: white;
	width: 150px;
	text-align: center;
}
#ment tr{
	height: 100px;
}
</style>
<body>
<jsp:include page="./mypageinfo.jsp" /> 
<div id="content">
	
<div class="subcontent">
	<h4 class="subTitle">안내사항</h4>
	<div class="MsectionDiv" id="Mcontent2">
		
			
			<p style="font-size: 13px;">
				<ol>
					<li>멘토 신청 방법<br>
						<p>멘토를 신청하기 위해서는 학교, 자격증, 경력인증이 반드시 필요합니다.<br>
						스펙을 등록한 후 신청하기 버튼을 클릭하여 멘토를 신청할 수 있습니다.</p>
					</li>
					<li>스펙 등록 방법<br>
						<p>스펙을 명칭할 수 있는 이름을 반드시 작성하여야 합니다.<br>
						스펙을 인증할 수 있는 서류가 반드시 필요합니다.</p>
											
					</li>
					<li>스펙 인증<br>
						<p>스펙을 등록하신 후 인증이 완료되면 다른 이용자에게 자신이 보입니다.</p>
						<p>
						<span style="color:red;">인증 하기</span>: 등록되어 있지 않은 스펙입니다.<br>
						<span style="color:blue;">인증 대기</span>: 자신 외에는 보이지 않습니다.<br>
						<span style="color:green;">인증 완료</span>: 다른 이용자도 확인 가능합니다.<br>
						<span style="color:gray;">인증 실패</span>: 자동으로 스펙이 사라집니다.<br>
						</p>
					
					</li>
				
				</ol>
			</div>
		</div>
			<div class="subcontent" style="padding: 2%;  width: 550px; margin-left: 2%;">
			
			<h4 class="subTitle">멘토 신청</h4>
			<c:if test="${mentor eq 'F' }">
			<br>
			<h5>스펙 등록</h5>
			<table id="ment" >
				<tr>
					
					<th style="width: 50px;">학교</th>
					<td id="schoolApply" style="width: 80px;">
					</td>
					
					<td class="schoolinput" style="width: 200px;">
						<form id="sForm" method="post" enctype="Multipart/form-data" >
						<input type="hidden" id="specCName" name="specCName" value="SC00001" style="display: none;">
						<input type="hidden" id="memberNo" name="memberNo" value="${loginUser.memberNo }" style="display: none;">
						
						<input type="text" id="specName" name="specName" placeholder="학교 이름을 입력하세요" required>
						<input type="file" id="SspecFileName" name="specFileName1" onchange="" accept=".gif, .jpg, .png" style="width: 40%"required>
						<button onclick="specFileClick('SspecFileName');">업로드</button>	
						</form>
					</td>
					
				</tr>
				
				<tr>
					<th>자격증</th>
					<td id="certificateApply">
					</td>
					
					<td class="certificateinput" >
							<form id="ceForm" method="post" enctype="Multipart/form-data">
							<input type="hidden" id="specCName" name="specCName" value="SC00002">
							<input type="hidden" id="memberNo" name="memberNo" value="${loginUser.memberNo }">
							<input type="text" id="specName" name="specName" placeholder="자격증을 입력하세요" required>
							<input type="file" id="CespecFileName" name="specFileName1"accept=".gif, .jpg, .png" required style="width: 40%">
							<button onclick="specFileClick('CespecFileName');">업로드</button>
						
					
					</form>
					</td>
					
				</tr>
				<tr>
					<th>경력</th>
					<td id="careerApply" ></td>
					
					<td class="careerinput">
						
							<form id="caForm" method="post" enctype="Multipart/form-data">
							<input type="hidden" id="specCName" name="specCName" value="SC00003">
							<input type="hidden" id="memberNo" name="memberNo" value="${loginUser.memberNo }">
							
							<input type="text" id="specName" name="specName" placeholder="경력을 입력하세요"required>
							<input type="file" id="CAspecFileName" name="specFileName1"accept=".gif, .jpg, .png" required style="width: 40%;">						
							<button onclick="specFileClick('CaspecFileName');">업로드</button>
						
					</form>
					</td>
				</tr>
			</table>
			<div style="width:100%; text-align: center; bottom: 3%; position: absolute; ">

				<input type="checkBox" id="agree"> <label for="agree"
					style="font-size: 13px;"> 안내사항을 모두 확인했으며, 이에 동의합니다.</label> <br>
				<button onclick="mentorApply();" style=" width:50%;height:40px; border-radius:10px;">신청하기</button>
			</div>
			</c:if>
			
			
			
			<c:if test="${mentor eq 'S' }">
				<div style="width: 100%; text-align: center; margin-top: 20%">
				<img src='${contextPath }/resources/views/images/nomentor.jpg' width="200px"><br><br>
				<h3>심사중입니다.</h3>
				</div>
			</c:if>
			<c:if test="${mentor eq 'Y' }">
			<div style="width: 100%; text-align: center; margin-top: 20%">
				<img src='${contextPath }/resources/views/images/mentor.jpg' width="200px"><br><br>
				<h3>이미 멘토입니다.</h3>
				</div>
			</c:if>
			<c:if test="${mentor eq 'N' }">
			<div style="width: 100%; text-align: center; margin-top: 20%">
				<img src='${contextPath }/resources/views/images/outmemtor.jpg' width="200px"><br><br>
				<h3>멘토 신청에 탈락하셨습니다.</h3>
				</div>
			</c:if>
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
							location.reload();
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
			</script>
			
		
			
		</div>
	
<jsp:include page="../common/footer.jsp" />
</body>
</html>