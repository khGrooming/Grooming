<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">

	<%-- <link href="${pageContext.servletContext.contextPath }/resources/views/css/memberLoginRegistration.css" rel="stylesheet"> --%>

<style type="text/css">
*
{
	margin: 0;
	padding: 0;
	/* box-sizind: border-box; */
}
section
{
	position: relative;
	min-height: 91vh;
	/* background: #fee648; */
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}
#profileImg{
	cursor:Pointer;
}

#content_my{
    margin-right: auto;
    margin-left: 5%;

}
  .subContent_my{
    height: 100%;
    /* border:1px solid black; */
    float: left;
}
        .profile_my{
            margin-top: 10%;
            height: 160px; 
/*             
            margin-left: auto;
            margin-right: auto;
            width: 150px;
            border-radius: 50%;
            border:2px solid gray;
            z-index: 10; */
        }
       #memo{
        width: 75%;   
        margin-left: auto;
           margin-right:auto;  
           height:100px;
           
       }
       #memoTextArea{
        width: 100%;   
        margin-left: auto;
        margin-right:auto;  
        height:100px;
        font-size: 13px;
       }
       #expBox{
           width: 75%;
           height: 15px;
           margin-top:1%;
           margin-left: auto;
           margin-right:auto;
           margin-bottom: 3%;
           border:1px solid gray;
           text-align: center;
       }

       #expBar{
        width: 25%; 
        height: 13px;
        background-color: yellow; 
        position: absolute;
       }
               section1 {
            display: none;
            padding: 20px 10px 10px 10px;
            border: 3px solid #ddd;
            height: 500px;
            }

        /*라디오버튼 숨김*/
          input {
              display: none;}

        label {
            display: inline-block;
            margin: 0 0 -3px;
            padding: 15px 25px;
            font-weight: 600;
            text-align: center;
            color: #bbb;
            border: 1px solid #ddd;
            border-top-left-radius: 6px;
            border-top-right-radius: 6px;

            }

        label:hover {
            color: #2e9cdf;
            cursor: pointer;}

        /*input 클릭시, label 스타일*/
        input:checked + label {
              color: #555;
              border: 3px solid #ddd;
              /* border-top: 2px solid #2e9cdf; */
              border-bottom: 3px solid #ffffff;
              }

        #tab1:checked ~ #content1,
        #tab2:checked ~ #content2,
        #tab3:checked ~ #content3,
        #tab4:checked ~ #content4 {
            display: block;}

        .profile_img{
            width: 150px; transform:translate(-50%);
                height: 150px; 
                border-radius: 50%; 
                position: absolute;
        }
        .grayBox{
            height: 50px;
            border:1px solid lightgray;
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
	.submenu{
      display:inline-block;
      /* background:yellowgreen; */
      font-size:20px;
      text-align:center;
      line-height:50px;
      width:10%;
      height:50px;
      margin-left:5%;
      margin-right:5%;
     
   }
   .submenu a{
   	color:black;
   	text-decoration:none
   }
   .submenu:hover{
   	background: gray;
     
   }
}

