<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hwang.withpet.book.model.vo.Book"%>    
<%
	Cookie[] cookies=request.getCookies();
	String startDate=""; // 예약 시작일
	String endDate=""; // 예약 종료일
	String bookTime="";	// 시간
	
	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			switch(cookies[i].getName()){
				case "startDate" : startDate=URLDecoder.decode((cookies[i].getValue()==null)?"":cookies[i].getValue(), "UTF-8"); break;
				case "endDate" : endDate=URLDecoder.decode((cookies[i].getValue()==null)?"":cookies[i].getValue(), "UTF-8"); break;
				case "bookTime" : bookTime=URLDecoder.decode((cookies[i].getValue()==null)?"":cookies[i].getValue(), "UTF-8"); break;
			}
		}
	}

    String path = request.getContextPath(); // 프로젝트 주소
    	
%>
<!DOCTYPE html>
<html lang="en">
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

    <!-- 달력 라이브러리 추가 -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <!-- 폰트 추가 -->
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' rel='stylesheet' type='text/css'>

    <title>가정집 펫시터 예약 - step 3/4</title>
</head>
<body>
    <div class="fixedHeader">
        <div style="height: 100%;">
            <button type="button" class="close" aria-label="Close"
                onclick="location.href='<%=path%>/service';">
				<span aria-hidden="true">&times;</span>
			</button>
			가정집 펫시터 예약 - step 3/4
        </div>
    </div>
        <div class="container-fluid" style="height: 100%;">
            <div class="row middle">
                <div class="col-12">
                    <div class="row empty1"></div>
                    <div class="row empty2"></div>
                    <form action="<%=request.getContextPath()%>/book/petsitterHome4" method="POST" onsubmit="return book3_Validate();">
                        <div class="row">
                            <div class="col-12 centerClass"><span class='input-text'>날짜를 선택해주세요<br>(내일 날짜부터 예약 가능)</span></div>
                        </div>
                        <div class="row">
                            <div class="col-12 centerClass"><input type="text" name="daterange" id="daterange" value="" /></div>
                            <!-- <input type="hidden" name="startDate"/>
                            <input type="hidden" name="endDate"/> -->
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-12 centerClass"><span class='input-text'>시간을 선택해주세요.</span></div>
                        </div>
                        <div class="row">
                            <div class="col-12 centerClass">
                                <select name="bookTime" id="bookTime" onclick="choiceTime();">
                                    <option value="09:00~10:00">09:00~10:00</option>
                                    <option value="10:00~11:00">10:00~11:00</option>
                                    <option value="11:00~12:00">11:00~12:00</option>
                                    <option value="12:00~13:00">12:00~13:00</option>
                                    <option value="13:00~14:00">13:00~14:00</option>
                                    <option value="14:00~15:00">14:00~15:00</option>
                                    <option value="15:00~16:00">15:00~16:00</option>
                                    <option value="16:00~17:00">16:00~17:00</option>
                                    <option value="17:00~18:00">17:00~18:00</option>
                                    <option value="18:00~19:00">18:00~19:00</option>
                                    <option value="19:00~20:00">19:00~20:00</option>
                                    <option value="20:00~21:00">20:00~21:00</option>
                                </select>
                            </div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-1"></div>
                        	<div class="col-10 centerClass" id="selectDate">
                            </div>
                            <div class="col-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-1"></div>
                        	<div class="col-10 centerClass" id="selectTime">
                            </div>
                            <div class="col-1"></div>
                        </div>
                        <!-- <div class="row">
                            <div class="col-12 select">
                                <input type="button" class='btn btn-dark btn2' value="정기방문" id="periodBtn">
                                <input type="button" class='btn btn-dark btn2' value="일반방문" id="generalBtn">
                            </div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row empty3 centerClass">
                            <div class="col-12" id="printVisitData"><h6>방문 방법을 선택해주세요.</h6></div>
                        </div> -->
                        <div class="row empty3">
                                <input type="hidden" id="selectDateFlag">
                                <input type="hidden" id="selectTimeFlag">
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-6">
                                <input type='button' class='btn-primary form-control submitBtn' value='이전'
                                onclick="location.href='<%=path%>/book/visitPetsitter2';">
                            </div>
                            <div class="col-6">
                                <input type='submit' class='btn-primary form-control submitBtn' value='다음'>
                            </div>
                        </div>
                    </form>
            </div>
        </div>
    </div>
