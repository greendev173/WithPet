<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jimin_withPet.model.vo.Petsitter, jimin_withPet.model.vo.Review, java.util.List" %>    
<%
	Petsitter p = (Petsitter)request.getAttribute("p");
	List<Review> list = (List)request.getAttribute("list");
	int point = 0; //개인별점 보여주기위한 변수
	int listMore = 3; //처음 보여줄 reivew 수
	int totalCnt = list.size(); //총 review 수 
%>
<%@ include file="/views/common/header.jsp"%>


<div id="banner-area">
		<img src="<%=request.getContextPath() %>/images/banner/banner2.png" alt ="" />
		<!-- <div class="parallax-overlay"></div> -->
			<!-- Subpage title start -->
			<div class="banner-title-content">
	        	<div class="text-center">
		        	<h2><%=p.getPetsitterName() %></h2>
		        	<ul class="breadcrumb">
			            <li>Home</li>
			            <li>Members</li>
			            <li>
			            	<a href="#"> 
								<%if(p.getGrade()=='G') {%>
									일반펫시터
								<%} else {%>
									전문펫시터
								<%} %>
							</a>
						</li>
		          	</ul>
	          	</div>
          	</div><!-- Subpage title end -->
	</div><!-- Banner area end -->

	
	<!-- Portfolio item start -->
	<section id="portfolio-item">
		<div class="container">
			<!-- Portfolio item row start -->
			<div class="row">
				<!-- Portfolio item slider start -->
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<div class="portfolio-slider">
						<div class="flexportfolio flexslider">
							<ul class="slides">
								<li><img src="<%=request.getContextPath() %>/upload/petsitter/<%=p.getInfImg1() %>" /></li>
								<li><img src="<%=request.getContextPath() %>/upload/petsitter/<%=p.getInfImg2() %>" /></li>
								<li><img src="<%=request.getContextPath() %>/upload/petsitter/<%=p.getInfImg3() %>" /></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- Portfolio item slider end -->

				<!-- sidebar start -->
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="sidebar">
						<div class="portfolio-desc">
						
						<!-- 종합별점 -->
						<div class="br-wrapper br-theme-fontawesome-stars-o">
							<select id="avg_point">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
						
						
						<script type="text/javascript">
							$(function() {
						    	$("#avg_point").barrating({
						        	theme: 'fontawesome-stars-o',
						        	initialRating : <%=p.getRevPoint()%>,
						        	readonly : true
						        });
							});
						</script>
						
						<div class="gap-60"></div>
						
							<h3 class="widget-title">Used Skills</h3>
							
							<p><%=p.getFeature() %></p>
							
							<div class="gap-60"></div>
							
						
							<h3 class="widget-title">Introduce</h3>
							<p>
								<%=p.getIntro() %>
							</p>
							
							<div class="gap-20"></div>
							
							<p style="visibility:visible;"><a href="<%=request.getContextPath() %>/book/petsitterHome1" class="project-btn btn btn-primary" >예약하기</a></p>
						</div>
					</div>
				</div>
				<!-- sidebar end -->
			</div><!-- Portfolio item row end -->
			
		</div><!-- Container end -->
	</section><!-- Portfolio item end -->
	
	
	
	<!-- review secction -->
	<section id="feature" class="feature" style="padding:10px; margin-top:-50px; margin-bottom:30px;">
			<div class="container">
			
				<div class="feature-box" >
					<span class="feature-icon pull-left"><i class="fa fa-comments-o" aria-hidden="true"></i></span>
					<div class="feature-content">
					<h1 class="widget-title" style="visibility:visible;" aria-hidden="true">REVIEW</h1>
					</div>
					
				</div>
				
				<div class="row">
				<%if(!list.isEmpty()) {
					
					for(int i=0; i<list.size(); i++) {%>
					
					<div class="tbl_area" id="dispRow<%=i+1%>" style="display:none">				
						<div class="feature-box col-sm-4 wow fadeInDown" data-wow-delay=".5s">
							<span class="feature-icon pull-left" style="margin-right:20px; margin-bottom:50px;">
							<%if(list.get(i).getPetImg()!=null) {%>
								<img style="width:100px; height:100px; border-radius:50%;" src="<%=request.getContextPath()%>/upload/pet/<%=list.get(i).getPetImg()%>">
							<%} else{ %>
								<img style="width:100px; height:100px; border-radius:50%;" src="<%=request.getContextPath()%>/upload/pet/profile.jpg">
							<%} %>
							</span>
							<div class="feature-content">
								<h4 style="margin-top:20px;"><%=list.get(i).getWriter() %> / <%=list.get(i).getPetName() %></h4>
								
								<!-- 개인별점 -->
								<div class="br-wrapper br-theme-fontawesome-stars-o">
									
									<% if(list.get(i).getRevPoint()==1) {
										point = 1;
									} if(list.get(i).getRevPoint()==2){
										point = 2;
									} if(list.get(i).getRevPoint()==3){
										point = 3;
									} if(list.get(i).getRevPoint()==4){
										point = 4;
									} if(list.get(i).getRevPoint()==5){
										point = 5;
									} %>
											
									<select class="stars<%=point %>">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
								
								<span style="color:#49a2e7;"><%=list.get(i).getRevDate() %></span>
								<p></p>	
								<p><%=list.get(i).getRevContent() %></p>
							</div>
						</div>
					<!--/ End first featurebox -->
					</div>
					
				<%} %>
					<div id="dispMore" style="display:none; text-align:center; cursor:pointer;">
						<a onclick="listMore(<%=totalCnt %>);">더보기</a>
					</div>
				
				<%}else{%>
					<p style="text-align:center;">등록된 리뷰가 없습니다.</p>
				
				<%} %>
				</div>
				<script>
					$(function() {
						$(".stars1").barrating({
							theme: 'fontawesome-stars-o',
							initialRating : 1,
							readonly : true
						});
						
						
						$(".stars2").barrating({
							theme: 'fontawesome-stars-o',
							initialRating : 2,
							readonly : true
						});
						
						
						$(".stars3").barrating({
							theme: 'fontawesome-stars-o',
							initialRating : 3,
							readonly : true
						});
						
						$(".stars4").barrating({
							theme: 'fontawesome-stars-o',
							initialRating : 4,
							readonly : true
						});
						
						$(".stars5").barrating({
							theme: 'fontawesome-stars-o',
							initialRating : 5,
							readonly : true
						});
					});
					
					var c = 0;
					<% for(int i=1; i<=totalCnt; i++) {
						if(i<=listMore){%>
						
							//최대 갯수보다 작거나 같으면 리뷰를 보여줌
							document.getElementById("dispRow<%=i%>").style.display='block';
						    c++;
						<%}
					} 
					if(totalCnt > listMore){ //listMore은 현재 화면에 보여주는 리뷰 갯수
					%>
						//최대 갯수보다 화면에 보여주는 리뷰 갯수가 작으면 더보기 버튼 활성화
						document.getElementById("dispMore").style.display='block';
					<%}%>	
					
					
					//더보기 버튼을 눌렀을때 실행되는 함수
					function listMore(totalCnt){
						//현재 화면에 보여지는 리뷰 갯수를 가져옴(3개)
						var listMore = c;
						console.log(c);
						
						//더보기 버튼을 누르면 3개씩 추가됨
						var last = Number(c) + 3;
						
						//i=3+1 -> 맨 처음 3개만 보여주기때문에 다음부터는 4~6까지, 4보다 최대갯수가 크거나 같을때까지 i = 4++
						for(i=Number(c)+1; i<=totalCnt; i++){
							
							//i가 6보다 작거나 같을 경우
							if(i<=last){
								//dispRow6까지 block 처리함
								document.getElementById("dispRow"+i).style.display='block';
							}
						}
						
						if(totalCnt <= last){
							//last의 수가 최대갯수보다 크거나 같으면 더보기 버튼을 none 처리함
							document.getElementById("dispMore").style.display = 'none';
						}
						c = last;
					}
				</script>
								

				<div class="gap-40"></div>
					
				

			</div>
			<!--/ Container end -->
		</section>
		<!--/ Service box end -->

	<div class="gap-40"></div>

	
	
				
<%@ include file="/views/common/footer.jsp"%>