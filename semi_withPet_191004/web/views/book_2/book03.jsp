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
%>
<!DOCTYPE html>
<html lang="kor">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


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
                
                <form action="<%=request.getContextPath()%>/book/book031" method="post">
                   <!--  방문펫시터 예약을 위해 고객님의 주소를 알려주세요 -->
                    <div class="row empty5">
                        <div class="col-3"><span class='xbutton' onclick="back();"><i class="far fa-times-circle"></i></span></div>
                        <div class="col-6" id="printPetsitterType">
                          <h5>방문 일정 선택</h5>  
                        </div>
                        <div class="row empty2"></div>
                        <div class="col-3"></div>
                    </div>
                    <div class="row empty5"></div>
                    <div class="row"></div>
                    
                    <div class='row' style=margin:4px;border:1px;>
                    <div class='col-12' style=text-align:center;background-color:white;width:20px;height:60px;top:10px;>
                    	돌봄 신청 일정을 선택해주세요<br>5회 이상 예약하고 회당 10% 할인!
                    </div>
                    </div>
                    
                  
                    
                    <div class='row'>
                    <div class='col-12' style=text-align:center;height:200px;>
                    	<input type='text' name='daterange' class='form-control btn-info'
                    	value='' style=width:730px;text-align:center;>
                    </div>
                    </div>
                    
                    <br>
                    
                    <div class='row' style=background-color:white;margin:4px;>
                    <div class='col-2' name='bottomPen' style=text-align:center;width:20px;>
                    	<span class='' style=text-align:center;>시간대 선택</span>
                    </div>
                    <div class='col-10' name='bottomPen' style=text-align:left;font-size:12px;color:gray;>
                    	<span class='' style=text-align:center;>(선택한 시간대에 펫시터가 방문합니다)</span>
                    </div>
                    <div class='col-12' style='height:100px; top:40px;'>
                            <select name="time" id="time" class='form-control btn-default' >
                                <option value="">09:00~10:00</option>
                                <option value="">10:00~11:00</option>
                                <option value="">11:00~12:00</option>
                                <option value="">12:00~13:00</option>
                                <option value="">13:00~14:00</option>
                                <option value="">14:00~15:00</option>
                                <option value="">15:00~16:00</option>
                                <option value="">16:00~17:00</option>
                                <option value="">17:00~18:00</option>
                                <option value="">18:00~19:00</option>
                                <option value="">19:00~20:00</option>
                                <option value="">20:00~21:00</option>
                            </select>
                    </div>
                    </div>
                    
                    <div class='row' style=background-color:white;margin:4px;>
	                    <div class='col-3' name='bottomPen' style=text-align:center;width:20px;>
	                    	<span class='' style=text-align:center;>시간 추가</span>
	                    </div>
	                    <div class='col-6' name='bottomPen' style=text-align:left;font-size:12px;color:gray;>
	                    	<span class='' style=text-align:left;>(기본 1시간돌봄)</span>
	                    </div>
	                    <div class='col-3' id='timeUp' name='bottomPen'
	                     style=text-align:right;font-size:12px;color:gray;>
	                    	
	                    </div>
	                    
	                    <div class='col-2' style=height:100px;top:40px;>
		                    <input type='button' id='default-time' class='form-control btn-default' value='없음' style=text-align:center;font-size:10px;height:35px;width:120px;border-radius:12px;>
	                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <div class='col-2' style=height:100px;top:40px;>
		                    <input type='button' id='1-time' class='form-control btn-default' value='1시간' style=text-align:center;font-size:10px;height:35px;width:120px;border-radius:12px;>
	                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <div class='col-2' style=height:100px;top:40px;>
		                    <input type='button' id='2-time' class='form-control btn-default' value='2시간' style=text-align:center;font-size:10px;height:35px;width:120px;border-radius:12px;>
	                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <div class='col-2' style=height:100px;top:40px;>
		                    <input type='button' id='3-time' class='form-control btn-default' value='3시간' style=text-align:center;font-size:10px;height:35px;width:120px;border-radius:12px;>
	                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <div class='col-2' style=height:100px;top:40px;>
		                    <input type='button' id='4-time' class='form-control btn-default' value='4시간' style=text-align:center;font-size:10px;height:35px;width:120px;border-radius:12px;>
	                    </div>
	                    
                    </div>
                    
                    <input type='hidden' name='startDate'>
                    <input type='hidden' name='endDate'>
                    
                    <input type='hidden' name='addr1' value='<%=addr1 %>'>
					<input type='hidden' name='addr2' value='<%=addr2 %>'>
					<input type='hidden' name='addr3' value='<%=addr3 %>'>
					<input type='hidden' name='addr4' value='<%=addr4 %>'>
					
					<input type='hidden' name='petName' value='<%=petName%>'>
					<input type='hidden' name='petType' value='<%=petType%>'>
					<input type='hidden' name='petAge' value='<%=petAge%>'>
					<input type='hidden' name='petWeight' value='<%=petWeight%>'>
                    
                    <div class='col empty3'></div>
                    <div class='col empty3'></div>
                    <div class='col empty3'></div>
                    <div class='col empty3'></div>
                    <div class='col empty3'></div>
                    <div class='col empty3'></div>
                    <div class='col empty3'></div>
                    <div class='row'>
                    <div class="col-3"></div>
                    <div class="col-6"><input type='submit' class='form-control btn-info submitBtn' value='다음' id="nextBtn"></div>
                    <div class="col-3"></div>
					</div>
                 
					
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
	div[name=bottomPen]{
		border-bottom:0.5px solid gray;
		top:5px;
		opacity:0.7;
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
    input::placeholder {
        font-size: 1.2vw;
    }
    .centerClass{
    	height:20px;
    	margin:30px;
        text-align: left;
    }
</style>
	<script>
	$(document).ready(function() {
		var d=new Date(); // 날짜 객체 생성
		var currentDate=d.getFullYear()+"/"+(d.getMonth()+1)+"/"+d.getDate(); // 현재 날짜 받아오기
		$('input[name="bookDate"]').val(currentDate+"-"+currentDate); // 현재 날짜 value에 넣기
		});
	// 달력 스크립트
	$(function() {
	  $('input[name="daterange"]').daterangepicker({
	    opens: 'center',
		locale: {
			format: 'YYYY/MM/DD', // 날짜 표시 format 설정
			// 언어 설정
	        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	        daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"]
		}
	  }, function(start, end, label) {
	    console.log("새로운 날짜가 선택되었습니다.: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		
		$('input[name="startDate"]').val(start.format('YYYY-MM-DD')); // 선택한 날짜를 hidden의 value에 저장하기
	    $('input[name="endDate"]').val(end.format('YYYY-MM-DD')); // 선택한 날짜를 hidden의 value에 저장하기
	  });
	});
	$(function(){
		$("#default-time").click(function(){
			var defaultTime = $("#default-time").val();
			$("#timeUp").text(defaultTime);
		});
		$("#1-time").click(function(){
			var Time1 = $("#1-time").val();
			$("#timeUp").text(Time1);
		});
		$("#2-time").click(function(){
			var Time2 = $("#2-time").val();
			$("#timeUp").text(Time2);
		});
		$("#3-time").click(function(){
			var Time3 = $("#3-time").val();
			$("#timeUp").text(Time3);
		});
		$("#4-time").click(function(){
			var Time4 = $("#4-time").val();
			$("#timeUp").text(Time4);
		});
	});
	</script>
<!-- FontAwesome 아이콘 사용 script-->
		<script src="https://kit.fontawesome.com/dcff5cba12.js"></script>

</html>