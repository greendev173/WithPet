<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.filter.EncryptPasswordWrapper" %>
<%
	String target = (String)request.getAttribute("target");
	String purpose = (String)request.getAttribute("purpose");
	String email = (String)request.getAttribute("email");
%>
<%@ include file="/views/common/header.jsp"%>
<style>
	#intro-user>h3{
		font-weight: bold;
		margin-bottom : 20px;
	}
	
	#intro-user>p>span{
		font-weight: bold;
	}
	
	#intro-user>button{
		margin-top : 10px;
	}
</style>
	<div id="banner-area">
		<img src="<%=request.getContextPath() %>/images/banner/banner2.png" alt ="" />
		<!-- <div class="parallax-overlay"></div> -->
			<!-- Subpage title start -->
			<div class="banner-title-content">
	        	<div class="text-center">
		        	<h2>찾기 결과</h2>
		        	<ul class="breadcrumb">
			            <li>Home</li>
			            <li> 찾기결과</li>
		          	</ul>
	          	</div>
          	</div><!-- Subpage title end -->
	</div><!-- Banner area end -->
	<section>
		<div class="container">
			<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2" id="intro-user">
					<h3><%=purpose %> 안내</h3>
					<p><%=purpose%>가 <span>[<%=email %>]</span>로 전송되었습니다.</p>
					<%if(purpose.equals("새로운 비밀번호")){ %>
						<p> 임시비밀번호는 반드시 로그인 후 변경하여 사용하세요.</p>
					<%} %>
					<button class="btn btn-secondary" onClick="moveToLogin();">로그인페이지로 이동</button>
			</div>
		</div>
	</section>
	<script>
		function moveToLogin(){
			location.href="<%=request.getContextPath()%>/login";
		}
	</script>
<%@ include file="/views/common/footer.jsp"%>