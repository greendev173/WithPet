<%@page import="add_withPet.pet.model.vo.UsageHistory, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<UsageHistory> list = (List) request.getAttribute("list");
	String purpose = (String) request.getAttribute("purpose");
	int payNo = 0;
%>
<%@ include file="/views/common/mypageHeader.jsp"%>
<style>
	#pageBar {
		display : table;
		margin : 0 auto;
	}
</style>
<section>
<div class="page-content-wrapper">
<div class="page-content-wrapper-inner">
<div class="content-viewport">
	<div class="col-lg-12">
		<div class="grid">
			<p class="grid-header">이용내역 TABLE</p>
			<div class="item-wrapper">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>서비스번호</th>
								<th>펫시터(pet)</th>
								<th>반려견이름</th>
								<th>시작시간</th>
								<th>종료시간</th>
								<th>이용시간</th>
								<th>가격</th>
								<th>주소</th>
								<th>요청사항</th>
								<th>리뷰</th>
							</tr>
						</thead>
						<tbody>
							<%
							if(!list.isEmpty()){
								for (UsageHistory uh : list) {
							%>
							<tr>
								<td><%=uh.getPayNo() %></td>
								<td class="d-flex align-items-center border-top-0 text-center">
									<img class="profile-img img-sm img-rounded mr-2"
									src="<%=request.getContextPath() %>/images/team/<%=uh.getPetsitterImg() %>"
									alt="profile image"> <span><%=uh.getPetsitterId()%></span>
								</td>
								<td><%=uh.getPetName() %></td>
								<td><%=uh.getStartDate()%></td>
								<td><%=uh.getEndDate()%></td>
								<td><%=uh.getBookTime()%></td>
								<td class="text-success"><%=uh.getPrice()%></td>
								<td><%=uh.getArea()%></td>
								<td><%=uh.getUserRequest()%></td>
							<%if(uh.getReviewCount() == 0) {%>
	<td><button class="btn btn-primary btn-rounded" onClick="writeReview(<%=uh.getPayNo()%>, '<%=uh.getPetsitterImg()%>', '<%=uh.getPetName() %>');">리뷰쓰기</button></td>
<% } else { %>
	<td><button class="btn btn-outline-success btn-rounded" onClick="openReview(<%=uh.getPayNo()%>, '<%=uh.getPetsitterImg()%>', '<%=uh.getPetName() %>');">리뷰보기</button></td>
<%} %>
							</tr>
							<% 
							// 리뷰보기 or 쓰기로 전달할 payNo값 설정
								}
							} else { %>
								<tr>
									<td colspan="10" style="text-align: center; margin-top: 20px; font-size:14px; font-weight:bold;">이용내역이 없습니다.</td>
								</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
			<div id="pageBar" class="text-center">
				<ul class="pagination">
					<%=request.getAttribute("pageBar") %>
				</ul>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
</section>
<script>
	function openReview(payNo, petsitterImg, petName){
		var open = window.open("<%=request.getContextPath()%>/member/viewReview?payNo="+payNo+"&petsitter="+petsitterImg +"&petName="+petName, "_blank", "width=500, height= 500");
	}
	
	function writeReview(payNo, petsitterImg, petName){
		var open = window.open("<%=request.getContextPath()%>/member/writeReview?payNo="+payNo+"&petsitter="+petsitterImg +"&petName="+petName, "_blank", "width=500, height= 500");
	}
</script>
<%@ include file="/views/common/mypageFooter.jsp"%>