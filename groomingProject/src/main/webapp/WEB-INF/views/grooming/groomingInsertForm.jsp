<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--      <script src="http:/code.jquery.com/jquery-latest.min.js"></script> -->
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<!-- datapicker  -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.js"></script>
<link
	href="${pageContext.servletContext.contextPath }/resources/js/bootstrap4-tagsinput/tagsinput.css"
	rel="stylesheet">

<title>Hello, world!</title>
<style>
body {
	height: auto;
}

textarea {
	height: 300px;
	border-radius: 5px;
}

input {
	border-radius: 5px;
}
/*폰트 설정 */
@font-face {
	font-family: 'TmoneyRoundWindExtraBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: "TmoneyRoundWindExtraBold";
}

/* image삽입 div */
.image {
	width: 400px;
	height: 300px;
	background-color: lightgray;
	border-radius: 10px;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

section {
	margin-bottom: 50px;
}

.study tbody tr td {
	padding: 10px;
}

/* 3D Button */
.btn-3d {
	position: relative;
	display: inline-block;
	font-size: 12px;
	padding: 20px 60px;
	color: white;
	margin: 10px;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
}

.btn-3d.green:hover {
	background-color: #80C49D;
}

{
background-color


:

 

#82D1E3


;
}
.btn-3d:active {
	top: 9px;
}

.btn-3d.green {
	background-color: #82c8a0;
	box-shadow: 0 0 0 1px #82c8a0 inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 8px 0 0 rgba(126, 194, 155, .7), 0 8px 0 1px
		rgba(0, 0, 0, .4), 0 8px 8px 1px rgba(0, 0, 0, 0.5);
}

.btn-3d.green:active {
	box-shadow: 0 0 0 1px #82c8a0 inset, 0 0 0 2px rgba(255, 255, 255, 0.15)
		inset, 0 0 0 1px rgba(0, 0, 0, 0.4);
}

.money {
	display: none;
}

section .form_container .study .bootstrap-tagsinput .badge {
	margin: 0 3px;
	font-weight: lighter;
}

.ui-datepicker-trigger {
	width: 25px;
	height: 25px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}
/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	/* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	ppearance: none;
}

.filebox .upload-display { /* 이미지가 표시될 지역 */
	margin-bottom: 5px;
	width: 300px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
	display: inline-block;
	width: 100%;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img { /* 추가될 이미지 */
	display: block;
	max-width: 100%;
	width: 100%;
	height: auto;
}

.form_container {
	width: 100%;
	margin-top: 50px;
	border: 3px solid lightgreen;
	border-radius: 10px;
}

.badge::before
{
   content: "#";
}
</style>
</head>

<body>

	<header>
		<jsp:include page="../common/mainNavigationBar.jsp" />
	</header>


	<section>


		<jsp:useBean id="now" class="java.util.Date" />
		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

		<label id="today" style="" hidden></label>
		<div class="form_container container">
			<!-- style=" "> -->

			<c:url var="groomingInsert" value="groomingInsertForm.do"/>
				
			<form action="${groomingInsert }" method="post"
				enctype="multipart/form-data" id="form">
 				<input type="hidden" value="${loginUser.memberNo }" id="hiddienMemberNo" name="memberNo"> 
				<div class="row" style="margin-bottom: 10px; margin-top: 10px;">

					<div class="col-7">
						<table class="study">
							<tbody>
								<tr>
									<td><span>스터디 그룹 이름</span><br> <input type="text"
										size="50" placeholder="스터디 그룹 이름을 입력해주세요" id="title"
										name="groomingTitle" required><br> <small><span
											style="color: lightblue">간략하면서 주제가 잘 들어난 이름이 좋아요</span></small> <small><span
											style="color: #aaa;" id="counterTitle">(0/40)</span></small></td>

								</tr>
								<tr>
									<td>
										<label>타입</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<c:if test="${m ne null }">
											<label><input type="radio" name="groomingType" id="m"value="멘토" checked>멘토 그룹</label>&nbsp;&nbsp;&nbsp;&nbsp; 
											<label><input type="radio" name="groomingType" value="호스트" id="h">호스트 그룹</label>
										</c:if>
										<c:if test="${m eq null }">
											<label><input type="radio" name="groomingType" id="m"value="멘토" disabled>멘토 그룹</label>&nbsp;&nbsp;&nbsp;&nbsp; 
											<label><input type="radio" name="groomingType" value="호스트" id="h" checked>호스트 그룹</label>
										</c:if>
									</td>
								</tr>

								<tr>
									<td><span>한줄 소개</span><br> <input type="text"
										size="50" placeholder="스터디 그룹 한줄 소개를 입력해주세요" id="introduce"
										name="groomingIntroduce" required><br> <small><span
											style="color: lightblue">이목을 집중할 한마디면 충분해요!</span></small> <small><span
											style="color: #aaa;" id="counterIntroduce">(0/60)</span></small></td>

								</tr>
								<tr>
									<td><span>활동인원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="number" max="6" min="2"
										style="text-align: center;" name="groomingP" id="groomingP" required><span>&nbsp;&nbsp;명</span><br>
										<small><span style="color: lightblue;">2~6명으로
												인원을 구성해주세요</span></small></td>
								</tr>
								<tr>
									<td><span>내용</span><br> <textarea cols="50" rows="10"
											placeholder="구체적인 활동 내용을 적어주세요!" id="content"
											style="resize: none;" name="groomingContent" required></textarea> <small><span
											style="color: #aaa;" align="right" id="counterContent">(0/480)</span></small></td>

								</tr>
								<tr>
									<td><label>예치금</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label id="l1"><input type="radio" name="money1" id="exist" value="y" checked>있음</label>&nbsp;&nbsp;&nbsp;&nbsp; 
										<label id="l2"><input type="radio" name="money1" id="nonexist" value="x">없음</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="number" min="1000" step="1000" style="text-align: center; width: 60px;" class="money" name="money"><span class="money">&nbsp;&nbsp;원</span>
									</td>
								</tr>

							</tbody>
						</table>

					</div>

					<!-- 컨테이너 우측 -->
					<div class="col-5" style="margin: 0;">
						<table class="study">
							<tbody>

								<tr>
									<td><span>해시 태그</span><br> <input type="text"
										name="tagName" value="" placeholder="Tags,"
										data-role="tagsinput" class="form-control" id="tagName"
										required> <small><span
											style="color: lightblue">해쉬태그는 5개 이하로 등록해주세요!</span> </small></td>
									</td>
								</tr>

								<tr>
									<td><span>스터디 모집 기간</span><br> <input id="startG" type="text" name="groomingSd" required> ~ 
									<input id="endG" type="text" name="groomingEd" required><br> <small><span>스터디
												그룹을&nbsp;&nbsp;<span style="color: red;">모집</span>할 기간을
												설정해주세요
										</span></small></td>
								</tr>
								<tr>
									<td><span>스터디 진행 기간</span><br> <input id="start" type="text" min="${today }" name="studySd" required> ~ <input
										id="end" type="text" name="studyEd" required><br> <small>
											<span>스터디 그룹을&nbsp;&nbsp;<span style="color: red;">진행</span>할
												기간을 설정해주세요
										</span>
									</small></td>
								</tr>
								<tr>
									<td><span>대표이미지</span><br> <!-- 	<div class="image">
                        			<div class="icon"><i class="fas fa-plus" ></i></div>
                        		</div> --></td>
								</tr>
								<tr>
									<td>
										<div class="filebox preview-image">
											<input class="upload-name" value="파일선택" disabled="disabled">
											<label for="input-file">업로드</label> <input type="file"
												id="input-file" class="upload-hidden" name="uploadFile" required>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<input id="insert" class="btn-3d green" type="submit" value="등록하기">
										<input id="cansel" class="btn-3d green" type="submit" value ="취소하기" >
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</form>
		</div>
	
		 <script>
			$(function(){
					var tagName = $("#tagName").text();
					$(document).on("click","#insert",function(){
						
						
							var result= confirm("등록하시겠습니까?");
							if(result){
								if(tagName == ""){
									//console.log("모든값을 작성해주세요!");
								}else{
									$("form").submit();
									
								}
							}else{
								event.preventDefault();
							}
						
					
					
				})
			})
		
		</script> 
		
		<!-- 엔터키 입력시 submit 방지 -->
		<script>
			$('input').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
			});
			
			
		
		</script>
		
			<!--  파일 업로드 관련 script -->
		<script>
			$(document).ready(function() {

								var fileTarget = $('.filebox .upload-hidden');

								fileTarget
										.on(
												'change',
												function() {
													if (window.FileReader) {
														// 파일명 추출
														var filename = $(this)[0].files[0].name;
													}

													else {
														// Old IE 파일명 추출
														var filename = $(this)
																.val().split(
																		'/')
																.pop().split(
																		'\\')
																.pop();
													}
													;

													$(this).siblings(
															'.upload-name')
															.val(filename);
												});

								//preview image 
								var imgTarget = $('.preview-image .upload-hidden');

								imgTarget.on('change',function() {
													var parent = $(this)
															.parent();
													parent.children(
															'.upload-display')
															.remove();

													if (window.FileReader) {
														//image 파일만
														if (!$(this)[0].files[0].type
																.match(/image\//))
															return;

														var reader = new FileReader();
														reader.onload = function(e) {
															var src = e.target.result;
															parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');

														}
														reader.readAsDataURL($(this)[0].files[0]);
													}

													else {
														$(this)[0].select();
														$(this)[0].blur();
														var imgSrc = document.selection.createRange().text;
														parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

														var img = $(this).siblings('.upload-display').find('img');
														img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
																+ imgSrc
																+ "\")";
													}
												});
							});
		</script>
		
	
			<!-- 그룹 타입 관련 script -->
		<script>
			$(function() {
				if($("#m").is(":checked")){
					$("#exist").attr('style', "display:none;");
					$("#nonexist").attr('style', "display:none;");
					$("#l1").attr('style', "display:none;");
					$("#l2").attr('style', "display:none;");
					$(".money").attr('style', "display:inline;");
				}
				if($("#h").is(":checked")){
					$("#exist").attr('style', "display:inline;");
					$("#nonexist").attr('style', "display:inline;");
					$("#l1").attr('style', "display:inline;");
					$("#l2").attr('style', "display:inline;");
					$(".money").attr('style', "display:inline;");
				
				
				}
				$("input:radio[name='groomingType']").on("click", function() {
					

					if ($(this).val() == '멘토') {
						$("#exist").attr('style', "display:none;");
						$("#nonexist").attr('style', "display:none;");
						$("#l1").attr('style', "display:none;");
						$("#l2").attr('style', "display:none;");
						$(".money").attr('style', "display:inline;");
					}
					if ($(this).val() == '호스트') {
						$("#exist").attr('style', "display:inline;");
						$("#nonexist").attr('style', "display:inline;");
						$("#l1").attr('style', "display:inline;");
						$("#l2").attr('style', "display:inline;");
						$(".money").attr('style', "display:inline;");
						$("#exist").attr("checked", true);
					}

				})

				$("input:radio[name='money1']").on("click", function() {

					if ($(this).val() == 'x') {
						//console.log("예치금 없앰");
						
						$(".money").attr('style', "display:none;");
					}
					if ($(this).val() == 'y') {
						//console.log("예치금 있음");
						$(".money").attr('style', "display:inline;");
					}

				})

			})
		</script>
		
		<script>
/* 			var memberNo = $("#hiddienMemberNo").val(); */
		/* 	console.log(memberNo); */
			$(function(){
				var memberNo = "${loginUser.memberNo}";
						$("#cansel").on("click",function(){
							
						var result = confirm("임시저장 하시겠습니까?");
						var groomingP = $("#groomingP").val();
						var startG = $("#startG").val();
						var endG = $("#endG").val();
						var start = $("#start").val();
						var end = $("#end").val();
						
						if (result) {
								
							if(groomingP == ""  ){
								alert("참가인원, 모집기간, 스터디 기간은 체크해주셔야 임시저장 가능합니다.!");
							}else if(startG == ""){
								alert("참가인원, 모집기간, 스터디 기간은 체크해주셔야 임시저장 가능합니다.!");
							
							}else if(endG == ""){
								alert("참가인원, 모집기간, 스터디 기간은 체크해주셔야 임시저장 가능합니다.!");
							}else if(start == ""){
								alert("참가인원, 모집기간, 스터디 기간은 체크해주셔야 임시저장 가능합니다.!");
							}else if(end == ""){
								alert("참가인원, 모집기간, 스터디 기간은 체크해주셔야 임시저장 가능합니다.!");
							}else {
							
							$("#title").attr("required",false);
							$("#introduce").attr("required",false);
					/* 		$("#groomingP").attr("required",false); */
							$("#content").attr("required",false);
							$("#tagName").attr("required",false);
						/* 	$("#startG").attr("required",false);
							$("#endG").attr("required",false);
							$("#start").attr("required",false);
							$("#end").attr("required",false); */
							$("#input-file").attr("required",false);
							
							$("#form").attr("action","save.do");  
							
							$("#cansel").submit();
							}
						} else {
							alert("취소되었습니다.");
							location.href = "groomingMain.do";
						}
					})
				})			
			
		</script>
		
		
		
			<!-- 실시간 글자 카운팅  -->
		<script>
			// 그룹 이름 
			$('#title').keydown(function(e) {
				var content = $(this).val();
				$('#counterTitle').html("(" + content.length + "/40)"); //글자수 실시간 카운팅

				if (content.length > 40) {
					alert("최대 40자까지 입력 가능합니다.");
					$(this).val(content.substring(0, 40));
					$('#counterTitle').html("(40/40)");
				}
			});

			// 한줄 소개
			$('#introduce').keydown(function(e) {
				var content = $(this).val();
				$('#counterIntroduce').html("(" + content.length + "/60)"); //글자수 실시간 카운팅

				if (content.length > 60) {
					alert("최대 60자까지 입력 가능합니다.");
					$(this).val(content.substring(0, 60));
					$('#counterIntroduce').html("(60/60)");
				}
			});

			// 내용
			$('#content').keydown(function(e) {
				var content = $(this).val();
				$('#counterContent').html("(" + content.length + "/480)"); //글자수 실시간 카운팅

				if (content.length > 480) {
					alert("최대 480자까지 입력 가능합니다.");
					$(this).val(content.substring(0, 480));
					$('#counterContent').html("(480/480)");
				}
			});
		</script>

			<!--  날짜 관련 script -->
		<script>
			$(function() {

				//오늘 날짜를 출력
				$("#today").text(new Date().toLocaleDateString());

				//datepicker 한국어로 사용하기 위한 언어설정
				$.datepicker.setDefaults($.datepicker.regional['ko']);

				// 시작일은 종료일이후 날짜 선택 불가
				// 종료일은 시작일 이전 날짜 선택 불가

				//시작일.
				$('#start')
						.datepicker(
								{
									showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
									buttonImage : "${contextPath }/resources/views/images/calendar.png", // 버튼 이미지
									buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
									buttonText : "날짜선택", // 버튼의 대체 텍스트
									dateFormat : "yy-mm-dd", // 날짜의 형식
									changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
									minDate : 0,
									onClose : function(selectedDate) {
										// 시작일(fromDate) datepicker가 닫힐때
										// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
										
									 $("#end").datepicker("option",
												"minDate", "selectedDate:'+1d'"); 
									 $("#endG").datepicker("option",
												"maxDate", selectedDate); 
									}});

				//종료일
				$('#end')
						.datepicker(
								{
									showOn : "both",
									buttonImage : "${contextPath }/resources/views/images/calendar.png",
									buttonImageOnly : true,
									buttonText : "날짜선택",
									dateFormat : "yy-mm-dd",
									changeMonth : true,
									minDate: 0, // 오늘 이전 날짜 선택 불가  */
									onClose : function(selectedDate) {
										// 종료일(toDate) datepicker가 닫힐때
										// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
										$("#start").datepicker("option", "maxDate",  selectedDate);
										$("#endG").datepicker("option","minDate",selectedDate);
									}
								});
				/*  --------------------------- 위는 스터디 기간, 아래는 스터디 모집 기간-------------------------- */

				//시작일.
				$('#startG')
						.datepicker(
								{
									showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
									buttonImage : "${contextPath }/resources/views/images/calendar.png", // 버튼 이미지
									buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
									buttonText : "날짜선택", // 버튼의 대체 텍스트
									dateFormat : "yy-mm-dd", // 날짜의 형식
									changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
									minDate : 0,
									onClose : function(selectedDate) {
										// 시작일(fromDate) datepicker가 닫힐때
										// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
										$("#endG").datepicker("option",
												"minDate", "selectedDate:'+1d'");
									}
								});

				//종료일
				$('#endG')
						.datepicker(
								{
									showOn : "both",
									buttonImage : "${contextPath }/resources/views/images/calendar.png",
									buttonImageOnly : true,
									buttonText : "날짜선택",
									dateFormat : "yy-mm-dd",
									changeMonth : true,
									//minDate: 0, // 오늘 이전 날짜 선택 불가
									onClose : function(selectedDate) {
										// 종료일(toDate) datepicker가 닫힐때
										// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
										$("#startG").datepicker("option",
												"maxDate", selectedDate);
									}
								});
			});
		</script>
	
		<script>
		
		
		
		</script>
	
	
	</section>


	<footer><jsp:include page="../common/footer.jsp" />
	</footer>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
</body>

</html>