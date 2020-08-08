<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--   <script src="http:/code.jquery.com/jquery-latest.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">


    <title>Hello, world!</title>
    <style>
    	body{
    		height:1200px;
    	}

        /*폰트 설정 */
        @font-face {
            font-family: 'TmoneyRoundWindExtraBold';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;

        }

        * {
            font-family: "TmoneyRoundWindExtraBold";
        }

       .groomingImage{
       	width:450px;
       	height:550px;
        background-image:url("${contextPath }/resources/views/images/book.png");
        background-size:cover;
        border:1px solid lightgreen;
       }
		
		.status{
			border-radius:10px;
			border:1px solid black; 
			width:80px; 
			height:40px;
			text-align:center;
			color:red;
			margin-bottom:20px;
		}
		.pimg{
			   background-image:url("${contextPath }/resources/views/images/박재범.jpg");
			  background-size:cover;
			  width:100px; height:90px;
		}
     	
    </style>
</head>

<body>

    <header>
        <jsp:include page="../common/mainNavigationBar.jsp" /> 
    </header>


    <section>
        <div class="container" style="margin-top:150px;">
        	
            <div class="row">
                <div class="col-9">
                    <table>
                    	<tr><td><br></td></tr>
                        <tr><td><h3>초보 JAVA스터디</h3></td></tr>
                        <tr><td><span>모집 기간 : </span><span>2020/08/01 ~ 2020/08/25</span></td></tr>
                        
                    </table>
                </div>
                <div  style="text-align:right; margin-left:70px;">
                    <table >
						<tr>
							<td align="right"><div class="status" ><h4>모집중</h4></div></td>
						</tr>
						<tr>
							<td>
								&nbsp;<i class="far fa-bookmark"></i>&nbsp;&nbsp;
								<a href="#" onclick="">신고</a>
							</td>
						
                    	</tr>
                    	<tr>
                    		<td>
                    			<span>작성일 :2020/08/01</span>
                    		</td> 
                    	</tr>
                    	<tr>
							<td>
                    			<span>조회수 : </span><span>40</span>
                    		</td>
                    	</tr>	
                    </table>
                </div>
            </div>

        </div>
         <div class="container" style="margin-top:20px;">
            <div class="row">
                <div class="col-5">
                        <table>
                            <tbody>
                                <tr>
                                    <td><div class="groomingImage"></div></td>
                                </tr>
                            </tbody>
                        </table>
            
                </div>

                <!-- 컨테이너 우측 -->
                 <div class="col-7">
                   <table>
                            <tbody>
	
                              	<tr>
                              		<td style="padding-right:20px;"><div class="pimg" ></div></td>
                              		<td>호스트 : <span>박재범</span><br>
                              			<span style="color:lightblue;">#AOMG#좋아#자바</span><br>
                              		경력 : <span>서울대학교 전기전자공학부 석사 / 정보처리기사 , Cad, 한국사 1급</span>
                              		</td>
                              		
                              	</tr>
                            
                            
                            </tbody>
                        </table>
                        <br>
                    <table>	
                    		<tr>
                    			<td><span>그룹 타입 : </span><span>호스트</span>
                    		</tr>
                    		<tr>
    	                          	<td><span>스터디 기간 :</span><span>2020/08/25~2020/10/24</span></td>
                              	</tr>
                              	
                              	<tr>
                              		
                              		<td><span>예치금 : </span>1000원</td>
                              	</tr>
                              	<tr>
                              		<td><span>모집인원  : 2/6명</span></td>
                              	</tr>	
                              
                              <tr>
                              	<td><br><h4>모두의 합격을 도와드리겠습니다~ 같이 스터디 해요!</h4></td>
                              </tr>
                              
                              <tr>
                              <td>
                              	<p>
                              	비밀모임 소개<br>
								2차 모임 운영기간 : ~6/15<br>
								이 모임은 특별히 인증해야하는 미션이 없습니다.<br>
								자신이 원하는 정보와 자료를 마음껏 얻어가실 수 있는 모임입니다.<br>
								<hr>
								단기합격자가의 공부기록들을 보면서 단기합격과 고득점에 효율적인 공부 방법을 배워가실 수 있습니다.<br>
								이런분께 도움이 됩니다.<br>
								* 합격하고 싶으나, 공부방법에 대해 확신이 안 서시는 분<br>
								*10개월 단기 합격 공부방법의 모든 것을 알고싶으신 분<br>
								*필기합격에 관한 공부 자료, 정보를 얻고 싶으신 분<br>
								*면접에 관한 공부 자료, 정보를 얻고 싶으신 분<br>
								<hr>
								비밀모임 커리큘럼<br>
								*과목별 공부법 공개<br>
								*시기별 공부법 공개<br>
								*학습 스케줄러 공개<br>
								*필기합격수기 공개<br>
								*면접 후기 공개<br>
                              	</p>
                              	</td>
                              </tr>
                    </table>
                   
                </div> 
            </div>
        </div> 
      
    </section>


    <footer> </footer>


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