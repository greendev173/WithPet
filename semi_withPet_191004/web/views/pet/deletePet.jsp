<%@page import="common.filter.EncryptPasswordWrapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mypageHeader.jsp"%>
<%
	List<Pet> pList = (List) request.getAttribute("pList");
	//마리당 폼 추가하기 위한 변수
	int cnt = 1;
%>

<section>
	<!--Body#Section-Start-->

	<!-- partial - Title section Start -->
	<div class="page-content-wrapper">
		<div class="page-content-wrapper-inner">
			<div class="content-viewport">
				<!-- Title Start -->
				<div class="row">
					<div class="col-12 py-5">
						<!-- <h4>Title</h4>
                  <p class="text-gray">Sub-title</p> -->
					</div>
				</div>
				<!-- Title End -->

				<!-- Main Content Start -->


				<div class="col-lg-12"
					style="margin-left: -50px; margin-top: -50px;">
					<div class="grid">

						<div class="grid-body">
							<div class="item-wrapper">
								<div class="row mb-3">
									<div class="col-md-11 mx-auto">

										<form action="" method="post" id="deletePetFrm"
											onSubmit="fn_deletePet();">

											<%
												for (Pet pet : pList) {
											%>
											<input type="hidden" id="petId<%=cnt%>" name="petId<%=cnt%>"
												value="<%=pet.getPetId()%>" />
											<div class="row" id="petList<%=cnt%>">

												<div id="picture<%=cnt%>" class="col-md-3">
												<%if(pet.getPetImg()!=null) { // 진짜 null이 아니면 %>
													<%if(pet.getPetImg()=="" || pet.getPetImg().equals("null")) {%>
														<img
															src="<%=request.getContextPath()%>/upload/pet/profile.jpg"
															style="width: 150px; height: 150px; margin-top: 100px;">
													<%} else{ %>
														<img
															src="<%=request.getContextPath()%>/upload/pet/<%=pet.getPetImg()%>"
															style="width: 150px; height: 150px; margin-top: 100px;">
													<%} %>
												<%}else { %>
													<img
															src="<%=request.getContextPath()%>/upload/pet/profile.jpg"
															style="width: 150px; height: 150px; margin-top: 100px;">
												<%} %>	
												</div>

												<div class="col-md-7">
													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petPic<%=cnt%>">사진</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<div class="custom-file">
																<input type="file" class="custom-file-input"
																	id="customFile<%=cnt%>" name="up_file<%=cnt%>" readonly>
																<input type="hidden" id="ori_File<%=cnt%>"
																	name="ori_file<%=cnt%>" value="<%=pet.getPetImg()%>">
																<label class="custom-file-label"
																	for="customFile<%=cnt%>" id="pic<%=cnt%>">
																	<%if(pet.getPetImg()!=null) { // 진짜 null이 아니면 %>
																		<%if(pet.getPetImg()=="" || pet.getPetImg().equals("null")) {%>
																			사진 없음
																		<%} else{ %> 
																			<%=pet.getPetImg() %>
																		<%} %> 
																	<%} else{ %>
																		사진 없음
																	<%} %>	
																	</label>
															</div>
														</div>
													</div>

													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petName<%=cnt%>">이름</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<input type="text" class="form-control form-control-sm"
																id="petName<%=cnt%>" name="petName<%=cnt%>"
																value="<%=pet.getPetName()%>" readonly />
														</div>
													</div>
													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petType<%=cnt%>">종류</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<input type="text" class="form-control form-control-sm"
																id="petType<%=cnt%>" name="petType<%=cnt%>"
																value="<%=pet.getPetType()%>" readonly />
														</div>
													</div>

													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petAge<%=cnt%>">나이</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<input type="number" class="form-control form-control-sm"
																id="petAge<%=cnt%>" name="petAge<%=cnt%>"
																value="<%=pet.getPetAge()%>" readonly />
														</div>
													</div>
													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petWeight<%=cnt%>">몸무게</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<input type="number" class="form-control form-control-sm"
																id="petWeight<%=cnt%>" name="petWeight<%=cnt%>"
																min="0.1" max="100" step="0.1"
																value="<%=pet.getPetWeight()%>" readonly />
														</div>
													</div>



													<div class="form-group row showcase_row_area"
														style="margin-bottom: -5px;">
														<div class="col-md-3 showcase_text_area">
															<label>예방접종</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<div class="form-group">
																<div class="form-inline">
																	<div class="checkbox mb-3">
																		<label> <input type="checkbox"
																			class="form-check-input" id="vaccine-<%=cnt%>-1"
																			name="vaccine<%=cnt%>" value="종합백신"
																			<%=pet.getVaccine().contains("종합백신") ? "checked" : ""%>>
																			종합백신 <i class="input-frame"></i>
																		</label>
																	</div>
																	<div class="checkbox mb-3">
																		<label> <input type="checkbox"
																			class="form-check-input" id="vaccine-<%=cnt%>-2"
																			name="vaccine<%=cnt%>" value="코로나장염"
																			<%=pet.getVaccine().contains("코로나장염") ? "checked" : ""%>>
																			코로나장염 <i class="input-frame"></i>
																		</label>
																	</div>
																	<div class="checkbox mb-3">
																		<label> <input type="checkbox"
																			class="form-check-input" id="vaccine-<%=cnt%>-3"
																			name="vaccine<%=cnt%>" value="광견병"
																			<%=pet.getVaccine().contains("광견병") ? "checked" : ""%>>
																			광견병 <i class="input-frame"></i>
																		</label>
																	</div>
																</div>

																<div class="form-inline">
																	<div class="checkbox mb-3">
																		<label> <input type="checkbox"
																			class="form-check-input" id="vaccine-<%=cnt%>-4"
																			name="vaccine<%=cnt%>" value="켄넬코프"
																			<%=pet.getVaccine().contains("켄넬코프") ? "checked" : ""%>>
																			켄넬코프 <i class="input-frame"></i>
																		</label>
																	</div>
																	<div class="checkbox mb-3">
																		<label> <input type="checkbox"
																			class="form-check-input" id="vaccine-<%=cnt%>-5"
																			name="vaccine<%=cnt%>" value="인플루엔자"
																			<%=pet.getVaccine().contains("인플루엔자") ? "checked" : ""%>>
																			인플루엔자 <i class="input-frame"></i>
																		</label>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<div class="row showcase_row_area"
														style="margin-bottom: 50px;">
														<div class="col-md-3 showcase_text_area">
															<label>질병유무</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<div class="form-inline">
																<div class="radio mb-3">
																	<label class="radio-label mr-4"> <input
																		name="petSick<%=cnt%>" id="sick<%=cnt%>_1"
																		type="radio" value="Y"
																		<%=pet.getSickYn().contains("Y") ? "checked" : ""%>>Y
																		<i class="input-frame"></i>
																	</label>
																</div>
																<div class="radio mb-3">
																	<label class="radio-label"> <input
																		name="petSick<%=cnt%>" id="sick<%=cnt%>_2"
																		type="radio" value="N"
																		<%=pet.getSickYn().contains("N") ? "checked" : ""%>>N
																		<i class="input-frame"></i>
																	</label>
																</div>
															</div>
														</div>
													</div>
												</div>

												<div style="margin-left:20px; margin-top:150px;">
													<input type="button" onclick="deletePet<%=cnt%>" 
													id="deletePet<%=cnt%>" class="btn btn-sm btn-primary" value="펫삭제" />
												</div>

											</div>
											<script>
													$(function(){
														$("#deletePet<%=cnt%>").click(function(){
															var flag = confirm("정말 삭제하시겠습니까?");
															if(flag==true){
																deletePetFrm.action = "<%=request.getContextPath()%>/member/deletePetEnd?id=<%=pet.getPetId()%>";
																deletePetFrm.submit();
															}
														});
													});
											
											</script>
											<%
												cnt++;
												}
											%>

											<!-- <div style="text-align: center;">
												<button type="submit" class="btn btn-sm btn-primary" id="btn_del">삭제</button>
											</div> -->
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Main Content End -->
			</div>
		</div>
	</div>
</section>
<script>
	
	<%-- $(function(){

			$("#deletePet2").click(function(){
				var flag = confirm("정말 삭제하시겠습니까?");
				if(flag==true){
					deletePetFrm.action = "<%=request.getContextPath()%>/member/deletePetEnd?id=<%=pList.get(1).getPetId()%>";
					deletePetFrm.submit();
				}
			});
			
			
			$("#deletePet3").click(function(){
				var flag = confirm("정말 삭제하시겠습니까?");
				if(flag==true){
					deletePetFrm.action = "<%=request.getContextPath()%>/member/deletePetEnd?id=<%=pList.get(2).getPetId()%>";
					deletePetFrm.submit();
				}
			});
		
	});
	 --%>
	
	             
</script>

<%@ include file="/views/common/mypageFooter.jsp"%>