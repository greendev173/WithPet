<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userMail = request.getParameter("userMail");
%>
<%@ include file="/views/common/header.jsp"%>
<!-- banner area 추가 -->
	<div id="banner-area">
		<img src="<%=request.getContextPath() %>/images/banner/banner2.png" alt ="" />
		<!-- <div class="parallax-overlay"></div> -->
			<!-- Subpage title start -->
		<div class="banner-title-content">
			<div class="text-center">
				<h2>회원가입</h2>
				<ul class="breadcrumb">
					<li>Home</li>
					<li><a href="<%=request.getContextPath()%>/memberEnroll"> 회원가입</a></li>
				</ul>
			</div>
    	</div>
	</div><!-- Subpage title end -->
<section id="main-container">
	<div class="container">
		<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
		<h3>회원가입 - 회원 정보입력단계(2/2)</h3>
		<form action="<%=request.getContextPath()%>/memberEnrollEnd"
			method="post" id="enroll_form">
			<div class="form-group has-feedback">
				<label class="control-label" for="id">아이디</label> <input
					class="form-control" type="text" name="id" id="id" required /> <span
					id="overlapErr" class="help-block">사용할 수 없는 아이디 입니다.</span>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="pwd">비밀번호</label> <input
					class="form-control" type="password" name="pwd" id="pwd" required />
				<span id="pwdRegErr" class="help-block">6글자 이상 입력하세요.</span>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="rePwd">비밀번호 재확인</label> <input
					class="form-control" type="password" name="rePwd" id="rePwd" /> <span
					id="rePwdErr" class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해
					주세요.</span>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="name">이름</label> <input
					class="form-control" type="text" name="name" id="name"
					placeholder="한글이름 2-4자" required /> <span id="nameErr"
					class="help-block">이름은 한글 2-4자까지 입력가능합니다.</span>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="phone">연락처</label> <input
					class="form-control" type="phone" name="phone" id="phone"
					placeholder="(-없이)01012345678" required /> <span id="phoneErr"
					class="help-block">올바른 연락처 형식이 아닙니다. 다시 입력해 주세요.</span>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="address">주소</label> <input
					type="text" class="form-control" name="roadaddress"
					id="roadaddress" placeholder="도로명주소" readonly> <input
					type="button" onclick="excuteSearchPostCode();" class="btn btn-outline-info" value="주소 찾기" /><br />
				<span id="guide" style="color: #999; display: none"></span> <input
					class="form-control" type="text" name="address_etc"
					id="address_etc" placeholder="상세주소" required/>
				<!-- 이메일은 hidden값으로 전달 -->
				<input type="hidden" name="userMail" value="<%=userMail%>">
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
			function nextStep(){
				location.href="<%=request.getContextPath()%>/memberEnrollEnd"
			}
		
			function excuteSearchPostCode() {
				new daum.Postcode({
					oncomplete:function(data) {
						// 창이 닫히면
						// 도로명 주소로 전달
						$("#roadaddress").val(data.roadAddress);
						// 상세주소 포커싱
						$("#address_etc").focus();
					}

				}).open();

				}
			///////////////////ajax + 회원가입 정규표현식/////////////////
			//아이디 입력란에 keyup 이벤트가 일어 났을때 실행할 함수 등록 
			$(function(){
    		$('#id').keyup(function(){
    			if($(this).val().trim().length>=6){
    				var id=$(this).val();
    				$.ajax({
    					url:"<%=request.getContextPath()%>/checkId",
					data : {
						"id" : id
					},
					dataType : "json",
					success : function(data) {
						if (!data) {
							//사용 가능한 아이디 라면 
							$("#overlapErr").hide();
							// 성공한 상태로 바꾸는 함수 호출
							successState("#id");
						} else {
							//사용 가능한 아이디가 아니라면 
							$("#overlapErr").show();
							errorState("#id");
						}
					}
				})
			}
		})
	})

	$("#name").keyup(function() {
		var name = $(this).val();
		// 비밀번호 검증할 정규 표현식
		var reg = /^[가-힣]{2,4}$/;
		if (reg.test(name)) {//정규표현식을 통과 한다면
			$("#nameErr").hide();
			successState("#name");
		} else {//정규표현식을 통과하지 못하면
			$("#nameErr").show();
			errorState("#name");
		}
	});

	$("#pwd").keyup(function() {
		var pwd = $(this).val();
		// 비밀번호 검증할 정규 표현식
		var reg = /^.{6,}$/;
		if (reg.test(pwd)) {//정규표현식을 통과 한다면
			$("#pwdRegErr").hide();
			successState("#pwd");
		} else {//정규표현식을 통과하지 못하면
			$("#pwdRegErr").show();
			errorState("#pwd");
		}
	});
	$("#rePwd").keyup(function() {
		var rePwd = $(this).val();
		var pwd = $("#pwd").val();
		console.log(rePwd);
		console.log(pwd);
		// 비밀번호 같은지 확인
		if (rePwd != "") {
			if (rePwd == pwd) {
				//비밀번호 같다면
				$("#rePwdErr").hide();
				successState("#rePwd");
			} else {
				//비밀번호 다르다면
				$("#rePwdErr").show();
				errorState("#rePwd");
			}
		} else {
			$("#rePwdErr").hide();
		}
	});

	$("#phone").keyup(function() {
		var phone = $(this).val();
		// 핸드폰 검증할 정규 표현식
		var regExp = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		if (regExp.test(phone)) {
			$("#phoneErr").hide();
			successState("#phone");
		} else {
			$("#phoneErr").show();
			errorState("#phone");
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