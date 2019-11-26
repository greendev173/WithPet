<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="son_withPet.pet.model.vo.PetsitterView"%>
<%@page import="java.util.List"%>
  
<%
	
   	List<PetsitterView> list = (List)request.getAttribute("list"); //view에서 보여주는 코드
    PetsitterView totalCount = (PetsitterView)request.getAttribute("totalCount"); //지역전체 카운트
    int cPage=(int)request.getAttribute("cPage"); //페이징
    
    int SeoulCount = (int)request.getAttribute("SeoulCount"); //서울카운트
    int kyyungKiCount = (int)request.getAttribute("kyyungKiCount"); //경기카운트
    int incheonCount = (int)request.getAttribute("incheonCount"); //인천카운트
    int count=0;
    //List<Map<String, Object>> listMap = (List)list;
    
%> 
	
<%@ include file="/views/common/header.jsp"%>
<!-- 달력 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 달력끝 -->

<!-- 슬라이드 -->
<script src="https://kit.fontawesome.com/dcff5cba12.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
<!-- 슬라이드끝 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> <!-- R -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> <!-- R -->

	<div id="banner-area">
		<img style="background-color : tomato; width : 100%; height : 300px;" />
			<!-- Subpage title start -->
			<div class="banner-title-content">
	        	<div class="text-center">
		        	<h2>가정집 펫시터 예약하기</h2>
		        	<ul class="breadcrumb">
			            <li>WithPet</li>
			            <li><a href="#"> 가정집 펫시터</a></li>
		          	</ul>
	          	</div>
          	</div><!-- Subpage title end -->
	</div><!-- Banner area end -->
	<!-- https://rclass.iptime.org/viewChat -->
	<div class='container-fluid'>
	<div class='row empty1'></div>
	<div class='row middle'>
		<div class="col-3 row-2">
                <!-- left -->
       </div>
			<div class="col-6" id='middle_border'>
			
			<div class='row'>
				<div class='col-xs-2'></div>
				<div class='col-xs-8'>
				
					<div name='upDiv'>
						<input type='button' id='areaFilter' name='upBtn' class='btn btn-default upBtn' value='전체'>
						<span style='font-size:10px;opacity:0.6;color:black;'><%=totalCount.getPetsitterCount()%></span>
						<input type='button' id='areaFilter' name='upBtn' class='btn btn-default upBtn' value='서울'>
						<span style='font-size:10px;opacity:0.6;color:black'><%=SeoulCount%></span>
						<input type='button' id='areaFilter' name='upBtn' class='btn btn-default upBtn' value='경기'>
						<span style='font-size:10px;opacity:0.6;color:black'><%=kyyungKiCount%></span>
						<input type='button' id='areaFilter' name='upBtn' class='btn btn-default upBtn' value='인천'>
						<span style='font-size:10px;opacity:0.6;color:black'><%=incheonCount%></span>
					</div>
				</div>
				<div class='col-xs-2'></div>
			</div>
			
			<div class='empty3'></div>
			<div class='row'>
				<div class='col-xs-2'></div>
				
				
				<div class='col-xs-8'>
					<div class='upBorder' style=height:185px;>
						<div class='row' style=margin:15px;>
							<div class='col-xs-2' style=height:50px;font-size:10px;>
								<div>서비스</div>
								<div><select class='btn btn-default form-control' 
								style=font-weight:bold;color:black;height:35px;font-size:6px;width:130px;>
									<option value='' style=font-weight:bold;>24시간 돌봄</option>
									<option value='' style=font-weight:bold;>데이케어</option>
								</select></div>
							</div>
							<!-- <div class='col-xs-3' style=height:50px;left:-15px;>
							</div> -->
							<div class='col-xs-2' style=height:49px;top:1px;left:26px;font-size:10px;>
								<div>이름으로 검색</div>
								<div>
								<input id='searchName' type='text' class='btn btn-default from-control' style='width:130px;'>
								</div>
								<!-- <select id='selectAge' class='btn btn-default form-control' onchange="selectAge();"
								style=font-weight:bold;color:black;height:35px;font-size:11px;width:150px;>
									<option value='강아지(1살이하)' style=font-weight:bold;>강아지(1살이하)</option>
									<option value='성견(2~6살)' style=font-weight:bold;>성견(2~6살)</option>
									<option value='노견(7살이상)' style=font-weight:bold;>노견(7살이상)</option>
								</select> -->
							</div>
							<div class='col-xs-4' style=height:50px;top:0px;left:50px;font-size:10px;>
								<div style=''>반려견 크기</div>
								<div><select id='selectSize' class='btn btn-default form-control' onchange="selectSize();"
								 style=font-weight:bold;color:black;height:35px;font-size:11px;left:30px;width:130px;>
									<option value='소형견(0~4.9kg)' style=font-weight:bold;>소형견(0~4.9kg)</option>
									<option value='중형견(5~14kg)' style=font-weight:bold;>중형견(5~14kg)</option>
									<option value='대형견(15kg이상)' style=font-weight:bold;>대형견(15kg이상)</option>
								</select></div>
							</div>
							<div class='col-xs-2' style=height:50px;left:-45px;font-size:10px;>
								<div>펫시터 등급</div>
								<div><select id='selectPetSitter' class='btn btn-default form-control' onchange="selectPetSitter();"
								style=font-weight:bold;color:black;height:35px;font-size:11px;width:130px;>
									<option value='G' style=font-weight:bold;>일반</option>
									<option value='M' style=font-weight:bold;>전문</option>
								</select></div>
							</div>
							<div class='col-xs-1' style=top:-8px;>
								<div><br></div>
								<input type='button' name='searchFeatures' class='btn btn-info' value='찾기'
								 style=width:105px; onclick="fn_searchName();">
							</div>
						</div>
							<div class='col-xs-4'>
								<div style='font-size:13px;height:30px;'>원하는 태그를 모두 선택해주세요!</div>
							</div>
							<div class='col-xs-8'></div>
						<br>
						<br>
							<div class='col-xs-12' id='btn_unclick'>
								<span id="selectJing" class='pull-left' style='width:800px;'>
								<input name='btnfilter' id="selectJing1" type='button' value='자차 보유' class="btn btn-default btn_click">&nbsp;&nbsp;
								<input name='btnfilter' id="selectJing2" type='button' value='마당 보유' class="btn btn-default btn_click">&nbsp;&nbsp;
								<input name='btnfilter' id="selectJing3" type='button' value='미용자격 보유' class="btn btn-default btn_click">&nbsp;&nbsp;
								<input name='btnfilter' id="selectJing4" type='button' value='행동교정자격 보유' class="btn btn-default btn_click">&nbsp;&nbsp;
								<input name='btnfilter' id="selectJing5" type='button' value='반려동물관리사자격 보유' class="btn btn-default btn_click">&nbsp;&nbsp;
								<!-- <input name='btnfilter' id="selectJing6" type='button' value='반려견 탤런트메이커자격 보유' class="btn btn-default btn_click"> -->
								</span>
							</div>
						</div>
						
						
					</div><!-- col-xs-8 end -->
							
				<div class='col-xs-2'></div>
					</div><!-- row end -->
					
					
					
					
					
				<br>
				<!-- ajax container시작 -->
				<div id="serch-container">
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
						<input type='hidden' name='id' value='<%=p.getUserId()%>'>
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
				</div>
				<div class='row'>
					<div class='col-xs-2'></div>
					<div class='col-xs-8'>
						<div class='col-xs-12'>
							<div id="pageBar">
							<%=request.getAttribute("pageBar") %>
							</div>
						</div>
					</div>
					<div class='col-xs-2'></div>
				</div>
			</div>
		</div><!-- row -->	
	</div><!-- container -->
	
	