</body>
<style>
    html, body{
        /* font-size: 100%; */
        font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif';
        height: 100%;
        max-width: 650px;
        margin:0 auto;
    }
    /* html{
        font-size:15px;
    } */
    .fixedHeader{
        border: 0.75px solid black;
        background-color: white;
        position: fixed;
        width: 100%;
        max-width: 650px;
        height: 50.5px;
        align-content: center;
        text-align: center;
        z-index: 10;
        font-size: 1.125rem;
        border-color: white;
        border-bottom-color:  black;
        vertical-align: middle;
        padding-top: 10px;
        padding-bottom: 7px;
        color:#6f6f6f;
    }
    .empty1 {
        height:50.5px;
    }
    .empty2 {
        height: 50px;
    }
    .empty3 {
        height: 25px;
    }
    .middle{
        background-color: whitesmoke;
        height: 100%;
    }
    .footer{
        border:2px solid red;
        background-color: greenyellow;
        height: 50px;
        text-align: center;
        align-content: center;
    }

    /* div 나누는 거 확인하기 위해 필요한 스타일, 지우지 말 것 */
    /* div[class|=col] {
        border:2px solid green;
    } */

    .select {
        text-align: center;
    }
    .btn2 {
        width: 42%;
        padding-left: 0px;
        padding-right: 0px;
        margin-right: 5px;
    }
    .submitBtn {
        width:100%;
    }
    .centerClass {
        text-align: center;
        font-size: 17px;
        line-height: 1.7;
        letter-spacing: -.5px;
    }
    input[name="daterange"] {
		width:250px;
		text-align:center;
	}
</style>

<script>
// jQuery 코드
// 정기방문 버튼 눌렀을 때
$('#periodBtn').click(function onclick(){
    $(this).css({
        'backgroundColor' : 'yellow',
        'color' : 'black',
        'fontWeight' : 'bolder'
    });
    $('#generalBtn').css({
        'backgroundColor' : '#343a40',
        'color' : 'white',
        'fontWeight' : 'normal'
    });
    $('#printVisitData').html('<h6><b>정기 방문</b>을 선택하셨습니다.</h6>').css('color', 'black').css('fontFamily', 'Spoqa Han Sans');
});
// 일반방문 버튼 눌렀을 때
$('#generalBtn').click(function onclick(){
    $(this).css({
        'backgroundColor' : 'yellow',
        'color' : 'black',
        'fontWeight' : 'bolder'
    });
    $('#periodBtn').css({
        'backgroundColor' : '#343a40',
        'color' : 'white',
        'fontWeight' : 'normal'
    });
    $('#printVisitData').html('<h6><b>일반 방문</b>을 선택하셨습니다.</h6>').css('color', 'black').css('fontFamily', 'Spoqa Han Sans');
});

//페이지 로드 되기 전에
$(document).ready(function() {
	var d=new Date(); // 날짜 객체 생성
	var currentDate=d.getFullYear()+"/"+(d.getMonth()+1)+"/"+d.getDate(); // 현재 날짜 받아오기
	$('input[name="bookDate"]').val(currentDate+"-"+currentDate); // 현재 날짜 value에 넣기
	});

function getFormatDate(date) { // yyyyMMdd 포맷으로 변환하는 함수
    var year=date.getFullYear(); // yyyy
    var month=(1+date.getMonth()); // M
    month=month>=10?month:'0'+month; // month 두자리로 저장하기
    var day=date.getDate(); // d
    day=day>=10?day:'0'+day; // day 두자리로 저장
    return year+'-'+month+'-'+day;
}

