<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

    <!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
     integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
   
 
<%-- 	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/summernote-lite.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/views/summernote-lite.css"></script> --%>
<%-- 	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/summernote-ko-KR.js"></script> --%>
    <title>Hello, world!</title>
    <style>
        body{
            height: 1200px;
        }
        /* div의 크기에 맞춤 */
        img {
            max-width: 100%;
            max-height: 100%;
        }

  
  
        .table{
            text-align: center;
            border-radius:15px;
        }
        
        @font-face { 
			font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
    	    font-weight: normal; 
    	    font-style: normal; 
   		}
   
	   * {
	      font-family:"TmoneyRoundWindExtraBold";
	   }
	   
	   .table tr th{
	   		vertical-align:center;
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
	   
    </style>
</head>

<body>
    <!-- 헤더시작 -->
	<jsp:include page="../common/mainNavigationBar.jsp" />

    <!-- 섹션 시작 -->
	
    <!-- 컨테이너로 양옆에 공백 생성 -->
    <div class=container style="margin-top:150px ; ">
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
	

        <!-- 메인에 들어갈 내용용 -->
        <section style="margin-top:100px;">



            <div class="container">

                <table class="table table-bordered">


                <form action="groupUpdate.do" method="post" enctype="multipart/form-data" id="form">
                    <input type="hidden" name="page" value="${page}">
                    <input type="hidden" name="groomingNo" value="${grooming.groomingNo}">
                    <input type="hidden" name="gBoardNo" value="${g.gBoardNo }">
                    <input type="hidden" name="memberNo" value="${loginUser.memberNo }">
                    
                        <tr>
                            <th>작성게시판 </th>
                            <td>
                            	<c:if test="${loginUser.memberNo eq grooming.memberNo }">
	                            	<c:if test="${g.gBoardCategory eq '자유' }">
		                                <label><input type="radio" name="gBoardCategory" class="board" value="자유" checked>자유게시판</label>
		                                <label><input type="radio" name="gBoardCategory" class="board" value="공지">공지사항</label>
	                            	</c:if>
	                            	<c:if test="${g.gBoardCategory eq '공지' }">
		                                <label><input type="radio" name="gBoardCategory" class="board" value="자유" >자유게시판</label>
		                                <label><input type="radio" name="gBoardCategory" class="board" value="공지" checked>공지사항</label>
	                            	</c:if>
                            	</c:if>
                            	<c:if test="${loginUser.memberNo ne grooming.memberNo }">
                                <label><input type="text" name="gBoardCategory" class="board" value="자유" hidden>자유게시판</label>
                            	</c:if>
                            	
                            </td>
                        </tr>
                        <tr>
                            <th>제목: </th>
                            <td><input type="text" placeholder="제목을 입력하세요. " name="gBoardTitle" class="form-control" value="${g.gBoardTitle }" required></td>
                        </tr>
                        <tr>
                            <th>내용: </th>
                            <td><textarea cols="10" rows="20" placeholder="내용을 입력하세요." id="content" name="gBoardContent"
                                    class="form-control" style="resize:none;" required></textarea></td>
                        </tr>
                        <tr>
                            <th>첨부파일: </th>
                            <td>
                            	<div class="filebox preview-image">
											<img src="${contextPath }/resources/upGroomingFiles/${g.gBoardImg}" id="UImg" style="width:300px;height:150px;"> 
											<input class="upload-name" value="파일선택" disabled="disabled" >
											<label for="input-file">업로드</label> 
											<input type="file" id="input-file" class="upload-hidden" name="uploadFile">
								</div>
                            </td>
                        </tr>
                      
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="수정">
                                  <c:url var="gDetail" value="groupDetail.do">
										<c:param name="gBoardNo" value="${g.gBoardNo}"/>
										<c:param name="page" value="${page }"/>
										<c:param name="groomingNo" value="${grooming.groomingNo}"/>
										<c:param name="memberNo" value="${loginUser.memberNo }"/>
								</c:url> 
                                <input type="button" value="취소" onclick="location.href='${gDetail}'">
                            </td>
                        </tr>
                    </form>

                </table>

            </div>	
            <input type="hidden" value="${g.gBoardContent }" id="textareaContent">





        </section>
        <script>
			$(function(){
			
				var textareaContent = $("#textareaContent").val();
				var content = $("#content");
				if(textareaContent != null){
					content.text(textareaContent);
				}
			})
			
		</script> 
    <!--     <script >
            $(document).ready(function() {
                  $('#summernote').summernote({
                	 	height:500,
                        placeholder: 'content',
                        minHeight: null,
                        maxHeight: null,
                        focus: true, 
                        lang : 'ko-KR'
                  });
                });
            </script>
 -->

		<script>
			// 파일 업로드 관련 script
			$(document).ready(function() {

								var fileTarget = $('.filebox .upload-hidden');

								fileTarget.on('change',function() {
													if (window.FileReader) {
														// 파일명 추출
														var filename = $(this)[0].files[0].name;
													}

													else {
														// Old IE 파일명 추출
														var filename = $(this).val().split('/').pop().split('\\').pop();
													};

													$(this).siblings(
															'.upload-name')
															.val(filename);
												});

								//preview image 
								var imgTarget = $('.preview-image .upload-hidden');	// api에서 기존에 있었던 이미지
								var imgTarget1 = $('.preview-image #UImg');	// 원래 업로드 하여 사용중이었던 이미지
								imgTarget.on('change',function() {
												var parent = $('.preview-image .upload-hidden').parent();
												parent.children('.upload-display').remove();
												imgTarget1.remove();
							if (window.FileReader) {
							//image 파일만
									if (!$(this)[0].files[0].type.match(/image\//))
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
								img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+ imgSrc+ "\")";
							}
												});
									});
		</script>


    </div>


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