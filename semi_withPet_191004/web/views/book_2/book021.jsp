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

    <!-- 카카오 주소 찾기 API -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
                
                <form name='fnData' method="post">
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
                    <div class="row empty4" id='topPen'> </div>
                    <div class="row"></div>
                    <div class='row'>
                    <div class='col-3'></div>
                    <div class='col-6' style=text-align:center;>원하시는 방문 유형을<br> 선택해 주세요</div>
                    <div class='col-3'></div>
                    </div>
                    <br><br>
                    <div class='row'>
                    <div class='col-12' style=text-align:center;>
                    	<input type='button' class='form-control btn-info' name='epic'
                    	value='정기 방문 돌봄 신청' style=width:730px;text-align:center; onclick='fn_epic();'>
                    	<!-- <input type='hidden' name='epic' value='정기 방문'> -->
                    </div>
                    </div>
                    <br>
                    <div class='row'>
                    <div class='col-12' style=text-align:center;>
                    	<input type='button' class='form-control btn-info' name='standard'
                    	value='일반 방문 돌봄 신청' style=width:730px;text-align:center; onclick='fn_standard();'>
                    	<!-- <input type='hidden' name='standard' value='일반 방문'> -->
                    </div>
                    </div>
                    <br> <br> <br>
                    
                    <div class='row'>
                    <div class='col-1'></div>
                    <div class='col-10' style=text-align:center;font-weight:bold;><i style=color:coral; class="fas fa-calendar-alt"></i>
		                    정기 방문 돌봄 신청 <br>
		            <span style=font-size:10px;>매월 몇회씩 방문 돌봄을 신청하는 서비스로 정기 결제 시 최대 22% 할인 된 가격으로 이용하실 수 있습니다.</span>
                    </div>
                    <div class='col-1'></div>
                    </div>
                    <br>
                    <div class='row'>
                    <div class='col-1'></div>
                    <div class='col-10' style=text-align:center;font-weight:bold;><i style=color:lightpink; class="fas fa-flag"></i>
		                    일반 방문 돌봄 신청 <br>
		            <span style=font-size:10px;>여행 및 출장 등의 이유로 단기 방문 돌봄을 신청하는 서비스로 5회 이상 예약 시 회당 10% 할인된 가격으로 이용하실 수 있습니다.</span>
                    </div>
                    <div class='col-1'></div>
                    </div>
                    
					<%-- <input type='hidden' name='addr1' id='addr1' value='<%=addr1 %>'>
					<input type='hidden' name='addr2' id='addr2' value='<%=addr2 %>'>
					<input type='hidden' name='addr3' id='addr3' value='<%=addr3 %>'>
					<input type='hidden' name='addr4' id='addr4' value='<%=addr4 %>'>
					
					<input type='hidden' name='petName' id='petName' value='<%=petName %>'>
					<input type='hidden' name='petType' id='petType' value='<%=petType %>'>
					<input type='hidden' name='petAge' id='petAge' value='<%=petAge %>'>
					<input type='hidden' name='petWeight' id='petWeight' value='<%=petWeight %>'> --%>
                    
                </form>
            </div>
            <div class="col-3">
            
            </div>
        </div>
        
      
    </div>
    
</body>
<style>
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
        height: 735px;
    }

    .footer {
        /* border: 2px solid red; */
        background-color: greenyellow;
        height: 50px;
        text-align: center;
        align-content: center;
    }

    /* div 나누는 거 확인하기 위해 필요한 스타일, 지우지 말 것 */
    /* div[class|=col] {
        border: 2px solid blue;
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
		function back(){
			history.back();
		}
		function fn_epic(){
			location.href="<%=request.getContextPath()%>/book/book022?addr1=<%=addr1%>&addr2=<%=addr2%>&addr3=<%=addr3%>&addr4=<%=addr4%>&petName=<%=petName%>&petType=<%=petType%>&petAge=<%=petAge%>&petWeight=<%=petWeight%>";
		}
		function fn_standard(){
			location.href="<%=request.getContextPath()%>/book/book022?addr1=<%=addr1%>&addr2=<%=addr2%>&addr3=<%=addr3%>&addr4=<%=addr4%>&petName=<%=petName%>&petType=<%=petType%>&petAge=<%=petAge%>&petWeight=<%=petWeight%>";
		}
	</script>
<!-- FontAwesome 아이콘 사용 script-->
		<script src="https://kit.fontawesome.com/dcff5cba12.js"></script>

</html>

















