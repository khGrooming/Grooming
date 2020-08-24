<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        
            <!--summernote css/js 異�媛�  -->

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <title>Hello, world!</title>
    <style>
        body {
            height: 1200px;
        }

        /* div�� �ш린�� 留�異� */
        img {
            max-width: 100%;
            max-height: 100%;
        }

        /* �몃�쇱�� ������ 異��� */
        #tab1:checked~#content1,
        #tab2:checked~#content2,
        #tab3:checked~#content3 {
            display: block;
        }

        /* 媛� ���� 硫��댁�� �댁�� */
        section {
            display: none;
            padding: 20px 10px 10px 10px;
            border: 3px solid #ddd;
            height: auto;
        }

        /*�쇰���ㅻ��� �④�*/
        .radio {
            display: none;
        }


        /* ��硫��� ��洹� 留��곗�� �щ┫�� */
        .menu:hover {
            color: #2e9cdf;
            cursor: pointer;
        }

        /* ��洹� 硫��� css */
        .menu {
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

        /*input �대┃��, label �ㅽ����*/
        input:checked+label {
            color: #555;
            border: 3px solid #ddd;
            /* border-top: 2px solid #2e9cdf; */
            border-bottom: 3px solid #ffffff;
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
    </style>
</head>

<body>
    <!-- �ㅻ������ -->
    <header>
        <jsp:include page="../common/mainNavigationBar.jsp" />
    </header>

    <!-- �뱀�� ���� -->

    <!-- 而⑦���대��濡� ������ 怨듬갚 ���� -->
    <div class=container style="margin-top:150px ; ">
        <!--���댄�� 硫���-->
        <input id="tab1" type="radio" name="tabs" class="radio">
        <label for="tab1" class="menu"><i class="fas fa-user-graduate"></i>硫���</label>

        <input id="tab2" type="radio" name="tabs" class="radio">
        <label for="tab2" class="menu"><i class="fas fa-calendar-alt"></i>罹�由곕��</label>

        <input id="tab3" type="radio" name="tabs" class="radio" checked>
        <label for="tab3" class="menu"><i class="fas fa-icons"></i>寃�����</label>


        <!-- 硫��몄�� �ㅼ�닿� �댁�⑹�� -->
        <section id="content3">

            <div style="text-align: right; margin-right: 20px;">
            <a href="#">��怨���湲�</a>
            <p >���깆�� : <label>2020-07-25</label>&nbsp;&nbsp;議고���� : <label>7��</label></p>
            </div>
                    <div class="container">

                        <table class="table table-bordered">

                            <form method="post">
                                <tr>
                                    <th>���깃����� </th>
                                    <td>
                                        <label>����寃�����</label>
                                        <label hidden>怨듭��ы��</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>��紐� </th>
                                    <td><label>���������� ���������� ����������</label></td>
                                </tr>
                                <tr>
                                    <th>�댁�� </th>
                                    <td><textarea cols="100" rows="10" class="form-control" readonly
                                            style="height:auto;">��怨� 蹂대ŉ �����대�� 鍮�諛���
						                                    媛����� �� 留��� �댁�쇨린
						                                    吏�湲� �� 紐⑥�듭�� �댁��� 醫���
						                                    ��瑜� �ъ���硫� ����濡� 醫���
						                                    �� �대� 遺��ъ�
						                                    
                                    * �� ����濡� 鍮�移��� �� 留� �ㅽ�ш� ���ㅼ��
						                                    媛��댁�� 留� 踰�李� ���ъ��
						                                    議곌�留� 瑗� 李멸� �� 湲곕�ㅻ�ㅼ�
						                                    ���� ������ 吏�湲� ����吏�
						                                    ��怨�瑜� �� 蹂댁�怨� �띠�留�
						                                    �ㅺ� ���� 誘몃������
						                                    �� �대��� 遺��ъ�
						                                    
						                                    �닿� 癒쇱�� �용낫怨� �� ��媛���
						                                    ���� �닿� �④�����吏�
						                                    ���� ����二쇰�� 洹몃��媛� 醫���
						                                    �닿� 臾쇱�대낫硫� 洹몃���� 醫���
						                                    �� �대��� 萸���
						                                    
						                                    * Repeat
						                                    
						                                    �� 源�諛���硫� �대Ⅸ�� �� 嫄곗����
						                                    �� ����蹂닿�二� 洹몃�� 湲곗�듯��寃�二�
						                                    洹몃�� 湲곕����� ����
						                                    �� ����濡� 鍮�移��� �� 紐⑥�� 李� 醫���
						                                    
						                                    �����쇰� ��由щŉ ��怨�諛����� �щ�ㅻ�
						                                    議곌�留� �� 鍮⑤━ ����遊�
						                                    �� ���� 瑗� 媛�怨� 留�踰��� 嫄대��
						                                    ���� ������ 議곌� �⑥��吏�
						                                    紐��� 紐��ㅼ� 紐⑤Ⅴ寃�吏�留�
						                                    �ㅺ� ���� 誘몃������
						                                    �뱀�� �닿� �ㅻ㎤�ㅻ㈃
						                                    ��瑜� ����蹂� �� ��寃�
						                                    �� �대��� 遺��ъ�</textarea></td>
                                </tr>





                            </form>

                        </table>
                        
                       <!-- ���� ���� 踰��� -->
                        <div align="right">
                            <button type="button">����</button>
                            <button type="button">����</button>
                        </div>
                        
                        <br><br><br>
                        
                        <!-- ��湲� �깅�  -->
                        <div class="container">
                            <table class="table table-bordered">
                                <form method="post">

                                    <tr>
                                        <td class="col-6" style="width: 70%;">
                                            <textarea cols="20" rows="2" class="form-control" style="resize: none;">
                                             </textarea>
                                        </td>
                                        <br><br>
                                        <td class="col-4" style="width:30%; vertical-align: middle; text-align: center;">
                                            <button>��湲� �깅�</button>
                                        </td>

                                    </tr>
                                </form>
                            </table>
                            <!-- ��湲� 紐⑸� 蹂닿린 -->
                            <table align="center" width="500" border="1" id="tb2">
                                <thead>
                                    <tr>
                                        <td colspan="2"><b id="rCount"></b></td>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>





        </section>






    </div>


    <footer>

		<jsp:include page="../common/footer.jsp" />
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