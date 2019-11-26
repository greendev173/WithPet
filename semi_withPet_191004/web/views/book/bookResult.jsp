<%@page import="jimin_withPet.model.vo.Petsitter"%>
<%@page import="hwang.withpet.book.model.vo.Price"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hwang.withpet.book.model.vo.Book" %>
<%
	Cookie[] cookies=request.getCookies();

	///book/book1.jsp에서 입력한 값 받아오기
	String petsitterType = ""; // 펫시터 타입
	String userPostcode = ""; // 고객 우편번호
	String roadAddress="";
	String detailAddress="";
	
	// /book/book2.jsp에서 입력한 값 받아오기
	int petCount=0; // 펫 마리 수 변수
	String[] petName = null; // 강아지 이름
	String[] breed = null; // 견종
	int[] petAge = null; // 강아지 나이
	double[] petWeight = null; // 강아지 몸무게
	String[] petId=null; // 강아지 아이디
	
	// /book/book3.jsp에서 입력한 값 받아오기
	String startDate = ""; // 시작 날짜
	String endDate = ""; // 종료 날짜
	String time = ""; // 시간
	
	// /book/book4.jsp에서 입력한 값 받아오기
	int requestCount=0; // 요청사항 개수 변수
	String[] checkRequest=null;
	String userRequest = ""; // 기타 요청 사항
	
	// /book/bookSelectPetsitter.jsp에서 입력한 값 받아오기
	Price price=(Price)request.getAttribute("price");
	Petsitter petsitter=(Petsitter)request.getAttribute("petsitter");

	int[] index=new int[4];
	
	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			String cookieName=cookies[i].getName();
			String cookieValue=cookies[i].getValue();
			if(cookieName.equals("petsitterType")) {
				petsitterType=URLDecoder.decode(cookieValue, "UTF-8");
			}else if(cookieName.equals("userPostcode")){
				userPostcode=cookieValue;
			}else if(cookieName.equals("roadAddress")){
				roadAddress=URLDecoder.decode(cookieValue, "UTF-8");
			}else if(cookieName.equals("detailAddress")){
				detailAddress=URLDecoder.decode(cookieValue, "UTF-8");
			}else if(cookieName.equals("petCount")){
				petCount=Integer.parseInt(cookieValue);
				petName=new String[petCount];
				breed=new String[petCount];
				petAge=new int[petCount];
				petWeight=new double[petCount];
				petId=new String[petCount];
			}else if(cookieName.equals("startDate")) {
				startDate=URLDecoder.decode(cookieValue, "UTF-8");
			}else if(cookieName.equals("endDate")) {
				endDate=URLDecoder.decode(cookieValue, "UTF-8");
			}else if(cookieName.equals("bookTime")) {
				time=URLDecoder.decode(cookieValue, "UTF-8");
			}else if(cookieName.equals("requestCount")) {
				requestCount=Integer.parseInt(cookieValue);
				checkRequest=new String[requestCount];
			}else if(cookieName.equals("userRequest")) {
				userRequest=URLDecoder.decode(cookieValue, "UTF-8");
			}	
		}
	}
	
	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			for(int j=0; j<petCount; j++) {
				if(cookies[i].getName().equals("petName"+(j+1))) {
					petName[j]=URLDecoder.decode(cookies[i].getValue(), "UTF-8");
				}else if(cookies[i].getName().equals("breed"+(j+1))) {
					breed[j]=URLDecoder.decode(cookies[i].getValue(), "UTF-8");
				}else if(cookies[i].getName().equals("petAge"+(j+1))) {
					petAge[j]=Integer.parseInt(cookies[i].getValue());
				}else if(cookies[i].getName().equals("petWeight"+(j+1))) {
					petWeight[j]=Double.parseDouble(cookies[i].getValue());
				}else if(cookies[i].getName().equals("petId"+(j+1))) {
					if(cookies[i].getValue().equals("")) { // 새로운 반려견이면
						petId[j]="0";
					}else {
						petId[j]=cookies[i].getValue();
					}
				}
			}
			
			for(int j=0; j<requestCount; j++) {
				if(cookies[i].getName().equals("checkRequest"+(j+1))) {
					checkRequest[j]=URLDecoder.decode(cookies[i].getValue(), "UTF-8");
				}
			}
		}
	}
	
	String userAddress=roadAddress+" "+detailAddress;

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

    <!-- 폰트 추가 -->
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' rel='stylesheet' type='text/css'>

    <title>예약하기</title>
