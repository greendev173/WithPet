<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	// 확인 눌렀을 때 이동할 페이지
	String loc = (String)request.getAttribute("loc");
	// 취소 눌렀을 때 이동할 페이지
	String loc1 = (String)request.getAttribute("loc1");
	session.setAttribute("isLogin", true);
	String fineEnroll = (String)request.getAttribute("fineEnroll");
	String userId = (String)request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>withpet</title>
</head>
<body>
	
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(function(){
	var flag = confirm("<%=msg%>");
	var userId = '<%=userId%>';
	if(flag == true){
		if(userId != ""){
			location.href="<%=request.getContextPath()%><%=loc%>?userId=<%=userId%>";
		} else {
			alert("시스템오류");
		}
	} else {
		location.href="<%=request.getContextPath()%><%=loc1%>";
	}
})
	
</script>
</html>