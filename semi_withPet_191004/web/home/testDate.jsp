<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">



<style>
html, body, ul, li, button{
	margin:0px;
	padding:0;		
}
img{
	display:block;
	border:0;
}
button{
	border:0;
	background:none;
}
</style>

<title>Insert title here</title>

<script src="https://kit.fontawesome.com/dcff5cba12.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

</head>
<body>

	<div class='slideS'>
	<button class='prevS' type='button'>
	<span style='font-size:20px;color:snow;'><i class="fas fa-angle-left fa-4x"></i></span>
	</button>
	<ul>
		<li><img src='<%=request.getContextPath() %>/images/bung.png' alt=''></li>
		<li><img src='<%=request.getContextPath() %>/images/bung.png' alt=''></li>
		<li><img src='<%=request.getContextPath() %>/images/bung.png' alt=''></li>
		<li><img src='<%=request.getContextPath() %>/images/bung.png' alt=''></li>
		<li><img src='<%=request.getContextPath() %>/images/bung.png' alt=''></li>
	</ul>
	<button class='nextS' type='button'>
	<span style='font-size:20px;color:snow;'><i class="fas fa-angle-right fa-4x"></i></span>
	</button>
	</div>
	
	
</body>





</html>