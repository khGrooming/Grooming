<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
     integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">


    <script src="http:/code.jquery.com/jquery-latest.min.js"></script>
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

        /* 인라인 형식의 출력 */
        #tab1:checked~#content1,
        #tab2:checked~#content2,
        #tab3:checked~#content3{
            display: block;
        }

        /* 각 탭의 메뉴의 내용 */
        section {
            display: none;
            padding: 20px 10px 10px 10px;
            border: 3px solid #ddd;
            height: 700px;
        }

        /*라디오버튼 숨김*/
        input {
            display: none;
        }

        /* 탭메뉴 태그 마우스 올릴시 */
        label:hover {
            color: #2e9cdf;
            cursor: pointer;
        }

        /* 태그 메뉴 css */
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
        /*input 클릭시, label 스타일*/
        input:checked+label {
            color: #555;
            border: 3px solid #ddd;
            /* border-top: 2px solid #2e9cdf; */
            border-bottom: 3px solid #ffffff;
        }
        .table{
            text-align: center;
        }
    </style>
</head>

<body>
    <!-- 헤더시작 -->
    <header>
      	<jsp:include page="../common/mainNavigationBar.jsp" />
    </header>

    <!-- 섹션 시작 -->

    <!-- 컨테이너로 양옆에 공백 생성 -->
    <div class=container style="margin-top:150px ; ">
        <!--디폴트 메뉴-->
        <input id="tab1" type="radio" name="tabs" >
        <label for="tab1"><i class="fas fa-user-graduate"></i>메인</label>

        <input id="tab2" type="radio" name="tabs">
        <label for="tab2"><i class="fas fa-calendar-alt"></i>캘린더</label>

        <input id="tab3" type="radio" name="tabs" checked>
        <label for="tab3"><i class="fas fa-icons"></i>게시판</label>


        <!-- 메인에 들어갈 내용용 -->
        <section id="content1">
         
               <!-- 그루밍 제목 -->
                <h2 style="margin-top:20px; margin-left:20px;" align="left">Spring Project Fighting</h2>
                <!-- 그루밍 한줄 소개 -->
                <p  style="margin-top:20px; margin-left:20px;" align="left">스프링 프로젝트 열심히해서 포트폴리오에 자신있게 씁시다~~~~~~~~~~~~~~~~</p>
                <div class="row">
                    <div class="col-4" style="width: 20%;">
                        <table>
                            <tr>
                                <div class="gimg"
                                    style="width: 300px; height:300px;  margin-left: 50px; margin-top: 50px; position: relative;">
                                    <!-- 그룹 이미지 들어갈 곳 -->
                                    <img src="${contextPath }/resources/views/images/박재범.jpg"> 
                                </div>
                            </tr>

                        </table>
                    </div>

                    <div class="col-8" style=" margin-top: 50px; width:80%; ">
                        <table class="table">
                            <thead>
                                <!-- 멤버 정보 목록 -->
                                <tr>
                                    <th scope="col" style="width: 200px;">프로필</th> 
                                    <th scope="col" style="width: 200px;">닉네임</th>
                                    <th scope="col" style="width: 200px;">이메일</th>
                                    <th scope="col" style="width: 200px;">연락처</th>
                                    <th scope="col" style="width:200px;">회원</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="pimg" style="width:40px; height:40px; "><img src="${contextPath }/resources/views/images/박재범.jpg"></div>
                                    </td>
                                    <td>아이유</td>
                                    <td>gdoeb@naver.com</td>
                                    <td>01051704587</td>
                                    <td>멘토</td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="pimg" style="width:40px; height:40px; "><img src="${contextPath }/resources/views/images/박재범.jpg"></div>
                                    </th>

                                    <td>Jacob</td>
                                    <td>2323@naver.com</td>
                                    <td>02616161</td>
                                    <td>스터디원</td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="pimg" style="width:40px; height:40px;"><img src="${contextPath }/resources/views/images/박재범.jpg"></div>
                                    </th>
                                    <td>maroon5</td>
                                    <td>sugar@naver.com</td>
                                    <td>01051876123</td>
                                    <td>스터디원</td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="pimg" style="width:40px; height:40px;"><img src="${contextPath }/resources/views/images/박재범.jpg"></div>
                                    </th>
                                    <td>손담비</td>
                                    <td>미쳤어@naver.com</td>
                                    <td>1515111531</td>
                                    <td>스터디원</td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="pimg" style="width:40px; height:40px;"><img src="${contextPath }/resources/views/images/박재범.jpg"></div>
                                    </th>
                                    <td>원빈</td>
                                    <td>Onebin@naver.com</td>
                                    <td>1531313513</td>
                                    <td>스터디원</td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="pimg" style="width:40px; height:40px;"><img src="${contextPath }/resources/views/images/박재범.jpg"></div>
                                    </th>
                                    <td>방탄유리</td>
                                    <td>Yuri@naver.com</td>
                                    <td>777888877777</td>
                                    <td>스터디원</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            
    
    </section>
	
	<!-- 캘린더 내용 (일정 관리/출석 체크) -->
    <section id="content2">
       
    </section>

    <!--게시판에 들어갈 내용 -->
    <section id="content3">
        
        <table class="table table-hover" id="boardId">
            <thead>
              <tr>
                <th scope="col">글유형</th>
                <th scope="col">글번호</th>	<!-- 공지사항/자유게시판 -->
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">조회수</th>
              </tr>
            </thead>
            <tbody>
              <tr onclick="location.href='groupdetail.do'">
                <th scope="row">1</th>
                <td>공지사항</td>
                <td>내일 예정이었던 스터디디</td>
                <td>김성훈</td>
                <td>2020-07-12</td>
                <td>2</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>공지사항</td>
                <td>내일 늦으면 과제 2배에요요</td>
                <td>김성훈</td>
                <td>2020-07-17</td>
                <td>1</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>공지사항</td>
                <td>시험이 일주일 남았네요요</td>
                <td>김성훈</td>
                <td>2020-07-27</td>
                <td>4</td>
              </tr>
              <tr>
                <th scope="row">4</th>
                <td>자유게시판</td>
                <td>금요일에 만나요</td>
                <td>아이유유</td>
                <td>2020-07-12</td>
                <td>1</td>
              </tr>
              <tr>
                <th scope="row">5</th>
                <td>자유게시판</td>
                <td>묘해 너와</td>
                <td>디에이드</td>
                <td>2020-07-22</td>
                <td>1</td>
              </tr>
              <tr>
                <th scope="row">6</th>
                <td>자유게시판</td>
                <td>purpose</td>
                <td>etham</td>
                <td>2020-07-12</td>
                <td>12</td>
              </tr>
              <tr>
                <th scope="row">7</th>
                <td>자유게시판</td>
                <td>너랑나</td>
                <td>아이유</td>
                <td>2020-07-12</td>
                <td>12</td>
              </tr>
              <tr>
                <th scope="row">8</th>
                <td>자유게시판</td>
                <td>비도 오고 그래서</td>
                <td>헤이즈</td>
                <td>2020-07-12</td>
                <td>12</td>
              </tr>
              <tr>
                <th scope="row">9</th>
                <td>자유게시판</td>
                <td>디키즈 크루 모집</td>
                <td>양홍원</td>
                <td>2020-07-12</td>
                <td>12</td>
              </tr>
              <tr>
                <th scope="row">10</th>
                <td>자유게시판판</td>
                <td>내일 스터디 바나프레소에서 모여요</td>
                <td>김성훈</td>
                <td>2020-07-12</td>
                <td>12</td>
              </tr>

            </tbody>
        
          </table>
          
          <!-- 글작성 버튼 -->
 	       <div class="col-12" align="right">
          	<button type="button"  style="margin-right:10px;" id="ib" onclick="location.href='groupBoardInsertForm.do'") >글 작성</button>
          </div>
          
    
          
          <!-- 페이지네이션 -->
          <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
              <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#">Next</a>
              </li>
            </ul>
          </nav>
    </section>

</div>


    <footer>


    </footer>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>

</html>