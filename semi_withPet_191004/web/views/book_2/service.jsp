<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="/views/common/header.jsp"%>

	<!-- Style switcher start -->
	<div class="style-switch-wrapper">
		<div class="style-switch-button">
			<i class="fa fa-sliders"></i>
		</div>
		<h3>Style Options</h3>
		<!--퀵 메뉴바로 변경 예정 or Calender표시-->
		<button id="preset1" class="btn btn-sm btn-primary"></button>
		<button id="preset2" class="btn btn-sm btn-primary"></button>
		<button id="preset3" class="btn btn-sm btn-primary"></button>
		<button id="preset4" class="btn btn-sm btn-primary"></button>
		<button id="preset5" class="btn btn-sm btn-primary"></button>
		<button id="preset6" class="btn btn-sm btn-primary"></button>
		<br /><br />
		<a class="btn btn-sm btn-primary close-styler pull-right">Close X</a>
	</div>
	<!-- Style switcher end -->

	<div class="body-inner">
		<!-- Header start -->
		<header id="header" class="navbar-fixed-top header2" role="banner">
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
						<div class="navbar-brand">
							<a href="index.html">
								<img class="img-responsive" src="images/logo3.png" alt="logo">
							</a>
						</div>
					</div>

					<!--/ Logo end -->

					<nav class="collapse navbar-collapse clearfix" role="navigation">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="index.html">Home</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Matching <i
										class="fa fa-angle-down"></i></a>
								<div class="dropdown-menu">
									<ul>
										<li><a href="service.html">Easy Matching</a></li>
										<!--매칭 시작-->
										<li><a href="career.html">Searching Petsitter</a></li>
										<!--펫시터만 검색-->
										<li><a href="about.html">Insurance policy</a></li>
										<!--보험 서비스 설명.-->
										<li><a href="pricing.html">Pricing</a></li>
										<!--가격정보-->
										<!-- "testimonial.html" -->
										<!-- <li><a href="faq.html">FAQ</a></li> -->
									</ul>
								</div>
							</li>

							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Members <i
										class="fa fa-angle-down"></i></a>
								<div class="dropdown-menu">
									<ul>
										<li><a href="team.html">Our Team</a></li>
										<li><a href="about2.html">Petsitter</a></li>
										<li><a href="service2.html">Sup.Petsitter</a></li>
										<li><a href="service-single.html">Customers Services</a></li>
										<!-- <li><a href="pricing.html">Pricing Table</a></li>
										<li><a href="404.html">404 Page</a></li> -->
									</ul>
								</div>
							</li>
							<li class="dropdown">
								<a href="portfolio-classic.html">Reviews <i class="fa fa-angle-down"></i></a>
								<!-- class="dropdown-toggle" data-toggle="dropdown"-->
								<!-- <div class="dropdown-menu">
										<ul>
											<li><a href="portfolio-classic.html">Lookup Reviews</a></li>
											<li><a href="portfolio-static.html">Service Status</a></li>
											<li><a href="portfolio-item.html"></a></li>
										</ul>
									</div> -->
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Recruitment <i
										class="fa fa-angle-down"></i></a>`
								<div class="dropdown-menu">
									<ul>
										<li><a href="blog-rightside.html">Recruitment guide</a></li>
										<li><a href="blog-item.html">Applying</a></li>
									</ul>
								</div>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Help Center<i
										class="fa fa-angle-down"></i></a>
								<div class="dropdown-menu">
									<ul>
										<li><a href="typography.html">Q & A</a></li>
										<li><a href="elements.html">Report complaints</a></li>
									</ul>
								</div>
							</li>

							<li><a href="contact.html">Login</a></li>
						</ul>
					</nav>
					<!--/ Navigation end -->
				</div>
				<!--/ Row end -->
			</div>
			<!--/ Container end -->
		</header>
		<!--/ Header end -->


		<div id="banner-area">
			<img src="images/banner/banner2.jpg" alt="" />
			<div class="parallax-overlay"></div>
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
				
					.overCuror{
						cursor: pointer;
					}
			
				</style>


				<div class="row">
						<div class="col-md-12 heading">
							<span class="title-icon classic pull-left"><i class="fa fa-cogs"></i></span>
							<h2 class="title classic">매칭</h2>
						</div>
					</div>
		​			
						<div class="row">
							<div class="col-md-12">
								<div class="col-md-3 col-sm-3"></div>
								<div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-delay=".5s">
									<div class="service-content text-center">
										<span class="service-icon icon-pentagon overCuror" onclick="location.href='<%=request.getContextPath()%>/book/book1.jsp'"><i class="fas fa-car-side"></i></span>
										<h3>방문펫시터 예약하기</h3>
										<p>펫시터를 집으로 부르기</p>
									</div>
								</div><!--/ End first service -->
								​
								<div class="col-md-3 col-sm-3 wow fadeInDown" data-wow-delay=".8s" >
									<div class="service-content text-center">
										<span class="service-icon icon-pentagon overCuror" onclick="location.href='<%=request.getContextPath()%>/book/testBook.jsp'"><i class="fas fa-home"></i></span>
										<h3>가정집펫시터 예약하기</h3>
										<p>펫시터 집에 강아지 맡기기</p>
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
			<div class="testimonial parallax parallax3">
				<div class="parallax-overlay"></div>
				<div class="container">
					<div class="row">
						<div id="testimonial-carousel" class="owl-carousel owl-theme text-center testimonial-slide">
							<div class="item">
								<div class="testimonial-thumb">
									<img src="images/team/testimonial1.jpg" alt="testimonial">
								</div>
								<div class="testimonial-content">
									<p class="testimonial-text">
											일이 프리랜서라서 집에서 있는 시간이 종종 있었고 20년 정도 직접 강아지를 키워봤기 때문에 강아지와 함께 하는 것이 문제가 없었어요. 애견 관련 종사업(미용사)도 하고 있어 다른 강아지와 있는 시간도 많았습니다. 제일 중요한 건 친한 분이 강아지를 맡기시면서 확실하게 다른 강아지를 돌보는 것이 문제가 없다는 것을 알았습니다. 그러던 중 펫시터란 직업을 인터넷으로 알게 됐어요. 초창기에 들어와서 처음에는 걱정이 됐지만 이제는 워낙 탄탄하게 체계가 쌓여져서 만족합니다. 펫시터 입장에서는 다양한 강아지도 만날 수 있어서 좋아요.
									</p>
									<h3 class="name">박성술<span>펫시터 경력28년</span></h3>
								</div>
							</div>
							<div class="item">
								<div class="testimonial-thumb">
									<img src="https://scontent-frt3-2.cdninstagram.com/vp/73fc5c722a4e36cac04ede93200ac6b8/5D8463B8/t51.2885-15/e35/16124166_1860891854148522_6897262133533212672_n.jpg?_nc_ht=scontent-frt3-2.cdninstagram.com&ig_cache_key=MTQzODI2NjE2MDEyOTk3NTkzMw%3D%3D.2" alt="testimonial">
								</div>
								<div class="testimonial-content">
									<p class="testimonial-text">
											일이 프리랜서라서 집에서 있는 시간이 종종 있었고 20년 정도 직접 강아지를 키워봤기 때문에 강아지와 함께 하는 것이 문제가 없었어요. 애견 관련 종사업(미용사)도 하고 있어 다른 강아지와 있는 시간도 많았습니다. 제일 중요한 건 친한 분이 강아지를 맡기시면서 확실하게 다른 강아지를 돌보는 것이 문제가 없다는 것을 알았습니다. 그러던 중 펫시터란 직업을 인터넷으로 알게 됐어요. 초창기에 들어와서 처음에는 걱정이 됐지만 이제는 워낙 탄탄하게 체계가 쌓여져서 만족합니다. 펫시터 입장에서는 다양한 강아지도 만날 수 있어서 좋아요.
									</p>
									<h3 class="name">박성술<span>펫시터 경력28년</span></h3>
								</div>
							</div>
							<div class="item">
								<div class="testimonial-thumb">
									<img src="images/team/testimonial3.jpg" alt="testimonial">
								</div>
								<div class="testimonial-content">
									<p class="testimonial-text">
											일이 프리랜서라서 집에서 있는 시간이 종종 있었고 20년 정도 직접 강아지를 키워봤기 때문에 강아지와 함께 하는 것이 문제가 없었어요. 애견 관련 종사업(미용사)도 하고 있어 다른 강아지와 있는 시간도 많았습니다. 제일 중요한 건 친한 분이 강아지를 맡기시면서 확실하게 다른 강아지를 돌보는 것이 문제가 없다는 것을 알았습니다. 그러던 중 펫시터란 직업을 인터넷으로 알게 됐어요. 초창기에 들어와서 처음에는 걱정이 됐지만 이제는 워낙 탄탄하게 체계가 쌓여져서 만족합니다. 펫시터 입장에서는 다양한 강아지도 만날 수 있어서 좋아요.
									</p>
									<h3 class="name">박성술<span>펫시터 경력28년</span></h3>
								</div>
							</div>
						</div>
						<!--/ Testimonial carousel end-->
					</div>
					<!--/ Row end-->
				</div>
				<!--/  Container end-->
			</div>
			<!--/ Testimonial end-->

			<div class="gap-60"></div>


			<div class="container">
				<!-- 2nd container start -->

				<!-- Pricing table start -->
				<div id="pricing" class="pricing">
					<div class="row">
						<div class="col-md-12 heading">
							<span class="title-icon classic pull-left"><i class="fa fa-university"></i></span>
							<h2 class="title classic">Pricing Table</h2>
						</div>
					</div><!-- Title row end -->

					<div class="row">
						<!-- plan start -->
						<div class="col-md-3 col-sm-6 wow fadeInUp" data-wow-delay=".5s">
							<div class="plan text-center">
								<span class="plan-name">방문 <small>Monthly plan</small></span>
								<p class="plan-price"><sup class="currency">$</sup><strong>49</strong><sub>.99</sub></p>
								<ul class="list-unstyled">
									<li>100GB Monthly Bandwidth</li>
									<li>$100 Google AdWords</li>
									<li>100 Domain Hosting</li>
									<li>SSL Shopping Cart</li>
									<li>24/7 Live Support</li>
								</ul>
								<a class="btn btn-primary" href="#.">Sign Up</a>
							</div>
						</div><!-- plan end -->

						<!-- plan start -->
						<div class="col-md-3 col-sm-6 wow fadeInUp" data-wow-delay="1s">
							<div class="plan text-center">
								<span class="plan-name">위탁 <small>Monthly plan</small></span>
								<p class="plan-price"><sup class="currency">$</sup><strong>99</strong><sub>.99</sub></p>
								<ul class="list-unstyled">
									<li>100GB Monthly Bandwidth</li>
									<li>$100 Google AdWords</li>
									<li>100 Domain Hosting</li>
									<li>SSL Shopping Cart</li>
									<li>24/7 Live Support</li>
								</ul>
								<a class="btn btn-primary" href="#.">Sign Up</a>
							</div>
						</div><!-- plan end -->

						<!-- plan start -->
						<div class="col-md-3 col-sm-6 wow fadeInUp" data-wow-delay="1.4s">
							<div class="plan text-center featured">
								<span class="plan-name">Professional <small>Monthly plan</small></span>
								<p class="plan-price"><sup class="currency">$</sup><strong>149</strong><sub>.99</sub>
								</p>
								<ul class="list-unstyled">
									<li>100GB Monthly Bandwidth</li>
									<li>$100 Google AdWords</li>
									<li>100 Domain Hosting</li>
									<li>SSL Shopping Cart</li>
									<li>24/7 Live Support</li>
								</ul>
								<a class="btn btn-primary" href="#.">Sign Up</a>
							</div>
						</div>plan end

						<!-- plan start -->
						<div class="col-md-3 col-sm-6 wow fadeInUp" data-wow-delay="1.6s">
							<div class="plan text-center">
								<span class="plan-name">Premium <small>Monthly plan</small></span>
								<p class="plan-price"><sup class="currency">$</sup><strong>399</strong><sub>.99</sub>
								</p>
								<ul class="list-unstyled">
									<li>100GB Monthly Bandwidth</li>
									<li>$100 Google AdWords</li>
									<li>100 Domain Hosting</li>
									<li>SSL Shopping Cart</li>
									<li>24/7 Live Support</li>
								</ul>
								<a class="btn btn-primary" href="#.">Sign Up</a>
							</div>
						</div>plan end
					</div>
					<!--/ Content row end -->
				</div>
				<!--/ Pricing table end -->

			</div><!-- 2nd container end -->
		</section>
		<!--/ Main container end -->
		
		
<%@ include file="/views/common/footer.jsp"%>