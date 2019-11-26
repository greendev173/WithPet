<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
%>
<%@ include file="/views/common/header.jsp"%>
<!-- banner area 추가 -->
<style>
	div>input.form-check-input, div>input.form-radio-input{
		margin-left : 12px;
	}
	  
</style>
	<div id="banner-area">
		<img src="<%=request.getContextPath() %>/images/banner/banner2.jpg" alt ="" />
		<div class="parallax-overlay"></div>
			<!-- Subpage title start -->
		<div class="banner-title-content">
			<div class="text-center">
				<h2>반려견등록</h2>
				<ul class="breadcrumb">
					<li>Home</li>
					<li><a href="<%=request.getContextPath()%>/petEnroll"> 반려견등록</a></li>
				</ul>
			</div>
    	</div>
	</div><!-- Subpage title end -->
	<section id="main-container">
	<div class="container">
		<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
		<h3>반려견 정보 입력하기</h3>
		<!-- 이름, 나이, 종류(검색), 무게, 백신, 질병유무, 이미지 (hidden = id) -->
		<form action="<%=request.getContextPath()%>/petEnrollEnd"
			method="post" id="enroll_form" enctype="multipart/form-data">
				<input type="hidden" value="<%=userId%>" name="userId" id="userId" />
				<div class="form-group has-feedback">
					<label class="control-label" for="petName">반려견 이름</label> <input
						class="form-control" type="text" name="petName" id="petName"
						required /> <span id="petNameErr" class="help-block">한글,
						영문으로만 입력가능합니다.</span>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="petAge">나이</label> <input
						class="form-control" type="number" name="petAge" id="petAge"
						required min="1" max="35" step="1" /> <span id="petAgeErr"
						class="help-block">나이는 숫자만 입력가능합니다.</span>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="petType">종류</label> <input
						class="form-control" type="text" name="petType" id="petType"
						list="data" required/>
					<div></div>
					<span id="petTypeErr" class="help-block">올바른 견종을 입력해주세요.</span>
					<datalist id="data">

					</datalist>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="petWeight">무게</label> <input
						class="form-control" type="number" name="petWeight" id="petWeight"
						min="0.1" max="100" step="0.1" placeholder="ex)1.1kg" required />
					<span id="petWeightErr" class="help-block">무게는 소숫점 1자리까지
						입력가능합니다.</span>
				</div>
				<div class="form-group has-feedback">
					<label class="form-check-label" for="vaccine">예방접종내역</label> </br>
					<div class="text-center">
						<input class="form-check-input" type="checkbox" name="vaccine" id="vaccine1" value="종합백신" /> 종합백신 
						<input class="form-check-input" type="checkbox" name="vaccine" id="vaccine2" value="코로나장염" /> 코로나장염 
						<input class="form-check-input" type="checkbox" name="vaccine" id="vaccine3" value="켄넬코프" /> 켄넬코프 
						<input class="form-check-input" type="checkbox" name="vaccine" id="vaccine4" value="광견병" /> 광견병 
						<input class="form-check-input" type="checkbox" name="vaccine" id="vaccine5" value="인플루엔자" /> 인플루엔자
					</div>
				</div>
				<div class="form-group has-feedback">
					<label class="form-radio-label" for="sickYN">질병유무</label> </br>
					<div class="text-center">
						<input class="form-radio-input" type="radio" name="sickYN" id="vaccine1" value="Y" /> 질병있음 
						<input class="form-radio-input" type="radio" name="sickYN" id="vaccine2" value="N" /> 질병없음
					</div>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="petImg">이미지</label> <input
						type="file" class="form-control" name="up_petimg" id="up_petimg" /><br />
					<span id="guide" style="color: #999; display: none"></span>
					<!-- 파일 미리보기 div -->
					<div></div>
				</div>
			<div class="text-center">
				<button class="btn btn-success" type="reset">취소</button>
				<button class="btn btn-success" type="submit" onSubmit="nextStep();">가입</button>
			</div>
		</form>
	</div>
	</div>
</section>
<!--다음주소 api-->
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- FontAwesome 아이콘 사용 script-->
<script src="https://kit.fontawesome.com/dcff5cba12.js"></script>
<script>
	var types;

	function nextStep(){
		location.href="<%=request.getContextPath()%>/petEnrollEnd";
	}
			
	///////////////////ajax + 펫정보 정규표현식/////////////////
	/// 검색한 결과가 div #result로 <
			$(function(){
				$('#petType').keyup(function(){
					$.ajax({
						url : "<%=request.getContextPath()%>/searchTypes",
				type : "get",
				data : {
					"key" : $(this).val()
				},
				dataType : "json",
				success : function(data) {
					types = data.split(",");
					// #data에 누적되지 않도록 초기화함
					$('#data').html("");
					for (var i = 0; i < types.length; i++) {
						var option = $("<option>").attr({
							"value" : types[i]
						}).html(types[i]);
						$('#data').append(option);
					}
				}
			})
		});
		
				
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
						$("#petWeight").focus();
					}
					else{
						$("#petTypeErr").show();
						$("#petType").focus(); 
						
					}
				});				
				
				
	});

	// 객체화?
	// count 기준값 두고
	// + 누르면 다음 index를 가진 객체 입력칸 등장 count++;
	// - 누르면 감소 count--;
	// 각각 input 창의 데이터를 key value 형식으로 받음(count 값만큼 반복문실행)
	// count 값만큼 객체에 저장
	// JSON이용해서 객체를 전송?


	$("#petName").keyup(function() {
		var name = $(this).val();
		// 이름 검증 정규표현식
		var reg = /^[가-힣]{1,10}|[a-zA-Z]{1,10}$/;
		if (reg.test(name)) {//정규표현식을 통과 한다면
			$("#petNameErr").hide();
			successState("#petName");
		} else {//정규표현식을 통과하지 못하면
			$("#petNameErr").show();
			errorState("#petName");
		}
	});

	$("#petAge").keyup(function() {
		var pwd = $(this).val();
		// 나이 검증 정규표현식
		var reg = /^([0-9]|[1-3][0-9])$/;
		if (reg.test(pwd)) {//정규표현식을 통과 한다면
			$("#petAgeErr").hide();
			successState("#petAge");
		} else {//정규표현식을 통과하지 못하면
			$("#petAgeErr").show();
			errorState("#petAge");
		}
	});

	$("#petWeight").keyup(function() {
		var weight = $(this).val();
		// 몸무게 검증 정규표현식
		var reg = /^\d+(?:[.]?[\d]?)?$/;
		if (reg.test(weight)) {//정규표현식을 통과 한다면
			$("#petWeightErr").hide();
			successState("#petWeight");
		} else {//정규표현식을 통과하지 못하면
			$("#petWeightErr").show();
			errorState("#petWeight");
		}
	});

	// 성공 상태로 바꾸는 함수
	function successState(id) {
		$(id).parent().removeClass("has-error").addClass("has-success").show();

		$("#enroll_form button[type=submit]").removeAttr("disabled");
	};
	// 에러 상태로 바꾸는 함수
	function errorState(id) {
		$(id).parent().removeClass("has-success").addClass("has-error").show();

		$("#enroll_form button[type=submit]").attr("disabled", "disabled");
	};
	// 입력하지 않았을 때는 안보이게 하는 함수
	$(function() {
		if ($("form-control").val() == null) {
			$(".help-block").hide();
			$("#enroll_form button[type=submit]").attr("disabled", "disabled");
		}
	});
</script>
<%@ include file="/views/common/footer.jsp"%>