<%@page import="add_withPet.pet.model.vo.UsageHistory, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<UsageHistory> list = (List)request.getAttribute("list");
	String purpose = (String) request.getAttribute("purpose");
	String payNo = "";
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
			<p class="grid-header">임시저장내역 TABLE</p>
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
							</tr>
							<%
								}
							} else {
							%>
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

<%@ include file="/views/common/mypageFooter.jsp"%>