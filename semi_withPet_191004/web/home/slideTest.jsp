<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


  
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>

	<div id="banner-area">
		<img style="background-color : purple; width : 100%; height : 300px" />
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
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=request.getContextPath() %>/images/bung.png" alt="Los Angeles" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath() %>/images/bung.png" alt="Chicago" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="<%=request.getContextPath() %>/images/bung.png" alt="New York" width="1100" height="500">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#myCarousel" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
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