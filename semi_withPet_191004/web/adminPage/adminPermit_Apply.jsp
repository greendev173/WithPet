<%@page import="java.util.ArrayList"%>
<%@page import="withPet.apply.model.vo.ApplyMember"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="views/common/adminHeader.jsp"%>
<%
	List<ApplyMember> listReady = new ArrayList<ApplyMember>();
	List<String> nameReady = null;
	List<String> gradeReady = null;

	if (!(((List<ApplyMember>) request.getAttribute("listReady")).isEmpty())) {
		listReady = (List<ApplyMember>) request.getAttribute("listReady");
		nameReady = (List<String>) request.getAttribute("nameReady");
		gradeReady = (List<String>) request.getAttribute("gradeReady");
	}

	List<ApplyMember> listDone = new ArrayList<ApplyMember>();
	List<String> nameDone = null;
	List<String> gradeDone = null;

	if (!(((List<ApplyMember>) request.getAttribute("listDone")).isEmpty())) {
		listDone = (List<ApplyMember>) request.getAttribute("listDone");
		nameDone = (List<String>) request.getAttribute("nameDone");
		gradeDone = (List<String>) request.getAttribute("gradeDone");
	}
	int nR = 0; //nameReady for문용 -> 각 멤버의 이름을 출력하기 위한 변수(for each문 안에사용)
	int nD = 0; //nameDone for문용 -> 각 멤버의 이름을 출력하기 위한 변수(for each문 안에사용)
	int gR = 0; //gradeReady
	int gD = 0; //gradeDone

	int readyNumPerPage = (int) request.getAttribute("readyNumPerPage");

	if (request.getParameter("readyCPage") != null) {
		int readyCPage = (int) request.getAttribute("readyCPage");
	}

	int doneNumPerPage = (int) request.getAttribute("doneNumPerPage");

	if (request.getParameter("doneCPage") != null) {
		int doneCPage = (int) request.getAttribute("doneCPage");
	}
