<%@page import="son_withPet.pet.model.vo.PetsitterView"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    List<PetsitterView> list = (List)request.getAttribute("list"); //view에서 보여주는 코드
    PetsitterView totalCount = (PetsitterView)request.getAttribute("totalCount"); //지역전체 카운트
    int cPage = (int)request.getAttribute("cPage");
   /*  int cPage=(int)request.getAttribute("cPage"); //페이징
    int SeoulCount = (int)request.getAttribute("SeoulCount"); //서울카운트
    int kyyungKiCount = (int)request.getAttribute("kyyungKiCount"); //경기카운트
    int incheonCount = (int)request.getAttribute("incheonCount"); //인천카운트 */
    int count=0;    
    %>
				<div class='row'>
				<div class='col-xs-12'>
					<div class='col-xs-2'></div>
					<div class='col-xs-8'>
						<div class='col-xs-7'><span style=font-size:10px;><%=totalCount.getPetsitterCount()%> 명의 검증된 펫시터가 검색되었습니다!</span></div>
						<div class='col-xs-5'>
						<span style="float:right;">
						<input type='button' value='검색 설정 초기화 하기' onclick="reset();"
							style='border:0px;background-color:white;font-size:10px;text-decoration:underline;'>
						</span>
						</div>
						<div class='row empty3'></div>
						<div class='row empty1' style='border-bottom:1px solid lightgray;margin:0px;'></div>
					</div>
					<div class='col-xs-2'></div>
					</div>
				</div>
				<br>
				<!-- 리스트시작 -->
				<%
					for(PetsitterView p : list) {
				%>
				<div class='row' id='ajaxTestDiv'>
				<div class='col-xs-12'>
					<div class='col-xs-2'></div>
					<div class='col-xs-8 clickHover'>
					<input type='hidden' name='id' value='<%=p.getUserId()%>'>
					<div class='row' style='height:250px;'>
					<div class='col-xs-4' style='padding:0;width:250px;height:200px;overflow:hidden'>
					
					<!-- <div class='row clickHover' style='border:1px solid lightgray;height:202px;'> -->
						<!-- <div class='col-xs-4 clickHover' style='padding:0;width:250px;height:200px;overflow:hidden'> ㅅㅈ-->
	<!-- div7 -->					
	
	<%
	if(count<totalCount.getPetsitterCount()){
	 count++;
	 
	 System.out.println(count);
	%>
<!-- 슬라이드시작 -->
	<div id='myCarousel<%=count%>' class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators" style="bottom:0;opacity:0.5;">
      <li data-target="#myCarousel<%=count%>" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel<%=count%>" data-slide-to="1"></li>
      <li data-target="#myCarousel<%=count%>" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="<%=request.getContextPath() %>/images/team/<%=p.getProfileImg() %>" alt="" style="width:250px;">
      </div>

      <div class="item">
        <img src="<%=request.getContextPath() %>/images/team/<%=p.getIntro1Img() %>" alt="" style="width:250px;">
      </div>
    
      <div class="item">
        <img src="<%=request.getContextPath() %>/images/team/<%=p.getIntro2Img() %>" alt="" style="width:250px;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel<%=count%>" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" style='left:15px;'></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel<%=count%>" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" style='left:0px;'></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <%} %>
  <!-- 슬라이드끝 -->
</div>
						<!-- </div> --><!-- div7end -->
						<!-- <div class='col-xs-4'></div> -->
						<div class='col-xs-8' style='margin:0;float:right;'>
							<!-- <input type='hidden' class='btn btn-default' value=''
							style='border:0px;font-weight:bold;font-size:15px;color:gray;'> -->
							<br>
							<%if(p.getGrade()=='M') {%>
							<span name='userName' style='font-weight:bold;font-size:17px;'><%=p.getUserName() %>
								<span style='font-weight:bold;font-size:8px;color:red;'><%="(전문)" %>
								</span>
							</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<%}else {%>
							<span name='userName' style='font-weight:bold;font-size:17px;'><%=p.getUserName() %>
								<span style='font-weight:bold;font-size:8px;color:blue;'><%="(일반)" %>
								</span>
							</span>&nbsp;&nbsp;&nbsp;&nbsp;
							<%} %>
							<span>
							<img src="<%=request.getContextPath()%>/images/siba.png">&nbsp;&nbsp;반려견 
							<%=p.getHaveDog().equals("Y")?"있음":"없음" %>
							<span style='float:right;font-weight:bold;color:black;font-size:12px;'><%=p.getAddress().replace("subaddr", " ") %></span>
							</span>
							<br>
							<div class='row empty3' style='border:0px;border-bottom:1px solid lightgray;'></div>
							<div class='row empty3'></div>
							<%String[] btnArray = p.getFeatures().split(",");
							for(int i=0;i<btnArray.length;i++) {%>
							<input name='btnfilter2' type='button' value='<%=btnArray[i] %>' class="btn btn-default "
							style="font-size:10.5px;border:1px solid skyblue;border-radius:8px 8px 8px 8px;background-color:none;color:skyblue;">&nbsp;&nbsp;
							<%} %>
							<!-- <input name='btnfilter' type='button' value='??????' class="btn btn-default ">&nbsp;&nbsp;
							<input name='btnfilter' type='button' value='??????' class="btn btn-default ">&nbsp;&nbsp; -->
							<br>
							<div class='row' style='height:45px;'></div> <!-- 회색 총점부분 위치조절 -->
							<div class='row' style='margin:-25px;'>
							
								<div style='background-color:lightgray;width:550px;top:60px;height:70px;opacity:0.7;'> <!-- 회색사이즈조절 -->
								
									<!-- <div class='col-xs-6' style='bottom:0px;'> -->
										<span><i class="fas fa-medal fa-3x"></i>펫시터 총점 <%=p.getRevPoint() %>점</span>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<!-- </div> -->
									<!-- <div class='col-xs-6' style='bottom:-23px;left:-80px;'> -->
										<span><i class="far fa-file-alt"></i>&nbsp;&nbsp;고객후기 <%=p.getViewCount() %>개</span>
									</div>
									
									<!-- <div class='col-xs-12' style='bottom:25px;'>
										<span class='pull-right'></span>
										
									</div> -->
									
									
						</div>
						
						<!-- </div> --><!-- row -->
					</div>
					
					</div>
					</div><!-- div8끝 -->
					</div><!-- div12끝 -->
					<!-- <div class='col-xs-2'></div> -->
				</div>
				
				<br>
				<br>
				
				<%} %>
				
				<script>
					$(function(){
						$("#pageBar").html("<%=request.getAttribute("pageBar")%>");
					});
				
					$(".clickHover").on({
						mouseover: function(){
						$(this).css({"border":"1px solid coral","cursor":"pointer"});
					},
						mouseleave: function(){
						$(this).css({"border":"1px solid lightgray"});
					},
					 dblclick: function(){
						 console.log($(this).find("input[name=userId]").val()); //clickHover 안에있는 find을 이용해 input태그의 value를 찾음
							var userId = $(this).find('input[name=id]').val();
							location.href="<%=request.getContextPath()%>/petsitterInfo?id="+userId;
					}
				});
				</script>
