<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="add_withPet.pet.model.vo.UsageHistory" %>
<%
	UsageHistory uh = (UsageHistory)request.getAttribute("uh");
	String petsitter = (String)request.getAttribute("petsitter");
	String petName = request.getParameter("petName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰페이지</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	body {
		margin : 0;
	}
	#div-header {
		text-align : left;
		background-color : dodgerblue;
		color : white;
		margin : 0;
		margin-bottom : 10px;
		padding : 20px;
		font-size : 1.2em;
	}
	
	
	/* css 추가부분 */
	#input-review{
		margin-top : 30px;
	}
	
	#input-header>img{
		width: 100px;
		height: 100px;
		border-radius: 50px;
		margin-right: 20px;
	}
	
	#input-header>table{
		padding-top: 30px;
	}
	
	#input-header>table>tr {
		margin: 10px;
		padding: 10px;
	}
	
	.star-rating {
		line-height:32px;
		font-size:1.25em;
		cursor: pointer;
	}

	.star-rating .fa-star{
		color: yellow;
		transition : 0.5s;
	}
	
	textarea {
	  resize: none;
	}
</style>
<body>
	<header>
		<div id="div-header">
			<h3>Review 작성하기</h3>
		</div>
	</header>
	<section>
	<div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
		<div class="text-center" id="auth-div">
		<form action="<%=request.getContextPath() %>/member/writereviewEnd" method="POST" id="write_form">
			<div id="input-header">
				<img src="<%=request.getContextPath()%>/images/team/<%=petsitter%>" class="img-thumbnail float-left" id="petsitter">
				<table>
					<tr>
						<th>펫시터ID</th>
						<td><%=uh.getPetsitterId() %></td>
					</tr>
					<tr>
						<th>반려견이름</th>
						<td><%=petName %></td>
					</tr>
					<tr>
						<th>만족도</th>
						<td>
							<div class="star-rating">
						        <span class="fa fa-star-o" data-rating="1"></span>
						        <span class="fa fa-star-o" data-rating="2"></span>
						        <span class="fa fa-star-o" data-rating="3"></span>
						        <span class="fa fa-star-o" data-rating="4"></span>
						        <span class="fa fa-star-o" data-rating="5"></span>
						        <input type="hidden" name="revPoint" class="rating-value" value="5">
      						</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="input-review">
				<textarea id="reviewText" name="revContent" cols="50" rows="5" placeholder="리뷰를 작성해보세요!"></textarea>
			</div>
			<!-- hidden 전송값 -->
			<input type="hidden" name="payNo" value="<%=uh.getPayNo()%>"/>
			<input type="hidden" name="petsitter" value="<%=petsitter%>"/>
			<input type="hidden" name="petName" value="<%=petName%>"/>
			<div class="form-group" id="auth-button">
				<button class="btn btn-outline-primary" onClick="fn_write();" id="btn-write">작성완료</button>
				<button class="btn btn-outline-info" onClick="window.close();">닫기</button>
			</div>
		</form>
		</div>
	</div>
	</section>
	
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
	function fn_write(){
		$("#write_form").submit();
	}
	
	var $star_rating = $('.star-rating .fa');

	var SetRatingStar = function() {
	  return $star_rating.each(function() {
	    if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
	      return $(this).removeClass('fa-star-o').addClass('fa-star');
	    } else {
	      return $(this).removeClass('fa-star').addClass('fa-star-o');
	    }
	  });
	};

	$star_rating.on('click', function() {
	  $star_rating.siblings('input.rating-value').val($(this).data('rating'));
	  return SetRatingStar();
	});

	SetRatingStar();
	$(document).ready(function() {

	});
	</script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>