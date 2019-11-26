<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String addr1 = (String)request.getAttribute("addr1");	
	String addr2 = (String)request.getAttribute("addr2");	
	String addr3 = (String)request.getAttribute("addr3");	
	String addr4 = (String)request.getAttribute("addr4");	

	String petName = (String)request.getAttribute("petName");
	String petType = (String)request.getAttribute("petType");
	int petAge = (int)request.getAttribute("petAge");
	int petWeight = (int)request.getAttribute("petWeight");
	
	String startDate = (String)request.getAttribute("startDate");
	String endDate = (String)request.getAttribute("endDate");
	String time = (String)request.getAttribute("time");
%>
<!DOCTYPE html>
<html lang="kor">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <!-- 체크박스 링크 -->
    <link rel='stylesheet' id='fontawesome-css' href='https://use.fontawesome.com/releases/v5.0.1/css/all.css?ver=4.9.1' 
    type='text/css' media='all' />
    

    <!--
        CDN방식으로 파일 불러오기
    -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<!-- 달력 -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <title>펫시터 예약</title>
</head>

<body>
    <!-- <div class="fixedHeader">
        <div class="col">
            <h3>예약 화면입니다. step 1/4 (고정됨)</h3>
        </div>
    </div> -->
    <div class="container-fluid">
        <div class="row empty1"></div>
        <div class="row middle">
            <div class="col-3 row-2">
                <!-- left -->
            </div>
            
            <div class="col-6" id='middle_border'>
                
                <form action="<%=request.getContextPath()%>/book/book04" method="post">
                   <!--  방문펫시터 예약을 위해 고객님의 주소를 알려주세요 -->
                    <div class="row empty5">
                        <div class="col-3"><span class='xbutton' onclick="back();"><i class="far fa-times-circle"></i></span></div>
                        <div class="col-6" id="printPetsitterType">
                          <h5>방문펫시터 예약</h5>  
                        </div>
                        <div class="row empty2"></div>
                        <div class="col-3"></div>
                    </div>
                    <div class="row empty5"></div>
                    <div class="row"></div>
                    
                    <div class='row' style=margin:4px;border:1px;>
                    <div class='col-12' style=text-align:center;background-color:white;width:20px;height:300px;>
                    <br>
                    	<h6>펫시터에게 전달 할 요청사항이 있으신가요?</h6>
                    	  <ul class="ks-cboxtags">
						    <li class="ks-cboxtags"><input type="checkbox" id="checkboxOne">
						    <label for="checkboxOne">놀이 위주 서비스로 진행해주세요.</label></li><br>
						    <li><input type="checkbox" id="checkboxTwo">
						    <label for="checkboxTwo">노령견 및 환자견 케어가 필요합니다.</label></li><br>
						    <li><input type="checkbox" id="checkboxThree">
						    <label for="checkboxThree">산책 위주 서비스로 진행해주세요.</label></li><br>
						    <li><input type="checkbox" id="checkboxfour">
						    <label for="checkboxfour">생식 급여가 필요합니다.</label></li>
						  </ul>
                    </div>
                    
                    <!-- <div class='row' style=background-color:white;margin:4px; >-->
						  <div class='col-3' style=background-color:white;></div>
						  <div class='col-6' style=background-color:white;text-align:center;font-size:10px;color:skyblue;>
						  	산책위주의 돌봄을 요청하더라도 날씨상황에 따라 야외활동이 제한되는 경우
							실내돌봄 프로그램으로 대체될수 있습니다.</div>
						  <div class='col-3' style=background-color:white;></div>
					<!-- </div> -->
					
                    </div>
                    
                    
                    <br>
                    
                    <div class='row' style=background-color:white;margin:4px;>
                    <div class='col-12'>
                    	<textarea name='qna' style=text-align:left;width:100%;height:250px; placeholder='기타 요청사항을 적어주세요 
*정해진 시간에 투약을 해야하거나, 야외 배변 필수 등 돌봄 중 펫시터가 유의해야하는 사항을 꼭 작성해주세요'></textarea>
                    </div>
                    </div>
                 
                 <div class='row empty3'></div>
                 <div class="row">
                        <div class="col-3"></div>
                        <div class="col-6"><input type='submit' class='form-control btn-info submitBtn'
                        			value='다음' id="nextBtn"></div>
                        <div class="col-3"></div>
                    </div>
                    
                    <input type='hidden' name='startDate' value='<%=startDate %>'>
                    <input type='hidden' name='endDate' value='<%=endDate%>'>
                    <input type='hidden' name='time' value='<%=time%>'>
                    
                    <input type='hidden' name='addr1' value='<%=addr1 %>'>
					<input type='hidden' name='addr2' value='<%=addr2 %>'>
					<input type='hidden' name='addr3' value='<%=addr3 %>'>
					<input type='hidden' name='addr4' value='<%=addr4 %>'>
					
					<input type='hidden' name='petName' value='<%=petName%>'>
					<input type='hidden' name='petType' value='<%=petType%>'>
					<input type='hidden' name='petAge' value='<%=petAge%>'>
					<input type='hidden' name='petWeight' value='<%=petWeight%>'>
                 
					
                </form>
            </div>
            <div class="col-3">
                <!-- right -->
            </div>
        </div>
        
        <!-- <div class="row footer">
            <div class="col">footer</div>
        </div> -->
    </div>

