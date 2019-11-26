<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/adminPage/views/common/recruitHeader.jsp"%>
<style>
.body-container {
	width: 100%;
	height: 100%;
	padding-top: 100px;
	background-color: #0c111f;
	text-align: center;
}

.apply_main_title {
	font-size: 6em;
}

.apply_subtitle {
	font-size: 3em;
}

.grid>button{
	width : 300px;
	height : 300px;
	
}
</style>

<div class="body-container">
	<p class="apply_main_title">With Pet</p>
	<p class="apply_subtitle">안녕하세요 With Pet의 가족이 되어주세요</p>
	<br><br><br>
	<p class="apply_subtitle"><small>아래 메뉴 클릭시 해당 페이지로 이동합니다</small></p>
	<br><br>
	<div class="col-lg-12">
		<div class="grid" style="text-align: center;">
			<br>
			<button type="button" class="btn btn btn-success" onclick="home();">With Pet 홈페이지로 돌아가기</button>
			<br><br>
			<button type="button" class="btn btn-primary" onclick="apply();">지원 시작하기</button>
			<br><br>
			<button type="button" class="btn btn-danger" onclick="step();">지원 절차 설명보기</button>
			<br><br>
			<button type="button" class="btn btn-info" onclick="status();">지원 현황 보기</button>
			<br><br>
		</div>
	</div>

	<script>
	function home(){
		location.href="<%=request.getContextPath()%>/index.jsp";
	}
	function apply(){
		location.href="<%=request.getContextPath()%>/apply/apply_form";	
	}
	function step(){
		location.href="<%=request.getContextPath()%>/apply/apply_info";
	}
	function status(){
		location.href="<%=request.getContextPath()%>/apply/checkApplyStatus"
	}
	
	</script>


	




</div>
<%@ include file="views/common/adminFooter.jsp"%>