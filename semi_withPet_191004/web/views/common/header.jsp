<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="semi_withPet.model.vo.Member" %>
<%
	// 아이디 저장 관련 프로세스
	Member loginMember = null; 
	if(session.getAttribute("loginMember") != null){
		loginMember = (Member)session.getAttribute("loginMember");
	}
	

%>    
    
<!DOCTYPE html>
<html lang="en">

<head>

	<!-- Basic Page Needs
	================================================== -->
	<meta charset="utf-8">
	<title>With Pet</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Mobile Specific Metas
	================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Favicons
	================================================== -->
	<link rel="icon" href="<%=request.getContextPath() %>/images/favicon/favicon-32x32.png" type="image/x-icon" />
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="<%=request.getContextPath() %>/images/favicon/favicon-144x144.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=request.getContextPath() %>/images/favicon/favicon-72x72.png">
	<link rel="apple-touch-icon-precomposed" href="<%=request.getContextPath() %>/images/favicon/favicon-54x54.png">

	<!-- CSS
	================================================== -->

	<!-- Bootstrap -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
	<!-- Template styles-->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
	<!-- Responsive styles-->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/responsive.css">
	<!-- FontAwesome -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/font-awesome.min.css">
	<!--기본 icon CSS-->
	<!-- Animation -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
	<!-- Prettyphoto -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/prettyPhoto.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.theme.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/flexslider.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cd-hero.css">
	<!-- Style Swicther -->
	<link id="style-switch" href="<%=request.getContextPath() %>/css/presets/preset3.css" media="screen" rel="stylesheet" type="text/css">
	<!-- 별점 bootstrap -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/fontawesome-stars.css"> 
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/fontawesome-stars-o.css"> 
	
	<script src = "http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
	<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="body-inner">
		<!-- Header start -->
		<header id="header" class="navbar-fixed-top header2" role="banner">
						<div class="navbar-brand" style='float:left;'>
							<a href="<%=request.getContextPath() %>/index.jsp">
								<img class="img-responsive" id='logoImage' src="<%=request.getContextPath() %>/images/logo1.png" alt="logo" 
								style="padding-top : 20px;padding-left:200px;">
							</a>
						</div>
						<script>
							$("#logoImage").hover(function(){
								$(this).attr("src",$(this).attr("src").replace("logo1.png", "logo11.png"));
							},function(){
								$(this).attr("src",$(this).attr("src").replace("logo11.png", "logo1.png"));
							});
						</script>
			<div class="container">
				<div class="row">
					<!-- Logo start -->

					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>

					<!--/ Logo end -->

					<nav class="collapse navbar-collapse clearfix" role="navigation">
						<ul class="nav navbar-nav navbar-right" style="padding-top : 20px;">
							<li><a href="<%=request.getContextPath() %>/">홈</a></li>
							<li class="dropdown">
								<a href="<%=request.getContextPath() %>/#" class="dropdown-toggle" data-toggle="dropdown">예약하기 <i
										class="fa fa-angle-down"></i></a>
								<div class="dropdown-menu">
									<ul>
										<li><a href="<%=request.getContextPath() %>/service">펫시터 예약하기</a></li>
										<!--매칭 시작-->
										<li><a href="<%=request.getContextPath() %>/home/insurance">보험 정책</a></li>
										<!--보험 서비스 설명.-->
										<!--가격정보-->
										<!-- "testimonial.html" -->
										<!-- <li><a href="faq.html">FAQ</a></li> -->
									</ul>
								</div>
							</li>
						
							
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">펫시터소개<i
										class="fa fa-angle-down"></i></a>
								<div class="dropdown-menu">
									<ul>
										<li><a href="<%=request.getContextPath() %>/petsitterList?area=all">일반펫시터</a></li>
										<li><a href="<%=request.getContextPath() %>/masterPetsitterList?area=all">전문펫시터</a></li>
										<!-- <li><a href="pricing.html">Pricing Table</a></li>
										<li><a href="404.html">404 Page</a></li> -->
									</ul>
								</div>
							</li>
							<li><a href="<%=request.getContextPath()%>/apply/apply_main<%if(loginMember!=null) {%>?userId=<%=loginMember.getUserId()%><%}%>">펫시터지원</a></li>
							
							<%if(loginMember != null) {%>
									<%if(!(loginMember.getGrade().equals("A"))){ %><li><a href="<%=request.getContextPath() %>/member/mypage">마이페이지</a></li><%} %>
									<li><a href="<%=request.getContextPath() %>/logout">로그아웃</a>
									<%if(loginMember.getUserId().equals("admin1")){ %>
									<li><a href="<%=request.getContextPath() %>/admin/adminMain">관리자페이지</a></li> <!-- 09/25 5:45수정 -->
								<%}} else { %>
									<li><a href="<%=request.getContextPath()%>/login">로그인</a></li>
									<li><a href="<%=request.getContextPath()%>/checkEmail">회원가입</a>
								<%} %>
							<!-- <li><a href="contact.html">Login</a></li> -->

							<%-- <li><a href="<%=request.getContextPath() %>/adminPage/adminMain.jsp">Administrator</a></li> --%>
						</ul>
					</nav>
					<!--/ Navigation end -->
				</div>
				<!--/ Row end -->
			</div>
			<!--/ Container end -->
		</header>
		<!--/ Header end -->

