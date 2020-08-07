<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!--   <script src="http:/code.jquery.com/jquery-latest.min.js"></script> -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
  integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">


    <title>Hello, world!</title>
    <style>
         textarea{
            height:300px;
            border-radius: 5px;
        }
        input{
            border-radius:5px;
        }
        
	  @font-face { 
			font-family: 'TmoneyRoundWindExtraBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
    	    font-weight: normal; 
    	    font-style: normal; 
   		}
   
	   * {
	      font-family:"TmoneyRoundWindExtraBold";
	   }
    </style>
</head>

<body>

    <header>
	   	<jsp:include page="../common/mainNavigationBar.jsp" />
    </header>


    <section>
   
			<div class="container" style="margin-top:150px;">
            <div class="col-6">
                <form>
                    <table>
                        <tr>
                            <td><span>스터디 그룹 이름</span></td>
                        </tr>
                        <tr>
                            <td><input type="text" size="50" placeholder="스터디 그룹 이름을 입력해주세요" id="title"><br>
                                <small><span style="color:lightblue">간략하면서 주제가 잘 들어난 이름이 좋아요</span></small>
                                <small><span style="color:#aaa;" id="counterTitle">(0/40)</span></small>

                            </td>

                        </tr>
                        <tr>
                            <td>
                                <label>타입</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="group">멘토 그룹</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="group">자유 그룹</label>
                            </td>
                        </tr>
                        <tr>
                            <td><span>한줄 소개</span></td>
                        </tr>
                        <tr>
                            <td><input type="text" size="50" placeholder="스터디 그룹 한줄 소개를 입력해주세요" id="introduce"><br>
                                <small><span style="color:lightblue">이목을 집중할 한마디면 충분해요!</span></small>
                                <small><span style="color:#aaa;" id="counterIntroduce">(0/60)</span></small>

                            </td>

                        </tr>
                        <tr>
                            <td><span>활동 인원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="number" max="6" min="2" style="text-align: center;"><span>&nbsp;&nbsp;명</span>
                             </td>
                        </tr>
                        <tr>
                            <td>
                                <span>내용</span>
                                <textarea cols="80" rows="6" placeholder="구체적인 활동 내용을 적어주세요!" id="content" style=""></textarea>
                                <small><span style="color:#aaa;" align="right" id="counterContent">(0/480)</span></small>
                            </td>
                          
                        </tr>
                        <tr>
                            <td>
                                <label>예치금</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="money" id="exist">있음</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="money" id="nonexist">없음</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="number" min="2000" step="1000" style="text-align: center;" id="money" ><span>원</span>
                             
                            </td>
                        </tr>
                        
                        <tr>
                            <td><span>해시 태그</span></td>
                        </tr>
                        <tr>
                            <td><input type="text" size="70" placeholder="그룹을 해시태그로 표현해주세요" id="hash"><br>
                                <small><span style="color:lightblue">해쉬태그는 2개이상 등록해주세요!</span>
                                <span style="color:#aaa;" align="right" id="hashCount">0개</span></small>
                            </td>

                        </tr>
                        
                        
                    </table>
                </form>
            </div>
            
            <!-- 컨테이너 우측 -->
            <div class="col-8">
				<form>
					<table>
						<tr>
							<td>
								<span>스터디 기간</span><br>
								<input type="date" > ~ <input type="date"><br>
								<span>스터디 그룹을 <p style="color:red;">진행</p>할 기간을 설정해주세요</span>							
							</td>
						</tr>
					</table>
				</form>
            </div>

</div>
        <script>
   
        	 // 그룹 이름 
            $('#title').keydown(function (e) {
                var content = $(this).val();
                $('#counterTitle').html("(" + content.length + "/40)");    //글자수 실시간 카운팅

                if (content.length > 40) {
                    alert("최대 40자까지 입력 가능합니다.");
                    $(this).val(content.substring(0, 40));
                    $('#counterTitle').html("(40/40)");
                }
            });

            // 한줄 소개
            $('#introduce').keydown(function (e) {
                var content = $(this).val();
                $('#counterIntroduce').html("(" + content.length + "/60)");    //글자수 실시간 카운팅

                if (content.length > 60) {
                    alert("최대 60자까지 입력 가능합니다.");
                    $(this).val(content.substring(0, 60));
                    $('#counterIntroduce').html("(60/60)");
                }
            });

            // 내용
            $('#content').keydown(function (e) {
                var content = $(this).val();
                $('#counterContent').html("(" + content.length + "/480)");    //글자수 실시간 카운팅

                if (content.length > 480) {
                    alert("최대 480자까지 입력 가능합니다.");
                    $(this).val(content.substring(0, 480));
                    $('#counterContent').html("(480/480)");
                }
            });
            
  
       	
        </script>
   <script>
    // 해쉬태그개수(나중에 계산)
    $('#hash').keydown(function (e) {
        var content = $(this).val();
        var hash = content.split("#");
        var count = 0;
        for(i=0; i<hash.length; i++){
           count++ ;
        }
        $('#hashCount').html(hash.length + "개");    //글자수 실시간 카운팅

        if (hash.length < 2) {
            alert("2개 이상 입력해주세요.");
            $('#hashCount').html("count"+ "개");
        }else{
        for(i=0; i<content.length; i++){
           if(content.indexOf(i) != '#'){
           alert("#을 붙여서 띄어쓰기없이 해시태그 단어를 완성해주세요 ");
        }
       }
        $('#hashCount').html("count"+ "개");
        }
        
    });
   
   </script>
    </section>


    <footer>


    </footer>


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