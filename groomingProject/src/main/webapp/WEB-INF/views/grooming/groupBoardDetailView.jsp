<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">


	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

    
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        
            <!--summernote css/js 추가  -->

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <title>Hello, world!</title>
    <style>
        /* div의 크기에 맞춤 */
        img {
            max-width: 300px;
            max-height: 300px;
        }
        .table th {
            text-align: center;
            vertical-align: middle;
        }
		  @font-face { 
			font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
    	    font-weight: normal; 
    	    font-style: normal; 
   		}
	   * {
	      font-family:"TmoneyRoundWindExtraBold";
	   }
	   .mImg{
	   	max-width:100%;
	   	max-height:100%;
	   }
	   #tb2 tbody tr td{
	   	text-align:center;
	   	border:none;
	   	border-bottom:1px solid green;
	   }
	    #tb2 tbody{
	    	border-radius:15px;
	    	background:lightsteelblue;
	    }
    </style>
</head>

<body>
    <!-- 헤더시작 -->
	<jsp:include page="../common/mainNavigationBar.jsp" />

    <!-- 섹션 시작 -->
    <!-- 메인에 들어갈 내용용 -->
    <section >

    <!-- 컨테이너로 양옆에 공백 생성 -->
    <div class="container">
       <c:url var="calendar" value="calendar.do">
	    		<c:param name="groomingNo" value="${grooming.groomingNo}"/>
	    		<c:param name="memberNo" value="${loginUser.memberNo}" />
	  	</c:url>
		<c:url var="gBlist" value="gBlist.do">
				<c:param name="groomingNo" value="${grooming.groomingNo}"/>
		</c:url>
		<c:url var="groupP" value="groupPage.do">
				<c:param name="groomingNo" value="${grooming.groomingNo}"/>
		</c:url>
    
        <!--디폴트 메뉴-->
        <label><a href="${groupP }"><i class="fas fa-user-graduate"></i>메인</a></label>

        <label><a href="${calendar }"><i class="fas fa-calendar-alt"></i>출석부</a></label>

        <label><a href="${gBlist }"><i class="fas fa-icons"></i>게시판</a></label>



            <div style="text-align: right; margin-right: 20px;">
            <button data-toggle='modal' data-target='#declareForm' id='apply'>신고</button>
						
			<!-- 신청폼 모달 -->
			<div class="modal fade" id="declareForm" tabindex="-1" role="dialog" aria-labelledby="declareModalLabel" aria-hidden="true">
			
				<div class="modal-dialog">
					<c:url var="declareG" value="declareG.do">
							<c:param name="groomingNo" value="${grooming.groomingNo}"/>
							<c:param name="currentPage" value="${currentPage }"/>
							<c:param name="gBoardNo" value="${gboard.gBoardNo }"/>
					</c:url>
					<form action="${declareG}" method="post">
							<div class="modal-content" style="width: auto; height: auto;">
								<input type="hidden" value="${gboard.gBoardNo }" name="dnNo">
								<input type="hidden" value="${loginUser.memberNo }" name="memberNo">
												<!-- 모달 제목 -->
									<div class="modal-header">
										<h5 class="modal-title" id="declareModalLabel">신고 사유</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<!-- 모달 본문 내용 -->
									<div class="modal-body container">
										<textarea cols="100" rows="10" placeholder="신고 사유를 입력하세요. " id="summernote" name="dContent" class="form-control" required></textarea>
									</div>
									<div style="text-align:center; margin-bottom:10px;">
										<button type="sumbit" id="singo">제출</button>
										<button type="button" data-dismiss="modal">취소</button>
									</div>
							</div>
					</form>
				</div>

			</div>
								
            <p >작성일 : <label>${gboard.createDate }</label>&nbsp;&nbsp;조회수 : <label>${gboard.count}회</label></p>
            </div>
                    <div class="container">

                        <table class="table table-bordered" style="border-radius:10px;">

                                <tr>
                                    <th>작성게시판 </th>
                                    <td>
                                        <label>${gboard.gBoardCategory }</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>제목 </th>
                                    <td><label>${gboard.gBoardTitle }</label></td>
                                </tr>
                                <tr>
                                    <th>내용 </th>
                                    <td><textarea cols="100" rows="10" class="form-control" readonly style="height:auto; resize:none;" >${gboard.gBoardContent }</textarea></td>
                                </tr>
								<tr>
									<th>첨부파일</th>
									<td style="text-align:center;">
									<a href="${pageContext.servletContext.contextPath }/resources/upGroomingFiles/${gboard.gBoardImg}" download="${gboard.gBoardImg}">
									<img src="${pageContext.servletContext.contextPath }/resources/upGroomingFiles/${gboard.gBoardImg}"><br>
									</a></td>
								</tr>

                        </table>
                        <div style="text-align:center;"><button type="button" onclick="location.href='${gBlist}'">목록으로</button></div>
                        <c:if test="${loginUser.memberNo eq member.memberNo }">
                        <c:url var="groupBoardUpdate" value="groupBoardUpdate.do">
                        	<c:param name="groomingNo" value="${grooming.groomingNo}"/>
							<c:param name="page" value="${currentPage }"/>
							<c:param name="gBoardNo" value="${gboard.gBoardNo }"/>
                        </c:url>
	                       <!-- 수정 삭제 버튼 -->
	                        <div align="right">
	                            <button type="button" onclick="location.href='${groupBoardUpdate}'">수정</button>
	                            <button type="button" id="delete">삭제</button>
	                        </div>
                        </c:if>
                        <br><br><br>
                        <c:choose>
	                        <c:when test="${gboard.gBoardCategory == '공지'}">
	                        	<div style="text-align:center; border:1px solid green; border-radius:10px;"><h2>공지사항에는 댓글을 달 수 없습니다!</h2></div>
	                        </c:when>
	                        <c:otherwise>
	                        <!-- 댓글 등록  -->
	                        <div class="container">
	                            <table class="table table-bordered">
	                                    <tr>
	                                        <td class="col-6" style="width: 70%;">
	                                            <textarea cols="20" rows="2" class="form-control" style="resize: none;" id="gReplyContent">
	                                             </textarea>
	                                        </td>
	                                        <br><br>
	                                        <td class="col-4" style="width:30%; vertical-align: middle; text-align: center;">
	                                            <button id="sumbitReply">댓글 등록</button>
	                                        </td>
	
	                                    </tr>
	                            </table>
	                            <!-- 댓글 목록 보기 -->
	                            <table align="center" width="1050" border="1" id="tb2">
	                                   <tbody>
	                                    <tr>
	                                        
	                                    </tr>
	                                    </tbody>
	                            </table>
	                        </div>
	                        </c:otherwise>
                     </c:choose>
                        
                        
                    </div>
		</div>
	</section>
    
    <script>
    $(function(){
		getReplyList();
		
		setInterval(function(){
			getReplyList();
		},5000);
		
		$("#sumbitReply").on("click",function(){
			var gReplyContent = $("#gReplyContent").val();	// 선택자
			var gBoardNo = "${gboard.gBoardNo}";
			var memberNo = "${loginUser.memberNo}";
			var groomingNo = "${grooming.groomingNo}";
			if(gReplyContent == ""){
				alert("한글자 이상 입력해주세요");
			}else{
			$.ajax({
				url:"addGroupReply.do",
				data:{gReplyContent:gReplyContent, gBoardNo:gBoardNo,memberNo:memberNo,groomingNo:groomingNo},
				success:function(data){
					if(data=="success"){
						getReplyList();
						
						$("#gReplyContent").val("");	
						
						
					}
				},
				error:function(request, status, errorData){
					alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
				}
			})
			}
		})
		
		
	})
	
	function getReplyList(){
		var gBoardNo = "${gboard.gBoardNo}";
		
		$.ajax({
			url:"groupReply.do",
			data:{gBoardNo:gBoardNo},
			dataType:"json",
			success:function(data){
				$tableBody = $("#tb2 tbody");
				$tableBody.html("");
				
				var $tr;
				var $memberPhoto;
				var $memberNickName;
				var $td1;
				var $gReplyContent;
				var $gReplyCreateDate;
				var $img;
		
				
				if(data.length > 0){	// 댓글이 하나 이상 존재하면
					for(var i in data){
						$tr = $("<tr>");
						$memberPhoto = $("<td style='width:50px; height:50px;'>");
						$memberNickName = $("<td style='width:100px;'>").text(data[i].memberNickName);
						$img = $("<img class='mImg' src='${contextPath }/resources/upprofileFiles/"+data[i].memberPhoto+"'>");
						$gReplyContent = $("<td style='width:600px; height:auto;'>").text(data[i].gReplyContent);
						$gReplyCreateDate = $("<td width='100'>").text(data[i].gReplyCreateDate);
						
						$tr.append($memberPhoto);
						$tr.append($memberNickName);
						$memberPhoto.append($img);
						$tr.append($td1);
						$tr.append($gReplyContent);
						$tr.append($gReplyCreateDate);
						$tableBody.append($tr);
					}
				}else{					// 댓글이 없으면
					$tr = $("<tr>");
					$gReplyContent = $("<td colspan='3'>").text("등록 된 댓글이 없습니다.회원님이라도 작성해주세요!");
					
					$tr.append($gReplyContent);
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
	<script>
		$(function(){
			var memberNo = "${loginUser.memberNo}";
			var gmemberNo = "${member.memberNo}";
			var dmemberNo = "${declaration.memberNo}";
			var groupBNo = "${declaration.dnNo}";
			var gBoardNo = "${gboard.gBoardNo }";
			$("#apply").on("click",function(e){
				if(memberNo == gmemberNo){
					alert("자신의 글은 신고할 수 없습니다.");
					$(this).attr("disabled",true)
				}
				
				if((memberNo == dmemberNo) && (groupBNo == gBoardNo)){
					alert("이미 신고하신 게시글 입니다.!");
					$(this).attr("disabled",true)
				}
				
				
			})
			$("#singo").on("click",function(){
				alert("신고 되었습니다.");
			})
	
		})
	</script>

	<script>
		$(function(){
			var groomingNo="${grooming.groomingNo}";
			var gBoardNo = "${gboard.gBoardNo }";
			var page = "${pi.currentPage }";
			$("#delete").on("click",function(){
				var result= confirm("삭제하시겠습니까?");
				if(result){
					location.href="groupDelete.do?groomingNo="+groomingNo+'&gBoardNo='+gBoardNo+'&page='+page;					
					alert("삭제되었습니다.");
				}
				
			})
		})
	
	
	</script>

	<jsp:include page="../common/footer.jsp" />

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>

</html>