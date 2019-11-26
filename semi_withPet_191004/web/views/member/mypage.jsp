<%@page import="add_withPet.pet.model.vo.UsageHistory"%>
<%@page import="semi_withPet.model.vo.Point"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mypageHeader.jsp"%>
<%
	List<Pet> petList = (List<Pet>) request.getAttribute("petList");
	List<Point> pointList = (List<Point>) request.getAttribute("pointList");

	List<UsageHistory> usageList = (List<UsageHistory>) request.getAttribute("usageList");
	List<String> pstImgs = (List<String>) request.getAttribute("pstImgs");
	List<Member> pstInfo = (List<Member>) request.getAttribute("pstInfo");
	Member m5 = (Member)request.getAttribute("changeMember");
	int cPage = (int)request.getAttribute("cPage");
	int numPerPage = (int)request.getAttribute("numPerPage");
%>

<section>
	<!--Body#Section-Start-->

	<!-- partial - Title section Start -->
	<div class="page-content-wrapper">
		<div class="page-content-wrapper-inner">
			<div class="content-viewport">
				<!-- Title Start -->
				
				<!-- Title End -->

				<!-- Main Content Start -->


				<!--  등록 된 펫 내역 출력 -->
				<div class="col-md-12 equel-grid">
					<div class="grid">
						<div class="grid-body py-3">
							<p class="card-title ml-n1">등록된 펫 정보</p>
						</div>
						<div class="table-responsive">
							<table class="table table-hover table-sm">
								<thead>
									<tr class="solid-header">
										<th colspan="2" class="pl-4">이름</th>
										<th>나이</th>
										<th>몸무게</th>
										<th>예방접종 현황</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<%if(!petList.isEmpty()){
											for (Pet pet : petList) {
										%>
										<td class="pr-0 pl-4">
										<%if(pet.getPetImg() == null || pet.getPetImg().equals("null")){%>
										<img class="profile-img img-sm"
											src="<%=request.getContextPath()%>/upload/pet/profile.jpg"
											alt="profile image">
										<%} else{ %>
											<img class="profile-img img-sm"
											src="<%=request.getContextPath()%>/upload/pet/<%=pet.getPetImg()%>"
											alt="profile image">
										<%} %>
											</td>
										<td class="pl-md-0"><small
											class="text-black font-weight-medium d-block"><%=pet.getPetName()%></small>
											<span class="text-gray"> <span
												class="status-indicator rounded-indicator small bg-primary"></span><%=pet.getPetType()%></span>
										</td>

										<!-- 펫 나이 -->
										<td><%=pet.getPetAge()%>살</td>

										<!-- 몸무게 -->
										<td><%=pet.getPetWeight()%>(kg)</td>

										<!-- 예방접종 현황 -->
										<td><small><%=pet.getVaccine()%></small></td>
									</tr>
									<%
										}}
									%>
								</tbody>
							</table>
							<%
								if (petList.isEmpty()) {
							%>
						</div>
						<a class="border-top px-3 py-2 d-block text-gray"
							href="<%=request.getContextPath()%>/member/insertPet"> <small
							class="font-weight-medium"><i class="mdi mdi-dog mr-2"></i>현재
								등록된 펫이 없습니다! 지금 바로 등록해주세요~</small>
						</a>
					</div>
					<%
						} else {
					%>
				</div>
				<a class="border-top px-3 py-2 d-block text-gray"
					href="<%=request.getContextPath()%>/member/insertPet"> <small
					class="font-weight-medium"><i class="mdi mdi-dog mr-2"></i>반려동물
						추가 등록하러가기~</small>
				</a>
			</div>

			<%
				}
			%>
		</div>

		<!-- 등록된 펫 정보테이블 끝 -->

		<div class="row col-lg-12">
			<!-- 사용 내역 시작 -->
			<div class="col-lg-5 col-md-6 col-sm-12 equel-grid">
				<div class="grid">
					<div class="grid-body">
						<div class="split-header">
							<p class="card-title">보유 포인트 & 내역</p>
							<span class="btn action-btn btn-xs component-flat"
								data-toggle="tooltip" data-placement="left"
								title="Available balance since the last week"> <i
								class="mdi mdi-information-outline text-muted mdi-2x"></i>
							</span>
						</div>
						<div class="d-flex align-items-end mt-2">
							<h3><%if(m5 != null){%><%=m5.getPoint()%><%}else{%>0<%} %></h3>
							<p class="ml-1 font-weight-bold">Pts</p>
						</div>
						<div class="d-flex flex-row mt-4 mb-8">
							<button
								class="btn btn-primary w-50 ml-4"
								type="button" data-toggle="modal" data-target="#myModal">충전하기</button>
							<button class="btn btn-primary w-50 ml-4" type="button" onclick="moveUsage();">이용내역조회</button>
						</div>
						<script>
						function moveUsage(){
							location.href="<%=request.getContextPath()%>/member/paidUH";
						}
						
						</script>
						<!-- 충전하기 모달 시작 -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<!--  큰창:<div class="modal-dialog modal-lg"> 작은창 :<div class="modal-dialog modal-sm">  -->
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">Point 충전</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
									</div>
									<div class="modal-body">
										<!-- 금액 입력 시작 -->
										<div class="form-group row showcase_row_area">
											<div class="col-md-3 showcase_text_area">
												<label for="inputType1">충전금액<br> <span
													style="color: coral;">[=Point]</span></label>
											</div>
											<div class="col-md-9 showcase_content_area">
												<input type="number" class="form-control" id="updatePoint"
													value="0" step="1000" min='10000' max='500000'>
											</div>
										</div>
										<!-- 금액 입력 종료 -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" id="myButtons1"
											onclick="updatePoint();">충전</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">취소</button>
									</div>
									
								</div>
							</div>
						</div>
						<!-- 충전 모달 종료 -->
						<div class="d-flex mt-2">
							<div class="wrapper d-flex pr-4">
								<small class="text-success font-weight-medium mr-2">최소금액</small>
								<small class="text-gray">10000(원=point)</small>
							</div>
							<div class="wrapper d-flex">
								<small class="text-primary font-weight-medium mr-2">최대금액</small>
								<small class="text-gray">500000(원=point)</small>
							</div>
						</div>

						<!-- 아임포트 cdn -->
						<script type="text/javascript"
							src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
						<script>
						var point = 0;
						
						function updatePoint(){
							//성술이 로직
							//var point = document.getElementById('updatePoint').value;
							//console.log(point);
							//location.href = "<%=request.getContextPath()%>/member/updatePoint?point="+point;
				
							var IMP = window.IMP; // 생략가능
							IMP.init('imp13577377');
							// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
							// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
							IMP.request_pay({
							pg: 'inicis', // version 1.1.0부터 지원.
							/*
							'kakao':카카오페이,
							html5_inicis':이니시스(웹표준결제)
							'nice':나이스페이
							'jtnet':제이티넷
							'uplus':LG유플러스
							'danal':다날
							'payco':페이코
							'syrup':시럽페이
							'paypal':페이팔
							*/
							pay_method: 'card',
							/*
							'samsung':삼성페이,
							'card':신용카드,
							'trans':실시간계좌이체,
							'vbank':가상계좌,
							'phone':휴대폰소액결제
							*/
							merchant_uid: 'merchant_' + new Date().getTime(),
							/*
							merchant_uid에 경우
							https://docs.iamport.kr/implementation/payment
							위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
							참고하세요.
							나중에 포스팅 해볼게요.
							*/
							name: 'WithPet 포인트 결제',
							//결제창에서 보여질 이름
							amount: $("#updatePoint").val(),
							//가격
							buyer_email: '<%=loginMember.getEmail()%>',
							buyer_name: '<%=loginMember.getUserName()%>',
							buyer_tel: '<%=loginMember.getPhone()%>',
							buyer_addr: '<%=(loginMember.getAddress()).replaceAll("subaddr", " ")%>',
							buyer_postcode: '123-456',
							//m_redirect_url: 'https://www.yourdomain.com/payments/complete'
							/*
							모바일 결제시,
							결제가 끝나고 랜딩되는 URL을 지정
							(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
							*/
							}, function (rsp) {
							if (rsp.success) {
								var msg = '결제가 완료되었습니다.';
									msg += '고유ID : ' + rsp.imp_uid;
									msg += '상점 거래ID : ' + rsp.merchant_uid;
									msg += '결제 금액 : ' + rsp.paid_amount;
									msg += '카드 승인번호 : ' + rsp.apply_num;
									point = rsp.paid_amount;
								location.href="<%=request.getContextPath()%>/member/updatePoint?point="+point+"&userId=<%=loginMember.getUserId()%>";
								return point;
							} else {
								var msg = '결제에 실패하였습니다.';
								msg += '에러내용 : ' + rsp.error_msg;
								alert(msg);
							}
							});
						};

					</script>
						<!-- 충전내역 시작 -->
						<div class="d-flex mt-5 mb-3">
							<small class="mb-0 text-primary">최근 충전 내역 (5개)</small>
						</div>
						<div class="d-flex justify-content-between border-bottom py-2">
							<p class="text-gray">입출금 여부</p>
							<p class="text-gray">포인트</p>
							<p class="text-gray">결제 일자</p>
						</div>
						<%
							for (Point pt : pointList) {
						%>
						<div class="d-flex justify-content-between border-bottom py-2">
							<p class="text-black"><%=pt.getPointDW()%></p>
							<p class="text-black">
								<%
									if (pt.getPointDW().equals("차감")) {
								%>-<%
									}
								%>
								<%=pt.getPrice()%></p>
							<p class="text-black"><%=pt.getPointDate()%></p>
						</div>
						<%
							}
						%>

					</div>
					<div class="border-top px-3 py-2 d-block text-gray"
							style="text-align: center;"><%=request.getAttribute("pageBar")%>
						</div>
				</div>
			</div>
			<!-- 사용 내역 끝 -->

			<!--  결제처리 시작 -->
			<div class="col-md-7 equel-grid">
				<div class="grid">
					<div class="grid-body py-3">
						<p class="card-title ml-n1">서비스 예약 내역(Order History)</p>
					</div>
					<div class="table-responsive">
						<table class="table table-hover table-sm">
							<thead>
								<tr class="solid-header">
									<th colspan="2" class="pl-4">Petsitter</th>
									<th>Price</th>
									<th>Reservation Date</th>
									<th>Payment</th>
								</tr>
							</thead>
							<tbody>
								<%
									int pstInfoNum = 0;
								%>
								<%
									for (UsageHistory usa : usageList) {
								%>
								<tr>
									<td class="pr-0 pl-4"><img class="profile-img img-sm"
										src="<%=request.getContextPath()%>/upload/petsitter/<%=pstImgs.get(pstInfoNum)%>"
										alt="profile image"></td>
									<td class="pl-md-0"><small
										class="text-black font-weight-medium d-block"><%=pstInfo.get(pstInfoNum).getUserName()%></small>
										<span class="text-gray"> <span
											class="status-indicator rounded-indicator small bg-primary"></span><%=pstInfo.get(pstInfoNum).getGrade()%></span>
									</td>
									<td><small><%=usa.getPrice()%></small></td>
									<td><%=usa.getPayDate()%></td>
									<td><button type="button" class="btn btn-dark"
											onclick="payment('<%=usa.getPrice()%>','<%=usa.getPayNo()%>')">결제하기</button></td>
								</tr>
								<%
									pstInfoNum++;
									}
								%>
							</tbody>
						</table>
						<script>
                  function payment(price,payNo) {
                	  var check = confirm(price + "원 이 결제됩니다. 결제하시겠습니까? \n※주의)상세정보를 정확히 확인하세요!");
                	  if(check){
                		  location.href="<%=request.getContextPath()%>/member/paymentEnd?price="+price+"&payNo="+payNo;
                	  }
                  }
                  
                  
                  </script>

					</div>
					<a class=" page-link" href="<%=request.getContextPath()%>/member/selectUH" style="text-align : center;"> <i
							class="mdi mdi-basket mr-2"></i>임시저장 내역 보러가기
					</a>
				</div>
			</div>
		</div>
		<!-- 결제처리 끝 -->
		<!-- Main Content End -->
	</div>

</section>
<%@ include file="/views/common/mypageFooter.jsp"%>