<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="views/common/adminHeader.jsp"%>

<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
	SimpleDateFormat sf2 = new SimpleDateFormat("yyyy년 MM월");
%>
<section>
	<!-- partial -->
	<div class="page-content-wrapper">
		<div class="page-content-wrapper-inner">
			<div class="content-viewport">
				<div class="row">
					<div class="col-12 py-5">
						<h4>Dashboard</h4>
						<p class="text-gray">Welcome aboard, Allen Clerk</p>
					</div>
				</div>
				<!-- 각종 집계 화면 시작 -->
				<!-- 금일 방문자 수  시작 -->
				<div class="row">
					<div class="col-md-3 col-sm-6 col-6 equel-grid">
						<div class="grid">
							<div class="grid-body text-gray">
								<div class="d-flex justify-content-between">
									<p><%=sf.format(nowTime)%>
									</p>
									<p>+06.2%</p>
								</div>
								<p class="text-black">금일 방문자 수</p>
								<div class="wrapper w-50 mt-4">
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<canvas height="16" id="stat-line_1" width="111"
										class="chartjs-render-monitor"
										style="display: block; width: 111px; height: 16px;"></canvas>
								</div>
							</div>
						</div>
					</div>
					<!-- 금일 방문자 수 끝 -->
					<!-- 금일 이용 량 -->
					<div class="col-md-3 col-sm-6 col-6 equel-grid">
						<div class="grid">
							<div class="grid-body text-gray">
								<div class="d-flex justify-content-between">
									<p><%=sf.format(nowTime)%></p>
									<p>+15.7%</p>
								</div>
								<p class="text-black">금일 서비스 이용량</p>
								<div class="wrapper w-50 mt-4">
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<canvas height="16" id="stat-line_2" width="111"
										class="chartjs-render-monitor"
										style="display: block; width: 111px; height: 16px;"></canvas>
								</div>
							</div>
						</div>
					</div>
					<!-- 금일 이용 량 끝 -->

					<!-- 금일 매출 시작 -->
					<div class="col-md-3 col-sm-6 col-6 equel-grid">
						<div class="grid">
							<div class="grid-body text-gray">
								<div class="d-flex justify-content-between">
									<p><%=sf.format(nowTime)%></p>
									<p>+02.7%</p>
								</div>
								<p class="text-black">금일 매출액</p>
								<div class="wrapper w-50 mt-4">
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<canvas height="16" id="stat-line_3" width="111"
										class="chartjs-render-monitor"
										style="display: block; width: 111px; height: 16px;"></canvas>
								</div>
							</div>
						</div>
					</div>

					<!-- 금일 매출 끝 -->

					<!-- 이번달 매출액 -->
					<div class="col-md-3 col-sm-6 col-6 equel-grid">
						<div class="grid">
							<div class="grid-body text-gray">
								<div class="d-flex justify-content-between">
									<p><%=sf2.format(nowTime)%></p>
									<p>- 53.34%</p>
								</div>
								<p class="text-black">당월 매출액</p>
								<div class="wrapper w-50 mt-4">
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<div class="chartjs-size-monitor"
										style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
										<div class="chartjs-size-monitor-expand"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
										</div>
										<div class="chartjs-size-monitor-shrink"
											style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
											<div
												style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
										</div>
									</div>
									<canvas height="16" id="stat-line_4" width="111"
										class="chartjs-render-monitor"
										style="display: block; width: 111px; height: 16px;"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 이번달 매출액 끝 -->

				<!-- 각종 집계 그래프 끝 -->

				<div class="row"></div>
				<div class="col-md-12 equel-grid">
					<div class="grid">
						<div class="grid-body py-3">
							<p class="card-title ml-n1">최근 결제된 서비스</p>
						</div>
						<div class="table-responsive">
							<table class="table table-hover table-sm">
								<thead>
									<tr class="solid-header">
										<th colspan="2" class="pl-4">Customer</th>
										<th>Order No</th>
										<th>Purchased On</th>
										<th>담당 펫시터</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="pr-0 pl-4"><img class="profile-img img-sm"
											src="../assets/images/profile/male/image_4.png"
											alt="profile image"></td>
										<td class="pl-md-0"><small
											class="text-black font-weight-medium d-block">Barbara
												Curtis</small> <span class="text-gray"> <span
												class="status-indicator rounded-indicator small bg-primary"></span>Account
												Deactivated
										</span></td>
										<td><small>8523537435</small></td>
										<td>Just Now</td>
									</tr>
								</tbody>
							</table>
						</div>
						<a class="border-top px-3 py-2 d-block text-gray" href="#"> <small
							class="font-weight-medium"><i
								class="mdi mdi-chevron-down mr-2"></i>View All Order History</small>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="views/common/adminFooter.jsp"%>