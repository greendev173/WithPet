<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List, jimin_withPet.model.vo.Petsitter" %>
<%
	List<Petsitter> list = (List)request.getAttribute("list");
	int numPerPage = (int)request.getAttribute("numPerPage");
	String area = request.getParameter("area");
%>    
<%@ include file="/views/common/header.jsp"%>

	<div id="banner-area">
		<img src="<%=request.getContextPath() %>/images/banner/banner2.png" alt ="" />
		<!-- <div class="parallax-overlay"></div> -->
			<!-- Subpage title start -->
			<div class="banner-title-content">
	        	<div class="text-center">
		        	<h2>일반 펫시터</h2>
		        	<ul class="breadcrumb">
			            <li>Home</li>
			            <li>Members</li>
			            <li><a href="#"> 일반펫시터</a></li>
		          	</ul>
	          	</div>
          	</div><!-- Subpage title end -->
	</div><!-- Banner area end -->
	
	
	
	<section id="main-container" class="portfolio portfolio-box">
	
		<div class="container">
			<!--Isotope filter start -->
			<div class="row text-center">
		
				<div class="isotope-nav" data-isotope-nav="isotope">
					<ul>
						<li><a id="area_all" style="cursor:pointer;">전체</a></li>
						<li><a id="seoul" onclick="seoul();" style="cursor:pointer;">서울</a></li>
						<li><a id="incheon" onclick="incheon();" style="cursor:pointer;">인천</a></li>
						<li><a id="gyeonggi" onclick="gyeonggi();" style="cursor:pointer;">경기</a></li>
						<li><a id="busan" onclick="busan();" style="cursor:pointer;">부산</a></li>
						<li><a id="daegu" onclick="daegu();" style="cursor:pointer;">대구</a></li>
						<li><a id="gwangju" onclick="gwangju();" style="cursor:pointer;">광주</a></li>
						<li><a id="deajeon" onclick="deajeon();" style="cursor:pointer;">대전</a></li>
						<li><a id="woolsan" onclick="woolsan();" style="cursor:pointer;">울산</a></li>					
					</ul>
				</div>
			</div><!-- Isotope filter end -->
			
			
			<script>
			
			$(function(){
				<%switch(area) {
				case "all" :%> $('#area_all').addClass('active');<% break; 
				case "seoul" : %> $('#seoul').addClass('active'); <% break;
				case "incheon" : %> $('#incheon').addClass('active'); <% break;
				case "gyeonggi" : %> $('#gyeonggi').addClass('active'); <% break;
				case "busan" : %> $('#busan').addClass('active'); <% break;
				case "daegu" : %> $('#daegu').addClass('active'); <% break;
				case "gwangju" : %> $('#gwangju').addClass('active'); <% break;
				case "deajeon" : %> $('#deajeon').addClass('active'); <% break;
				case "woolsan" : %> $('#woolsan').addClass('active'); <% break;
				} %>
			});
			
			 
				$('#area_all').on("click",function(){
					location.href = "<%=request.getContextPath() %>/petsitterList?area=all";
				});
			
				
				function seoul(){
					location.href = "<%=request.getContextPath() %>/petsitterList?area=seoul";
				}
				
				function incheon(){
					location.href = "<%=request.getContextPath() %>/petsitterList?area=incheon";
				}
				
				function gyeonggi(){
					location.href = "<%=request.getContextPath() %>/petsitterList?area=gyeonggi";
				}
				
				function busan(){
					location.href = "<%=request.getContextPath() %>/petsitterList?area=busan";
				}
				
				function daegu(){
					location.href = "<%=request.getContextPath() %>/petsitterList?area=daegu";
				}
				
				function gwangju(){
					location.href = "<%=request.getContextPath() %>/petsitterList?area=gwangju";
				}
				
				function deajeon(){
					location.href = "<%=request.getContextPath() %>/petsitterList?area=deajeon";
				}

				function woolsan(){
					location.href = "<%=request.getContextPath() %>/petsitterList?area=woolsan";
				}
				
			</script>

			
			<div class="row">
			<div id="isotope" class="isotope">
			
			<%for(Petsitter p : list) {
				if(p.getArea().substring(0, 2).equals("서울")){
			%>
					<div class="col-sm-3 서울 isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="<%=request.getContextPath() %>/upload/petsitter/<%=p.getProfileImg() %>" alt="">
								<figcaption>
									<h3><%=p.getPetsitterName() %></h3>
									<a class="link icon-pentagon" href="<%=request.getContextPath() %>/petsitterInfo?id=<%=p.getPetsitterId()%>"><i class="fa fa-id-card-o" aria-hidden="true"></i></a>
									<a class="view icon-pentagon" data-rel="prettyPhoto" href="<%=request.getContextPath() %>/images/portfolio/portfolio-bg1.jpg"><i class="fa fa-commenting-o" aria-hidden="true"></i></a>            
								</figcaption>			
							</figure>
						</div>
					</div><!-- Isotope item end -->

				<%}if(p.getArea().substring(0, 2).equals("인천")){%>
					<div class="col-sm-3 인천 isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="<%=request.getContextPath() %>/upload/petsitter/<%=p.getProfileImg() %>" alt="">
								<figcaption>
									<h3><%=p.getPetsitterName() %></h3>
									<a class="link icon-pentagon" href="<%=request.getContextPath() %>/petsitterInfo?id=<%=p.getPetsitterId()%>"><i class="fa fa-id-card-o" aria-hidden="true"></i></a>
									<a class="view icon-pentagon" data-rel="prettyPhoto" href="<%=request.getContextPath() %>/images/portfolio/portfolio-bg1.jpg"><i class="fa fa-commenting-o" aria-hidden="true"></i></a>            
								</figcaption>			
							</figure>
						</div>
					</div><!-- Isotope item end -->
						
				<%} if(p.getArea().substring(0, 2).equals("경기")) {%>
					<div class="col-sm-3 경기 isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="<%=request.getContextPath() %>/upload/petsitter/<%=p.getProfileImg() %>" alt="">
								<figcaption>
									<h3><%=p.getPetsitterName() %></h3>
									<a class="link icon-pentagon" href="<%=request.getContextPath() %>/petsitterInfo?id=<%=p.getPetsitterId()%>"><i class="fa fa-id-card-o" aria-hidden="true"></i></a>
									<a class="view icon-pentagon" data-rel="prettyPhoto" href="<%=request.getContextPath() %>/images/portfolio/portfolio-bg1.jpg"><i class="fa fa-commenting-o" aria-hidden="true"></i></a>            
								</figcaption>			
							</figure>
						</div>
					</div><!-- Isotope item end -->
						
				<%} if(p.getArea().substring(0, 2).equals("부산")) {%>
					<div class="col-sm-3 부산 isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="<%=request.getContextPath() %>/upload/petsitter/<%=p.getProfileImg() %>" alt="">
								<figcaption>
									<h3><%=p.getPetsitterName() %></h3>
									<a class="link icon-pentagon" href="<%=request.getContextPath() %>/petsitterInfo?id=<%=p.getPetsitterId()%>"><i class="fa fa-id-card-o" aria-hidden="true"></i></a>
									<a class="view icon-pentagon" data-rel="prettyPhoto" href="<%=request.getContextPath() %>/images/portfolio/portfolio-bg1.jpg"><i class="fa fa-commenting-o" aria-hidden="true"></i></a>            
								</figcaption>			
							</figure>
						</div>
					</div><!-- Isotope item end -->
				<%} if(p.getArea().substring(0, 2).equals("대구")) {%>
					<div class="col-sm-3 대구 isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="<%=request.getContextPath() %>/upload/petsitter/<%=p.getProfileImg() %>" alt="">
								<figcaption>
									<h3><%=p.getPetsitterName() %></h3>
									<a class="link icon-pentagon" href="<%=request.getContextPath() %>/petsitterInfo?id=<%=p.getPetsitterId()%>"><i class="fa fa-id-card-o" aria-hidden="true"></i></a>
									<a class="view icon-pentagon" data-rel="prettyPhoto" href="<%=request.getContextPath() %>/images/portfolio/portfolio-bg1.jpg"><i class="fa fa-commenting-o" aria-hidden="true"></i></a>            
								</figcaption>			
							</figure>
						</div>
					</div><!-- Isotope item end -->
			  <%} if(p.getArea().substring(0, 2).equals("광주")) {%>
					<div class="col-sm-3 광주 isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="<%=request.getContextPath() %>/upload/petsitter/<%=p.getProfileImg() %>" alt="">
								<figcaption>
									<h3><%=p.getPetsitterName() %></h3>
									<a class="link icon-pentagon" href="<%=request.getContextPath() %>/petsitterInfo?id=<%=p.getPetsitterId()%>"><i class="fa fa-id-card-o" aria-hidden="true"></i></a>
									<a class="view icon-pentagon" data-rel="prettyPhoto" href="<%=request.getContextPath() %>/images/portfolio/portfolio-bg1.jpg"><i class="fa fa-commenting-o" aria-hidden="true"></i></a>            
								</figcaption>			
							</figure>
						</div>
					</div><!-- Isotope item end -->
			  <%} if(p.getArea().substring(0, 2).equals("대전")) {%>
					<div class="col-sm-3 대전 isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="<%=request.getContextPath() %>/upload/petsitter/<%=p.getProfileImg() %>" alt="">
								<figcaption>
									<h3><%=p.getPetsitterName() %></h3>
									<a class="link icon-pentagon" href="<%=request.getContextPath() %>/petsitterInfo?id=<%=p.getPetsitterId()%>"><i class="fa fa-id-card-o" aria-hidden="true"></i></a>
									<a class="view icon-pentagon" data-rel="prettyPhoto" href="<%=request.getContextPath() %>/images/portfolio/portfolio-bg1.jpg"><i class="fa fa-commenting-o" aria-hidden="true"></i></a>            
								</figcaption>			
							</figure>
						</div>
					</div><!-- Isotope item end -->
				<%} if(p.getArea().substring(0, 2).equals("울산")) {%>
					<div class="col-sm-3 울산 isotope-item">
						<div class="grid">
							<figure class="effect-oscar">
								<img src="<%=request.getContextPath() %>/upload/petsitter/<%=p.getProfileImg() %>" alt="">
								<figcaption>
									<h3><%=p.getPetsitterName() %></h3>
									<a class="link icon-pentagon" href="<%=request.getContextPath() %>/petsitterInfo?id=<%=p.getPetsitterId()%>"><i class="fa fa-id-card-o" aria-hidden="true"></i></a>
									<a class="view icon-pentagon" data-rel="prettyPhoto" href="<%=request.getContextPath() %>/images/portfolio/portfolio-bg1.jpg"><i class="fa fa-commenting-o" aria-hidden="true"></i></a>            
								</figcaption>			
							</figure>
						</div>
					</div><!-- Isotope item end -->
				<%} %>
			<%} %>
		</div><!-- Isotope end -->
		</div><!-- row end -->
	</div><!-- Container end -->
		
		<div class="gap-40"></div>
		
		<div id = "paging" style="text-align : center;">
			<ul class="pagination">
				<%=request.getAttribute("pageBar") %>
			</ul>
		</div>
					
		
	</section><!-- Portfolio end -->


	<div class="gap-40"></div>
	
	

<%@ include file="/views/common/footer.jsp"%>