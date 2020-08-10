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
    		height:auto;
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
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/TmoneyRoundWindExtraBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
      
        }

        * {
            font-family: "TmoneyRoundWindExtraBold";
        }
        
        /* image삽입 div */
     	#image{
     		width:400px;
     		height:300px;
     		background-color:lightgray;
     		border-radius:10px;
     	    display: table-cell;
    		vertical-align: middle;
    		text-align:center;
     	}
     	
     	
     	.icon{
     		font-size:50px;
     		color:white;
     	 
     	}
     	section{
     		margin-bottom:100px;
     	}
     	
     	.study tbody tr td{
     		padding:10px;
     	}
     	
     	/* 3D Button */
		.btn-3d {
			position: relative;
			display: inline-block;
			font-size: 12px;
			padding: 20px 60px;
			color: white;
			margin:10px;
			border-radius: 6px;
			text-align: center;
			transition: top .01s linear;
			text-shadow: 0 1px 0 rgba(0,0,0,0.15);
		}
		
		.btn-3d.green:hover  {background-color: #80C49D;}
		  {background-color: #82D1E3;}
		
		.btn-3d:active {
			top: 9px;
		}
		
		
		
		.btn-3d.green {
			background-color: #82c8a0;
			box-shadow: 0 0 0 1px #82c8a0 inset,
						0 0 0 2px rgba(255,255,255,0.15) inset,
						0 8px 0 0 rgba(126, 194, 155, .7),
						0 8px 0 1px rgba(0,0,0,.4),
						0 8px 8px 1px rgba(0,0,0,0.5);
		}
		.btn-3d.green:active {
			box-shadow: 0 0 0 1px #82c8a0 inset,
						0 0 0 2px rgba(255,255,255,0.15) inset,
						0 0 0 1px rgba(0,0,0,0.4);
		}




    </style>
</head>

<body>

    <header>
        <jsp:include page="../common/mainNavigationBar.jsp" />
    </header>


    <section>

        <div class="container" style="margin-top: 150px; border:3px solid lightgreen; border-radius:10px;">
        	<div  class="row">
        	
        
            <div class="col-7">
                <form>
                    <table class="study">
                    <tbody>
                    
                          
                        <tr>
                            <td><span>스터디 그룹 이름</span><br><input type="text" size="50" placeholder="스터디 그룹 이름을 입력해주세요" id="title"><br>
                                <small><span style="color: lightblue">간략하면서 주제가 잘 들어난 이름이 좋아요</span></small>
                                <small><span style="color: #aaa;" id="counterTitle">(0/40)</span></small></td>

                        </tr>
                        <tr>
                            <td><label>타입</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="group">멘토 그룹</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="group">자유 그룹</label></td>
                        </tr>
                        
                        <tr>
                            <td><span>한줄 소개</span><br><input type="text" size="50" placeholder="스터디 그룹 한줄 소개를 입력해주세요" id="introduce"><br>
                                <small><span style="color: lightblue">이목을 집중할
                                        한마디면 충분해요!</span></small> <small><span style="color: #aaa;"
                                        id="counterIntroduce">(0/60)</span></small></td>

                        </tr>
                        <tr>
                            <td><span>활동
                                    인원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="number" max="6" min="2"
                                    style="text-align: center;"><span>&nbsp;&nbsp;명</span><br>
                                    <small><span style="color: lightblue;">2~6명으로 인원을 구성해주세요</span></small>
                            </td>
                        </tr>
                        <tr>
                            <td><span>내용</span><br> <textarea cols="50" rows="10" placeholder="구체적인 활동 내용을 적어주세요!"
                                    id="content" style=""></textarea>
                                <small><span style="color: #aaa;" align="right"
                                        id="counterContent">(0/480)</span></small></td>

                        </tr>
                        <tr>
                            <td><label>예치금</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="money" id="exist">있음</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label><input type="radio" name="money"
                                        id="nonexist">없음</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="number" min="2000" step="1000" style="text-align: center; width:100px;"
                                    id="money"><span>원</span></td>
                        </tr>

                      
                        <tr>
                            <td><span>해시 태그</span><br><input type="text" size="50" placeholder="그룹을 해시태그로 표현해주세요" id="hash"><br> <small><span
                                        style="color: lightblue">해쉬태그는 2개이상 등록해주세요!</span> <span style="color: #aaa;"
                                        align="right" id="hashCount">0개</span></small></td>

                        </tr>
					
					</tbody>
                    </table>
                </form>
            </div>

            <!-- 컨테이너 우측 -->
            <div class="col-5">
                <form>
                    <table class="study">
                    <tbody>
                        <tr>
                            <td><span>스터디  진행 기간</span><br> <input type="date">
                                ~ <input type="date"><br><small> <span>스터디 그룹을&nbsp;&nbsp;<span style="color: red;">진행</span>할 기간을 설정해주세요</span></small></td>
                        </tr>
                        <tr>
                        	 <td><span>스터디 모집 기간</span><br> <input type="date">
                                ~ <input type="date"><br> <small><span>스터디 그룹을&nbsp;&nbsp;<span style="color: red;">모집</span>할 기간을 설정해주세요</span></small></td>
                        </tr>
                        <tr>
                        	<td ><span>대표이미지</span><br>
                        		<div id="image"><div class="icon"><i class="fas fa-plus"></div></i></div>
                        	</td>
                        <tr>
                        <tr>
                        	<td><button class="btn-3d green" onclick="location.href='groomingMain.do'">등록하기</button>
                      			<button class="btn-3d green" onclick="save();">취소하기</button>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
	</div>
        </div>
        <script>
        	function save(){
        		var result = confirm("임시저장 하시겠습니까?");
        		if(result){
        		    alert("임시저장되었습니다.");
        		    location.href="groomingMain.do";
        		}else{
        		    alert("취소되었습니다.");
        		    location.href="groomingMain.do";
        		}
        	}
        
        </script>
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
            // 해쉬태그개수(나중에 계산 / 미완)
            $('#hash').keydown(function (e) {
                var content = $(this).val();
                var hash = content.split("#");
                var count = 0;
                for (i = 0; i < hash.length; i++) {
                    count++;
                }
                
                $('#hashCount').html(count + "개");    //글자수 실시간 카운팅

         
                    if (window.event.keyCode == 13) {

                        if (hash.length < 2) {
                            alert("2개 이상 입력해주세요.");
                            $('#hashCount').html(count + "개");
                        } else {
                            for (i = 0; i < content.length; i++) {
                                if (content.indexOf(i) == ' ') {
                                    alert("#을 붙여서 띄어쓰기없이 해시태그 단어를 완성해주세요 ");
                                }
                            }
                        }
                    }
                
                $('#hashCount').html(count + "개");
            })
        
   

        </script>
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