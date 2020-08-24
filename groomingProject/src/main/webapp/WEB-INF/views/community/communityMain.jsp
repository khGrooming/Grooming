<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        
<!--datatable-->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
  	      
<!--jQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
      
<title>Insert title here</title>
<style>
    /*datatable css*/
    div.dataTables_wrapper {
        width: 70rem;
        margin: 0 auto;
    }
</style>
</head>
<body>
<header>
	<jsp:include page="../common/mainNavigationBar.jsp" />
	<br><br>
</header>
<!--내용 시작-->
<section>
	<div class="container-fluid">
    	<div class="row">
    		<div class="col-12">
        		<div class="container">
					<div class="btn-group btn-group-toggle btn-lg btn-block" data-toggle="buttons" style="margin:100px 0;">
  						<label class="btn btn-outline-info active">
    						<input type="radio" id="showcommunityMain" onclick="showBoard(0);" autocomplete="off" checked> 커뮤니티
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
       				
       				<div class="container"  id="StudyConfirm" style="display:none;">
 						
       				</div>	
       				
       				<div class="container"  id="QnA" style="display:none;">
 						<jsp:include page="../community/communityQnA.jsp" />
       				</div>		
				</div>
    		</div>
		</div>
	</div>
</section>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>

<!-- dataTable -->
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/r-2.2.5/sc-2.0.2/datatables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.3.1/js/dataTables.fixedColumns.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
 
<script>
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

</body>
</html>