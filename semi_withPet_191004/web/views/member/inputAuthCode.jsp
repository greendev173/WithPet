<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userMail = (String)request.getAttribute("userMail");
	String authCode = (String)request.getAttribute("authCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증코드</title>
</head>
<style>
	body {
		margin : 0;
	}
	#div-header {
		text-align : left;
		background-color : dodgerblue;
		color : white;
		margin : 0;
		margin-bottom : 10px;
		padding : 20px;
		font-size : 1.2em;
	}
	
	div#input-text{
		margin-left : 10px;
		color : #666;
		line-height : 0.8em;
	}
	
	div#input-text>span{
		font-weight : bolder;
		color : #555;
	}
	
	#inputLabel-div{
		margin: 0px;
		padding : 4px;
		background-color : #ddd;
	}
	
	#auth-div {
		margin-left : 10px;
	}
	
	#auth-button>button{
		margin-top : 8px;
	}
	

</style>
<body>
	<header>
		<div id="div-header">
			<h3>인증코드입력</h3>
		</div>
	</header>
	<section>
	<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
		<div id="input-text">
			<p>입력하신 메일 <span>[<%=userMail %>]</span>로</p>
			<p>인증코드가 전송되었습니다. 인증코드를 입력해주세요.</p>
		</div>
		<div class="text-center" id="auth-div">
			<div id="inputLabel-div">
				<label for="inputCode" id="inputLabel">인증번호</label>
			</div>
			<div class="form-group" id="auth-button">
				<input type="text" class="form-control" name="inputCode" id="inputCode" placeholder="인증코드입력">
				<button type="button" class="btn btn-outline-info" onClick="window.close();">닫기</button>
				<button class="btn btn-outline-primary" onClick="checkCode();">이메일인증</button>
			</div>
		</div>
	</div>
	</section>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
    	
    
    // 타이머
    // var mins = 3; 
    // var secs = mins * 60;
    // var currentSeconds = 0;
    // var currentMinutes = 0;

    // setTimeout('Decrement()',1000); 

    // function Decrement() {
    //     currentMinutes = Math.floor(secs / 60);
    //     currentSeconds = secs % 60;
    //     if(currentSeconds <= 2) currentSeconds = "0" + currentSeconds;
    //     secs--;
    //     document.getElementById("timer").innerHTML = currentMinutes + ":" + currentSeconds; //Set the element id you need the time put into.
    //     if(secs !== -1) setTimeout('Decrement()',1000);
    // }
    
    function checkCode(){
	   	var userCode = $('#inputCode').val();
    	var serverCode = <%=authCode%>;
    		if(userCode == serverCode){
    			alert('인증성공');
    			opener.document.location.href='<%=request.getContextPath()%>/memberEnroll?userMail=<%=userMail%>';
    			window.close();
    		} else {
    			alert('인증코드를 잘 못 입력하셨습니다.');
    			$('#inputCode').val("");
    			$("#inputCode").focus();
    		}	
    }
	</script>
	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>