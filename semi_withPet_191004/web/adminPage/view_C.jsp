<%@page import="semi_withPet.model.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="views/common/adminHeader.jsp"%>
<%
	List<Member> list = (List) request.getAttribute("list");
	int numPerPage = (int) request.getAttribute("numPerPage");
	
	if (request.getParameter("cPage") != null) {
		int cPage = (int) request.getAttribute("cPage");
	}
	
	String grade = (String)request.getAttribute("grade");
%>

<section>
	<!--Body#Section-Start-->

	<!-- partial - Title section Start -->
	<div class="page-content-wrapper">
		<div class="page-content-wrapper-inner">
			<div class="content-viewport">
				<div class="row">
					<div class="col-12 py-5">
						<h4>일반 회원 관리</h4>
						<p class="text-gray">Mgmt-Member</p>
					</div>
				</div>
				<!-- partial - Title section  End -->

				<!--Main Body Start-->
				<!-- div class="row" 를 설정하여 섹션을 구분-->
				<!-- 그 이외의 것들은 grid 형식으로 배열된다. side by side-->
				<div class="row" style="text-align: center">

					<!--Create Inner Content Start-->
					<div class="col-lg-12">
						<div class="grid">
							<p class="grid-header">회원 정보 조회</p>
							<div class="grid-body">
								<div class="item-wrapper">
									<div class="table-responsive">
										<table class="table info-table table-dark">
											<thead>
												<tr>
													<th>ID</th>
													<th>이름</th>
													<th>회원등급</th>
													<th>집주소</th>
													<th>지역1</th>
													<th>지역2</th>
													<th>연락처</th>
													<th>이메일</th>
													<th>강아지 보유 여부</th>
													<th>보유Point</th>
													<th>가입날짜</th>
												</tr>
												<!-- ======================멤버입력======================== -->
												<%
													for (Member m1 : list) {
												%>
												<tr>
													<td><%=m1.getUserId()%></td>
													<td><%=m1.getUserName()%></td>
													<td><%=m1.getGrade()%></td>
													<td><%=m1.getAddress()%></td>
													<td>
														<%
															if (m1.getArea1() != null) {
														%> <%=m1.getArea1()%> <%
															 	} else {
															 %>미입력<%
															 	}
															 %>
													</td>
													<td>
														<%
															if (m1.getArea2() != null) {
														%> <%=m1.getArea2()%> <%
															 	} else {
															 %>미입력<%
															 	}
															 %>
													</td>
													<td><%=m1.getPhone()%></td>
													<td><%=m1.getEmail()%></td>
													<td><%=m1.getHaveDog()%></td>
													<td><%=m1.getPoint()%></td>
													<td><%=m1.getEnrollDate()%></td>
												</tr>
												<%
													}
												%>
												<!-- ======================멤버입력======================== -->
												
											</thead>
											<!-- 멤버조회 테이블 끝 -->

										</table>


									</div>

								</div>
									<div class="border-top px-3 py-2 d-block text-gray"
										style="text-align: center;"><%=request.getAttribute("pageBar")%>
									</div>
								</div>

						</div>

					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-8"></div>
				<div class="col-4">
					<form action="#" class="t-header-search-box "
						style="margin-bottom: 2px;">
						<div class="input-group" style="text-align: right;">
							<input type="text" class="form-control"  id="searchList"
								placeholder="Search" autocomplete="off">
							
							
							<script>
								
									$(function(){
							    		$('#searchList').keyup(function(){
							    				var name=$(this).val();
							    				var grade = "<%=grade%>";
							    				$.ajax({
							    					url:"<%=request.getContextPath()%>/admin/searchMemberAjax",
												data : {
													"name" : name,
													"grade" : grade
												},
												dataType : "json",
												success : function(data) {
													$(".searchResult").remove();
													var memberList = data.list;
													var cPage = data.cPage;
													var numPerPage = data.numPerPage;
													var pageBar = data.pageBar;
												
													var html = "";
													
													for(var i = 0; i<memberList.length; i++){
														
														html += "<tr class='searchResult'><td>"+memberList[i].userId+"</td><td>"+memberList[i].userName+"</td><td>"+memberList[i].grade+"</td><td>"+memberList[i].address+"</td><td>";
																	if(memberList[i].area1 != null) {
																 		html += memberList[i].area1;
																	 	} else {
																		 html += "미입력";
																	 	}
															html +="</td><td>";
																if(memberList[i].area2 != null) {
																 		html += memberList[i].area2;
																	 	} else {
																		 html += "미입력";
																	 	}
															html +="</td><td>"+memberList[i].phone+"</td><td>"+memberList[i].email+"</td><td>"+memberList[i].haveDog+"</td><td>"+memberList[i].point+"</td><td>"+memberList[i].enrollDate+"</td></tr>";
													}
													
													$("#searchTable").last().append(html);
												}
											})
										})
									})									
							</script>
							
							
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-12">
						<div class="grid">
							<p class="grid-header">이름으로 검색된 회원</p>
							<div class="grid-body">
								<div class="item-wrapper">
									<div class="table-responsive">
										<table class="table info-table table-dark">
											<thead id="searchTable">
												<tr>
													<th>ID</th>
													<th>이름</th>
													<th>회원등급</th>
													<th>집주소</th>
													<th>지역1</th>
													<th>지역2</th>
													<th>연락처</th>
													<th>이메일</th>
													<th>강아지 보유 여부</th>
													<th>보유Point</th>
													<th>가입날짜</th>
												</tr>
												
												<!--Ajax 테이블 출력 -->
											
											</thead>
											
											<!-- 멤버조회 테이블 끝 -->
											</table>
											</div>
											</div>
											</div>
											</div>
											</div>
											
		</div>
	</div>

</section>
<%@ include file="views/common/adminFooter.jsp"%>