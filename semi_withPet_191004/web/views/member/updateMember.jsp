<%@page import="common.filter.EncryptPasswordWrapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/mypageHeader.jsp"%>
<%
	String[] address = loginMember.getAddress().split("subaddr");
%>
    
<section>
   <!--Body#Section-Start-->

   <!-- partial - Title section Start -->
   <div class="page-content-wrapper">
      <div class="page-content-wrapper-inner" >
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
            <div class="col-lg-12" style="margin-left:-50px; margin-top:-50px;">
                <div class="grid">

                  <div class="grid-body">
                    <div class="item-wrapper">
                      <div class="row mb-3">
                        <div class="col-md-8 mx-auto">
                        
                        <form action = "<%=request.getContextPath() %>/member/updateMemberEnd" method="post" id="updateMember-frm" onSubmit="return validate();">
                          <div class="form-group row showcase_row_area">
                            <div class="col-md-3 showcase_text_area">
                              <label for="inputTypeName" >이름</label>
                            </div>
                            <div class="col-md-9 showcase_content_area">
                              <input type="text" class="form-control form-control-sm"  id="inputTypeName" name="mname" value="<%=loginMember.getUserName()%>" required />
                            </div>
                          </div>
                          <div class="form-group row showcase_row_area">
                            <div class="col-md-3 showcase_text_area">
                              <label for="inputTypePwd">현재 비밀번호</label>
                            </div>
                            <div class="col-md-9 showcase_content_area">
                            	<input type="password" class="form-control form-control-sm" id="inputTypePwd" name="pwd" required/> </div>
                          		<span class="help-block" id="pwdReg" style="margin-left:120px;"></span>
                          		
                          </div>
                          
                          <div class="form-group row showcase_row_area">
                            <div class="col-md-3 showcase_text_area">
                              <label for="inputTypeNpwd">신규 비밀번호</label>
                            </div>
                            <div class="col-md-9 showcase_content_area">
                              <input type="password" class="form-control form-control-sm" id="inputTypeNpwd" name="nPw" placeholder="현재 비밀번호를 입력해주세요."/> </div>
                              <span class="help-block" id="npwdReg" style="margin-left:120px; color:red;">6자리 이상 입력해주세요.</span>
                          </div>
                          <div class="form-group row showcase_row_area">
                            <div class="col-md-3 showcase_text_area">
                              <label for="inputTypeNpwd2">신규 비밀번호 확인</label>
                            </div>
                            <div class="col-md-9 showcase_content_area">
                              <input type="password" class="form-control form-control-sm" id="inputTypeNpwd2"  placeholder="현재 비밀번호를 입력해주세요."/> </div>
                          	  <span class="help-block" id="NpwdReg" style="margin-left:120px;"></span>	
                          </div>
                          <div class="form-group row showcase_row_area">
                            <div class="col-md-3 showcase_text_area">
                              <label for="inputTypeEmail">이메일</label>
                            </div>
                            <div class="col-md-9 showcase_content_area">
                              <input type="email" class="form-control form-control-sm" id="inputTypeEmail" name="memail" value="<%=loginMember.getEmail()%>" required/>
                            </div>
                          </div>
                          <div class="form-group row showcase_row_area">
                            <div class="col-md-3 showcase_text_area">
                              <label for="inputTypePhone" >전화번호</label>
                            </div>
                            <div class="col-md-9 showcase_content_area">
                              <input type="text" class="form-control form-control-sm"  id="inputTypePhone" name="mphone" value="<%=loginMember.getPhone()%>" required/>
                            </div>
                          </div>
                          <div class="form-group row showcase_row_area">
                            <div class="col-md-3 showcase_text_area">
                            </div>
                            <div class="col-md-9 showcase_content_area">
                            	<button class="btn btn-sm btn-primary" onclick="excuteSearchPostCode(); return false;" style="margin-bottom:-8px;">주소찾기</button>
                            </div> 
                          </div>
                          <div class="form-group row showcase_row_area">
                            <div class="col-md-3 showcase_text_area">
                            <label for="inputTypeAddr1" >도로명 주소</label>
                            </div>
                            <div class="col-md-9 showcase_content_area">
                            	<input type="text" class="form-control form-control-sm"  id="inputTypeAddr1" name="maddr1" value="<%=address[0]%>" readonly />
                            </div> 
                          </div>
                          <div class="form-group row showcase_row_area">
                            <div class="col-md-3 showcase_text_area">
                              <label for="inputTypeAddr2" >상세 주소</label>
                            </div>
                            <div class="col-md-9 showcase_content_area">
                            	<input type="text" class="form-control form-control-sm"  id="inputTypeAddr2" name="maddr2" value="<%=address[1]%>" required/>
                            </div>
                          </div>
                         
                            <div style="text-align:center; margin-top:50px;">
                               <button type="submit" class = "btn btn-sm btn-primary">수정</button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <button type="reset" class = "btn btn-sm btn-primary">취소</button>
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
	function excuteSearchPostCode() {
	    new daum.Postcode({
	       oncomplete:function(data) {
	          // 창이 닫히면
	          // 도로명 주소로 전달
	          $('#inputTypeAddr1').val(data.roadAddress);
	          // 상세주소 포커싱
	          $('#inputTypeAddr2').focus();
	       }
	    }).open();
	 };
	
	 
	 
	$(function(){		
		//'6자리 이상 입력해주세요'  span 숨김
		$('#npwdReg').hide();
		
		//현재 비밀번호 미입력시 신규비밀번호/신규비밀번호확인 input창 readonly 상태
		$('#inputTypeNpwd').attr("readonly", true);
		$('#inputTypeNpwd2').attr("readonly", true);
	});

	
		//현재비밀번호 input창에 keyup시
		$('#inputTypePwd').keyup(function(){
			//입력한 비밀번호
			var inputPwd = $(this).val();
			//로그인된 아이디의 비밀번호
			var pwd = '<%=loginMember.getUserPwd()%>';
			
			//ajax로 입력한 비밀번호와 기존 비밀번호 일치하는지 확인
			$.ajax({
				url : "<%=request.getContextPath() %>/checkPwd",
				data : {
					"pwd" : inputPwd
					   },
				dataType : "json",
				success : function(data){
					console.log(data);
					console.log(pwd);
					console.log(inputPwd);
					//두개의 비밀번호 일치시 
					if(pwd==data){
						$('#pwdReg').css("color", "green");
						$("#pwdReg").html("비밀번호가 일치합니다.");
						//신규비밀번호/신규비밀번호확인 input 창 readonly 풀어줌
						$('#inputTypeNpwd').attr("readonly", false);
						$('#inputTypeNpwd2').attr("readonly", false);
						
					}else{
						$('#pwdReg').css("color", "red");
						$("#pwdReg").html("비밀번호가 일치하지 않습니다.");
						
						$('#inputTypeNpwd').attr("readonly", true);
						$('#inputTypeNpwd2').attr("readonly", true);
					}
				}
			});
		});
		
		
		//신규비밀번호 input창에 keyup시
		$('#inputTypeNpwd').keyup(function(){
			var pwd = $(this).val().trim();
			//비밀번호 정규표현식(6자리 이상)
			var reg = /^.{6,}$/;
			if(!reg.test(pwd)){
				//6자리 이상 입력하세요 span 보여주기
				$('#npwdReg').show();
			}else{
				$('#npwdReg').hide();
			}
			
		});
		
		//신규비밀번호확인 input창에 keyup시
		$('#inputTypeNpwd2').keyup(function(){
			//신규비밀번호 확인에 입력된 값
			var Npwd = $(this).val().trim();
			//신규비밀번호에 입력된 값
			var pwd = $('#inputTypeNpwd').val().trim();
			
			//신규비밀번호 확인의 입력된 값이 공백이 아닐 경우
			if(Npwd != ""){
				if(Npwd == pwd){
					$('#NpwdReg').css("color", "green");
					$('#NpwdReg').html("비밀번호가 일치합니다.");
				}else{
					$('#NpwdReg').css("color", "red");
					$('#NpwdReg').html("비밀번호가 일치하지 않습니다.");
				}
			}
			//신규비밀번호 확인의 입력된 값이 공백일 경우
			else{
				$('#NpwdReg').css("color", "red");
				$('#NpwdReg').html("비밀번호를 입력해주세요.");
			}
		});
		

	


   
   
   
   
   function validate(){
	    var pwd1 = $('#inputTypeNpwd').val();
		var pwd2 = $('#inputTypeNpwd2').val();
		
		if(pwd1==pwd2){
			$('#updateMember-frm').submit();
		}
		else{
			alert("비밀번호가 일치하지 않습니다.");
		}
   };
   
</script>
        
<%@ include file="/views/common/mypageFooter.jsp" %>