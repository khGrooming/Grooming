<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.5.1.min.js"></script>

  
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
        integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

	
	 
	   
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

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
            height: 700px;
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

        .table th{
            text-align: center;
            vertical-align:middle;
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
        <input id="tab1" type="radio" name="tabs" class="radio" checked>
        <label for="tab1" class="menu"><i class="fas fa-user-graduate"></i>硫���</label>

        <input id="tab2" type="radio" name="tabs" class="radio">
        <label for="tab2" class="menu"><i class="fas fa-calendar-alt"></i>罹�由곕��</label>

        <input id="tab3" type="radio" name="tabs" class="radio">
        <label for="tab3" class="menu"><i class="fas fa-icons"></i>寃�����</label>


        <!-- 硫��몄�� �ㅼ�닿� �댁�⑹�� -->
        <section id="content3">



            <div class="container">

                <table class="table table-bordered">


                    <form method="post">
                        <tr>
                            <th>���깃����� </th>
                            <td>
                                <label><input type="radio" name="board" class="board">����寃�����</label>
                                <label><input type="radio" name="board" class="board">怨듭��ы��</label>
                            </td>
                        </tr>
                        <tr>
                            <th>��紐� </th>
                            <td><input type="text" placeholder="��紐⑹�� ���ν���몄��. " name="subject" class="form-control" ></td>
                        </tr>
                        <tr >
                            <th>�댁�� </th>
                            <td><textarea cols="100" rows="10" placeholder="�댁�⑹�� ���ν���몄��. " id="summernote" name="editordata"
                                    class="form-control"></textarea></td>
                        </tr>
                       
                     
                        <tr style="text-align:center">
                            <td colspan="2">
                                <input id="insert" type="button" value="�깅�" onclick="location.href='groupPage.do'">
                                <input id="backlist" type="button" value="紐⑸��쇰�" onclick="location.href='groupPage.do'">
                            </td>
                        </tr>
                    </form>

                </table>

            </div>

		<script>
          	$(function(){
          		$("#insert").on("click",function(){
          			$("#tab3").attr("checked",true);
          			
          		})
          		
          		$("#backlist").on("click",function(){
          			$("#tab3").attr("checked",true);
          		})
          		
          	})
          </script>



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