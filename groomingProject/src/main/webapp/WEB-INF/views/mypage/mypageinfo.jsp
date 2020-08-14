<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css"
	integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX"
	crossorigin="anonymous">

<%-- <link href="${pageContext.servletContext.contextPath }/resources/views/css/memberLoginRegistration.css" rel="stylesheet"> --%>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	/* box-sizind: border-box; */
}

section {
	position: relative;
	min-height: 91vh;
	/* background: #fee648; */
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

#profileImg {
	cursor: Pointer;
}

#content_my {
	margin-right: auto;
	margin-left: 5%;
}

.subContent_my {
	height: 100%;
	float: left;
}

.profile_my {
	margin-top: 10%;
	height: 110px;
}

#memo {
	width: 75%;
	margin-left: auto;
	margin-right: auto;
	height: 100px;
}

#memoTextArea {
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	height: 90px;
	font-size: 12px;
}

#expBox {
	width: 75%;
	height: 15px;
	margin-top: 1%;
	margin-left: auto;
	margin-right: auto;
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

.profile_img {
	width: 100px;
	transform: translate(-50%);
	height: 100px;
	border-radius: 50%;
	position: absolute;
}

.grayBox {
	height: 50px;
	border: 1px solid lightgray;
	border-radius: 12px;
}

#counter {
	float: right;
	margin-bottom: 0.5em;
	background: rgba(224, 224, 224, 1);
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
}

.submenu {
	display: inline-block;
	/* background:yellowgreen; */
	font-size: 15px;
	text-align: center;
	line-height: 50px;
	width: 10%;
	height: 50px;
	margin-left: 5%;
	margin-right: 5%;
}

.submenu a {
	color: black;
	text-decoration: none
}

.a {
	display: none;
}

.specTd {
	font-size: 12px;
	white-space: pre;
}


