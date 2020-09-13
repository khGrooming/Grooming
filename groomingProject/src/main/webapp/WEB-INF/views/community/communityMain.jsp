<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
<!--datatable-->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
    /*datatable css*/
    div.dataTables_wrapper {
        width: 70rem;
        margin: 0 auto;
    }
    section .btn-group-toggle{
		font-family: 'Jua', sans-serif;
    }
</style>
</head>
<body>
<header>
	<jsp:include page="../common/mainNavigationBar.jsp" />
	<br><br>
</header>
<!--내용 시작-->
<!-- <section style="padding-top: 0.10rem;"> -->
<section>
	<div class="container-fluid">
    	<div class="row">
    		<div class="col-12">
        		<div class="container">
					<div class="btn-group btn-group-toggle btn-lg btn-block" data-toggle="buttons" style="margin:100px 0; margin-bottom: 50px;" id="buttonGroup">
  						<label class="btn btn-outline-info active">
    						<input type="radio" id="showcommunityMain" onclick="showBoard(0);" autocomplete="off"> 커뮤니티
  						</label>
  						<label class="btn btn-outline-info">
    						<input type="radio" id="showNotice" onclick="showBoard(1);" autocomplete="off"> 공지사항 
  						</label>
  						<label class="btn btn-outline-info">
    						<input type="radio" id="showFreeBoard" onclick="showBoard(2);" autocomplete="off"> 자유 게시판
  						</label>
  						<label class="btn btn-outline-info">
    						<input type="radio" id="showStudyPromotion" onclick="showBoard(3);" autocomplete="off"> 내 스터디 홍보
  						</label>
  						<label class="btn btn-outline-info">
    						<input type="radio" id="showStudyConfirm" onclick="showBoard(4);" autocomplete="off"> 스터디 인증
  						</label>
  						<label class="btn btn-outline-info">
    						<input type="radio" id="showQnA" onclick="showBoard(5);" autocomplete="off"> Q&A
  						</label>
					</div>
        		</div>
        
        		<div class="row">
        			<div class="container"  id="communityMain">
 						<jsp:include page="../community/communityMainForm.jsp" />
       				</div>
        		
                	<div class="container" id="Notice" style="display:none; text-align: center;">
                    	<jsp:include page="../community/communityNotice.jsp" />
            	 	</div>
               
                    <div class="container mx-auto" id="FreeBoard" style="display:none;">
                    	<jsp:include page="../community/communityFreeBoard.jsp" />
					</div>  
					  
					<div class="container"  id="StudyPromotion" style="display:none;">
 						<jsp:include page="../community/communityStudyPromotion.jsp" />
       				</div>		
       				
       				<div class="container"  id="QnA" style="display:none;">
 						<jsp:include page="../community/communityQnA.jsp" />
       				</div>		
       				
       				<div class="container"  id="StudyConfirm" style="display:none;">
 						<jsp:include page="../community/communityStudyConfirm.jsp" />
       				</div>	
       				
				</div>
    		</div>
		</div>
	</div>
	<br><br><br>
</section>

<!-- dataTable -->
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/r-2.2.5/sc-2.0.2/datatables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.3.1/js/dataTables.fixedColumns.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

<input type="hidden" id="bCategoryNo" value="${bCategoryNo}">

<script>
	$(document).ready(function() {
		var categoryVal = $("#bCategoryNo").val(),
			showcommunityMain = $("#showcommunityMain"),
			showNotice = $("#showNotice"),
			showFreeBoard = $("#showFreeBoard"),
			showStudyPromotion = $("#showStudyPromotion"),
			showStudyConfirm = $("#showStudyConfirm"),
			showQnA = $("#showQnA");
/* 		[
			showcommunityMain,
			showNotice,
			showFreeBoard,
			showStudyPromotion,
			showStudyConfirm,
			showQnA
		].forEach(function(btn){
			btn.parents().removeClass('active');
		}) */
		$(".btn-outline-info").removeClass("active");
		
		console.log(categoryVal);
		
		if(categoryVal == 'BC00001'){
			showNotice.parents(".container").addClass('active');
			showNotice.attr("checked", true);
			showBoard(1);
			
		}else if(categoryVal == 'BC00002'){
			showFreeBoard.parents(".container").addClass('active');
			showFreeBoard.attr("checked", true);
			showBoard(2);
			
		}else if(categoryVal == 'BC00003'){
			showStudyPromotion.parents(".container").addClass('active');
			showStudyPromotion.attr("checked", true);
			showBoard(3);
		
		}else if(categoryVal == 'BC00004'){
			showStudyConfirm.parents(".container").addClass('active');
			showStudyConfirm.attr("checked", true);
			showBoard(4);
			
		}else if(categoryVal == 'BC00005'){
			showQnA.parents(".container").addClass('active');
			showQnA.attr("checked", true);
			showBoard(5);
			
		}else{
			showcommunityMain.parents(".container").addClass('active');
			showcommunityMain.attr("checked", true);
			showBoard(0);
		}
		
	});

	function showBoard(num){
		if(num==0){
			$("#communityMain").css("display","block");
			$("#Notice").css("display","none");
			$("#FreeBoard").css("display","none");
			$("#StudyPromotion").css("display","none");
			$("#StudyConfirm").css("display","none");
			$("#QnA").css("display","none");
			
			
		}else if(num==1){
			$("#Notice").css("display","block");
			$("#communityMain").css("display","none");
			$("#FreeBoard").css("display","none");
			$("#StudyPromotion").css("display","none");
			$("#StudyConfirm").css("display","none");
			$("#QnA").css("display","none");
			
			
		}else if(num==2){
			$("#FreeBoard").css("display","block");
			$("#communityMain").css("display","none");
			$("#Notice").css("display","none");
			$("#StudyPromotion").css("display","none");
			$("#StudyConfirm").css("display","none");
			$("#QnA").css("display","none");
			
		}else if(num==3){
			$("#StudyPromotion").css("display","block");
			$("#communityMain").css("display","none");
			$("#Notice").css("display","none");
			$("#FreeBoard").css("display","none");
			$("#StudyConfirm").css("display","none");
			$("#QnA").css("display","none");
			
		}else if(num==4){
			$("#StudyConfirm").css("display","block");
			$("#communityMain").css("display","none");
			$("#Notice").css("display","none");
			$("#FreeBoard").css("display","none");
			$("#StudyPromotion").css("display","none");
			$("#QnA").css("display","none");
			
		}else{
			$("#QnA").css("display","block");
			$("#communityMain").css("display","none");
			$("#Notice").css("display","none");
			$("#FreeBoard").css("display","none");
			$("#StudyPromotion").css("display","none");
			$("#StudyConfirm").css("display","none");
		};
	}
</script>
<%-- 	<br><br>
	<jsp:include page="../common/footer.jsp" /> --%>
</body>
</html>