<style>
	/* div 나누는 거 확인하기 위해 필요한 스타일, 지우지 말 것 */
/*    	div[class|=col] {
        border: 1px solid blue;
    } */
    /*페이지바*/
    
	div#pageBar{
	margin-top:10px; text-align:center;
	}
	div#pageBar span.cPage{
	color: #0066ff;
	}
    input[name="btnfilter"]{
    	border-radius:8px 8px 8px 8px;
    	background-color:white;
    	color:black;
    }
	/*  input[name="btnfilter2"]{
    	border:1px solid skyblue;
    	border-radius:8px 8px 8px 8px;
    	background-color:none;
    	color:skyblue;
    } */
    /* 달력 */
    input[name="date"]{
		width:100px;
		height:35px;
		text-align:center;
		border:1px solid lightgray;
		border-right:0.2px solid skyblue;
	}
    input[name="date_"]{
		width:100px;
		height:35px;
		text-align:center;
		border:1px solid lightgray;
		border-left:0.2px solid skyblue;
	}
	.ui-datepicker{
		border-radius:10px 10px 10px 10px;
		background-color:snow;
		border:1px solid black;
	}
	.ui-datepicker th{
		background-color:snow;
		color:black;
		font-weight:bold;
		margin:35px;
		height:3px;
		width:3px;
		font-size:10pt;
	}
	/* 달력끝 */
	input[name="upBtn"]{
		background:whitesmoke;
		border:0px solid whitesmoke;
		width:120px;
		height:42px;
	}
	div[name="upDiv"]{
		background:whitesmoke;
		border:1px solid orange;
		opacity:1;
		height:45px;
	}
	div[class="upBorder"]{
		border:1px solid lightgray;
	}
	
	i{
		 font-size:20px;
	}
    html,
    body {
        font-size: 100%;
    }
    .empty1 {
        height: 30.5px;
    }

    .empty2 {
        height: 50px;
    }

    .empty3 {
        height: 10px;
    }
    .empty4 {
    	height: 50px;
    }
    /* 헤더 흰색변경 및 위치조정 */
    .empty5 {
    	height: 30px;
    	background: white;
    }
    .empty6 {
    	height: 400px;
    }
    .middle {
        /* border: 1px solid black; */
        background-color: white;
        height: 1650px;
    }

    .select {
        text-align: center;
    }

    .btn2 {
        width: 45%;
        font-size: 1.7vw;
        padding-left: 0px;
        padding-right: 0px;
        margin-right: 10px;
    }
    .submitBtn {
        width: 100%;
        font-size: 1.2vw;
    }

    div[class|=col] {
        font-size: 1rem;
    }
    /* 중앙 예약화면 크기조정 및 색상변경 */
    div[id=middle_border]{
    	/* border:1px solid gray; */
    	background-color :white;
    }
    /* 밑줄용 */
    div[id=topPen]{
        border-top:1px solid gray;
    }
    div[name=radius_]{
        border-radius: 50px;
    }

    #printPetsitterType {
        text-align: center;
    }
    input::placeholder {
        font-size: 1.2vw;
    }
    .centerClass{
    	height:20px;
    	margin:30px;
        text-align: left;
    }
     .clickHover{
    	/* width:auto; */
    	border:1px solid lightgray;
    	height:202px;
    }