</style>
</head>
<body>
	<jsp:include page="../common/mainNavigationBar.jsp" />
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	<section >
	<c:if test="${!empty profileInfo }">
	<!-- 프로필 정보 div -->
	<div class="signup form_container active" style="width: 100%;margin-top: 7%; margin-bottom: 10%"><!-- active toggle --> 
		<div class="subContent_my" style="width:25%; margin-right: 10px;text-align: center;">
		
		
			<!-- 프로필 사진 div -->
			<div class="profile_my" style="position: relative;">  
				<img src="icon.png" class="profile_img" >            
				<img src="${contextPath}/resources/upprofileFiles/${profileInfo.memberPhoto }"
				id="profileImg" class="profile_img" style="border:3px solid gray;" onclick="prpfileChange()"> 
				
				<form id="testForm" action="test1.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="memberPhoto" id="memberPhoto" value="${profileInfo.memberPhoto }">
					<input type="hidden" name="memberNo" id="memberNo" value="${profileInfo.memberNo}">
					<input type="file" name="profileFile" id="profileFile" style="display:none;" onchange="test2();">
				</form>
				
		    </div><!-- 프로필 사진 div_end -->
		    
		    <br>
		    
		    <!-- 닉네임/ 레벨 영역-->
			<span style="font-size: 25px;font-weight: 800;margin-right: 2%;">${profileInfo.memberNickName}</span>
			<span>&nbsp;&nbsp;</span>
			<span style="font-size:15px; color:darkgray">Lv.${profileInfo.lvl }</span>
			<!-- 레벨에 대한 설명을 보여줄 툴팁 추가해야함!!! -->
		    <br>
		    
		    <!-- 경험치_div -->
		     <div id="expBox" style="position: relative;">
                <div style="font-size: 10px; position: absolute; z-index: 100;  margin-left: 45%;"> ${profileInfo.memberExp } / ${profileInfo.lvlMaxExp }</div>
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
            </div><!-- 경험치 div_end -->
            
            <!-- 이메일 영역-->
            <p id="MemberEmail" style="color: rgba(123, 123, 123, 1); letter-spacing:0.5em">${profileInfo.memberEmail }</p>
            <br>
            
            <!-- 상태메시지 -->
            <div id="memo">
	            <span id="counter">###</span>
            	<textarea id="memoTextArea" style="letter-spacing:0.3em" maxlength="100"><c:if test="${profileInfo.memberMemo ne 'NULL' }">${profileInfo.memberMemo}</c:if></textarea>
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
	                		$('#memoTextArea').val("${profileInfo.memberMemo}");
	                	}
	                	
	                })
	                
	                
	         	 });
	          
	            
            
            </script>
            <br>
            <br>
            
            <!-- 포인트 div -->
            <div style=" width: 75%; margin-left: auto;  margin-right:auto; ">
                <p style="font-size: 20px; font-weight: 900; margin-bottom: 5px; float: left;">포인트</p>
                <br clear="both">
                <div class="grayBox" style="height: 85px;">
                    <p style="font-size: 28px; font-weight:bold; margin-bottom: auto; height: 50px; margin-top: 20px; letter-spacing:0.3em;"> ${profileInfo.nowPoint } G</p>
                </div>

            </div>
            
            
            <br>
            <br>


			<!-- ★  -->
			<!-- 리스트를 뿌려짐 -->
			<!-- 리스트에서 3개이하는 '+'버튼 넣는거 해야함 -->
			<!-- 테이블 보이는거 바꿔야함 text-align-->
			<!-- 스펙추가하기 기능을 넣어야 함 -->
            <!-- 스펙 div -->
             <div style=" width: 75%; margin-left: auto;  margin-right:auto; ">
                <p style="font-size: 20px; font-weight: 900; margin-bottom: 5px; float: left;">스펙</p>
                <br clear="both">
                <div class="grayBox" style="height: 200px;">
                    <table>
				
						<tr>
							<th>학교</th>	
							
							
						</tr>
				
							<c:forEach var="s" items="${schoolList}" >
							<tr>
								<td></td><td>${s}</td>
							</tr>
							</c:forEach>
						<tr>
							<th>자격증</th>
						</tr>
						<c:forEach var="s" items="${certificateList}" >
						<tr>
								<td></td><td>${s}</td>
						</tr>
							</c:forEach>
						<tr>
							<th>경력</th>
						</tr>
						<c:forEach var="s" items="${careerList}" >
							<tr>
								<td></td><td>${s}</td>
						</tr>
						</c:forEach>
				
					</table>
                </div>

            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            
		</div><!-- 프로필 정보 div_end -->
		
		

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
	
				<div class="subContent_my" style="width: 70%; height: 50px; border:1px solid rgba(229, 229, 229, 1);   border-radius:10px; ">
					<div class="menubar">
					  	<div class="nav">
					  		<div class="submenu"><a href="#">개인정보</a></div>
					  		<div class="submenu"><a href="#">스터디</a></div>
					  		<div class="submenu"><a href="#">찜목록</a></div>
					  		<div class="submenu"><a href=#">활동내역</a></div>
					  		<div class="submenu"><a href="#">포인트</a></div>
					  	</div>
					  </div>
				</div>
				<br><br><br>
				<div class="subContent_my" style="width: 70%;">				
					<jsp:include page="./test.jsp" />
				</div>
     
					
				
				
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
   
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>

</body>
</html>