.modelForm{
	width: 150px;
	height: 150px; 
	border: 1px solid black; 
	margin-left: auto; 
	margin-right: auto;

}
</style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />
	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath }" scope="application" />
	<section>
		<c:if test="${!empty profileInfo }">
			<!-- 프로필 정보 div -->
			<div class="signup form_container active"
				style="width: 100%; margin-top: 10%; margin-bottom: 10%">
				<!-- active toggle -->
				<div class="subContent_my"
					style="width: 25%; margin-right: 1%; text-align: center;">


					<!-- 프로필 사진 div -->
					<div class="profile_my" style="position: relative;">
						<img src="icon.png" class="profile_img"> <img
							src="${contextPath}/resources/upprofileFiles/${profileInfo.memberPhoto }"
							id="profileImg" class="profile_img"
							style="border: 3px solid gray;" onclick="prpfileChange()">

						<form id="testForm" action="test1.do" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="memberPhoto" id="memberPhoto"
								value="${profileInfo.memberPhoto }"> <input
								type="hidden" name="memberNo" id="memberNo"
								value="${profileInfo.memberNo}"> <input type="file"
								name="profileFile" id="profileFile" style="display: none;"
								onchange="test2();">
						</form>

					</div>
					<!-- 프로필 사진 div_end -->


					<!-- 닉네임/ 레벨 영역-->
					<span style="font-size: 25px; font-weight: 800; margin-right: 2%;">${profileInfo.memberNickName}</span>
					<span>&nbsp;&nbsp;</span> <span
						style="font-size: 15px; color: darkgray">Lv.${profileInfo.lvl }</span>
					<!-- 레벨에 대한 설명을 보여줄 툴팁 추가해야함!!! -->
					<br>

					<!-- 경험치_div -->
					<div id="expBox" style="position: relative;">
						<div
							style="font-size: 10px; position: absolute; z-index: 100; margin-left: 45%;">
							${profileInfo.memberExp } / ${profileInfo.lvlMaxExp }</div>
						<div id="expBar"></div>
						<script>
                	$(function(){
                		var maxExp= "${profileInfo.lvlMaxExp }";
                		var memberExp= "${profileInfo.memberExp }";
                		var empPercent=2;
                		empPercent=(100/maxExp)*memberExp; 
                		if(empPercent <1){
                			/* 1%보다 작을경우 화면에 표시되는게 너무 작아서 눈에 쉽게 보이지 않음 */
                			$("#expBar").css("width","1%");
                		}else{
                			$("#expBar").css("width",empPercent+"%");
                		}
                		
                		
                		
                	})
                
                </script>
					</div>
					<!-- 경험치 div_end -->

					<!-- 이메일 영역-->
					<p id="MemberEmail"
						style="color: rgba(120, 120, 120, 1); letter-spacing: 0.3em">${profileInfo.memberEmail }</p>

					<!-- 상태메시지 -->
					<div id="memo" style="position: relative;">
						<textarea id="memoTextArea" style="letter-spacing: 0.3em"
							maxlength="100"><c:if
								test="${profileInfo.memberMemo ne 'NULL' }">${profileInfo.memberMemo}</c:if></textarea>
						<span id="counter"
							style="position: absolute; top: 70%; left: 70%;">###</span>
					</div>
					<script>
	            $(function() {
	            	
	            	var content=$("#memoTextArea").val();
	            	
	            	 $('#counter').html(content.length + '/100');
	            	 
	                $('#memoTextArea').keyup(function (e){
	                    content = $(this).val();     
	                   
	                    $('#counter').html(content.length + '/100');
	                    
	                });
	               
	                $('#content').keyup();
	                
	                
	                $('#memoTextArea').change(function(){
	                	 alert(content);
	                	var save = confirm("상태메시지를 저장하시겠습니까?");
	                	if(save){
	                		$.ajax({
	                			url:"upMemo.do",
	                			type:"post",
	                			data:{memberMemo:$(this).val()},
	                			success : function(data) {
			                		alert("변경되었습니다");					            	
					            },
					            error : function(data) {  
					               alert("code:"+request.status+"\n"+"error:"+error);
					            }
	                			
	                		})
	                	}else{
	                		alert("취소하였습니다");
	                		if("${profileInfo.memberMemo}"=="NULL"){
	                			$('#memoTextArea').val("");
	                		}else{
	                			
		                		$('#memoTextArea').val("${profileInfo.memberMemo}");
	                		}
	                	}
	                	
	                })
	                
	                
	         	 });
	          
	            
            
            </script>

					<!-- 포인트 div -->
					<div style="width: 75%; margin-left: auto; margin-right: auto;">
						<p
							style="font-size: 20px; font-weight: 900; margin-bottom: 5px; float: left;">포인트</p>


						<p
							style="font-size: 18px; font-weight: bold; margin-bottom: auto; height: 50px; letter-spacing: 0.3em;">
							${profileInfo.nowPoint } G</p>


					</div>


					<!-- 스펙div -->
					<div style="width: 75%; margin-left: auto; margin-right: auto;">
						<p
							style="font-size: 20px; font-weight: 900; margin-bottom: 5px; float: left;">스펙</p>
						<br clear="both">
						<div class="grayBox" style="height: 250px;">
							<div id="specTable"
								style="margin-left: auto; height: 100%; margin-right: auto; width: 85%;">
								<table style="text-align: left;">
									<tr>
										<th rowspan="3" valign=top style="width: 50px;">학교</th>
										<td class="specTd" id="school0"></td>
									</tr>
									<tr>
										<td class="specTd" id="school1"></td>
									</tr>
									<tr>
										<td class="specTd" id="school2"></td>
									</tr>
								</table>
								<br>

								<table style="text-align: left;">
									<tr>
										<th rowspan="3" valign=top style="width: 50px;">자격증</th>
										<td class="specTd" id="certificate0"></td>
									</tr>
									<tr>
										<td class="specTd" id="certificate1"></td>
									</tr>
									<tr>
										<td class="specTd" id="certificate2"></td>
									</tr>
								</table>
								<br>
								<table style="text-align: left;">
									<tr>
										<th rowspan="3" valign=top style="width: 50px;">경력</th>
										<td class="specTd" id="career0"></td>
									</tr>
									<tr>
										<td class="specTd" id="career1"></td>
									</tr>
									<tr>
										<td class="specTd" id="career2"></td>
									</tr>
								</table>
								
								<!-- 스펙 추가 모달창 -->
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
											<div class="modal-body">
											<p>파일 미리보기</p>
												<img id="fileView"style="">
												
												<form id="modelForm" action="insertSpec.do"  method="post" enctype="Multipart/form-data" onsubmit="retrun fileCheck">
													<input  type="hidden"  id="specCName" name="specCName"><br>
													<input  type="hidden"  id="memberNo" name="memberNo" value="${loginUser.memberNo }"><br>
													<label id="specNameLable"></label><input type="text" id="specName" name="specName" required ><br>
													<label id="specFileNameLable">파일첨부</label><input type="file" id="specFileName" name="specFileName" style="width: 50%;" required>
												
											
											</div>
											<div class="modal-footer">
												<button class="btn btn-primary">확인</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">취소</button>
											</div>
											</form>	
										</div>
									</div>
								</div>
							</div>

						</div>
						<!-- 스펙 추가 스크립트 -->
						<script>
						$(function(){
							$("#subBtn").on("click",function(){
								
							})
						})
					
                	$(function(){
                		var $tdId;
                    	var school = new Array();
                    	school[0]= "${schoolList[0]}";
                    	school[1]= "${schoolList[1]}";
                    	school[2]= "${schoolList[2]}";
                    	/* $tdId=$("#school1");
                    	$tdId.text(school[0]); */
                    	for(var i=0; i<school.length;i++){
                    		var $tdId;
                    		switch (i) {
							case 0:
								$tdId=$("#school0");
								break;
							case 1:
								$tdId=$("#school1");
								break;
							case 2:
								$tdId=$("#school2");
								break;

							default:
								break;
							} 
                    		if(school[i] != ""){
                    			$tdId.text(school[i]);
                    		}else{
                    			$tdId.attr("valign","top");
                    			$tdId.html("<img src='${contextPath }/resources/views/icons/plusIcon.png'"
                    							 +"style='width:15px; text-align:top;'>"); 
                    			$tdId.attr("data-toggle","modal");
                    			$tdId.attr("data-target","#myModal");

                    			$tdId.on("click",function(){
                    				$("#myModalLabel").text("학교 추가");
                    				$("#specCName").val("SC00001");
                    				$("#specNameLable").text("학교 이름");
                    			})
                    			break;
                    		}
    							
                    		
                    	}
                    	
                    	var certificate = new Array();
                    	certificate[0]= "${certificateList[0]}";
                    	certificate[1]= "${certificateList[1]}";
                    	certificate[2]= "${certificateList[2]}";
                    	
                    	for(var i=0; i<certificate.length;i++){
                    		var $tdId;
                    		switch (i) {
							case 0:
								$tdId=$("#certificate0");
								break;
							case 1:
								$tdId=$("#certificate1");
								break;
							case 2:
								$tdId=$("#certificate2");
								break;

							default:
								break;
							} 
                    		if(certificate[i] != ""){
                    			$tdId.text(certificate[i]);
                    		}else{
                    			$tdId.attr("valign","top");
                    			$tdId.html("<img src='${contextPath }/resources/views/icons/plusIcon.png'"
                    							 +"style='width:15px; text-align:top;'>"); 
                    			$tdId.attr("data-toggle","modal");
                    			$tdId.attr("data-target","#myModal");

                    			$tdId.on("click",function(){
                    				$("#myModalLabel").text("자격증 추가");
                    				$("#specCName").val("SC00002");
                    				$("#specNameLable").text("자격증 이름");
                    			})
                    			break;
                    		}
                    		
                    	}
                    	
                    	var career = new Array();
                    	career[0]= "${careerList[0]}";
                    	career[1]= "${careerList[1]}";
                    	career[2]= "${careerList[2]}";

                    	for(var i=0; i<career.length;i++){
                    		var $tdId;
                    		switch (i) {
							case 0:
								$tdId=$("#career0");
								break;
							case 1:
								$tdId=$("#career1");
								break;
							case 2:
								$tdId=$("#career2");
								break;

							default:
								break;
							} 
                    		if(career[i] != ""){
                    			$tdId.text(career[i]);
                    		}else{
                    			$tdId.attr("valign","top");
                    			$tdId.html("<img src='${contextPath }/resources/views/icons/plusIcon.png'"
                    							 +"style='width:15px; text-align:top;'>"); 
                    			$tdId.attr("data-toggle","modal");
                    			$tdId.attr("data-target","#myModal");

                    			$tdId.on("click",function(){
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
				<!-- 프로필 정보 div_end -->



				<script>
					$(function(){
						$("#profileImg").on("click",function(){
							$("#profileFile").click();
							
						})
						
					})
					
					
					function test2(){
						var formData = new FormData($('#testForm')[0]);

				        alert("dgjd");
				        $.ajax({
				            type:'POST',
				            url:"upproimg.do",
				            enctype: 'multipart/form-data', // 필수 
				            data: formData, // 필수 
				            processData: false, // 필수 
				            contentType: false, // 필수 
				            processData: false,
				            contentType: false,
				            success : function(data) {
				            	alert(data);
								$("#profileImg").attr("src","${contextPath}/resources/upprofileFiles/"+data);
								$("memberPhoto").val(data);
				            },
				            error : function(data) {  
				               alert("code:"+request.status+"\n"+"error:"+error);
				            }
				        });
					}
		
				
				</script>

				<div class="subContent_my"
					style="width: 60%; height: 50px; border: 1px solid rgba(229, 229, 229, 1); border-radius: 10px;">
					<div class="menubar">
						<div class="nav">
							<div class="submenu s" id="menu1">
								<a>개인정보</a>
							</div>
							<div class="submenu s" id="menu2">
								<a>스터디</a>
							</div>
							<div class="submenu s" id="menu3">
								<a>찜목록</a>
							</div>
							<div class="submenu s" id="menu4">
								<a>활동내역</a>
							</div>
							<div class="submenu s" id="menu5">
								<a>포인트</a>
							</div>
						</div>
					</div>
				</div>
				<br>
				<br>
				<br>
				<div class="subContent_my a" id="a1"
					style="width: 70%; display: block;">

					<jsp:include page="./mypage_member.jsp" />
				</div>
				<div class="subContent_my a" id="a2" style="width: 70%;">
					<jsp:include page="./test2.jsp" />
				</div>
				<div class="subContent_my a" id="a3" style="width: 70%;"></div>
				<div class="subContent_my a" id="a4" style="width: 70%;"></div>
				<div class="subContent_my a" id="a5" style="width: 70%;"></div>

				<script>
					$(".submenu").on("click",function(){
						var clickId = $(this).attr("id");
						$(".a").css("display","none"); 
						$(".s").css("background","white");
					
						switch (clickId) {
						  case "menu1" :
						    $("#menu1").css("background","gray");
						    $("#a1").css("display","block"); 
						    break;
						  case "menu2" :
							  $("#menu2").css("background","gray");
							    $("#a2").css("display","block"); 
							    break;
						  case "menu3" :
							  $("#menu3").css("background","gray");
							    $("#a3").css("display","block"); 
							    break;
						  case "menu4" :
							  $("#menu4").css("background","gray");
							    $("#a4").css("display","block"); 
							    break;
						  case "menu5" :
							  $("#menu5").css("background","gray");
							    $("#a5").css("display","block"); 
							    break;
							    
						  default :
						    alert('선택한 값이 없습니다.');
						    break;
						}
						
					})
				</script>
		</c:if>
		<c:if test="${empty profileInfo}">
			<h3>정보 없음</h3>
		</c:if>
		</div>

	</section>

	<!-- /.container -->

	<jsp:include page="../common/footer.jsp" />

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js"
		integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J"
		crossorigin="anonymous"></script>

</body>
</html>