</style>

<script type="text/javascript">

	//-----------------주소 필터링--------------------------------------------------------------------------------
	$(".upBtn").click(function(){
		areaFilter($(this).val());	//ajaxText함수를 실행하기위한 클래스가 upBtn인 태그의 value값추출 (이것이 호출되면 밑에 ajax가 실행)
		//ajaxText(매개변수를 넣음)
	});
	function areaFilter(key,cPage){ ////ajaxText(매개변수를 넣음)==key <-key가 위에 이벤트가실행된 매개변수값을 가져온다
	
		 $.ajax({
			url:"<%=request.getContextPath()%>/home/areaFilter", //매핑할주소
			type:"post", //보내는방식
			dataType:"html", //타입
			data:{"key":key,"cPage":cPage}, //key:value로 value값을 가져옴
			success:function(data){ //data로 매개변수를 넣어 매핑된 서블릿에서 가져온 자료들을 밑에 $("#serch-container").html(data);을 이용해서 채워줌
				console.log(data);
				$("#serch-container").html(data);
			}
		 });
	}
	//-----------------주소 필터링끝------------------------------------------------------------------------------
	
	//----------특징 필터-----------------
	<%-- $(".btnfilter").click(function(){
		/* fn_search($(this).val()); */
		selectJing($(this).attr('value'));
		//ajaxText(매개변수를 넣음)
	});
	
	function selectJing(key,cPage){ ////ajaxText(매개변수를 넣음)==key <-key가 위에 이벤트가실행된 매개변수값을 가져온다
		 $.ajax({
			url:"<%=request.getContextPath()%>/home/searchFeatures", //매핑할주소
			type:"post", //보내는방식
			dataType:"html", //타입
			data:{"key":key,"cPage":cPage}, //key:value로 value값을 가져옴
			success:function(data){ //data로 매개변수를 넣어 매핑된 서블릿에서 가져온 자료들을 밑에 $("#serch-container").html(data);을 이용해서 채워줌
				console.log(data);
				$("#serch-container").html(data);
			}
		 });
	} --%>
	//---------------------------------
	
	
    $(function() { // 페이지 로드 되면 실행
    	for(var i=1; i<=5; i++) {
    		/* document.getElementById("selectJing"+i) */
	    	document.getElementById("selectJing"+i).addEventListener('click', selectJing); 
	    	// 이벤트 등록, selectJing+i 클릭 시 selectJing함수 실행됨
    	}
    });

	
