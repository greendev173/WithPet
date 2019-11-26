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
    <!-- 체크박스 링크 -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	  <!-- Bootstrap core CSS -->
	  <link href="css/bootstrap.min.css" rel="stylesheet">
	  <!-- Material Design Bootstrap -->
	  <link href="css/mdb.min.css" rel="stylesheet">
	  <!-- Your custom styles (optional) -->
	  <link href="css/style.css" rel="stylesheet">
    	
	    <!-- JQuery -->
	  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	  <!-- Bootstrap tooltips -->
	  <script type="text/javascript" src="js/popper.min.js"></script>
	  <!-- Bootstrap core JavaScript -->
	  <script type="text/javascript" src="js/bootstrap.min.js"></script>
	  <!-- MDB core JavaScript -->
	  <script type="text/javascript" src="js/mdb.min.js"></script>

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
                
                <form action="<%=request.getContextPath()%>/book/book03" method="post">
                   <!--  방문펫시터 예약을 위해 고객님의 주소를 알려주세요 -->
                    <div class="row empty5">
                        <div class="col-3"><span class='xbutton' onclick="back();"><i class="far fa-times-circle"></i></span></div>
                        <div class="col-6" id="printPetsitterType">
                          <h5>예약 전 안내 사항</h5>  
                        </div>
                        <div class="row empty2"></div>
                        <div class="col-3"></div>
                    </div>
                    <div class="row empty5"></div>
                    <div class="row empty4" id='topPen'> </div>
                    
					<div class='row' name='Rborder'>
					        <div class="col-12" style=left:5px;position:relative;top:15px;>
					            <input type="checkbox" name="fancy-checkbox-default" id="fancy-checkbox-default checked1" autocomplete="off" />
					            <div class="btn-group">
					                <label for="fancy-checkbox-default checked1" class="btn btn-info">
					                    <span class="glyphicon glyphicon-ok"></span>
					                    <span> </span>
					                </label>
					                <label for="fancy-checkbox-default checked1" class="btn active labelSize" style=width:670px;>
					                원하는 시간내 안에서 예약이 진행됩니다.
					                </label>
					            </div>
							</div>
					</div>
					<div class='row' name='Rborder1'>
					<div class='col-2'></div>
				<div class='col-8'>도그메이트는 원활한 돌봄을 위해 시간대로 운영되고 있습니다. 
				오전 (9~12) 오후 (12~15 / 15~18) 저녁 (18~21) 타임 중 요청한 시간대 내에서 스케쥴에 따라 시간대가 결정됩니다.
				</div>
				<div class='col-2'></div>
				</div>
				
                  <br>
                  
                  <div class='row' name='Rborder'>
					        <div class="col-12" style=left:5px;position:relative;top:15px;>
					            <input type="checkbox" name="fancy-checkbox-default" id="fancy-checkbox-default checked2" autocomplete="off" />
					            <div class="btn-group">
					                <label for="fancy-checkbox-default checked2" class="btn btn-info">
					                    <span class="glyphicon glyphicon-ok"></span>
					                    <span> </span>
					                </label>
					                <label for="fancy-checkbox-default checked2" class="btn active labelSize" style=width:670px;>
					                돌봄은 1시간 단위로 제공됩니다.
					                </label>
					            </div>
							</div>
					</div>
					<div class='row' name='Rborder1'>
					<div class='col-2'></div>
				<div class='col-8'>펫시터는 요청한 시간대에 방문해 기본 1시간 돌봄을 (산책, 배식, 배변처리) 진행합니다.
또한 1시간 내 최대 2마리까지 산책이 가능하며 3마리 이상 산책을 원할 경우 2시간 돌봄으로 예약 신청 바랍니다.
				</div>
				<div class='col-2'></div>
				</div>
				
                    <br>
                    
                    <div class='row' name='Rborder'>
					        <div class="col-12" style=left:5px;position:relative;top:15px;>
					            <input type="checkbox" name="fancy-checkbox-default" id="fancy-checkbox-default checked3" autocomplete="off" />
					            <div class="btn-group">
					                <label for="fancy-checkbox-default checked3" class="btn btn-info">
					                    <span class="glyphicon glyphicon-ok"></span>
					                    <span> </span>
					                </label>
					                <label for="fancy-checkbox-default checked3" class="btn active labelSize" style=width:670px;>
					                2명의 펫시터가 교차 배정될 수 있습니다.
					                </label>
					            </div>
							</div>
					</div>
					<div class='row' name='Rborder1'>
					<div class='col-2'></div>
				<div class='col-8'>원하는 날짜, 시간대 방문을 위해 최소 2명의 펫시터가 배정될 수 있으며 펫시터 지정은 불가합니다.
				</div>
				<div class='col-2'></div>
				</div>
				
				<br>
				
				<div class='row' name='Rborder'>
					        <div class="col-12" style=left:5px;position:relative;top:15px;>
					            <input type="checkbox" name="fancy-checkbox-default" id="fancy-checkbox-default checked4" autocomplete="off" />
					            <div class="btn-group">
					                <label for="fancy-checkbox-default checked4" class="btn btn-info">
					                    <span class="glyphicon glyphicon-ok"></span>
					                    <span> </span>
					                </label>
					                <label for="fancy-checkbox-default checked4" class="btn active labelSize" style=width:670px;>
					               하네스가 없으면 산책이 불가합니다.
					                </label>
					            </div>
							</div>
					</div>
					<div class='row' name='Rborder1'>
					<div class='col-2'></div>
				<div class='col-8'>도그메이트는 산책 시 발생될 수 있는 놓침 사고를 예방하기 위해 이중산책줄을 사용합니다.
