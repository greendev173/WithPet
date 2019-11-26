<%@page import="common.filter.EncryptPasswordWrapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/mypageHeader.jsp"%>
<%-- <%
	List<Pet> pList = (List) request.getAttribute("pList");
%> --%>

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


										<form action="<%=request.getContextPath()%>/member/insertPetEnd" method="post" id="insertPet-frm" enctype="multipart/form-data">

											<div class="row" id="petList">
												<div id="picture" class="col-md-4">
													<img src="<%=request.getContextPath()%>/images/pet/profile.jpg" style="width: 200px; height: 200px; margin-top: 50px;">
												</div>
												<div class="col-md-8">
													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petPic">사진</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<div class="custom-file">
																<input type="file" class="custom-file-input" id="customFile" name="up_file" > 
																<label class="custom-file-label" for="customFile" id="pic"> </label>
															</div>
														</div>
													</div>

													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petName">이름</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<input type="text" class="form-control form-control-sm" id="petName" name="petName" placeholder="한글 또는 영문만 입력" required />
															<span id="petNameErr" class="help-block" style="color:red;">한글, 영문으로만 입력 가능합니다.</span>
														</div>
													</div>
													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petType">견종</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<input type="text" class="form-control form-control-sm" id="petType" name="petType" list="data" required />
															<datalist id="data"></datalist>
															<span id="petTypeErr" style="color:red;">올바른 견종을 입력해주세요.</span>
														</div>
													</div>

													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petAge">나이</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<input type="number" class="form-control form-control-sm" id="petAge" name="petAge" min="1" max="35" step="1" required />
														</div>
													</div>
													<div class="form-group row showcase_row_area">
														<div class="col-md-3 showcase_text_area">
															<label for="petWeight">몸무게</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<input type="number" class="form-control form-control-sm" id="petWeight" name="petWeight" min="0.1" max="100" step="0.1" placehoder="소수점 첫째자리까지 입력" required />
														</div>
													</div>



													<div class="form-group row showcase_row_area" style="margin-bottom:-5px;">
														<div class="col-md-3 showcase_text_area">
															<label>예방접종</label>
														</div>
														<div class="col-md-9 showcase_content_area">
															<div class="form-group">
																<div class="form-inline">
																	<div class="checkbox mb-3">
																		<label> 
																			<input type="checkbox" class="form-check-input" id="vaccine-1" name="vaccine" value="종합백신"> 종합백신 <i class="input-frame"></i>
																		</label>
																	</div>
																	<div class="checkbox mb-3">
																		<label> 
																			<input type="checkbox" class="form-check-input" id="vaccine-2" name="vaccine" value="코로나장염" > 코로나장염 <i class="input-frame"></i>
																		</label>
																	</div>
																	<div class="checkbox mb-3">
																		<label> 
																			<input type="checkbox" class="form-check-input" id="vaccine-3" name="vaccine" value="광견병" > 광견병 <i class="input-frame"></i>
																		</label>
																	</div>
																</div>

																<div class="form-inline">
																	<div class="checkbox mb-3">
																		<label> 
																			<input type="checkbox" class="form-check-input" id="vaccine-4" name="vaccine" value="켄넬코프" > 켄넬코프 <i class="input-frame"></i>
																		</label>
																	</div>
																	<div class="checkbox mb-3">
																		<label> 
																			<input type="checkbox" class="form-check-input" id="vaccine-5" name="vaccine" value="인플루엔자" > 인플루엔자 <i class="input-frame"></i>
																		</label>
																	</div>
																</div>
															</div>
														</div>
													</div>
													
													<div class="row showcase_row_area" style="margin-bottom:50px;">
						                            <div class="col-md-3 showcase_text_area">
						                              <label>질병유무</label>
						                            </div>
						                            <div class="col-md-9 showcase_content_area">
						                              <div class="form-inline">
						                                <div class="radio mb-3">
						                                  <label class="radio-label mr-4">
						                                    <input name="petSick" type="radio" id="sick1" value="Y">Y <i class="input-frame"></i>
						                                  </label>
						                                </div>
						                                <div class="radio mb-3">
						                                  <label class="radio-label">
						                                    <input name="petSick" type="radio" id="sick2" value="N" >N <i class="input-frame"></i>
						                                  </label>
						                                </div>
						                              </div>
						                            </div>
						                          </div>
													
													
												</div>
											</div>

											

											<div style="text-align: center;">
												<button type="submit" class="btn btn-sm btn-primary">등록</button>
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
	var types = "";
	

	$(function(){
		
		$("#customFile").change(function(){
			var fileName = $("#customFile")[0].files[0].name;
			$("#pic").html(fileName);
			
			$("#picture").html("");
			$.each($(this)[0].files, function(i, item){
				var reader = new FileReader();
				reader.onload = function(e){
					var img = $("<img>").attr({"src":e.target.result}).css({"width":"200px", "height":"200px", "margin-top":"50px"});
					$("#picture").append(img);
				}
				reader.readAsDataURL(item);
			});
		});
		
		//이름 검증 경고 span 숨김
		$("#petNameErr").hide();
		
		$("#petName").keyup(function() {
			var name = $(this).val();
			// 이름 검증 정규표현식
			var reg = /^[가-힣]{1,10}|[a-zA-Z]{1,10}$/;
			if (reg.test(name)) {//정규표현식을 통과 한다면
				$("#petNameErr").hide();
				
			} else {//정규표현식을 통과하지 못하면
				$("#petNameErr").show();
			}
		});
		
		
		
		
		$("#petType").keyup(function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/searchTypes",
				type : "get",
				data : {"key" : $(this).val()},
				dataType : "json",
				success : function(data){
					types = data.split(",");
					$("#data").html("");
					for(var i=0; i<types.length; i++){
						var option = $("<option>").attr({"value" : types[i]}).html(types[i]);
						$("#data").append(option);
					}
					return types;
				}
			});
		});
		
		//견종 경고창 숨김
		$("#petTypeErr").hide();
		
		$("#petType").focusout(function(){
			if($(this).val()==""){
				$("#petType").focus();
				
			}
			if(types != "" && types!=$(this).val()){
				console.log(types);
				$("#petTypeErr").show();
				$("#petType").focus();
			}
			else if(types != "" && types==$(this).val()){
				$("#petTypeErr").hide();
				$("#petAge").focus();
			}
			else{
				$("#petTypeErr").show();
				$("#petType").focus();
				
			}
		});
		
	});
	
	             
</script>

<%@ include file="/views/common/mypageFooter.jsp"%>