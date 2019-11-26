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
                
                <form action="<%=request.getContextPath()%>/book/book_02.jsp" method="post">
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
                    <div class='row' style=height:10px;></div>
                    <div class='row' style=margin:4px;border:1px;>
                    <div class='col-12' style=text-align:center;background-color:white;width:20px;height:300px;>
                    </div>
                    </div>
                    <div class='row empty3'></div>
                    <div class='row' style=margin:4px;>
	                    <div class='col-12' name='rowBorder'></div>
                    </div>
                    
                    <div class='row' style=margin:4px;>
	                    <div class='col-6' name='rowBorder'>
	                    <br>
	                    	<div>반려동물</div>
	                    	<br>
	                    	<div>방문주소</div>
	                    </div>
	                    <div class='col-6' name='rowBorder' style=text-align:right;>
	                    <br>
	                    	<div><%=petName %></div>
	                    	<br>
	                    	<div><%=addr2%>(<%=addr4%>)</div>
	                    	<br>
	                    </div>
                    </div>
                   	<!-- 방문회수 및 금액div -->
                    <div class='row' style=margin:4px;>
                    	<div class='col-6'>
                    	<br>
                    		<div>총 ? 방문</div>
                    	</div>
                    	<div class='col-6' style=text-align:right;>
                    	<br>
                    		<div>원</div>
                    	</div>
                    </div>
                    <!-- 결제 예정 금액 -->
                    <div class='row' style=margin:4px;>
                    	<div class='col-6' name='pay'>
                    	<br>
                    		<div>결제 예정 금액</div>
                    	</div>
                    	<div class='col-6' name='pay' style=text-align:right;>
                    	<br>
                    		<div>원</div>
                    	</div>
                    </div>
                    <br>
                    <div class='row' style=margin:4px;>
                    	<div class='col-12'>
                    		<input type='button' name='btnBorder' class='form-control btn-default submitBtn' value='요금 세부 정보 보기'>
                    	</div>
                    </div>
                    
                    <div class='row empty3'></div>
                    
                    <div class='row' style=height:115px;>
                    	<div class='col-12' name='lastBox'>
                    	<br>
                    		<div class='col-3'>총 ?회</div>
                    		<div class='col-3' style=color:skyblue;>￦ ?가격 </div>
                    		<div class='col-6' style=left:360px;bottom:50px;>
                    			<input name='lastPay' type='submit' value='예약하기' class='form-control btn-info submitBtn'>
                    		</div>
                    	</div>
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
	input[name=lastPay]{
		height:70px;
		
	}
	div[name=lastBox]{
		border:0.3px solid gray;
		box-shadow: 1px 1px 8px 0.5px gray;
		opacity:0.7;
		height:115px;
	}
	input[name=btnBorder]{
		border:1px solid skyblue;
		color: skyblue;
	}
	div[name=pay]{
		color:skyblue;
	}
	div[name=rowBorder]{
		border-bottom:0.3px solid gray;
	}
	textarea{
		background-color:snow;
		border:none;
		border-top:4px solid white;
		border-bottom:4px solid white;
	}
	/* --체크박스-- */
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
	/* --체크박스-- */
	    
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
        height: 800px;
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
	  color: gray;
	  font-size: 0.8em;
	  font-weight: 400;
	  opacity: 0.5;
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