도그메이트에서 준비한 목줄과 하네스를 결합하여 사고를 방지하고 있습니다. 하네스가 없을 경우 산책은 불가하며 실내놀이로 대체됩니다.
				</div>
				<div class='col-2'></div>
				</div>
				
				<br>
				<div class='row' name='Rborder'>
					        <div class="col-12" style=left:5px;position:relative;top:15px;>
					            <input type="checkbox" name="fancy-checkbox-default" id="fancy-checkbox-default checked5" autocomplete="off" />
					            <div class="btn-group">
					                <label for="fancy-checkbox-default checked5" class="btn btn-info">
					                    <span class="glyphicon glyphicon-ok"></span>
					                    <span> </span>
					                    
					                </label>
					                
					                <label for="fancy-checkbox-default checked5" class="btn active labelSize" style=width:670px;>
					              반려동물 등록 및 인식표를 의무화해주세요.
					                </label>
					            </div>
							</div>
					</div>
					
					<div class='row' name='Rborder1'>
					<div class='col-2'></div>
					
				<div class='col-8'>도그메이트는 동물등록 의무화 관련 법령을 이행하지 않아 발생되는 모든 책임들에 대한 의무가 없음을 알려드립니다.
				</div>
				<div class='col-2'></div>
				</div>
				
				<input type='hidden' name='addr1' value='<%=addr1 %>'>
				<input type='hidden' name='addr2' value='<%=addr2 %>'>
				<input type='hidden' name='addr3' value='<%=addr3 %>'>
				<input type='hidden' name='addr4' value='<%=addr4 %>'>
				
				<input type='hidden' name='petName' value='<%=petName%>'>
				<input type='hidden' name='petType' value='<%=petType%>'>
				<input type='hidden' name='petAge' value='<%=petAge%>'>
				<input type='hidden' name='petWeight' value='<%=petWeight%>'>
				
				<div class="row empty3"></div>
				<div class="row empty3"></div>
				<div class="row">
                    <div class="col-3"></div>
                    <div class="col-6">
                    <input type='submit' class='form-control btn-info submitBtn' value='확인했습니다.' id="nextBtn" onclick='fn_checked();'>
                    </div>
                    <div class="col-3"></div>
               </div>
               <div class="row empty3"></div>
                    <!-- <div class='row'>
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
                    </div> -->
					
                    
                    
                    <!-- <div class="row">
                        <div class="col-3"></div>
                        <div class="col-6"><input type='submit' class='form-control btn-info submitBtn'
                        			value='다음' id="nextBtn"></div>
                        <div class="col-3"></div>
                    </div> -->
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
	div[name="Rborder"]{
		/* border-top:1px solid gray; */
		height:70px;
	}
	div[name="Rborder1"]{
		border-bottom:0.1px solid gray;
		height:120px;
		opacity:0.7;
	}
	div[class="Ckcontent"]{
		border:0.2px solid gray;
		text-align:justify;
		opacity:0.7;
	}
	/* 체크박스 css */
	label[class="labelSize"]{
		width:200px;
		height:200px;
	}
	input[type="checkbox"] {
	    display: none;
	}
	
	input[type="checkbox"] + .btn-group > label span {
	    width: 20px;
	}
	
	input[type="checkbox"] + .btn-group > label span:first-child {
	    display: none;
	}
	input[type="checkbox"] + .btn-group > label span:last-child {
	    display: inline-block;   
	}
	input[type="checkbox"]:checked + .btn-group > label span:first-child {
	    display: inline-block;
	}
	input[type="checkbox"]:checked + .btn-group > label span:last-child {
	    display: none;   
	}
	/* label[class="labelSize"]{
		width:200px;
		height:200px;
	} */
	/* 체크박스 css끝 */
	
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
        height: 1000px;
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
        border: 0.1px solid blue;
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
		function fn_checked(){
			var checked = document.getElementsByName("fancy-checkbox-default");
			var ckd = false;
			
			for(var i = 0; i<checked.length;i++){
				if(checked[i].checked){
					ckd = true;
				}else{
					ckd = false;
				}
			}
			if(ckd){
				alert("확인");
				return false;
			}else
				alert("모든 약관에 동의해 주세요.");
		}
	</script>
<!-- FontAwesome 아이콘 사용 script-->
		<script src="https://kit.fontawesome.com/dcff5cba12.js"></script>

</html>