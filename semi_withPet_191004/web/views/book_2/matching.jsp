<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

	<div id="banner-area">
		<img style="background-color : coral; width : 100%; height : 300px" />
		<div class="parallax-overlay"></div>
			<!-- Subpage title start -->
			<div class="banner-title-content">
	        	<div class="text-center">
		        	<h2>Contact Us</h2>
		        	<ul class="breadcrumb">
			            <li>Home</li>
			            <li><a href="#"> Contact</a></li>
		          	</ul>
	          	</div>
          	</div><!-- Subpage title end -->
	</div><!-- Banner area end -->
	
	<div>컨텐츠 입력
	<div class='container'>
		<div class='row'>
			<div class='col-xs-12'>
				<form action="<%=request.getContextPath() %>/home/petsitterView?cPage=<%=request.getAttribute("cPage")%>" method="post">
				
				<!-- <input type='hidden' id='userId' name='userId' value='admin1'> -->
				<input type='hidden' id='userName' name='userName' value='아무개'>
				<input type='hidden' id='petCount' name='petCount' value='마리수'>
				<input type='hidden' id='userCert' name='userCert' value='보유자격증'>
				<input type='hidden' id='revPoint' name='revPoint' value='평점'>
				<input type='hidden' id='revContentCount' name='revContentCount' value='리뷰개수'>
				
				<input type='submit' class='btn btn-info' value='가정집 방문'>
				</form>
			</div>
		</div>
	</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		
	</div>
	
<style>
	.empty1 {
	        height:50px;
	    }
	/*div 나누는 거 확인하기 위해 필요한 스타일, 지우지 말 것 */
    div[class|=col] {
        border: 1px solid blue;
    }
</style>

<%@ include file="/views/common/footer.jsp"%>