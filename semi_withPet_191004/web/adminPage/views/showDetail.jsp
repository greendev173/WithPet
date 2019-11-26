<%@page import="withPet.apply.model.vo.ApplyIntro"%>
<%@page import="withPet.apply.model.vo.ApplyCert"%>
<%@page import="java.util.ArrayList"%>
<%@page import="withPet.apply.model.vo.ApplyMember"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/adminPage/views/common/adminHeader.jsp"%>
<%
	Member member = (Member) request.getAttribute("sMember");
	ApplyMember ap = (ApplyMember) request.getAttribute("ApplyMember");
	ApplyCert cert = (ApplyCert) request.getAttribute("cert");
	ApplyIntro intro = (ApplyIntro) request.getAttribute("intro");
%>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>


<section>
	<!--Body#Section-Start-->

	<!-- partial - Title section Start -->
	<div class="page-content-wrapper">
		<div class="page-content-wrapper-inner">
			<div class="content-viewport">
				<!-- Title Start -->
				<div class="row">
					<div class="col-12 py-5">
						<h4><%=member.getUserName()%></h4>
						<p class="text-gray"><%=member.getUserId()%></p>

					</div>
				</div>
				<!-- Title End -->

				<!-- Main Content Start -->
				<!-- 기본정보  -->
				<div class="grid">
					<p class="grid-header">기본 정보</p>
					<div class="grid-body">
						<div class="item-wrapper">
							<div class="row mb-3">
								<div class="col-md-8 mx-auto">
									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType1">프로필 사진</label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<img class="profile-img img-xl"
												src="<%=request.getContextPath()%>/upload/petsitter/<%=ap.getProfile()%>"
												alt="profile image">
										</div>
									</div>
									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType12">추가 소개사진 </label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<%
												if (ap.getIntro_1() != null) {
											%>
											<img class="profile-img img-xl"
												src="<%=request.getContextPath()%>/upload/petsitter/<%=ap.getIntro_1()%>"
												alt="profile image">
											<%
												}
												if (ap.getIntro_2() != null) {
											%>
											<img class="profile-img img-xl"
												src="<%=request.getContextPath()%>/upload/petsitter/<%=ap.getIntro_2()%>"
												alt="profile image">
											<%
												}
												if (ap.getIntro_3() != null) {
											%>
											<img class="profile-img img-xl"
												src="<%=request.getContextPath()%>/upload/petsitter/<%=ap.getIntro_3()%>"
												alt="profile image">
											<%
												}
											%>
										</div>
									</div>
									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType13">지원 유형</label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<input type="text" class="form-control" id="inputType3"
												value="<%=ap.getApplyType()%>"
												style="background-color: coral; color: purple;" readonly>
										</div>
									</div>
									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType13">지원 등급</label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<input type="text" class="form-control" id="inputType3"
												value="<%=ap.getApplyGrade()%>"
												style="background-color: coral; color: purple;" readonly>
										</div>
									</div>

									<!-- 전문 펫시터 지원 시 학력증명서 출력 -->
									<%
										if (ap.getApplyGrade().equals("M")) {
									%>
									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType1">학력증명서</label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<img class="profile-img img-xl"
												src="<%=request.getContextPath()%>/upload/petsitter/<%=cert.getDiploma()%>"
												alt="profile image">
										</div>
									</div>
									<%
										}
									%>
									<!-- 전문 펫시터 지원 시 학력증명서 출력  끝-->

									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType5">특징</label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<input type="text" class="form-control" id="inputType5"
												value="<%=ap.getFeatures()%>" readonly
												style="background-color: coral; color: purple;">
										</div>
									</div>
									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType1">자격증</label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<%
												if (!cert.getCert_1().equals("None")) {
											%>
											<img class="profile-img img-xl"
												src="<%=request.getContextPath()%>/upload/petsitter/<%=cert.getCert_1()%>"
												alt="profile image">
											<%
												}
												if (!cert.getCert_2().equals("None")) {
											%>
											<img class="profile-img img-xl"
												src="<%=request.getContextPath()%>/upload/petsitter/<%=cert.getCert_2()%>"
												alt="profile image">
											<%
												}
												if (!cert.getCert_3().equals("None")) {
											%>
											<img class="profile-img img-xl"
												src="<%=request.getContextPath()%>/upload/petsitter/<%=cert.getCert_3()%>"
												alt="profile image">
											<%
												}
											%>
										</div>
									</div>
									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType7">이메일</label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<input type="text" class="form-control" id="inputType7"
												value="<%=member.getEmail()%>" readonly>
										</div>
									</div>
									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType8">주소</label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<input type="text" class="form-control" id="inputType8"
												readonly value="<%=member.getAddress()%>">
										</div>
									</div>
									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType9">자기소개</label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<textarea class="form-control" id="inputType9" cols="12"
												rows="5" readonly><%=intro.getMotivation()%></textarea>
										</div>
									</div>
									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType9">입사후 포부</label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<textarea class="form-control" id="inputType9" cols="12"
												rows="5" readonly><%=intro.getAspiration()%></textarea>
										</div>
									</div>
									<div class="form-group row showcase_row_area">
										<div class="col-md-3 showcase_text_area">
											<label for="inputType9">성격의 장단점</label>
										</div>
										<div class="col-md-9 showcase_content_area">
											<textarea class="form-control" id="inputType9" cols="12"
												rows="5" readonly><%=intro.getPersonality()%></textarea>
										</div>
									</div>
									<%if(ap.getPermitStatus().equals("N")) {%>
									<div style="text-align: center;">
											<input onclick="permit('<%=member.getUserId() %>','Y','<%=ap.getApplyGrade() %>');" value="승인" type="button"
												class="btn btn-primary"/>
											<input onclick="deny('<%=member.getUserId() %>','N');" value="거절" type="button"
												class="btn btn-danger"/>
									</div>
									<%} %>
									
									<script>
									function permit(id,status,grade){
										location.href="<%=request.getContextPath()%>/admin/updateGrade?userId="+id+"&status="+status+"&grade="+grade;
									}
									function deny(id,status){
										location.href="<%=request.getContextPath()%>/admin/updateGrade?userId="+id+"&status="+status;
									}
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Main Content End -->


	</div>
</section>
<%@ include file="/adminPage/views/common/adminFooter.jsp"%>