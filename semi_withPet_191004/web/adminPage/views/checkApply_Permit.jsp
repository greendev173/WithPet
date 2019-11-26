<%@page import="withPet.apply.model.vo.ApplyMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/adminPage/views/common/recruitHeader.jsp"%>

<%
	Member ckMember = (Member) request.getAttribute("ckMember");
	ApplyMember ckApm = (ApplyMember) request.getAttribute("ckApm");
%>
<div class="page-body">
	<!-- Side bar -->
	<%@ include file="/adminPage/views/common/recruitSide.jsp"%>

	<section>
		<!--Body#Section-Start-->

		<!-- partial - Title section Start -->
		<div class="page-content-wrapper">
			<div class="page-content-wrapper-inner">
				<div class="content-viewport">

					<!-- Title Start -->
					<div class="row">
						<div class="col-12 py-5">
							<h4>
								<span style="color: coral;"><%=ckMember.getUserName()%></span>
								님의 지원현황입니다.
							</h4>
							<p class="text-gray">Apply_Status</p>
						</div>
					</div>

					<!-- Title End -->

					<!-- Main Content Start -->

					<!-- 상단 안내글 시작 -->
					<div class="col-lg-12">
						<div class="grid">
							<p class="grid-header">지원 결과</p>
							<div class="grid-body">
								<div class="item-wrapper">
									<div class="row mb-3">
										<div class="col-md-8 mx-auto" style="text-align: center;">
											
											<%
												if (ckApm.getPermitStatus().equals("Y")) {
											%>
											<h1>
												<span style="color: coral;"><%=ckMember.getUserName()%></span>
												님 축하합니다!
											</h1>
											<h2>
												<span style="color: yellowgreen;">With Pet</span>의 가족이 되신걸
												진심으로 환영합니다 <br> 앞으로 더욱 가치있는 시간을 함께 만들기를 바랍니다.
											</h2>
											<%
												} else if (ckApm.getPermitStatus().equals("N")) {
											%>
											<h1>
												<span style="color: coral;"><%=ckMember.getUserName()%></span>
												님 지원 해 주셔서 감사합니다!
											</h1>
											<h2>
												<span style="color: yellowgreen;">With Pet</span>의 가족이 되길 진심으로 기원합니다 <br>
											</h2>
											<%
												} else if (ckApm.getPermitStatus().equals("D")) {
											%>
											<h1>
												<span style="color: coral;"><%=ckMember.getUserName()%></span>
												님 지원 해 주셔서 감사합니다!
											</h1>
											<h2>
												귀하는 아쉽게도 <span style="color: yellowgreen;">With Pet</span>과 함께하지 못하게 되었습니다. 
												<br> 앞으로 더욱 가치있는 시간을 함께 만들기를 바랍니다.
											</h2>
											<%
												}
											%>
											<br> <br>

											<h2>아래와 같이 지원처리된 정보를 알려드립니다.</h2>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 상단 안내글 끝 -->

					<!-- 조회 정보 출력 시작 -->
					<!-- 조회 정보 미니 테이블 시작 -->
					<div class="table-responsive">
						<table class="table table-hover table-sm">
							<thead>
								<tr class="solid-header">
									<th colspan="2" class="pl-4">지원자 이름</th>

									<th>지원 유형</th>
									<th>현재 등급</th>
									<th>지원 등급</th>
									<th>방문 서비스</th>
									<th>위탁 서비스</th>

									<th style="text-align: center;">지원 일자</th>

									<th style="text-align: center;">승인 상태</th>
									<th style="text-align: center;">상세정보</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<!-- 1st <td> Strat : 지원자 -->
									<!-- 1st <td> Strat : 지원자 -->
									<td class="pr-0 pl-4"><img class="profile-img img-sm"
										src="<%=request.getContextPath()%>/upload/petsitter/<%=ckApm.getProfile()%>"
										alt="profile image"></td>
									<td class="pl-md-0"><small
										class="text-black font-weight-medium d-block"><%=ckMember.getUserName()%></small>
										<span class="text-gray"> <span
											class="status-indicator rounded-indicator small bg-primary"></span><%=ckMember.getUserId()%></span>
									</td>
									<!-- 1st <td> : 지원자 End -->

									<!-- 2nd <td> : 지원유형 -->
									<td><small><%=ckApm.getApplyType()%></small></td>

									<!--  현재 등급 -->
									<td>
										<%
											if (ckMember.getGrade().equals("C")) {
										%> 일반회원 <%
											} else if (ckMember.getGrade().equals("G")) {
										%> 일반 펫시터 <%
											} else if (ckMember.getGrade().equals("M")) {
										%> 전문펫시터 <%
											}
										%>
									</td>

									<!-- 3nd <td> : 지원등급  -->
									<td><%=ckApm.getApplyGrade()%></td>

									<!-- 4 위탁 가능여부 -->
									<td><%=ckApm.getCare_in()%></td>

									<!-- 5 방문 가능 여부 -->
									<td><%=ckApm.getCare_out()%></td>

									<!-- 7nd <td> : 지원일자  -->
									<td><%=ckApm.getEnrollDate()%></td>

									<!-- 8nd <td> : 승인상태  -->
									<td style="text-align: center;">
										<%
											if (ckApm.getPermitStatus().equals("Y")) {
										%> 승인 완료 <%
											} else if (ckApm.getPermitStatus().equals("D")) {
										%> 승인 거부 <%
											} else if (ckApm.getPermitStatus().equals("N")) {
										%> 승인 대기중 <%
											}
										%>
									</td>
									<!-- 6nd <td> : 상세 정보 Start -->
									<td style="text-align: center;"><button type="button"
											class="btn btn-primary"
											onclick="showDetail('<%=ckApm.getUserId()%>');">상세보기</button></td>
								</tr>

							</tbody>
						</table>
						<!-- 조회 정보 미니 테이블 끝 -->


					</div>
					<!-- Main Content End -->


				</div>
			</div>
		</div>

	</section>
	<script>
	 function showDetail(id){
	 location.href = "<%=request.getContextPath()%>/apply/showMemberDetail?userId"+id;
		};
	</script>
</div>
<%@ include file="/adminPage/views/common/adminFooter.jsp"%>