<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

<%
	String addr1 = (String)request.getAttribute("addrInput1");
	String addr2 = (String)request.getAttribute("addrInput2");
	String addr3 = (String)request.getAttribute("addrInput3");
	String addr4 = (String)request.getAttribute("addrInput4");
%>
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
                
                <form action="<%=request.getContextPath()%>/book/book021" method="post">
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
                    <div class="row">
                        
                    </div>
                    
                    <div class="row col-5">
                    
                    <div class="col centerClass" id="pet">
                    
                    <div>이름
                    <input name='petName' class='addrInput' type="text" id="upen" placeholder="반려동물 이름을 입력해주세요."
                    style=width:640px;height:35px;></div><br>
					<div>견종
					<input name='petType' class='addrInput' type="text" id="petType" placeholder="견종을 입력해주세요."
					style=width:640px;height:35px;></div><br>
					
					<div>나이
					<input name='petAge' class='addrInput' type="number" id="petAge" placeholder="나이를 숫자로 입력해주세요." 
						style=width:640px;height:35px;></div>
					<div><br></div>
					
					<div>몸무게
					<input name='petWeight' class='addrInput' type="number" id="petWeight" placeholder="몸무게를 숫자로 입력해주세요." 
						style=width:640px;height:35px;></div>
					<div><br></div>
					<br>

					<!-- <input id='bigPet' type='button' name='bigW' class='form-control btn-info' value='대형견'>
					<input id='smallPet' type='button' name='smallW' class='form-control btn-info' value='소형견'> -->

                        </div>
                        
                    </div>
                    <!-- 주소값 파라미터 -->
					<input type='hidden' name='addr1' value='<%=addr1 %>'> 
					<input type='hidden' name='addr2' value='<%=addr2 %>'>
					<input type='hidden' name='addr3' value='<%=addr3 %>'>
					<input type='hidden' name='addr4' value='<%=addr4 %>'>
					
                    <div class="row empty3"></div>
                    <div class="row empty3"></div>
                    <div class="row empty3"></div>
                    <div class="row empty6"></div>
                    <div class="row">
                        <div class="col-3"></div>
                        <div class="col-6"><input type='submit' class='form-control btn-info submitBtn'
                        			value='다음' id="nextBtn"></div>
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
	input[class=addrInput]{
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
	</script>
<!-- FontAwesome 아이콘 사용 script-->
		<script src="https://kit.fontawesome.com/dcff5cba12.js"></script>

</html>