/* 	$(document).ready(function(){
		  $(".btn_click").on("click", function(){
		    $(this).css('background-color':'white','color':'black');
		  });
		}); */
	//특징보유
	$(document).ready(function(){
			$(".btn_click").on('click',function(){
				$(this).css({'background-color':'lightgray','color':'white'});
			});
	});
	var count = []; 
	function selectJing(event){ // 이벤트가 등록된 해당 태그가 event 임.
		if(count!=null){
			if(count.length>0){
				var value=$(this).val();
				if(!count.includes(value)){
					count.push(value);
					$(".btn_click").on('click',function(){
						$(this).css({'background-color':'lightgray','color':'white'});
					});
				}
				else{
					var i=count.indexOf(value);
					$(".btn_click").on('click',function(){
						$(this).css({'background-color':'white','color':'black'});
					});
					count.splice(i,1);
				}
			}
			else{
				count.push($(this).val());
				$(".btn_click").on('click',function(){
					$(this).css({'background-color':'lightgray','color':'white'});
				});
			}
			console.log(count)
		}
	}
	
	
	$(".clickHover").on({
			mouseover: function(){
			$(this).css({"border":"1px solid coral","cursor":"pointer"});
		},
			mouseleave: function(){
			$(this).css({"border":"1px solid lightgray","cursor":"pointer"});
		},
			dblclick: function(){
			var userId = $(this).find('input[name=id]').val();	 //clickHover 안에있는 find을 이용해 input태그의 value를 찾음
			console.log(userId);
			location.href="<%=request.getContextPath()%>/petsitterInfo?id="+userId;
		}
	});
	$("clickHover").click(function(){
		var userId = $("#userId").val();
		console.log(userId);
	})
	<%-- ?userId=<%=listMap.get(0).get("userId").toString()%> --%>
	
	$("input.upBtn").hover(function(){
		$(this).css({"background-color":"lightgray"})
	},function(){
		$(this).css({"background-color":"whitesmoke"})
	});
	

	//달력
/* 	$(function() {
		$("#date3").datepicker({
			onSelect : function(dateText, inst) {
				console.log(dateText);
			}
		});
	});
	$(function() {
		$("#date4").datepicker({
			onSelect : function(dateText, inst) {
				console.log(dateText);
			}
		});
	});//달력끝 */

	function reset(){
		history.go(0);
	}
	
	//select value
	//이름검색
	function fn_searchName(){
		var sn = $("#searchName").val();
		console.log(sn);
		petsitterSearchName(sn);
	}
	function petsitterSearchName(key,cPage){
		$.ajax({
			url: "<%=request.getContextPath()%>/home/petsitterSearchName",
			type: "post",
			data: {"key":key,"filter":JSON.stringify(count),"cPage":cPage}, //filter을 JSON객체로 보냄 
			dataType: "html",
			success:function(data){
				console.log(data);
				$("#serch-container").html(data);
			}
			
		});
	}
	
	//사이즈
	function selectSize(){
		var selectSize = $("#selectSize option:selected").val();
		console.log(selectSize);
	}
	
	//등급
	function selectPetSitter(){
		petsitterGrade($("#selectPetSitter option:selected").val());
	}
	
	//등급AJAX
	function petsitterGrade(key,cPage){ 
		 $.ajax({
			 url:"<%=request.getContextPath()%>/home/petsitterGrade", //매핑할주소
			type:"post", 
			dataType:"html", 
			data:{"key":key,"cPage":cPage}, 
			success:function(data){ 
				console.log(data);
				$("#serch-container").html(data);
			}
		 });
	}
	
		//var selectJing = $("#selectJing").val();
		//console.log(selectJing);
	
	/* $("#selectJing").click(function(){
        alert($("#selectJing").children().val());
	}); */

	
	<%-- $("#areaFilter").click(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/home/areaFilter",
			type:"get",
			data:{"key":$(this).val()},
			dataType:"html",
			success:function(data){
				console.log(data);
				}
		});
	}); --%>
	

</script>

<%@ include file="/views/common/footer.jsp"%>