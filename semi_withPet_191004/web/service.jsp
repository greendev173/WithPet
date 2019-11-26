<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<!-- Slider start -->
		<div id="banner-area">
			<img src="<%=request.getContextPath() %>/images/banner/banner2.png" alt="" />
			<!-- <div class="parallax-overlay"></div> -->
			<!-- Subpage title start -->
			<div class="banner-title-content">
				<div class="text-center">
					<h2>매칭</h2>
					<ul class="breadcrumb">
						<li>Home</li>
						<li>Company</li>
						<li><a href="#"> 매칭</a></li>
					</ul>
				</div>
			</div><!-- Subpage title end -->
		</div><!-- Banner area end -->

		<!-- Main container start -->

		<section id="main-container">
			<div class="container">

				<!-- Services -->

				<style>
				
					/* div{
						border:1px solid black;
					} */
					.overCuror{
						cursor: pointer;
					}
			
				</style>


				<div class="row">
						<div class="col-md-12 heading">
							<span class="title-icon classic pull-left"><i class="fa fa-cogs"></i></span>
							<h2 class="title classic">매칭 서비스</h2>
						</div>
					</div>
		​			
						<div class="row">
							<div class="col-md-12">
								<div class="col-3 col-md-3 col-sm-3"></div>
								<div class="col-3 col-md-3 col-sm-3 wow fadeInDown text-center" data-wow-delay=".5s">
									<div class="service-content text-center">
										<span class="service-icon icon-pentagon overCuror" onclick="location.href='<%=request.getContextPath()%>/home/petsitterView'"><i class="fas fa-home"></i></span>
										<h3>가정집펫시터 예약하기</h3>
										<p>펫시터 집에 강아지 맡기기</p>
									</div>
								</div><!--/ End first service -->
								​
								<div class="col-3 col-md-3 col-sm-3 wow fadeInDown text-center" data-wow-delay=".8s" >
									<div class="service-content text-center">
										<span class="service-icon icon-pentagon overCuror" onclick="location.href='<%=request.getContextPath()%>/book/visitPetsitter1'"><i class="fas fa-car-side"></i></span>
										<h3>방문펫시터 예약하기</h3>
										<p>펫시터를 집으로 부르기</p>
									</div>
									
								</div><!--/ End Second service -->
								​
								
							</div><!-- Content 2nd row end -->

							<!-- Services end -->

				</div><!--/ 1st container end -->
					
					
					<!-- Services end -->
					
					
				</div>
			<!--/ 1st container end -->


			<div class="gap-60"></div>


			<!-- Testimonial start-->
			
				<!--/ Pricing table end -->

		</section>
		<!--/ Main container end -->
	
<%@ include file="/views/common/footer.jsp"%>

