<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="http:/code.jquery.com/jquery-latest.min.js"></script>
    <title>Hello, world!</title>
    <style>
        #tab-menu li {
            width: 100px;
            font-size: large;
            font-weight: bold;

        }

        #tab-menu li a {
            text-align: center;
            color: black;
        }

        img {
            max-width: 100%;
            max-height: 100%;
        }

        #circle {
            width: 50px;
            height: 50px;
            border-radius: 100px;
            background: white;
            color:black;
            text-align: center;
            margin-left: 15px; 
            margin-top: 10px;
            border: 2px solid blue;
            display:table-cell;
            vertical-align:middle;
            line-height: 50px;
        }

        .top-img{
            background-image:url("${contextPath }/resources/views/images/book.png");
            background-size: cover;
            height: 200px;
            border: 2px solid skyblue;
            border-radius: 15px 15px 0px 0px;
        }
        .groupType{

            margin-left: 100px;
        }
        .card{
            border: 2px solid skyblue;
            border-radius: 15px;
        }

        .card-deck{
            margin-top: 30px;
        }
		label{
			font-size:20px;
		}

    </style>
</head>

<body>
    <!-- 헤더시작 -->
    <header>
	<jsp:include page="../common/mainNavigationBar.jsp" />
    </header>

    <!-- 섹션 시작 -->
    <section>
        <!-- 컨테이너 -->
        <div class="container" style="margin-top: 150px;">
            <!-- 필터와 검색 -->
            <div class="row">
                <div class="cols-3 search_filter" style="width: 20%; text-align: right;"  >

                    <label><input type="checkbox" name="search_filter">&nbsp;멘토 타입</label>
                    <label><input type="checkbox" name="search_filter">&nbsp;예치금 존재</label>
                </div>
                <div class="cols-9"  style="width: 80%; text-align: right; padding-right:5pxx">
                    <select>
                        <option name="title">제목</option>
                        <option name="writer">작성자</option>
                        <option name="content">내용</option>
                    </select>
                    <input type="text" size="30px">
                    <button type="submit">search</button>
                    <button type="button">글쓰기</button>
                </div>
            </div>
            <!-- 스터디 그룹 리스트 -->
            <div style="margin-top: 20px;">
                <div class="card-deck cols-4">
                    <div class="card">
                        <!-- 그룹 이미지 -->
                        <div class="top-img">
                            <!-- 그룹 d-day 태그 -->
                            <div id="circle" style="position: absolute; ">
                                D-<span style="position: relative; ">5</span>
                            </div>
                        </div>
                        <!-- 그룹 본문 -->
                        <div class="card-body">
                            <!-- 그룹 제목 -->
                            <h5 class="card-title"><a href="groupPage.do">정처기 실기 준비하실분 구해요</a></h5>
                            <!-- 그룹 한줄 소개  -->
                            <p class="card-text">정보처리기사 실기 스터디원들을 합격의 길로 80%이상 보장합니다.</p>
                            <p class="card-text">
                                <small class="text-muted">참여인원</small>&nbsp;<small><span>1</span>/<span>6</span></small>
                                <small><span class="groupType">멘토</span></small>
                            </p>

                        </div>
                    </div>
                    <div class="card">
                        <!-- 그룹 이미지 -->
                        <div class="top-img">
                            <!-- 그룹 d-day 태그 -->
                            <div id="circle" style="position: absolute;">
                                D-<span style="position: relative; ">5</span>
                            </div>
                        </div>
                        <!-- 그룹 본문 -->
                        <div class="card-body">
                            <!-- 그룹 제목 -->
                            <h5 class="card-title">정처기 실기 준비하실분 구해요</h5>
                            <!-- 그룹 한줄 소개  -->
                            <p class="card-text">정보처리기사 실기 스터디원들을 합격의 길로 80%이상 보장합니다.</p>
                            <p class="card-text">
                                <small class="text-muted">참여인원</small>&nbsp;<small><span>1</span>/<span>6</span></small>
                                <small><span class="groupType">멘토</span></small>
                            </p>

                        </div>
                    </div>
                    <div class="card">
                        <!-- 그룹 이미지 -->
                        <div class="top-img">
                            <!-- 그룹 d-day 태그 -->
                            <div id="circle" style="position: absolute; ">
                                D-<span style="position: relative; ">5</span>
                            </div>
                        </div>
                        <!-- 그룹 본문 -->
                        <div class="card-body">
                            <!-- 그룹 제목 -->
                            <h5 class="card-title">정처기 실기 준비하실분 구해요</h5>
                            <!-- 그룹 한줄 소개  -->
                            <p class="card-text">정보처리기사 실기 스터디원들을 합격의 길로 80%이상 보장합니다.</p>
                            <p class="card-text">
                                <small class="text-muted">참여인원</small>&nbsp;<small><span>1</span>/<span>6</span></small>
                                <small><span class="groupType">멘토</span></small>
                            </p>

                        </div>
                    </div>
                    <div class="card">
                        <!-- 그룹 이미지 -->
                        <div class="top-img">
                            <!-- 그룹 d-day 태그 -->
                            <div id="circle" style="position: absolute; ">
                                D-<span style="position: relative; ">5</span>
                            </div>
                        </div>
                        <!-- 그룹 본문 -->
                        <div class="card-body">
                            <!-- 그룹 제목 -->
                            <h5 class="card-title">정처기 실기 준비하실분 구해요</h5>
                            <!-- 그룹 한줄 소개  -->
                            <p class="card-text">정보처리기사 실기 스터디원들을 합격의 길로 80%이상 보장합니다.</p>
                            <p class="card-text">
                                <small class="text-muted">참여인원</small>&nbsp;<small><span>1</span>/<span>6</span></small>
                                <small><span class="groupType">멘토</span></small>
                            </p>

                        </div>
                    </div>
                   
                    <!-- 스터디 그룹 리스트 끝 -->
                </div>
                <div class="card-deck cols-4">
                    <div class="card">
                        <!-- 그룹 이미지 -->
                        <div class="top-img">
                            <!-- 그룹 d-day 태그 -->
                            <div id="circle" style="position: absolute; ">
                                D-<span style="position: relative; ">5</span>
                            </div>
                        </div>
                        <!-- 그룹 본문 -->
                        <div class="card-body">
                            <!-- 그룹 제목 -->
                            <h5 class="card-title">정처기 실기 준비하실분 구해요</h5>
                            <!-- 그룹 한줄 소개  -->
                            <p class="card-text">정보처리기사 실기 스터디원들을 합격의 길로 80%이상 보장합니다.</p>
                            <p class="card-text">
                                <small class="text-muted">참여인원</small>&nbsp;<small><span>1</span>/<span>6</span></small>
                                <small><span class="groupType">멘토</span></small>
                            </p>

                        </div>
                    </div>
                    <div class="card">
                        <!-- 그룹 이미지 -->
                        <div class="top-img">
                            <!-- 그룹 d-day 태그 -->
                            <div id="circle" style="position: absolute; ">
                                D-<span style="position: relative; ">5</span>
                            </div>
                        </div>
                        <!-- 그룹 본문 -->
                        <div class="card-body">
                            <!-- 그룹 제목 -->
                            <h5 class="card-title">정처기 실기 준비하실분 구해요</h5>
                            <!-- 그룹 한줄 소개  -->
                            <p class="card-text">정보처리기사 실기 스터디원들을 합격의 길로 80%이상 보장합니다.</p>
                            <p class="card-text">
                                <small class="text-muted">참여인원</small>&nbsp;<small><span>1</span>/<span>6</span></small>
                                <small><span class="groupType">멘토</span></small>
                            </p>

                        </div>
                    </div>
                    <div class="card">
                        <!-- 그룹 이미지 -->
                        <div class="top-img">
                            <!-- 그룹 d-day 태그 -->
                            <div id="circle" style="position: absolute; ">
                                D-<span style="position: relative; ">5</span>
                            </div>
                        </div>
                        <!-- 그룹 본문 -->
                        <div class="card-body">
                            <!-- 그룹 제목 -->
                            <h5 class="card-title">정처기 실기 준비하실분 구해요</h5>
                            <!-- 그룹 한줄 소개  -->
                            <p class="card-text">정보처리기사 실기 스터디원들을 합격의 길로 80%이상 보장합니다.</p>
                            <p class="card-text">
                                <small class="text-muted">참여인원</small>&nbsp;<small><span>1</span>/<span>6</span></small>
                                <small><span class="groupType">멘토</span></small>
                            </p>

                        </div>
                    </div>
                    <div class="card">
                        <!-- 그룹 이미지 -->
                        <div class="top-img">
                            <!-- 그룹 d-day 태그 -->
                            <div id="circle" style="position: absolute; ">
                                D-<span style="position: relative; ">5</span>
                            </div>
                        </div>
                        <!-- 그룹 본문 -->
                        <div class="card-body">
                            <!-- 그룹 제목 -->
                            <h5 class="card-title">정처기 실기 준비하실분 구해요</h5>
                            <!-- 그룹 한줄 소개  -->
                            <p class="card-text">정보처리기사 실기 스터디원들을 합격의 길로 80%이상 보장합니다.</p>
                            <p class="card-text">
                                <small class="text-muted">참여인원</small>&nbsp;<small><span>1</span>/<span>6</span></small>
                                <small><span class="groupType">멘토</span></small>
                            </p>

                        </div>
                    </div>
                   
                </div>
                <!-- 스터디 그룹 리스트 끝 -->
            </div>
            
        </div>
    </section>





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