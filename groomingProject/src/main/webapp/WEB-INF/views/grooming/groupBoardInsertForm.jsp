<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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


    <script src="http:/code.jquery.com/jquery-latest.min.js"></script>
	
	<!--summernote css/js �߰�  -->
<%-- 	<script src="${pageContext.servletContext.contextPath }/resources/js/summernote-lite.js"></script>
	<script src="${pageContext.servletContext.contextPath }/resources/js/summernote-ko-KR.js"></script>
	
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/views/css/summernote/summernote-lite.css"> --%>
	   <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <title>Hello, world!</title>
    <style>
        body {
            height: 1200px;
        }

        /* div�� ũ�⿡ ���� */
        img {
            max-width: 100%;
            max-height: 100%;
        }

        /* �ζ��� ������ ��� */
        #tab1:checked~#content1,
        #tab2:checked~#content2,
        #tab3:checked~#content3 {
            display: block;
        }

        /* �� ���� �޴��� ���� */
        section {
            display: none;
            padding: 20px 10px 10px 10px;
            border: 3px solid #ddd;
            height: 700px;
        }

        /*������ư ����*/
        .radio {
            display: none;
        }


        /* �Ǹ޴� �±� ���콺 �ø��� */
        .menu:hover {
            color: #2e9cdf;
            cursor: pointer;
        }

        /* �±� �޴� css */
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

        /*input Ŭ����, label ��Ÿ��*/
        input:checked+label {
            color: #555;
            border: 3px solid #ddd;
            /* border-top: 2px solid #2e9cdf; */
            border-bottom: 3px solid #ffffff;
        }

        .table th{
            text-align: center;
            vertical-align:middle;
        }
 /*        @font-face {
		   font-family: 'NanumGothic';
		   src: url(${pageContext.servletContext.contextPath }/resources/views/font/NanumGothic.ttf)
		      format('truetype');
		}

		body {
		   font-family: NanumGothic;
		} */
    </style>
</head>

<body>
    <!-- ������� -->
    <header>
        	<jsp:include page="../common/mainNavigationBar.jsp" />
    </header>

    <!-- ���� ���� -->

    <!-- �����̳ʷ� �翷�� ���� ���� -->
    <div class=container style="margin-top:150px ; ">
        <!--����Ʈ �޴�-->
        <input id="tab1" type="radio" name="tabs" class="radio">
        <label for="tab1" class="menu"><i class="fas fa-user-graduate"></i>����</label>

        <input id="tab2" type="radio" name="tabs" class="radio">
        <label for="tab2" class="menu"><i class="fas fa-calendar-alt"></i>Ķ����</label>

        <input id="tab3" type="radio" name="tabs" class="radio" checked>
        <label for="tab3" class="menu"><i class="fas fa-icons"></i>�Խ���</label>


        <!-- ���ο� �� ����� -->
        <section id="content3">



            <div class="container">

                <table class="table table-bordered">


                    <form method="post">
                        <tr>
                            <th>�ۼ��Խ��� </th>
                            <td>
                                <label><input type="radio" name="board" class="board">�����Խ���</label>
                                <label><input type="radio" name="board" class="board">��������</label>
                            </td>
                        </tr>
                        <tr>
                            <th>���� </th>
                            <td><input type="text" placeholder="������ �Է��ϼ���. " name="subject" class="form-control" ></td>
                        </tr>
                        <tr >
                            <th>���� </th>
                            <td><textarea cols="100" rows="10" placeholder="������ �Է��ϼ���. " id="summernote" name="editordata"
                                    class="form-control"></textarea></td>
                        </tr>
                       
                     
                        <tr style="text-align:center">
                            <td colspan="2">
                                <input type="button" value="���" onclick="location.href='groupPage.do'">
                                <input type="button" value="�������" onclick="location.href='groupPage.do'">
                            </td>
                        </tr>
                    </form>

                </table>

            </div>





        </section>
        <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 400,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>





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