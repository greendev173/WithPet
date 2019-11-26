<%@page import="common.filter.EncryptPasswordWrapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mypageHeader.jsp"%>
<%
	List<Pet> pList = (List)request.getAttribute("pList");
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

										<form
											action="<%=request.getContextPath()%>/member/updatePetEnd"
											method="post" id="updatePet-frm"
											enctype="multipart/form-data">
											<input type="hidden" name="cnt" value="<%=pList.size()%>">

											<%
												for (Pet pet : pList) {
											%>
											<input type="hidden" id="petId<%=cnt%>"
												name="petId<%=cnt%>" value="<%=pet.getPetId()%>" />
											<div class="row" id="petList<%=cnt%>">
												<div id="picture<%=cnt%>" class="col-md-4">
												<%if(pet.getPetImg()!=null) { // 진짜 null이 아니면 %>
													<%if(pet.getPetImg().equals("null") || pet.getPetImg()=="") {%>
														<img
															src="<%=request.getContextPath()%>/upload/pet/profile.jpg"
															style="width: 200px; height: 200px; margin-top: 50px;">
													<%} else{ %>
														<img
															src="<%=request.getContextPath()%>/upload/pet/<%=pet.getPetImg()%>"
															style="width: 200px; height: 200px; margin-top: 50px;">
													<%} %>
												<%}else { // 진짜 null 이면 %>
													<img
														src="<%=request.getContextPath()%>/upload/pet/profile.jpg"
														style="width: 200px; height: 200px; margin-top: 50px;">
												<%} %>
												</div>
												<div class="col-md-8">
													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petPic<%=cnt%>">사진</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<div class="custom-file">
																<input type="file" class="custom-file-input"
																	id="customFile<%=cnt%>" name="up_file<%=cnt%>">
																<input type="hidden" id="ori_File<%=cnt%>"
																	name="ori_file<%=cnt%>" value="<%=pet.getPetImg()%>">
																<!-- <input type="hidden" id="read_path" name="real_path" value="" /> -->
																<label class="custom-file-label"
																	for="customFile<%=cnt%>" id="pic<%=cnt%>">
																	<%if(pet.getPetImg()!=null) { // 진짜 null이 아니면 %>
																	<%if(pet.getPetImg()!="" || !pet.getPetImg().equals("null")) {%>
																			<%=pet.getPetImg() %>
																		<%} else{ %> 
																			사진 없음
																		<%} %> 
																	<%} else { %>
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
																value="<%=pet.getPetName()%>" required />
																<span id="petNameErr<%=cnt%>" class="help-block" style="color:red;">한글, 영문으로만 입력 가능합니다.</span>
														</div>
													</div>
													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petType<%=cnt%>">견종</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<input type="text" class="form-control form-control-sm"
																id="petType<%=cnt%>" name="petType<%=cnt%>" list="data<%=cnt %>"
																value="<%=pet.getPetType()%>" required />
															<datalist id="data<%=cnt%>"></datalist>	
															<span id="petTypeErr<%=cnt%>" style="color:red;">올바른 견종을 입력해주세요.</span>
														</div>
													</div>

													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petAge<%=cnt%>">나이</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<input type="number" class="form-control form-control-sm"
																id="petAge<%=cnt%>" name="petAge<%=cnt%>"
																value="<%=pet.getPetAge()%>" required />
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
																value="<%=pet.getPetWeight()%>" required />
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
											</div>

											<%
												cnt++;
													}
											%>

											<div style="text-align: center;">
												<button type="submit" class="btn btn-sm btn-primary">수정</button>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<button type="reset" class="btn btn-sm btn-primary">취소</button>
											</div>
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
	var types="";

	$(function(){
		
		$("#customFile1").change(function(){
			var fileName = $("#customFile1")[0].files[0].name;
			$("#pic1").html(fileName);
			
			$("#picture1").html("");
			$.each($(this)[0].files, function(i, item){
				var reader = new FileReader();
				reader.onload = function(e){
					var img = $("<img>").attr({"src":e.target.result}).css({"width":"200px", "height":"200px", "margin-top":"50px"});
					$("#picture1").append(img);
				}
				reader.readAsDataURL(item);
			});
		});
		
		
		
		$("#customFile2").change(function(){
			var fileName = $("#customFile2")[0].files[0].name;
			$("#pic2").html(fileName);
			
			$("#picture2").html("");
			$.each($(this)[0].files, function(i, item){
				var reader = new FileReader();
				reader.onload = function(e){
					var img = $("<img>").attr({"src":e.target.result}).css({"width":"200px", "height":"200px", "margin-top":"50px"});
					$("#picture2").append(img);
				}
				reader.readAsDataURL(item);
			});
		});
		
		
		
		
		$("#customFile3").change(function(){
			var fileName = $("#customFile3")[0].files[0].name;
			$("#pic3").html(fileName);
			
			$("#picture3").html("");
			$.each($(this)[0].files, function(i, item){
				var reader = new FileReader();
				reader.onload = function(e){
					var img = $("<img>").attr({"src":e.target.result}).css({"width":"200px", "height":"200px", "margin-top":"50px"});
					$("#picture3").append(img);
				}
				reader.readAsDataURL(item);
			});
		});
		
		
		$("#petNameErr1").hide();
		$("#petNameErr2").hide();
		$("#petNameErr3").hide();
		
		$("#petName1").keyup(function(){
			var name = $(this).val();
			// 이름 검증 정규표현식
			var reg = /^[가-힣]{1,10}|[a-zA-Z]{1,10}$/;
			if (reg.test(name)) {//정규표현식을 통과 한다면
				$("#petNameErr1").hide();
				
			} else {//정규표현식을 통과하지 못하면
				$("#petNameErr1").show();
			}
		});
		
		
		
		$("#petName2").keyup(function(){
			var name = $(this).val();
			// 이름 검증 정규표현식
			var reg = /^[가-힣]{1,10}|[a-zA-Z]{1,10}$/;
			if (reg.test(name)) {//정규표현식을 통과 한다면
				$("#petNameErr2").hide();
				
			} else {//정규표현식을 통과하지 못하면
				$("#petNameErr2").show();
			}
		});
		
		
		
		$("#petName3").keyup(function(){
			var name = $(this).val();
			// 이름 검증 정규표현식
			var reg = /^[가-힣]{1,10}|[a-zA-Z]{1,10}$/;
			if (reg.test(name)) {//정규표현식을 통과 한다면
				$("#petNameErr3").hide();
				
			} else {//정규표현식을 통과하지 못하면
				$("#petNameErr3").show();
			}
		});
		
		
		//견종 경고창 숨김
		$("#petTypeErr1").hide();
		$("#petTypeErr2").hide();
		$("#petTypeErr3").hide();
		
		$("#petType1").keyup(function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/searchTypes",
				type : "get",
				data : {"key" : $(this).val()},
				dataType : "json",
				success : function(data){
					types = data.split(",");
					$("#data1").html("");
					for(var i=0; i<types.length; i++){
						var option = $("<option>").attr({"value" : types[i]}).html(types[i]);
						$("#data1").append(option);
					}
					return types;
				}
			});
		});
		
		
		
		$("#petType1").focusout(function(){
			if($(this).val()==""){
				$("#petType1").focus();
				
			}
			if(types != "" && types!=$(this).val()){
				console.log(types);
				$("#petTypeErr1").show();
				$("#petType1").focus();
			}
			else if(types != "" && types==$(this).val()){
				$("#petTypeErr1").hide();
				$("#petAge1").focus();
			}
			else{
				$("#petTypeErr1").show();
				$("#petType1").focus();
				
			}
		});
		
		
		
		$("#petType2").keyup(function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/searchTypes",
				type : "get",
				data : {"key" : $(this).val()},
				dataType : "json",
				success : function(data){
					types = data.split(",");
					$("#data2").html("");
					for(var i=0; i<types.length; i++){
						var option = $("<option>").attr({"value" : types[i]}).html(types[i]);
						$("#data2").append(option);
					}
					return types;
				}
			});
		});
		
		
		
		$("#petType2").focusout(function(){
			if($(this).val()==""){
				$("#petType2").focus();
				
			}
			if(types != "" && types!=$(this).val()){
				console.log(types);
				$("#petTypeErr2").show();
				$("#petType2").focus();
			}
			else if(types != "" && types==$(this).val()){
				$("#petTypeErr2").hide();
				$("#petAge2").focus();
			}
			else{
				$("#petTypeErr2").show();
				$("#petType2").focus();
				
			}
		});
		
		
		
		
		$("#petType3").keyup(function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/searchTypes",
				type : "get",
				data : {"key" : $(this).val()},
				dataType : "json",
				success : function(data){
					types = data.split(",");
					$("#data3").html("");
					for(var i=0; i<types.length; i++){
						var option = $("<option>").attr({"value" : types[i]}).html(types[i]);
						$("#data3").append(option);
					}
					return types;
				}
			});
		});
		
		
		
		$("#petType3").focusout(function(){
			if($(this).val()==""){
				$("#petType3").focus();
				
			}
			if(types != "" && types!=$(this).val()){
				console.log(types);
				$("#petTypeErr3").show();
				$("#petType3").focus();
			}
			else if(types != "" && types==$(this).val()){
				$("#petTypeErr3").hide();
				$("#petAge3").focus();
			}
			else{
				$("#petTypeErr3").show();
				$("#petType3").focus();
			}
		});
		
		
		
	});
	
	             
</script>

<%@ include file="/views/common/mypageFooter.jsp"%>