<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//쿠키 
	Cookie[] cookies = request.getCookies();
	String saveId = "";
	if(cookies != null){
	for(Cookie c : cookies){
		if(c.getName().equals("saveId")){
			saveId = c.getValue();
		};
	};
	}	
%>
<%@ include file="/views/common/header.jsp"%>
<!-- 스타일 태그 추가 -->
<style>
	span>ul>li {
		list-style-type : none;
		display : inline-block;
		padding : 1em;
		margin-top : 0.6em;
		background-color: #555;
	}
	
	span>ul>li>a{
		color: #ddd;
	}
	
	span>ul {
		padding-left: 0px;
		font-weight: bold;
	}
	
	#login-submit{
		background-color : dodgerblue;
		font-weight: bold;
		color: white;
	}
	
	#saveId {
		margin-top : 0.6em;
	}
</style>
<!-- banner area 추가 -->
	<div id="banner-area">
		<img src="<%=request.getContextPath() %>/images/banner/banner2.png" alt ="" />
		<!-- <div class="parallax-overlay"></div> -->
			<!-- Subpage title start -->
			<div class="banner-title-content">
	        	<div class="text-center">
		        	<h2>로그인</h2>
		        	<ul class="breadcrumb">
			            <li>Home</li>
			            <li><a href="<%=request.getContextPath()%>/login"> 로그인</a></li>
		          	</ul>
	          	</div>
          	</div><!-- Subpage title end -->
	</div><!-- Banner area end -->
		<section id="main-container">
			<div class="container ">
				<div class="login-frm col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<a href="<%=request.getContextPath()%>/index.jsp"> <img
								class="img-responsive"
								src="<%=request.getContextPath()%>/images/logo1.png" alt="logo">
							</a>
					<div class="login-box well">
						<form role="form" method="post" action="<%=request.getContextPath()%>/loginexec" onsubmit="return validate();">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요"
									class="form-control" value='<%=saveId != null? saveId : "" %>' />
							</div>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" id="userPw" name="userPw" value=''
									placeholder="비밀번호를 입력하세요" class="form-control" />
							</div>
							<div class="text-center">
							<input type="submit" id="login-submit"
								class="btn btn-default btn-block" value="로그인"/>
							</button>
							<div id="saveId">
								<input type="checkbox" class="form-check-input" name="saveId" id="saveId" <%=saveId.equals("")? null:"checked"%>/>아이디저장
							</div>
							<div class="wrapper-container">
								<span class="text-center">
									<ul class="member_login_select">
										<li><a href="<%=request.getContextPath() %>/findId" class="text-sm"> 아이디찾기 </a></li>
										<li><a href="<%=request.getContextPath() %>/findPw" class="text-sm"> 비밀번호찾기 </a></li>
										<li><a href="<%=request.getContextPath() %>/checkEmail" class="text-sm"> 회원가입 </a></li>
									</ul>
								</span>
							</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function validate(){
		if($("#userId").val().trim().length < 6){
			alert('아이디는 6글자 이상 입력하세요.');
			$("#userId").focus();
			return false;
		}

		if($("#userPw").val().trim().length() == 0){
			alert('비밀번호를 입력하세요.');
			$('#userPw').focus();
			return false;
		} 
	}


</script>
<!--/ Main container end -->
<%@ include file="/views/common/footer.jsp"%>