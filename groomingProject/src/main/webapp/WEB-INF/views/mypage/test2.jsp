<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

        .SsectionDiv {
            display: none;
            padding: 20px 10px 10px 10px;
            border: 3px solid rgba(167, 167, 167, 1);
            height: 500px;
            background: rgba(175, 202, 202, 1); /* 변경 */
            }

        /*라디오버튼 숨김*/
          .SinputBar {
              display: none;}

        .Slabel {
            display: inline-block;
            margin: 0 0 -4px;
            padding: 15px 25px;
            font-weight: 600;
            text-align: center;
            color: rgba(160, 160, 160, 1);
            border: 1px solid rgba(167, 167, 167, 1);
            border-top-left-radius: 6px;
            border-top-right-radius: 6px;
           	background: rgba(175, 202, 202, 1); /* 변경 */

            }

        .Slabel:hover {
            color: rgba(59, 117, 117, 1); /* 변경 */
            cursor: pointer;}

        /*input 클릭시, label 스타일*/
         .SinputBar:checked + .Slabel {
              color: #555;
              border: 3px solid rgba(167, 167, 167, 1);
              /* border-top: 2px solid #2e9cdf; */
              border-bottom: 3px solid rgba(175, 202, 202, 1);  /* 변경 */
              }

        #Stab1:checked ~ #Scontent1,
        #Stab2:checked ~ #Scontent2,
        #Stab3:checked ~ #Scontent3 {
            display: block;}
</style>
</head>
<body>
			
			<input class="SinputBar"id="Stab1" type="radio" name="Stabs" checked> <!--디폴트 메뉴-->
            <label class="Slabel" for="Stab1">개설한 스터디</label>
        
            <input class="SinputBar" id="Stab2" type="radio" name="Stabs">
            <label class="Slabel" for="Stab2">신청 내역</label>
        
            <input class="SinputBar" id="Stab3" type="radio" name="Stabs">
            <label class="Slabel" for="Stab3">작성 내역</label>
     
     
            <div class="SsectionDiv"  id="Scontent1">
                <p></p>
             </div>
        
            <div class="SsectionDiv"  id="Scontent2">
                <span style="font-size: 25px;font-weight: 800;margin-right: 5%;">바난나킥</span><span>Lv.25</span>
                <p>tab menu2의 내용</p>
            </div>
        
            <div class="SsectionDiv"  id="Scontent3">
                <div id="expBox" style="position: relative;">
                    
                </div>
             </div>   
      

</body>
</html>