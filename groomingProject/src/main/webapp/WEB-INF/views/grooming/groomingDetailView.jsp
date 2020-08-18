<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
{
int count = 0;

}
<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--      <script src="http:/code.jquery.com/jquery-latest.min.js"></script> -->

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">
	
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>


<!-- modal CSS  -->
<link
	href="${pageContext.servletContext.contextPath }/resources/views/css/modal.css"
	rel="stylesheet">
<title>Hello, world!</title>
<style>
body {
	height: 1200px;
}

img {
	max-width: 100%;
	max-height: 100%;
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

.groomingImage {
	width: 450px;
	height: 550px;
	background-size: cover;
	border: 1px solid lightgreen;
}

.status {
	border-radius: 10px;
	border: 1px solid black;
	width: 80px;
	height: 40px;
	text-align: center;
	color: red;
	margin-bottom: 20px;
}

.pimg {
	background-size: cover;
	width: 100px;
	height: 90px;
}
</style>
</head>

<body>

	<header>
		<jsp:include page="../common/mainNavigationBar.jsp" />
	</header>


	<section>



		<div class="container" style="margin-top: 150px;">

			<div class="row">
				<div class="col-9">
					<table>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td><h3>${grooming.groomingTitle }</h3></td>
						</tr>
						<tr>
							<td><span>모집 기간 : </span><span>${grooming.groomingSd }
									~ ${grooming.groomingEd }</span></td>
						</tr>

					</table>
				</div>
				<div style="text-align: right; margin-left: 70px;">
					<table>
						<tr>
							<td align="right">
								<div class="status">
									<c:if test="${grooming.groomingEd gt grooming.groomingNd }">
										<c:out value="<h4>모집중</h4>" escapeXml="false" />
									</c:if>
									<c:if test="${grooming.groomingEd lt grooming.groomingNd }">
										<c:out value="<h4>마감</h4>" escapeXml="false" />
									</c:if>
								</div>
							</td>
						</tr>
						<tr>
							<td>&nbsp;<i class="far fa-bookmark"></i>&nbsp;&nbsp; <a
								href="#" onclick="">신고</a>
							</td>

						</tr>
						<tr>
							<td><span>작성일 :${grooming.groomingCd }</span></td>
						</tr>
						<tr>
							<td><span>조회수 : </span><span>${grooming.count}</span></td>
						</tr>
					</table>
				</div>
			</div>

		</div>
		<div class="container" style="margin-top: 20px;">
			<div class="row">
				<div class="col-5">
					<table>
						<tbody>
							<tr>
								<td>
									<div class="groomingImage">
										<img
											src="${contextPath }/resources/upGroomingFiles/${grooming.groomingImg}">
									</div>
								</td>
							</tr>
						</tbody>
					</table>

				</div>

				<!-- 컨테이너 우측 -->
				<div class="col-7">
					<table>
						<tbody>

							<tr>
								<td style="padding-right: 20px;">
									<div class="pimg">
										<img
											src="${contextPath }/resources/upprofileFiles/${member.memberPhoto}">
									</div>
								</td>
								<td>호스트 : <span>${member.memberNickName }</span><br> <c:forEach
										var="t" items="${tag }">
										<span style="color: lightblue;">${t.tagName }</span>
									</c:forEach> 경력 : <c:forEach var="s" items="${spec }">
										<span>${s.specName }</span>
									</c:forEach>
								</td>

							</tr>


						</tbody>
					</table>
					<br>
					<table>
						<tr>
							<td><span>그룹 타입 : </span><span>${grooming.groomingType }</span>
						</tr>
						<tr>
							<td><span>스터디 기간 :</span><span>${grooming.studySd } ~
									${grooming.studyEd }</span></td>
						</tr>

						<tr>

							<td><span>예치금 : </span>${grooming.money }</td>
						</tr>
						<tr>
							<td><span>모집인원 : ${grooming.currentP }/${grooming.groomingP }명</span></td>
						</tr>

						<tr>
							<td><br>
							<h4>${grooming.groomingIntroduce }</h4></td>
						</tr>

						<tr>
							<td>
								<p>${grooming.groomingContent }</p>
							</td>
						</tr>
					</table>

				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
			<c:if test="${loginUser.memberNo eq grooming.memberNo }">
				<div class="col-3">
					<!-- 신청자 리스트  확인 버튼 -->
					<button data-toggle="modal" data-target="#applicant">신청자
						리스트</button>
					<!-- 리스트 모달 -->
					<div class="modal fade" id="applicant" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">

						<div class="modal-dialog">

							<div class="modal-content" style="width: 800px; height: auto;">
								<!-- 모달 제목 -->
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">신청자 리스트</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<!-- 모달 본문 내용 -->
								<div class="modal-body">
									<table class="table" style="text-align: center">
										<thead>
											<!-- 멤버 정보 목록 -->
											<tr>
												<th scope="col" style="width: 100px;">프로필</th>
												<th scope="col" style="width: 100px;">닉네임</th>
												<th scope="col">신청 내용</th>
												<th scope="col" style="width: 200px">수락/거절</th>
											</tr>
										</thead>
										<tbody class="tbody">
										<c:forEach var="aL" items="${appList }">
										
											<tr class="appTr">
											
												<input type="hidden" class="applyNo" value="${aL.groomingAN }" >
												
												<td>
													<div class="pimg" style="width: 50px; height: 50px;">
														<img src="${contextPath }/resources/upprofileFiles/${aL.memberPhoto}">
													</div>
												</td>
												<td>${aL.memberNickName }</td>
												<td><button data-toggle="modal" data-target="#open_modal_appContent">신청서
														열람</button>
													<div class="modal modal-xl fade" id="open_modal_appContent'+count+'" tabindex="-1"
														role="dialog" aria-labelledby="exampleModalLabel"
														aria-hidden="true">

														<div class="modal-dialog">

															<div class="modal-content"
																style="width: 800px; height: auto;">
																<!-- 모달 제목 -->
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel">신청 내용</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<!-- 모달 본문 내용 -->
																<div class="modal-body">
																	${aL.groomingAC }
																</div>
															</div>
														</div>
													</div>
												</td>
												<td class="appTd"><button class="accept" >수락</button>&nbsp;&nbsp;
													<button class="reject" >거절</button></td>

											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>

							</div>

						</div>

					</div>
					<!-- 신청자 리스트 모달 끝 -->
				</div>

				<c:url var="gupdate" value="groomingUpdate.do" />
				<c:url var="gdelete" value="groomingDelete.do" />
				<c:url var="limit" value="limit.do" />
				<!-- 글의 상태 버튼 -->
				<div class="col-6" style="text-align: center">
					<button onclick="location.href='${gupdate}'">수정</button>
					<button onclick="location.href='${gdelete}'">삭제</button>
					<button onclick="location.href='${limit}'">마감</button>
				</div>
				</c:if>
				<c:if test="${loginUser.memberNo ne grooming.memberNo  }">
				<div class="col-3">
					<!-- 신청하기 버튼 -->
					<button data-toggle="modal" data-target="#applyForm">신청하기</button>
					<!-- 신청폼 모달 -->
					<div class="modal fade" id="applyForm" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">

						<div class="modal-dialog">
							<form action="groomingAppliate">
								<div class="modal-content" style="width: auto; height: auto;">

									<!-- 모달 제목 -->
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">신청서</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<!-- 모달 본문 내용 -->
									<div class="modal-body container">
										<div class="row">
											<div cols="6"></div>
											<div cols="6"></div>
										</div>
										<textarea cols="100" rows="10" placeholder="내용을 입력하세요. "
											id="summernote" name="editordata" class="form-control"></textarea>
										</td>
									</div>

								</div>
							</form>
						</div>

					</div>
					<!-- 신청 폼 모달 끝 -->
				</div>
			</c:if>
			</div>
		</div>
	</section>
<!-- 	<script>
		$(function(){
			$("#open_modal_appContent").draggable();
		})
	
	</script> -->
	<script>
		
		$(function(){
			
			getAppList();
			
			/* setInterval(function(){
				getAppList();
			},10000);  */
			
			$(document).on("click",".accept",function(){
				var groomingNo = "${grooming.groomingNo}";
				var appTemp = $(this);
				var applyNo = appTemp.parents(".appTr").children(".applyNo").val();
				
				$.ajax({
					url:"gaccept.do",
					data:{applyNo:applyNo,groomingNo:groomingNo},
					success:function(data){
						if(data=="success"){
						getAppList();
					}
						
					},error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
					})
			})
			
			
			$(document).on("click",".reject",function(){
				var groomingNo = "${grooming.groomingNo}";
				var appTemp = $(this);
				var applyNo = appTemp.parents(".appTr").children(".applyNo").val();
				
				$.ajax({
					url:"greject.do",
					data:{applyNo:applyNo},
					success:function(data){
						if(data=="success"){
						getAppList();
					}
						
					},error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
					})
			})
			
		})
		
						
			
				/* -- ajax-- */
			
			
		function getAppList(){
			
			var groomingNo = "${grooming.groomingNo}";
			$.ajax({
				url:"gacceptList.do",
				data:{groomingNo:groomingNo},
				dataType:"json",
				success:function(data){
					$tableBody = $(".tbody");
					$tableBody.html("");
					
					var $tr;
					var $input;
					var $td1;
					var $div1;
					var $img1;
					var $td2;
					var $td3;
					var $td4;
					var $button1;
					var $div2;
					var $div3;
					var $div4;
					var $div5;
					var $h5;
					var $button2;
					var $span1;
					
					var $div6;
					var $td5;
					var $button3;
			
						console.log(data.length);
					if(data.length> 0){	// 댓글이 하나 이상 존재하면
						for(var i in data){
							 $tr = $("<tr class='appTr'>");
							 $input = $("<input type='hidden' class='applyNo' >");
							 $inputVal = $input.val(data[i].groomingAN);
							 $td1 = $("<td>");
							 $div1 = $("<div class='pimg' style='width:50px; height:50px;'>");
							 $img1 = $("<img src='${contextPath }/resources/upprofileFiles/"+data[i].memberPhoto+"'>");
							 $td2 = $("<td>").text(data[i].memberNickName);
							 $td3 = $("<td>");
							 $button1 = $("<button data-toggle='modal' data-target='#open_modal_appContent"+i+"'>").text("신청서열람");
							 $div2 = $("<div class='modal modal-xl fade' id='open_modal_appContent"+i+"' tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel' aria-hidden='true'>");
							 $div3 = $("<div class='modal-dialog'>");
							 $div4 = $("<div class='modal-content' style='width: 800px; height: auto;'>");
							 $div5 = $("<div class='modal-header'>");
							 $h5 = $("<h5 class='modal-title' id='exampleModalLabel'>").text("신청 내용");
							 $button2 = $("<button type='button' class='close' data-dismiss='modal' aria-label='Close'>");
							 $span1 = $("<span aria-hidden='true'>").text("X");
							
							 $div6 = $("<div class='modal-body'>").text(data[i].groomingAC);
							 
							 $td4 = $("<td>");
							 $button3 = $("<button class='accept'>").text("수락");
							 $button4 = $("<button class='reject'>").text("거절");
							 
							 $td1.append($div1);
							 $div1.append($img1);
							 $td3.append($button1);
							 $td3.append($div2);
							 
							 $div2.append($div3);
							 $div3.append($div4);
							 $div4.append($div5);
							 $div5.append($h5);
							 $div5.append($button2);
							 $button2.append($span1);
							 
							 $div4.append($div6);
							 $td4.append($button3);
							 $td4.append($button4);
							 
							 $tr.append($td1);
							 $tr.append($td2);
							 $tr.append($td3);
							 $tr.append($td4);
							 $tr.append($inputVal);
							 $tableBody.append($tr);
							 
						}
					}else{					// 댓글이 없으면
						$tr = $("<tr>");
						$rContent = $("<td colspan='3'>").text("신청자가 없습니다.");
						
						$tr.append($rContent);
						$tableBody.append($tr);
					}
					
					
				},
				error:function(request, status, errorData){
					alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
				}
			}) 
		}
		
	</script>
	

	<footer><jsp:include page="../common/footer.jsp" />
	</footer>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script> -->
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