// 달력 스크립트
$(function() {

    // 내일 날짜로 달력 초기화 해주기 위한 변수들
    var today1=new Date();
    console.log(today1);
    console.log("today1:"+getFormatDate(today1));
    var tomorrowTime1=new Date(today1.getFullYear(), today1.getMonth(), parseInt(today1.getDate())+1);
    console.log("tomorrowTime1: "+getFormatDate(tomorrowTime1));
    

    var bookTime="<%=bookTime%>";
	<%if(!bookTime.equals("")) { %> // 쿠키가 있으면
		$("#bookTime").val(bookTime).attr("selected", "selected");
        $("#selectTime").html("<br>선택한 시간<br>"+bookTime);
        $("#selectTime").css("border-bottom", "1px solid #5f5757");
        $("#selectTimeFlag").val('1'); // 1로 세팅
	<%}else { %>
        $("#selectTimeFlag").val('0'); // 0으로 세팅
    <%} %>

    <%if(!startDate.equals("") && !endDate.equals("")) { %>
        var startDate1="<%=startDate%>";
        var endDate1="<%=endDate%>";

        $("#selectDate").html("선택한 날짜<br>시작일: "+startDate1+" &nbsp;&nbsp;&nbsp;종료일: "+endDate1);
        $("#selectDate").css("border-bottom", "1px solid #5f5757");
        $("#selectDateFlag").val('1'); // 1로 세팅

    <% }else { %>
        $("#selectDateFlag").val('0'); // 0으로 세팅
    <%} %>
  $('input[name="daterange"]').daterangepicker({
    opens: 'center',
    <%if(!startDate.equals("") && !endDate.equals("")) { %>
        startDate: "<%=startDate%>",
        endDate: "<%=endDate%>",
    <% }else { %>
        startDate: getFormatDate(today1),
        endDate: getFormatDate(today1),
    <% } %>
	locale: {
		format: 'YYYY/MM/DD', // 날짜 표시 format 설정
		// 언어 설정
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"]
	}
  }, function(start, end, label) {
    console.log("새로운 날짜가 선택되었습니다.: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	
    var startDate=start.format('YYYY-MM-DD');
    var endDate=end.format('YYYY-MM-DD');
	// $('input[name="startDate"]').val(startDate); // 선택한 날짜를 hidden의 value에 저장하기
    // $('input[name="endDate"]').val(endDate); // 선택한 날짜를 hidden의 value에 저장하기
    
    console.log(startDate.split('-')[0]+"년"+startDate.split('-')[1]+"월"+startDate.split('-')[2]+"일");
    //var startDate=new Date(startDate.split('-')[0], startDate.split('-')[1], startDate.split('-')[2]);
    console.log(startDate+"~"+endDate);
    var startDateTime=new Date(startDate.split('-')[0], parseInt(startDate.split('-')[1])-1, startDate.split('-')[2]);
    console.log("startDateTime"+startDateTime);

    // 시작날짜가 오늘날짜보다 이전이면 경고창 띄어주기
    console.log("오늘날짜: "+new Date());
    var today2=new Date();
    var tomorrowTime2=new Date(today2.getFullYear(), parseInt(today2.getMonth()), parseInt(today2.getDate())+1);
    console.log("tomorrowTime2: "+tomorrowTime2);
    console.log("tomorrowTime2.getTime(): "+tomorrowTime2.getTime());
    if(tomorrowTime2.getTime()>startDateTime.getTime()) {
        alert("                      내일 날짜부터 예약 가능합니다.\n\n                       날짜를 다시 선택해 주세요.");
    }else {
        // aJax 통신으로 startDate, endDate 쿠키 등록
        var xhr=new XMLHttpRequest();
        xhr.onreadystatechange=function(){
            if(xhr.readyState==4) {
                if(xhr.status==200) {
                    console.log("쿠키 등록 완료:"+xhr.responseText);
                }
            }
        }
        xhr.open("post", "<%=path%>/book/CookieAjaxServlet");
        xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        xhr.send("executeType=add&startDate="+startDate+"&endDate="+endDate);
        
        $("#selectDate").html("선택한 날짜<br>시작일: "+start.format('YYYY-MM-DD')+", 종료일: "+end.format('YYYY-MM-DD'));
        $("#selectDate").css("border-bottom", "1px solid #5f5757");
        $("#selectDateFlag").val('1');
    }   
  });

  
});

function choiceTime() {
    var bookTime=document.getElementById("bookTime");
    // alert('선택된 옵션 text 값='+bookTime.options[bookTime.selectedIndex].text); // 옵션 text 값
    // alert('선택된 옵션 value 값='+bookTime.options[bookTime.selectedIndex].value); // 옵션 text 값
    $("#selectTime").html("<br>선택한 시간<br>"+bookTime.options[bookTime.selectedIndex].value);
    $("#selectTime").css("border-bottom", "1px solid #5f5757");

    $("#selectTimeFlag").val('1');

    // aJax 통신으로 쿠키 등록
    var xhr=new XMLHttpRequest();
    xhr.onreadystatechange=function(){
        if(xhr.readyState==4) {
            if(xhr.status==200) {
                console.log("쿠키 등록 완료:"+xhr.responseText);
            }
        }
    }
    xhr.open("post", "<%=path%>/book/CookieAjaxServlet");
    xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    xhr.send("executeType=add&bookTime="+bookTime.options[bookTime.selectedIndex].value);
}

function book3_Validate() {
    var selectDateFlag = $("#selectDateFlag").val();
    var selectTimeFlag = $("#selectTimeFlag").val();
    console.log("book3_Validate 실행됨");
    console.log("selectDateFlag:"+selectDateFlag);
    console.log("selectTimeFlag:"+selectTimeFlag);
    if (selectDateFlag == "0") {
        alert("예약 날짜를 선택해주세요.");
        return false;
    } else if (selectTimeFlag == "0") {
        alert("예약 시간을 선택해주세요.");
        return false;
    }
}

</script>
</html>