</body>
<style>

	ul.ks-cboxtags {
	    list-style: none;
	    padding: 20px;
	}
	ul.ks-cboxtags li{
	  display: inline;
	}
	ul.ks-cboxtags li label{
	    display: inline-block;
	    background-color: rgba(255, 255, 255, .9);
	    border: 2px solid rgba(139, 139, 139, .3);
	    color: #adadad;
	    border-radius: 25px;
	    white-space: nowrap;
	    margin: 3px 0px;
	    -webkit-touch-callout: none;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	    -webkit-tap-highlight-color: transparent;
	    transition: all .2s;
	}
	
	ul.ks-cboxtags li label {
	    padding: 8px 12px;
	    cursor: pointer;
	}
	
	ul.ks-cboxtags li label::before {
	    display: inline-block;
	    font-style: normal;
	    font-variant: normal;
	    text-rendering: auto;
	    font-smoothing: antialiased;
	    font-family: "Font Awesome 5 Free";
	    font-weight: 900;
	    font-size: 12px;
	    padding: 2px 6px 2px 2px;
	    content: "\f067";
	    transition: transform .3s ease-in-out;
	}
	
	ul.ks-cboxtags li input[type="checkbox"]:checked + label::before {
	    content: "\f00c";
	    transform: rotate(-360deg);
	    transition: transform .3s ease-in-out;
	}
	
	ul.ks-cboxtags li input[type="checkbox"]:checked + label {
	    border: 2px solid #1bdbf8;
	    background-color: #12bbd4;
	    color: #fff;
	    transition: all .2s;
	}
	
	ul.ks-cboxtags li input[type="checkbox"] {
	  display: absolute;
	}
	ul.ks-cboxtags li input[type="checkbox"] {
	  position: absolute;
	  opacity: 0;
	}
	ul.ks-cboxtags li input[type="checkbox"]:focus + label {
	  border: 2px solid #e9a1ff;
	}
	    
	input[id=smallPet]{
		position:relative;
		left:350px;
		buttom:110px;
		opacity: 0.8;
	}
	input[id=bigPet]{
		position:relative;
		left:39px;
		top:38px;
		opacity: 0.8;
	}
	input::-webkit-input-placeholder{
		color:black;
		opacity: 0.3;
	}
	
	
	input[name=addrInput]{
		border:none;
		border-bottom:1px solid gray;
		background:transparent;
	}
	input[id=searchAddr]{
		width:130px;
		position: relative;
        left: 520px;
        bottom: 35px;
	}
	i{
		 font-size:20px;
	}
	
    html,
    body {
        font-size: 100%;
    }

    /* html{
        font-size:15px;
    } */
    .fixedHeader {
        border: 1px solid black;
        background-color: aqua;
        position: fixed;
        width: 100%;
        height: 30.5px;
        align-content: center;
        text-align: center;
        z-index: 10;
    }

    .fixedHeader>div>h3 {
        font-size: 1rem;
    }

    .empty1 {
        height: 30.5px;
    }

    .empty2 {
        height: 50px;
    }

    .empty3 {
        height: 25px;
    }
    .empty4 {
    	height: 50px;
    }
    /* 헤더 흰색변경 및 위치조정 */
    .empty5 {
    	height: 30px;
    	background: white;
    }
    .empty6 {
    	height: 400px;
    }

    .middle {
        /* border: 1px solid black; */
        background-color: white;
        height: 850px;
    }

    .footer {
        /* border: 2px solid red; */
        background-color: greenyellow;
        height: 50px;
        text-align: center;
        align-content: center;
    }

    /*div 나누는 거 확인하기 위해 필요한 스타일, 지우지 말 것 */
    /* div[class|=col] {
        border: 1px solid blue;
    } */

    .select {
        text-align: center;
    }

    .btn2 {
        width: 45%;
        font-size: 1.7vw;
        padding-left: 0px;
        padding-right: 0px;
        margin-right: 10px;
    }

    .submitBtn {
        width: 100%;
        font-size: 1.2vw;
    }

    div[class|=col] {
        font-size: 1rem;
    }
    /* 중앙 예약화면 크기조정 및 색상변경 */
    div[id=middle_border]{
    	/* border:1px solid gray; */
    	background-color :snow;
    }
    /* 밑줄용 */
    div[id=topPen]{
        border-top:1px solid gray;
    }
    div[name=radius_]{
        border-radius: 50px;
    }

    #printPetsitterType {
        text-align: center;
    }
    ::placeholder {
	  color: black;
	  font-size: 0.85em;
	  font-weight: 400;
	  opacity: 1;
	  text-align:left;
}
    .centerClass{
    	height:20px;
    	margin:30px;
        text-align: left;
    }
</style>
	<script>
	// 달력 스크립트
	$(function() {
	  $('input[name="daterange"]').daterangepicker({
	    opens: 'left'
	  }, function(start, end, label) {
	    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	  });
	});
	</script>
<!-- FontAwesome 아이콘 사용 script-->
		<script src="https://kit.fontawesome.com/dcff5cba12.js"></script>

</html>