%>
<section>
	<!--Body#Section-Start-->

	<!-- partial - Title section Start -->
	<div class="page-content-wrapper">
		<div class="page-content-wrapper-inner">
			<div class="content-viewport">
				<!-- First Title Start -->
				<div class="row">
					<div class="col-12 py-5">
						<h4>펫시터 승인 요청</h4>
						<p class="text-gray">대기중인 지원자</p>
					</div>
				</div>
				<!-- Title End -->

				<!-- Main Content1 Start -->
				<div class="col-md-12 equel-grid">
					<div class="grid">
						<div class="grid-body py-3">
							<p class="card-title ml-n1">Order History</p>
						</div>
						<div class="table-responsive">
							<table class="table table-hover table-sm">
								<thead>
									<tr class="solid-header">
										<th colspan="2" class="pl-4">지원자</th>

										<th>지원 유형</th>
										<th>현재 등급</th>
										<th>지원 등급</th>
										<th>방문 서비스</th>
										<th>위탁 서비스</th>
										<th style="text-align: center;">승인 절차</th>

										<th style="text-align: center;">지원 일자</th>

										<th style="text-align: center;">승인 상태</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (ApplyMember apm : listReady) {
									%>
									<tr>
										<!-- 1st <td> Strat : 지원자 -->
										<td class="pr-0 pl-4"><img class="profile-img img-sm"
											src="<%=request.getContextPath()%>/upload/petsitter/<%=apm.getProfile()%>"
											alt="profile image"></td>
										<td class="pl-md-0"><small
											class="text-black font-weight-medium d-block">
												<%
													if (nameReady != null) {
												%><%=nameReady.get(nR)%>
												<%
													nR++;
														}
												%>
										</small> <span class="text-gray"> <span
												class="status-indicator rounded-indicator small bg-primary"></span><%=apm.getUserId()%></span>
										</td>
										<!-- 1st <td> : 지원자 End -->

										<!-- 2nd <td> : 지원유형 -->
										<td><small><%=apm.getApplyType()%></small></td>

										<!--  현재 등급 -->
										<td>
											<%
												if (gradeReady != null) {
											%><%=gradeReady.get(gR)%>
											<%
												gR++;
													}
											%>
										</td>

										<!-- 3nd <td> : 지원등급  -->
										<td><%=apm.getApplyGrade()%></td>

										<!-- 4 위탁 가능여부 -->
										<td><%=apm.getCare_in()%></td>

										<!-- 5 방문 가능 여부 -->
										<td><%=apm.getCare_out()%></td>

										<!-- 6nd <td> : 상세 정보 Start -->
										<td style="text-align: center;"><button type="button"
												class="btn btn-primary"
												onclick="showDetail('<%=apm.getUserId()%>');">상세보기</button></td>

										<!-- 7nd <td> : 지원일자  -->
										<td><%=apm.getEnrollDate()%></td>

										<!-- 8nd <td> : 승인상태  -->
										<td style="text-align: center;"><%=apm.getPermitStatus()%></td>
									</tr>

									<%
										}
									%>
								</tbody>
							</table>



						</div>
						<div class="border-top px-3 py-2 d-block text-gray"
							style="text-align: center;"><%=request.getAttribute("readyPageBar")%>
						</div>
					</div>
				</div>

				<!-- Second Title Start -->
				<div class="row">
					<div class="col-12 py-5">
						<h4>권한 제어</h4>
						<p class="text-gray">승인처리된 펫시터 리스트</p>
					</div>
				</div>
				<!-- Title End -->
				<!-- Main Content2 Start -->
				<div class="col-md-12 equel-grid">
					<div class="grid">
						<div class="grid-body py-3">
							<p class="card-title ml-n1">Order History</p>
						</div>
						<div class="table-responsive">
							<table class="table table-hover table-sm">
								<thead>
									<tr class="solid-header">
										<th colspan="2" class="pl-4">직원명</th>
										<th>직원 등급</th>
										<th>방문 서비스</th>
										<th>위탁 서비스</th>
										<th style="text-align: center;">상세 정보</th>
										<th style="text-align: center;">승인 일자</th>
										<th style="text-align: center;">승인 상태</th>


									</tr>
								</thead>
								<tbody>
									<%
										for (ApplyMember apm : listDone) {
									%>
									<tr>
										<!-- 1st <td> Strat : 직원명 -->
										<td class="pr-0 pl-4"><img class="profile-img img-sm"
											src="<%=request.getContextPath()%>/upload/petsitter/<%=apm.getProfile()%>"
											alt="profile image"></td>
										<td class="pl-md-0"><small
											class="text-black font-weight-medium d-block">
												<%
													if (nameDone != null) {
												%><%=nameDone.get(nD)%>
												<%
													nD++;
														}
												%>
										</small> <!-- 이름 for문 증가 --> <span class="text-gray"> <span
												class="status-indicator rounded-indicator small bg-primary"></span><%=apm.getUserId()%></span>
										</td>
										<!-- 1st <td> : 직원명  End-->

										<!-- 2nd <td> : 직원등급 -->
										<td>
											<%
												if (gradeDone != null) {
											%><%=gradeDone.get(gD)%> <%
 	gD++;
 		}
 %>
										</td>
										<!-- 4 위탁 가능여부 -->
										<td><%=apm.getCare_in()%></td>

										<!-- 5 방문 가능 여부 -->
										<td><%=apm.getCare_out()%></td>
										<!-- 3nd <td> : 상세 정보  -->
										<td style="text-align: center;"><button type="button"
												class="btn btn-primary"
												onclick="showDetail('<%=apm.getUserId()%>');">상세보기</button></td>
										<!-- 4nd <td> : 승인 일자  -->
										<td><%=apm.getEnrollDate()%></td>
										<!-- 5nd <td> : 승인 상태  -->
										<td style="text-align: center;"><%=apm.getPermitStatus()%></td>
										<!-- 6nd <td> : 권한 관리  -->
										<%-- <td style="text-align : center;"><button type="button"
												class="btn btn-outline-secondary"
												onclick="controlGrade();" value="<%=apm.getUserId()%>">권한 관리</button></td>
									</tr> --%>

									<%
										}
									%>
								</tbody>
							</table>
						</div>
						<div class="border-top px-3 py-2 d-block text-gray"
							style="text-align: center;"><%=request.getAttribute("donePageBar")%>
						</div>
					</div>
				</div>

				<!-- Main Content End -->
				<script>
                 function showDetail(id){
               	  location.href = "<%=request.getContextPath()%>/apply/showDetail?userId22="+id;
               	  
                 };
				</script>


			</div>
		</div>
	</div>

</section>
</section>
<%@ include file="views/common/adminFooter.jsp"%>