<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<style>
	#find-form{
		margin-bottom : 12px;
	}
</style>
<div id="banner-area">
	<img src="<%=request.getContextPath()%>/images/banner/banner2.png"
		alt="" />
	<!-- <div class="parallax-overlay"></div> -->
	<!-- Subpage title start -->
	<div class="banner-title-content">
		<div class="text-center">
			<h2>아이디찾기</h2>
			<ul class="breadcrumb">
				<li>Home</li>
				<li><a href="<%=request.getContextPath()%>/findId"> 아이디찾기</a></li>
			</ul>
		</div>
	</div>
	<!-- Subpage title end -->
</div>
<!-- Banner area end -->
<section>
	<div class="container">
	<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
		<form action="<%=request.getContextPath()%>/memberFindId"
			method="post" id="find-form">
				<div class="form-group" >
					<div class="text-center" id="find-form">
					<label for="name">이름</label> 
						<input type="text" name="name" id="name" class="form-control" placeholder="이름입력"> 
					<label for="email">이메일 주소</label>
						<input type="email" name="email" id="email" class="form-control" placeholder="이메일입력"> 
					</div>
					<div class="text-center">
					<input type="submit" class="btn btn-outline-primary" value="아이디찾기" onSubmit="return checkEmail();">
					</div>
			</div>
		</form>
	</div>
</div>
</section>
<%@ include file="/views/common/footer.jsp"%>