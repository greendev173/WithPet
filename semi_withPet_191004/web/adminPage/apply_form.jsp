<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="views/common/recruitHeader.jsp"%>
<%
	Member m1 = (Member) request.getAttribute("ap_member");
%>

<style>
div.custom-file {
	margin-bottom: 15px;
}
</style>
<div class="page-body">
	<!-- Side bar -->
	<%@ include file="views/common/recruitSide.jsp"%>


	<div class="page-content-wrapper" style="width: 100%;">
		<div class="page-content-wrapper-inner">
			<div class="content-viewport">
				<div class="row">
					<form action="<%=request.getContextPath()%>/apply/submit?userId=<%=m1.getUserId()%>" enctype="multipart/form-data" method="post">
						<div class="col-14 py-5">
							<h4>펫시터 지원</h4>
							<p class="text-gray">
								Welcome ,<%=m1.getUserId()%>

							</p>
						</div>
						<div class="col-lg-12">
							<div class="grid">
								<p class="grid-header">회원 정보</p>
								<div class="grid-body">
									<div class="item-wrapper">

										<div class="row mb-3">
											<div class="col-md-8 mx-auto">
												<div class="form-group row showcase_row_area">
													<div class="col-md-3 showcase_text_area">
														<label for="text">이름</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<input type="text" class="form-control" id="inputType1"
															name="userName" value="<%=m1.getUserName()%>" readonly />
														<!-- 해당 칸에 입력될 인풋태그 -->
													</div>
												</div>
												<div class="form-group row showcase_row_area">
													<div class="col-md-3 showcase_text_area">
														<label for="inputType13">주소</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<input type="text" class="form-control" id="inputType3"
															value="<%=m1.getAddress()%>" readonly>
													</div>
												</div>
												<div class="form-group row showcase_row_area">
													<div class="col-md-3 showcase_text_area">
														<label for="inputType1">전화번호</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<input type="text" class="form-control" id="inputType4"
															value="<%=m1.getPhone()%>" readonly>
													</div>
												</div>
												<div class="form-group row showcase_row_area">
													<div class="col-md-3 showcase_text_area">
														<label for="inputType5">Email</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<input type="email" class="form-control" id="inputType5"
															value="<%=m1.getEmail()%>" disabled>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--지원 유형 및 선택사항 입력 시작 -->

						<div class="col-lg-12">
							<div class="grid">
								<p class="grid-header">지원 유형 및 선택사항</p>
								<div class="grid-body">
									<div class="item-wrapper">
										<div class="row">
											<div class="col-md-8 mx-auto">
												<div class="row showcase_row_area"
													style="margin-bottom: 20px;">
													<div class="col-md-3 showcase_text_area">
														<label>펫시터 등급 </label><br> <label
															style="color: coral;">[※필수선택]</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<select class="custom-select" name="applyGrade"
															id="select_grade">
															<option selected value="">클릭하여 선택하세요</option>
															<option value="G">일반 펫시터</option>
															<option value="M" id="MajorSitter">전문 펫시터(관련학과
																졸업증명서 제출 필수)</option>
														</select>
													</div>
												</div>
												<div class="row showcase_row_area mb-3 layer">
													<div class="col-md-3 showcase_text_area">
														<label style="color: #4CCEAC;">관련학과 졸업증명서 첨부</label><br>
														<label style="color: coral;">[필수사항 입니다]</label>
													</div>
													<div class="col-md-9 showcase_content_area"
														style="text-align: left;">
														<div class="custom-file">
															<input type="file" class="custom-file-input" id="diploma"
																name="diploma"> <label class="custom-file-label"
																for="diploma" id="fl_diploma">파일선택</label>
														</div>
													</div>
												</div>
												<script>
													$('.layer').hide();
													$('#select_grade')
															.change(
																	function() {
																		var state = $(
																				'#select_grade option:selected')
																				.val();
																		if (state == 'M') {
																			$(
																					'.layer')
																					.show();
																			$(
																					'#diploma')
																					.change(
																							function() {
																								var fileName = $("#diploma")[0].files[0].name;
																								var label = document
																										.getElementById("fl_diploma");
																								label.innerHTML = fileName;
																							});

																		} else {
																			$(
																					'.layer')
																					.hide();
																		}
																	});
												</script>


												<div class="row showcase_row_area" style="margin-top: 50px;">
													<div class="col-md-3 showcase_text_area">
														<label>추가 정보 선택</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<div class="form-inline">
															<div class="checkbox mb-3">
																<label> <input type="checkbox"
																	class="form-check-input" name="feature" id="feature1"
																	value="자차보유"> 자차 보유<i class="input-frame"></i>
																</label>
															</div>
															<div class="checkbox mb-3">
																<label> <input type="checkbox" name="feature"
																	id="feature2" value="마당보유" class="form-check-input">
																	마당 보유<i class="input-frame"></i>
																</label>
															</div>
															<div class="checkbox mb-3">
																<label> <input type="checkbox" name="feature"
																	id="feature7" value="실외배변 가능" class="form-check-input">
																	실외배변 가능<i class="input-frame"></i>
																</label>
															</div>
															<div class="checkbox mb-3">
																<label> <input type="checkbox" name="feature"
																	id="feature7" value="가족동거중" class="form-check-input">
																	가족동거 有<i class="input-frame"></i>
																</label>
															</div>
															<div class="checkbox mb-3">
																<label> <input type="checkbox" name="feature"
																	id="feature7" value="응급처치 가능" class="form-check-input">
																	응급처치 가능<i class="input-frame"></i>
																</label>
															</div>
															<div class="checkbox mb-3">
																<label style="color: #4CCEAC;"> <input
																	type="checkbox" name="feature" id="feature4"
																	value="미용자격 보유" class="form-check-input"> 미용자격
																	보유<i class="input-frame"></i>
																</label>
															</div>
															<div class="checkbox mb-3">
																<label style="color: #4CCEAC;"> <input
																	type="checkbox" name="feature" id="feature5"
																	value="행동교정자격 보유" class="form-check-input">
																	행동교정자격 보유<i class="input-frame"></i>
																</label>
															</div>
															<div class="checkbox mb-3">
																<label style="color: #4CCEAC;"> <input
																	type="checkbox" name="feature" id="feature5"
																	value="반려동물관리사 보유" class="form-check-input">반려동물관리사
																	보유<i class="input-frame"></i>
																</label>
															</div>
														</div>
													</div>
												</div>


												<!-- 위탁 방문 가능 여부 선택 Radio버튼 시작 -->
												<div class="row showcase_row_area">
													<div class="col-md-3 showcase_text_area">
														<label>서비스 방법 선택</label>
													</div>
													<div class="col-md-9 showcase_content_area">

														<div class="form-inline">
															<div class="radio mb-3">
																<label class="radio-label mr-4"> <input
																	name="care_radio" type="radio" value="all">위탁&방문
																	모두 가능<i class="input-frame"></i>
																</label>
															</div>
															<div class="radio mb-3">
																<label class="radio-label"> <input
																	name="care_radio" type="radio" value="out">위탁만
																	가능 <i class="input-frame"></i>
																</label>
															</div>
															<div class="radio mb-3">
																<label class="radio-label"> <input
																	name="care_radio" type="radio" value="in">방문만
																	가능<i class="input-frame"></i>
																</label>
															</div>
														</div>
													</div>
												</div>
												<!-- 위탁 방문 가능 여부 선택 Radio버튼 끝 -->



												<!-- 자격증 제출 시작 -->
												<div style="text-align: right;">
													<div class="row showcase_row_area mb-3">
														<div class="col-md-3 showcase_text_area">
															<label style="color: #4CCEAC;">자격증 선택시만 </label><br>
															<label style="color: coral;">[첨부-최대3개]</label>
														</div>
														<div class="col-md-9 showcase_content_area"
															id="upCertificate" style="text-align: left;">
															<div class="custom-file">
																<input type="file" class="custom-file-input"
																	id="customFile1" name="cert_1" onchange="up_file1();">
																<label class="custom-file-label" for="customFile1"
																	id="fl_1">파일선택</label>
															</div>
														</div>
													</div>
													<p id="certContainer" style="padding-top: 13px;">
														<input onclick="addCert();" value="추가" type="button"
															class="btn btn-success" />
													</p>
												</div>
												<script>
													var num = 1;
													var addCheck = false;

													function addCert() {
														if (num < 3) {
															var upCertificate = document
																	.getElementById("upCertificate");
															num += 1;
															upCertificate.innerHTML += "<div class='custom-file' ><input type='file' class='custom-file-input' id='customFile"
																	+ num
																	+ "' name='cert_"
																	+ num
																	+ "' onchange='up_file"
																	+ num
																	+ "();'> <label class='custom-file-label' for='customFile"+num+"' id='fl_"+num+"'>파일선택</label></div>";
															if (num === 2
																	&& addCheck === false) {
																var certContainer = document
																		.getElementById("certContainer");
																certContainer.innerHTML += "&nbsp;<input onclick='deleteCert();' value='제거' type='button' class='btn btn-warning'/>"
																addCheck = true;
															}
															;
															console.log(num);

														}
													};

													function up_file1() {
														var fileName = $("#customFile1")[0].files[0].name;
														var label = document
																.getElementById("fl_1");
														label.innerHTML = fileName;
													}
													function up_file2() {
														var fileName = $("#customFile2")[0].files[0].name;
														var label = document
																.getElementById("fl_2");
														label.innerHTML = fileName;
													}
													function up_file3() {
														var fileName = $("#customFile3")[0].files[0].name;
														var label = document
																.getElementById("fl_3");
														label.innerHTML = fileName;
													}

													function deleteCert() {
														/* var upCertificate = document.getElementById("upCertificate");
														upCertificate.innerHTML = "<div class='custom-file' ><input type='file' class='custom-file-input' id='customFile' name='1'> <label class='custom-file-label' for='customFile'>파일선택</label></div>";
														for(var i=1; i<num-1; i++){
														console.log(num);
														upCertificate.innerHTML += "<br><br><div class='custom-file' ><input type='file' class='custom-file-input' id='customFile' name='"+num+"'> <label class='custom-file-label' for='customFile'>파일선택</label></div>";
														};
														if(num>=2){
														num -= 1;
														};
														if(num===1){
															addCheck = false;
															var A_certContainer = document.getElementById("certContainer");
															A_certContainer.innerHTML = "<input onclick='addCert();' value='추가' type='button' class='btn btn-success'/>";
														}; */
														if (num > 1) {
															$(
																	'#upCertificate>.custom-file')
																	.last()
																	.remove();
															num -= 1;
														}
														if (num === 1) {
															addCheck = false;
															var A_certContainer = document
																	.getElementById("certContainer");
															A_certContainer.innerHTML = "<input onclick='addCert();' value='추가' type='button' class='btn btn-success'/>";
														}
														;

													};
												</script>
												<!-- 자격증 제출 칸 끝 -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--지원 유형 및 선택사항 입력 끝 -->
						<!-- 사진 업로드 시작 -->
						<div class="col-lg-12">
							<div class="grid">
								<p class="grid-header">
									<span>프로필 및 홍보 사진 업로드</span><br> <span
										style="color: coral;">[4가지 모두 필수]</span>
								</p>
								<div class="grid-body">
									<div class="item-wrapper">
										<div class="row">
											<div class="col-md-8 mx-auto">
												<div class="row showcase_row_area mb-3">
													<!-- 프로필사진 시작 -->

													<div class="col-md-3 showcase_text_area">
														<label>프로필 사진</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<div class="custom-file">
															<input type="file" class="custom-file-input"
																name="profile" id="profile" onchange="up_profile();"
																id="customFile"> <label
																class="custom-file-label" for="customFile"
																id="fl_profile">파일 선택</label>
														</div>
													</div>
													<!-- 프로필사진 끝 -->
													<br> <br>
													<!-- 사진 1시작 -->
													<div class="col-md-3 showcase_text_area">
														<label>추가 사진1</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<div class="custom-file">
															<input type="file" class="custom-file-input"
																name="intro_1" id="intro_1" onchange="up_intro1();"
																id="customFile"> <label
																class="custom-file-label" for="customFile"
																id="fl_intro_1">파일 선택</label>
														</div>
													</div>
													<!-- 사진 1  끝 -->
													<br> <br>
													<!-- 사진 2 시작 -->
													<div class="col-md-3 showcase_text_area">
														<label>추가 사진2</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<div class="custom-file">
															<input type="file" class="custom-file-input"
																name="intro_2" id="intro_2" onchange="up_intro2();"
																id="customFile"> <label
																class="custom-file-label" for="customFile"
																id="fl_intro_2">파일 선택</label>
														</div>
													</div>
													<!-- 사진2 끝 -->
													<br> <br>
													<!-- 사진 3시작 -->
													<div class="col-md-3 showcase_text_area">
														<label>추가 사진3</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<div class="custom-file">
															<input type="file" class="custom-file-input"
																name="intro_3" id="intro_3" onchange="up_intro3();"
																id="customFile"> <label
																class="custom-file-label" for="customFile"
																id="fl_intro_3">파일 선택</label>
														</div>
													</div>
													<!-- 사진 3끝 -->
												</div>

												<script>
													function up_profile() {
														var fileName = $("#profile")[0].files[0].name;
														var label = document
																.getElementById("fl_profile");
														label.innerHTML = fileName;
													}
													function up_intro1() {
														var fileName = $("#intro_1")[0].files[0].name;
														var label = document
																.getElementById("fl_intro_1");
														label.innerHTML = fileName;
													}
													function up_intro2() {
														var fileName = $("#intro_2")[0].files[0].name;
														var label = document
																.getElementById("fl_intro_2");
														label.innerHTML = fileName;
													}
													function up_intro3() {
														var fileName = $("#intro_3")[0].files[0].name;
														var label = document
																.getElementById("fl_intro_3");
														label.innerHTML = fileName;
													}
												</script>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 사진 업로드 끝-->
						<!-- 자기소개 입력란 시작 -->
						<div class="col-lg-12">
							<div class="grid">
								<p class="grid-header">
									자기소개 입력<br> <span style="color: coral">[※필수 : 아래
										3가지 사항 / 자기소개는 펫시터 소개글에 표시되어 고객에게 보여집니다]</span>
								</p>
								<div class="grid-body">
									<div class="item-wrapper">
										<div class="row mb-3">
											<div class="col-md-8 mx-auto">
												<div class="form-group row showcase_row_area">
													<div class="col-md-3 showcase_text_area">
														<label for="inputType9">자기소개<br> <span
															style="color: coral">[※소개글에 사용됨]</span></label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<textarea class="form-control" id="inputType9" cols="12"
															name="motivation" rows="5" placeholder="200자 내외"></textarea>
													</div>
												</div>
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-md-8 mx-auto">
												<div class="form-group row showcase_row_area">
													<div class="col-md-3 showcase_text_area">
														<label for="inputType9">입사후 포부</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<textarea class="form-control" id="inputType9" cols="12"
															name="aspiration" rows="5" placeholder="200자 내외"></textarea>
													</div>
												</div>
											</div>
										</div>
										<div class="row mb-3">
											<div class="col-md-8 mx-auto">
												<div class="form-group row showcase_row_area">
													<div class="col-md-3 showcase_text_area">
														<label for="inputType9">성격의 장단점</label>
													</div>
													<div class="col-md-9 showcase_content_area">
														<textarea class="form-control" id="inputType9" cols="12"
															name="personality" rows="5" placeholder="200자 내외"></textarea>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 자기소개 입력란 끝-->
						<!-- 제출버튼  -->
						<div class="col-lg-12">
							<div class="grid" style="text-align: center;">
								<button type="submit" class="btn btn-primary">제출</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="reset" class="btn btn-danger">취소</button>
							</div>
						</div>
					</form>

				</div>

			</div>

		</div>

	</div>

	<%@ include file="views/common/adminFooter.jsp"%>
</div>
<!-- body end -->