</head>
<body>
    <div class="fixedHeader">
        <div style="height: 100%;">
            <button type="button" class="close" aria-label="Close"
                onclick="moveServicePage();">
                <span aria-hidden="true">&times;</span>
            </button>
            예약하기
        </div>
    </div>
        <div class="container-fluid">
            <div class="row empty1"></div>
            <div class="row middle">
                <div class="col-12 centerClass">
                    <div class="row empty2"></div>
                    <form action="<%=path%>/book/visitPetsitterEnd" method="POST">
                        <div class="row">
                            <div class="col-12"><span class='input-text'>펫시터 정보</span></div>
                        </div>
                        <div class="row">
                        	<div class="col-3">
                            <img style="width:55px; border-radius:15px;" src="<%=path%>/images/team/<%=petsitter.getProfileImg()%>">
                            </div>
                            <div class="col-3">
                            <input class="readonlyInput" readonly type="text" name="petsitterType" value="<%=petsitterType%>">
                            </div>
                            <div class="col-2">
                            <input class="readonlyInput" readonly type="text" name="petsitterName" value="<%=petsitter.getPetsitterName()%>">
                            </div>
                            <div class="col-4">
                            <% if(petsitter.getGrade()=='G') { %>
                            <input class="readonlyInput" readonly type="text" value="펫시터등급: 일반펫시터">
                            <input type="hidden" name="petsitterGrade" value="<%=petsitter.getGrade()%>">
                            <% }else { %>
                            <input class="readonlyInput" readonly type="text" value="펫시터등급: 전문펫시터">
                            <input type="hidden" name="petsitterGrade" value="<%=petsitter.getGrade()%>">
                            <%} %>
                            </div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-12"><span class='input-text'>고객 우편번호</span></div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input class="readonlyInput" readonly type="text" name="userPostcode" value="<%=userPostcode %>"></div>
                        </div>
                        <div class="row">
                            <div class="col-12"><span class='input-text'>고객 주소</span></div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input class="readonlyInput" readonly type="text" name="userAddress" value="<%=userAddress %>"></div>
                                <input type="hidden" name="roadAddress" value="<%=roadAddress%>">
                                <input type="hidden" name="detailAddress" value="<%=detailAddress%>">
                                <input type="hidden" name="petsitterId" value="<%=petsitter.getPetsitterId()%>">
                        </div>
                        <div class="row empty3">
                            <input type="hidden" name="petCount" value="<%=petCount%>">
                        </div>
                        
                        
                        
                        <!--강아지 정보 출력 시작-->
                        <%for(int i=0; i<petCount; i++) { %>
                        <div class="row">
                            <div class="col-12"><span class='input-text'>반려견 정보<%=(i+1) %></span></div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input class="readonlyInput" readonly type="text" name="petInfo" value="이름: <%=petName[i] %>, 견종: <%=breed[i] %>, 나이: <%=petAge[i] %>살, 몸무게: <%=petWeight[i] %>kg"></div>
                                <input type="hidden" name="petName<%=(i+1)%>" value="<%=petName[i]%>">
                                <input type="hidden" name="breed<%=(i+1)%>" value="<%=breed[i]%>">
                                <input type="hidden" name="petAge<%=(i+1)%>" value="<%=petAge[i]%>">
                                <input type="hidden" name="petWeight<%=(i+1)%>" value="<%=petWeight[i]%>">
                                <input type="hidden" name="petId<%=(i+1)%>" value="<%=petId[i]%>">
                        </div>
                        <%} %>
                        <!--강아지 정보 출력 끝-->
                        
                        
                        
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-12"><span class='input-text'>시작 날짜</span></div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input class="readonlyInput" readonly type="text" name="startDate" value="<%=startDate %>"></div>
                        </div>
                        <div class="row">
                            <div class="col-12"><span class='input-text'>종료 날짜</span></div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input class="readonlyInput" readonly type="text" name="endDate" value="<%=endDate %>"></div>
                        </div>
                        <div class="row">
                            <div class="col-12"><span class='input-text'>시간</span></div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input class="readonlyInput" readonly type="text" name="time" value="<%=time %>"></div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-12"><span class='input-text'>고객 요청 사항</span></div>
                        </div>
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-10 textAreaWrapper">
                                <textarea class="leftAlignClass" name="userRequestAll" id="userRequestAll" col="8" rows="10" readonly></textarea>
                            </div>
                            <div class="col-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-12"><span class='input-text'>가격</span></div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <input class="readonlyInput" readonly type="text" name="totalPrice" id="totalPrice" value="원"></div>
                        </div>
                        <div class="row">
                            <input type="hidden" name="requestCount" value="<%=requestCount%>">
                        </div>
                        <div class="row empty3" id="userRequestContainer">                    
                        </div>
                        <div class="row empty3" id="checkRequestContainer">                    
                        </div>
                        <div class="row">
                            <div class="col-6"><input type='button'' class='btn-primary form-control submitBtn' value='이전'
                                onclick="location.href='<%=path%>/book/VisitPetsitterSelect';"></div>
                            <div class="col-6"><input type='submit' class='btn-primary form-control submitBtn' value='예약' id="finalBookBtn"></div>
                        </div>
                        <div class="row empty3"></div>
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
        height:30.5px;
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
        border: 2px solid green;
    } */

    .select {
        text-align: center;
    }
    .btn2 {
        width: 42%;
        font-size: 1.2vw;
        padding-left: 0px;
        padding-right: 0px;
        margin-right: 5px;
    }
    .submitBtn {
        width:100%;
    }
    .leftAlignClass {
        text-align: left;
        font-size: 17px;
        line-height: 1.7;
        letter-spacing: -.5px;
    }
    .centerClass {
        text-align: center;
        font-size: 17px;
        line-height: 1.7;
        letter-spacing: -.5px;
    }
    .readonlyInput {
        background-color:whitesmoke;
        color:#7e7a7a;
        border: 1px solid whitesmoke;
        border-bottom-color: #7e7a7a;
        padding: 0px 2px 0px;
        margin-bottom: 10px;
        width: 100%;
        font-size: 14px;
        text-align: center;
    }
    #userRequestAll{
        width: 100%;
        height: 100%;
        border: none;
        background-color: transparent;
        color: #828282;
        font-size: 14px;
        -webkit-appearance: none;
        outline: none;
        resize: none;
    }
    .textAreaWrapper {
        width: 80%;
        height: 170px;
        padding: 12px 15px;
        box-sizing: border-box;
        border: 1px solid hsla(0,0%,65%,.5);
    }
