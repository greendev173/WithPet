<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String userEmail = (String)request.getAttribute("userMail");
    boolean checkEmail = (boolean)request.getAttribute("checkEmail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
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
			<h3>이메일 확인</h3>
		</div>
	</header>
	<section>
		<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
	<%if(checkEmail == false) { %>
		<div id="input-text">
			<span><%=userEmail %>&nbsp</span>은 이미 사용 중입니다.
		</div>
		<div>
			<form action="<%=request.getContextPath() %>/emailcheck" name="checkEmail" method="post">
				<div class="text-center form-group">
				<input class="form-control" type="text" name="email" id="email" placeholder="withpet@withpet.com" required/>
				<input type="submit" class="btn btn-primary" value="중복확인">
				</div>
			</form>
		</div>
		</div>
	<%} else {%>
	<div class="input-text">
		<p><span><%=userEmail %></span></br>해당 이메일은 사용가능합니다.</p>
	</div>
		<button onclick="authCode();" class="btn btn-outline-primary">메일인증하기</button>
	<%} %>
		<button type="button" class="btn btn-outline-info" onClick="window.close();">닫기</button>
		</div>
	</section>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
        function authCode(){
			location.href="<%=request.getContextPath()%>/sendMail?userMail=<%=userEmail%>";
        }
        
        function checkEmail(){
        	var email = $("#userMail").val();
        	console.log(email);
        	var regExp=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			if(!regExp.test(email)){
				alert("이메일 형식이 다릅니다. 다시 작성해주세요");
			} else {
				$("#emailAuth").submit();
			}
        }
        
    </script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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