</style>

<script>

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


// jQuery 코드
$(function() {
	var pricePerGrade=<%=price.getPricePerGrade()%>;
	var pricePerTime=<%=price.getPricePerTime()%>;
	var pricePerWeight=<%=price.getPricePerWeight()%>;
	if("<%=petsitter.getGrade()%>"=="M") { 
		pricePerGrade+=pricePerGrade;
	}
	<% for(int i=0; i<petCount; i++) {
		if(petWeight[i]<10) { // 소형견일 때 %>
			pricePerWeight+=pricePerWeight*1;
		<%}else if(petWeight[i]>=10 && petWeight[i]<20) { // 중형견일 때 %>
			pricePerWeight+=pricePerWeight*2;
		<% }else if(petWeight[i]>=20) { // 대형견일 때%>
			pricePerWeight+=pricePerWeight*3;
		<% }%>
	<% } %>
	var totalPrice=pricePerGrade+pricePerTime+pricePerWeight;
	$("#totalPrice").val(numberWithCommas(totalPrice)+"원");
    <%for(int i=0; i<requestCount; i++) { %>
    $("#userRequestAll").val($("#userRequestAll").val()+'요구사항<%=(i+1) %>: <%=checkRequest[i] %>\n\n');
    $("#checkRequestContainer").html($("#checkRequestContainer").html()+"<input type='hidden' name='checkRequest<%=(i+1)%>' value='<%=checkRequest[i]%>'/>");
    <%} %>
    $("#userRequestAll").val($("#userRequestAll").val()+'기타 요구사항:<%=userRequest %>');
    var userRequest = "<%=userRequest %>";
    console.log("기타 요구사항:"+userRequest);
    userRequest = userRequest.replace(/(?:\r\n|\r|\n)/g, '\\n'); // 개행한 것들 정규표현식으로 찾아서 \\n로 바꾸기
    console.log("기타 요구사항(정규표현식 거친 후):"+userRequest);
    $("#userRequestContainer").html("<input type='hidden' name='userRequest' value='"+userRequest+"' />");
});

function moveServicePage() {
    if(confirm("예약화면에서 나가시겠습니까?")) {
        location.href="<%=path%>/service";
        return true;
    }else {
        return false;
    }
}

// 소형견 버튼 눌렀을 때
$('#smallDogBtn').click(function onclick(){
    $(this).css({
        'backgroundColor' : 'purple'
    });
    $('#largeDogBtn').css({
        'backgroundColor' : '#343a40'
    });
});

// 대형견 버튼 눌렀을 때
$('#largeDogBtn').click(function onclick(){
    $(this).css({
        'backgroundColor' : 'purple'
    });
    $('#smallDogBtn').css({
        'backgroundColor' : '#343a40'
    });
});

// 예약 버튼 눌렀을 때
$('#finalBookBtn').click(function() {
    //alert("결제 서비스 예정입니다.");
    if(confirm("예약을 진행하시겠습니까?")) {
    	return true;
    }else {
    	return false;
    }
});


</script>
</html>