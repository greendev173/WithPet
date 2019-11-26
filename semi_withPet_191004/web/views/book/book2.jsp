<%@page import="java.util.ArrayList"%>
<%@page import="hwang.withpet.pet.model.vo.Pet"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hwang.withpet.book.model.vo.Book" %>    
<%  
	
	List<Pet> petList=(ArrayList)request.getAttribute("petList"); // 펫 정보 불러오기

	Cookie[] cookies=request.getCookies();
	
	int petCount=0; // 반려견 마리수 변수
	
	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("petCount")) {
				petCount=Integer.parseInt(cookies[i].getValue());
			}
		}
	}
	
	String[] petName=new String[petCount];
	String[] breed=new String[petCount];
	int[] petAge=new int[petCount];
    double[] petWeight=new double[petCount];
    int[] petId=new int[petCount];
	
	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			for(int j=0; j<petCount; j++) {
				if(cookies[i].getName().equals("petName"+(j+1))) {
					petName[j]=URLDecoder.decode(cookies[i].getValue(), "UTF-8");
				}else if(cookies[i].getName().equals("breed"+(j+1))) {
					breed[j]=URLDecoder.decode(cookies[i].getValue(), "UTF-8");
				}else if(cookies[i].getName().equals("petAge"+(j+1))) {
					petAge[j]=Integer.parseInt(cookies[i].getValue());
				}else if(cookies[i].getName().equals("petWeight"+(j+1))) {
					petWeight[j]=Double.parseDouble(cookies[i].getValue());
				}else if(cookies[i].getName().equals("petId"+(j+1))) {
					if(!cookies[i].getValue().equals("")) { // petId가 비어 있지 않으면
						petId[j]=Integer.parseInt(cookies[i].getValue());						
					}
				}
			}
		}
	}
	
    String path=request.getContextPath(); // 프로젝트 주소
    
%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!--
        CDN방식으로 파일 불러오기
    -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- 폰트 추가 -->
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' rel='stylesheet' type='text/css'>

    <title>방문 펫시터 예약 - step 2/4</title>
</head>
<body>
    <div class="fixedHeader">
        <div style="height: 100%;">
            <button type="button" class="close" aria-label="Close"
                onclick="location.href='<%=path%>/service';">
				<!-- onclick="location.href='<%=path%>/book/visitPetsitter1';"> -->
				<span aria-hidden="true">&times;</span>
			</button>
			방문 펫시터 예약 - step 2/4
        </div>
    </div>
        <div class="container-fluid" style="height: 100%;" id="registerPetContainer">
            <div class="row middle">
                <div class="col-12">
                    <div class="row empty2"></div>
                    <form action="<%=path%>/book/visitPetsitter3" id="visitPetsitter3Frm" method="POST">
                        <div class="row">
                            <div class="col-12 msgContainer">
                                돌봄을 신청하는<br>
                                반려동물을 등록해주세요(최대 3마리까지).
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 msgContainer" id="msgContainer1">
                                현재 등록된 반려견: <%=petCount%>마리
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2 inputTextDiv">
                                <span class='inputSpan'>이름</span>
                            </div>
                            <div class="col-10"><input type='text' class='form-control inputText' name="petName" id="petName"
                                placeholder='반려동물 이름을 입력해주세요.'></div>
                        </div>
                        <div class="row">
                            <div class="col-2 inputTextDiv">
                                <span class='inputSpan'>견종</span>
                            </div>
                            <div class="col-10">
                                <input type='text' class='form-control inputText' name="breed" id="breed" list="breedList"
                                placeholder='견종을 입력해주세요'>
                            	<datalist id="breedList"></datalist>
								<span id="breedErr" style="color:red;">올바른 견종을 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2 inputTextDiv">
                                <span class='inputSpan'>나이</span>
                            </div>
                            <div class="col-9" style="padding-right: 0px;">
                                <input type='number' class='form-control inputText' name="petAge" id="petAge" max="35" min="0" 
                                placeholder='나이를 숫자로 입력해주세요.' style="padding-right: 0px;">
                            </div>
                            <div class="col-1" style="padding-left: 0px; padding-top: 5px;">
                                <span style="vertical-align: middle;">살</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-2 inputTextDiv">
                                <span class='inputSpan'>몸무게</span>
                            </div>
                            <div class="col-9" style="padding-right: 0px;">
                                <input type='number' class='form-control inputText' name="petWeight" id="petWeight" max="100" min="0" step="0.1" 
                                placeholder='소수점 1자리까지 입력해주세요.' style="padding-right: 0px;">
                                <!-- 반려견 정보 -->
                                <input type="hidden" name="petId1" id="petId1" value="">
                                <input type="hidden" name="petName1" id="petName1" value="">
                                <input type="hidden" name="breed1" id="breed1" value="">
                                <input type="hidden" name="petAge1" id="petAge1" value="">
                                <input type="hidden" name="petWeight1" id="petWeight1" value="">
                                <input type="hidden" name="petId2" id="petId2" value="">
                                <input type="hidden" name="petName2" id="petName2" value="">
                                <input type="hidden" name="breed2" id="breed2" value="">
                                <input type="hidden" name="petAge2" id="petAge2" value="">
                                <input type="hidden" name="petWeight2" id="petWeight2" value="">
                                <input type="hidden" name="petId3" id="petId3" value="">
                                <input type="hidden" name="petName3" id="petName3" value="">
                                <input type="hidden" name="breed3" id="breed3" value="">
                                <input type="hidden" name="petAge3" id="petAge3" value="">
                                <input type="hidden" name="petWeight3" id="petWeight3" value="">
                                <!-- 반려견 마리 수 정보 -->
                                <input type="hidden" name="petCount" id="petCount" value="">
                                <!-- <input type="button" class='btn btn-dark btn2' value="소형견(~15kg미만)" id="smallDogBtn"> -->
                                <!-- <input type="button" class='btn btn-dark btn2' value="대형견(15kg~이상)" id="largeDogBtn"> -->
                            </div>
                            <div class="col-1" style="padding-left: 0px; padding-top: 5px;">
                                <span style="vertical-align: middle;">kg</span>
                            </div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row" id="cancelContainer">
                            <div class="col-4"></div>
                            <div class="col-4">
                                <input type="button" class='btn btn-outline-dark' style="width: 100%;" 
                                value='등록 취소' onclick="cancelRegist();">
                            </div>
                            <div class="col-4"></div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-10"><input type='button' class='btn-primary form-control bookBtnType' 
                                value='내 반려견 정보 불러오기' onclick="searchMyPet();">
                            </div>
                            <div class="col-1"></div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-6"><input type='button' class='btn-primary form-control bookBtnType' 
                                id="bookBtnType" value='이전' onclick="location.href='<%=path%>/book/visitPetsitter1';">
                            </div>
                            <div class="col-6"><input type='button' class='btn-primary form-control bookBtnType' 
                                id="bookBtnType" value='다음' onclick="registerPetNext();">
                            	<input type="hidden" value="0" id="hiddenType">	
                            </div>
                        </div>
                    </form>
            </div>
        </div>
    </div>

<div class="container-fluid" style="height: 100%; display: none;" id="checkPetContainer">
    <div class="row middle">
        <div class="col-12">
            <div class="row empty2"></div>
            <div class="row empty2"></div>
            <div class="row">
                <div class="col-12 msgContainer">
                    돌봄을 신청하는<br>
                    반려동물을 등록해주세요(최대 3마리까지).
                </div>
            </div>
            <div class="row">
                <div class="col-12 msgContainer" id="msgContainer2">
                    현재 등록된 반려견: <%=petCount%>마리
                </div>
            </div>
            <div class="row">
                <div class="col-12 petInfoName" id="petInfoName">
                    <ul>

                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <input type="button" class='btn btn-outline-dark' style="width: 100%;" onclick="addPet_fn();" value="+반려견 추가하기"/>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row empty2"></div>
            <div class="row">
                <div class="col-6">
                    <input type='button' class='btn-primary form-control bookBtnType' 
                    id="bookBtnType" value='이전' onclick="location.href='<%=path%>/book/visitPetsitter1';">
                </div>
                <div class="col-6">
                    <input type="button" class='btn-primary form-control bookBtnType' onclick="submit_fn();" value="다음"/>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid" style="height: 100%; display: none;" id="searchMyPetContainer">
    <div class="row middle">
        <div class="col-12">
            <div class="row empty2"></div>
            <div class="row empty2"></div>
            <div class="row">
                <div class="col-12 msgContainer">
                    돌봄을 원하는 반려견을 체크해주세요(최대 3마리까지).
                </div>
            </div>
            <div class="row">
                <div class="col-12 msgContainer" id="searchMyPetMsgContainer">
                    조회된 나의 반려견: <%=petList.size()%>마리
                </div>
            </div>
            <div class="row">
                <div class="col-12 msgContainer" id="selectMyPetMsgContainer">
                    현재 등록된 나의 반려견: 0마리
                </div>
            </div>
            <div class="row">
                <div class="col-12 petInfoName" id="searchMyPetInfoName">
                    <ul>

                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <input type="button" class='btn btn-outline-dark' style="width: 100%;" onclick="addPet_fn();" value="+반려견 추가하기"/>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row empty2"></div>
            <div class="row">
                <div class="col-6">
                    <input type='button' class='btn-primary form-control bookBtnType' 
                    id="bookBtnType" value='이전' onclick="cancelMyPetRegist();">
                </div>
                <div class="col-6">
                    <input type="button" class='btn-primary form-control bookBtnType' onclick="submit_fn();" value="다음"/>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
<style>
    html,
    body {
        /* font-size: 100%; */
        font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif';
        height: 100%;
        max-width: 650px;
        margin:0 auto;
    }

    .fixedHeader {
        border: 0.75px solid black;
        background-color: white;
        position: fixed;
        width: 100%;
        max-width: 650px;
        height: 50.5px;
        align-content: center;
        text-align: center;
        z-index: 10;
        font-size: 1.125rem;
        border-color: white;
        border-bottom-color:  black;
        vertical-align: middle;
        padding-top: 10px;
        padding-bottom: 7px;
        color:#6f6f6f;
    }
    .empty1 {
        height:50.5px;
    }
    .empty2 {
        height: 50px;
    }
    .empty3 {
        height: 25px;
    }
    .middle{
        background-color: whitesmoke;
        height: 100%;
    }
    .footer{
         /* border: 2px solid red; */
         background-color: greenyellow;
        height: 50px;
        text-align: center;
        align-content: center;
    }

    /* div 나누는 거 확인하기 위해 필요한 스타일, 지우지 말 것 */
    /* div[class|=col] {
        border:2px solid green;
    }  */
    .btn2 {
        width: 42%;
        padding-left: 0px;
        padding-right: 0px;
        margin-right: 5px;
    }
    .bookBtnType {
        width:100%;
    }
    .msgContainer {
        text-align: center;
        padding-bottom: 20px;
        padding-top: 20px;
        font-size: 17px;
        line-height: 1.7;
        letter-spacing: -.5px;
    }
    .petInputContainer{
        padding: 13px 17px 16px;
    }
    .inputTextDiv {
        padding:0; 
        text-align: right;
    }
    .inputText{
        background-color:whitesmoke;
        color:#7e7a7a;
        border: 1px solid whitesmoke;
        border-bottom-color: #7e7a7a;
        padding: 0px 25px 0px;
        margin-bottom: 10px;
        width: 100%;
        font-size: 14px;
        text-align: right;
    }
    .inputSpan{
        margin-bottom: 0px;
        text-align: right;
    }
    .inputSpan2{
    width: 12%;
        margin-bottom: 0px;
        text-align: right;
    }
    input:-webkit-autofill { /*크롬에서 커서가 올라가면 색상 자동으로 바뀌는 것을 흰색으로 세팅*/
        caret-color: black;
    }
    .petInfoName>ul {
        padding:0px 0px 40px; /*위, 오른쪽 왼쪽, 아래*/
        list-style: none;
    }
    .petInfoName>ul>li {
        position: relative;
        padding:9px 2px;
        border-bottom: 1px solid #5f5757;
        list-style: none;
    }
    img, input{
        vertical-align: middle;
    }
    .removePetBtn, .checkPetBtn {
        position: absolute;
        top:12px;
        right:0;
        cursor: pointer;
    }
    .dogImage {
        position: absolute;
        top:12px;
        left:0;
    }
    .petInfoText{
        vertical-align: middle;
        padding-left:35px;
        font-size:14px;
    }
</style>

<script>
    var petCount=<%=petCount %>; // 반려견 마리수 저장하는 변수
	var removePetBtn=new Array(); // 반려견 삭제 버튼 저장할 변수
    var checkPetBtn=new Array(); // 반려견 체크 버튼 저장할 변수
	var index=0;
    var possibleBreedFlag=false; // 입력 가능한 견종인지 확인하는 변수
	
    $(function(){ // 페이지 로드 되면
        //견종 경고창 숨김
        $("#breedErr").hide();

    	<%
    	if(cookies!=null) {
    	 for(int i=0; i<cookies.length; i++) {
    		for(int j=0; j<petCount; j++) { %>
    		console.log("페이지 로드 된 후:<%=cookies[i].getName() %>");
    		<%if(cookies[i].getName().equals("petName"+(j+1))) {%>
    			console.log("petName<%=(j+1)%> 쿠키 조건문 들어옴");
    			console.log("<%=(j+1)%>번째 반려견 이름:<%=URLDecoder.decode(cookies[i].getValue(), "UTF-8")%>");
    			/* petName[i]=URLDecoder.decode(cookies[i].getValue(), "UTF-8"); */
    		<%}else if(cookies[i].getName().equals("breed"+(j+1))) {%>
    			console.log("breed<%=(j+1)%> 쿠키 조건문 들어옴");
    			/* breed[i]=URLDecoder.decode(cookies[i].getValue(), "UTF-8"); */
    		<%}else if(cookies[i].getName().equals("petAge"+(j+1))) {%>
    		console.log("petAge<%=(j+1)%> 쿠키 조건문 들어옴");
    			/* petAge[i]=Integer.parseInt(cookies[i].getValue()); */
    		<%}else if(cookies[i].getName().equals("petWeight"+(j+1))) {%>
    		console.log("petWeight<%=(j+1)%> 쿠키 조건문 들어옴");
    			/* petWeight[i]=Double.parseDouble(cookies[i].getValue()); */
    		<%}else if(cookies[i].getName().equals("petId"+(j+1))) {%>
    		console.log("petId<%=(j+1)%> 쿠키 조건문 들어옴");
    			/* petWeight[i]=Double.parseDouble(cookies[i].getValue()); */
    	
    		<%}
    	 }
    	}%>
    	
    	
    	<%if(petCount>0) { %>
        console.log("등록한 강아지 마리 수:"+petCount);
        $("#petCount").val(<%=petCount%>); // 강아지 마리 수 저장
    	
        $("#cancelContainer").css({
			"display" : "flex",
			"z-index" : "1"
		}); // 펫 등록 취소 버튼 보이기

		$("#registerPetContainer").css({
			"display" : "none",
			"z-index" : "0"
		}); // 펫 등록 화면 가리기

		$("#checkPetContainer").css({
			"display" : "block",
			"z-index" : "1"
		}); // 펫 체크 화면 보이기
		
		<% for(int i=1; i<=petCount; i++) { %>
			console.log("반려견"+<%=i%>+" 이름:<%=petName[i-1]%>");			
	    	$("#petName<%=i%>").val("<%=petName[i-1]%>"); // 반려견 이름 저장
	        $("#breed<%=i%>").val("<%=breed[i-1]%>"); // 반려견 견종 저장
	        $("#petAge<%=i%>").val("<%=petAge[i-1]%>"); // 반려견 나이 저장
	        $("#petWeight<%=i%>").val("<%=petWeight[i-1]%>"); // 반려견 몸무게 저장
            $("#petId<%=i%>").val("<%=petId[i-1]%>"); // 반려견 아이디 저장
	                               
	        $("#petInfoName").children().first().append('<li><span class="dogImage""><img src="<%=path%>/images/pet-friendly.svg"' 
	               +' alt="강아지" width="23" height="25"></span>'
	               +'<span class="petInfoText"><%=petName[i-1]%>(<%=breed[i-1]%> / <%=petAge[i-1]%>살 / <%=petWeight[i-1]%>kg)</span>'
	               +'<span class="removePetBtn" id="removePetBtn<%=i%>"><img src="<%=path%>/images/icon_delete2.svg"'
	               +' alt="삭제" width="17" height="17"></span></li>');
	        index=<%=i%>-1;
	        console.log("index:"+index);
	       removePetBtn[index]=document.getElementById("removePetBtn<%=i%>"); // 해당 요소 받아오기
	       console.log(removePetBtn[index]);
	       removePetBtn[index].addEventListener('click', deletePet_fn); // 이벤트 등록, deletePet_fn 함수 출력됨
       	<% } // 반복문 끝 %>
    	<%}else { %>
        	petCount=0; // 0으로 초기화    	

            $("#cancelContainer").css({
			"display" : "none",
			"z-index" : "0"
		    }); // 펫 등록 취소 버튼 가리기
    	<%}
    	}%>
    });

// jQuery 코드
// 소형견 버튼 눌렀을 때
$('#smallDogBtn').click(function onclick(){
    $(this).css({
        'backgroundColor' : 'purple'
    });
    $('#largeDogBtn').css({
        'backgroundColor' : '#343a40'
    });
});
// 대형견 버튼 눌렀을 때
$('#largeDogBtn').click(function onclick(){
    $(this).css({
        'backgroundColor' : 'purple'
    });
    $('#smallDogBtn').css({
        'backgroundColor' : '#343a40'
    });
});

 function addPet_fn() { // 반려견 추가하기 버튼 클릭시 실행되는 함수
    if (petCount < 3) { // 3마리 미만이면
         $("#registerPetContainer").css({
             "display": "block",
             "z-index": "1"
         }); // 펫 등록 화면 보이기

         $("#cancelContainer").css({
			"display" : "flex",
			"z-index" : "1"
		}); // 펫 등록 취소 버튼 보이기

         $("#checkPetContainer").css({
             "display": "none",
             "z-index": "0"
         }); // 펫 체크 화면 가리기
         
         $("#searchMyPetContainer").css({
             "display": "none",
             "z-index": "0"
         }); // 나의 펫 리스트 화면 가리기

         $("#petName").val(""); // 입력칸 지우기
         $("#breed").val(""); // 입력칸 지우기
         $("#petAge").val(""); // 입력칸 지우기
         $("#petWeight").val(""); // 입력칸 지우기
     }else { // 3마리 이상이면
         alert("반려견은 3마리까지만 입력가능합니다.");
     }
 }

 function cancelRegist() { // 반려견 정보 등록 취소하기 버튼 눌렀을 때 실행되는 함수
     $("#registerPetContainer").css({
         "display": "none",
         "z-index": "0"
     }); // 펫 등록 화면 가리기
     $("#checkPetContainer").css({
         "display": "block",
         "z-index": "1"
     }); // 펫 체크 화면 보이기
 }

 function cancelMyPetRegist() { // 나의 반려견 정보 등록 취소하기 버튼 눌렀을 때 실행되는 함수
     $("#searchMyPetContainer").css({
         "display": "none",
         "z-index": "0"
     }); // 나의 펫 리스트 화면 가리기
     $("#registerPetContainer").css({
         "display": "block",
         "z-index": "1"
     }); // 펫 등록 화면 보이기
 }

function deletePet_fn(event) { // 반려견 삭제 버튼 클릭할 때 실행되는 함수
    console.log(event); // 해당 이벤트 객체 출력
    console.log(this.id); // 해당 이벤트의 id 출력
    var petNo=this.id.substr(this.id.length-1); // 해당 이벤트의 id(span태그의 id)중 마지막 숫자 가져오기
    console.log(petNo+"번째 반려견 삭제 버튼 누름");
    console.log("해당 이벤트 li의 No:"+petNo);

    // aJax 통신으로 해당 pet 번호 쿠키 삭제
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                console.log("쿠키 삭제 완료:" + xhr.responseText);
            }
        }
    }
    xhr.open("post", "<%=path%>/book/CookieAjaxServlet");
    xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    xhr.send("executeType=delete&petCount="+petCount+"&petNo=" + petNo + "&petName=" + $("#petName" + petNo).val() + "&breed=" + $("#breed" + petNo).val()
        + "&petAge=" + $("#petAge" + petNo).val() + "&petWeight=" + $("#petWeight" + petNo).val());

    $(this).parent().remove(); // span의 부모인 li 삭제
    if(petNo<petCount) { // 선택한 span태그의 번호가 petCount보다 작으면
        for(var i=petNo; i<petCount; i++) {
            var j=Number(i)+Number(1);
            console.log("삭제한 번호:"+i+", 삭제한 다음 번호:"+j);
            $("#petName" + i).val($("#petName"+j).val()); // petName+petNo hidden의 값에 다음 petNo+1의 값으로 대체
            $("#breed" + i).val($("#breed"+j).val()); // breed+petNo hidden의 값에 다음 petNo+1의 값으로 대체
            $("#petAge" + i).val($("#petAge"+j).val()); // petAge+petNo hidden의 값에 다음 petNo+1의 값으로 대체
            $("#petWeight" + i).val($("#petWeight"+j).val()); // petWeight+petNo hidden의 값에 다음 petNo+1의 값으로 대체
            $("#petId" + i).val($("#petId"+j).val()); // petId+petNo hidden의 값에 다음 petNo+1의 값으로 대체

            $("#removePetBtn" + j).attr('id', 'removePetBtn'+i); // removePetBtn+j의 아이디를 removePetBtn+(j+1)로 변경

            $("#petName" + j).val(""); // petName+petNo+1 hidden의 값 삭제
            $("#breed" + j).val(""); // breed+petNo+1 hidden의 값 삭제
            $("#petAge" + j).val(""); // petAge+petNo+1 hidden의 값 삭제
            $("#petWeight" + j).val(""); // petWeight+petNo+1 hidden의 값 삭제
            $("#petId" + j).val(""); // petId+petNo+1 hidden의 값 삭제
        }
    }else { // 선택한 span태그의 번호가 petCount보다 크거나 같으면
        $("#petName" + petNo).val(""); // petName+petNo hidden의 값 삭제
        $("#breed" + petNo).val(""); // breed+petNo hidden의 값 삭제
        $("#petAge" + petNo).val(""); // petAge+petNo hidden의 값 삭제
        $("#petWeight" + petNo).val(""); // petWeight+petNo hidden의 값 삭제
        $("#petId" + petNo).val(""); // petId+petNo hidden의 값 삭제
    }

    if(petCount<=1) { // 등록된 반려견이 1마리 이하이면
        petCount--; // 반려견 마리 수 감소
        location.href="<%=path%>/book/visitPetsitter2";
    }else{ // 등록된 반려견이 2마리 이상이면
        petCount--; // 반려견 마리 수 감소
        $("#msgContainer1").html("현재 등록된 반려견: "+petCount+"마리");
        $("#msgContainer2").html("현재 등록된 반려견: "+petCount+"마리");
        $("#selectMyPetMsgContainer").html("현재 등록된 반려견: "+petCount+"마리");
    }

    console.log("1마리 삭제 후 등록한 강아지 마리 수:"+petCount);

}

function deleteAllPet() { // 모든 반려견 관련 쿠키 삭제하는 함수
    // aJax 통신으로 해당 pet 번호 쿠키 삭제
    var currentPetCount=petCount;
    for(var deletePetNo=1; deletePetNo<=petCount; deletePetNo++) {
        
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    console.log("쿠키 삭제 완료:" + xhr.responseText);
                }
            }
        }
        xhr.open("post", "<%=path%>/book/DeleteAllPetsCookieServlet");
        xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        xhr.send("executeType=delete&petCount="+currentPetCount+"&petNo=" + deletePetNo + "&petName=" + $("#petName" + deletePetNo).val() + "&breed=" + $("#breed" + deletePetNo).val()
            + "&petAge=" + $("#petAge" + deletePetNo).val() + "&petWeight=" + $("#petWeight" + deletePetNo).val()+ "&petId=" + $("#petId" + deletePetNo).val());


        $("#removePetBtn"+deletePetNo).parent().remove(); // span의 부모인 li 삭제

        if(1<currentPetCount) { // 선택한 span태그의 번호가 petCount보다 작으면
            for(var i=1; i<currentPetCount; i++) {
                var j=Number(i)+Number(1);
                console.log("삭제한 번호:"+i+", 삭제한 다음 번호:"+j);
                $("#petName" + i).val($("#petName"+j).val()); // petName+petNo hidden의 값에 다음 petNo+1의 값으로 대체
                $("#breed" + i).val($("#breed"+j).val()); // breed+petNo hidden의 값에 다음 petNo+1의 값으로 대체
                $("#petAge" + i).val($("#petAge"+j).val()); // petAge+petNo hidden의 값에 다음 petNo+1의 값으로 대체
                $("#petWeight" + i).val($("#petWeight"+j).val()); // petWeight+petNo hidden의 값에 다음 petNo+1의 값으로 대체
                $("#petId" + i).val($("#petId"+j).val()); // petId+petNo hidden의 값에 다음 petNo+1의 값으로 대체

                $("#removePetBtn" + j).attr('id', 'removePetBtn'+i); // removePetBtn+j의 아이디를 removePetBtn+(j+1)로 변경

                $("#petName" + j).val(""); // petName+petNo+1 hidden의 값 삭제
                $("#breed" + j).val(""); // breed+petNo+1 hidden의 값 삭제
                $("#petAge" + j).val(""); // petAge+petNo+1 hidden의 값 삭제
                $("#petWeight" + j).val(""); // petWeight+petNo+1 hidden의 값 삭제
                $("#petId" + j).val(""); // petId+petNo+1 hidden의 값 삭제
            }
        }else { // 선택한 span태그의 번호가 petCount보다 크거나 같으면
            $("#petName" + 1).val(""); // petName+petNo hidden의 값 삭제
            $("#breed" + 1).val(""); // breed+petNo hidden의 값 삭제
            $("#petAge" + 1).val(""); // petAge+petNo hidden의 값 삭제
            $("#petWeight" + 1).val(""); // petWeight+petNo hidden의 값 삭제
            $("#petId" + 1).val(""); // petId+petNo hidden의 값 삭제
        }

        currentPetCount--;
        $("#petCount").val(currentPetCount); // petId+deletePetNo+1 hidden의 값 삭제


        console.log("삭제 후 등록된 강아지 마리 수:"+currentPetCount);
        $("#msgContainer1").html("현재 등록된 반려견: "+currentPetCount+"마리");
        $("#msgContainer2").html("현재 등록된 반려견: "+currentPetCount+"마리");
        $("#selectMyPetMsgContainer").html("현재 등록된 반려견: "+currentPetCount+"마리");
    }

    petCount=currentPetCount;
    console.log("모두 삭제 후 등록된 강아지 마리 수:"+currentPetCount);
    console.log("모두 삭제 후 등록된 강아지 마리 수(petCount):"+petCount);
    
}

function searchMyPet() { // 내 반려견 정보 불러오기
    alert("내 반려견 정보를 불러옵니다.");

 	// 모든 반려견 쿠키 삭제하기
     deleteAllPet();
	// 모든 반려견 쿠키 삭제하기 끝
    
    $("#searchMyPetInfoName").children().first().html(''); // html 지우기
    $("#petInfoName").children().first().html(''); // petInfoName html 초기화
    
    <%if(petList.size()>=1) { // 등록된 반려견이 1마리 이상이면
		for(int i=0; i<petList.size(); i++) { %>
		var checkPetBtnNo="<%=(i+1)%>";
        var petName="<%=petList.get(i).getPetName()%>";
        var breed="<%=petList.get(i).getPetBreed() %>";
        var petAge="<%=petList.get(i).getPetAge() %>";
        var petWeight="<%=petList.get(i).getPetWeight() %>";
        var petId="<%=petList.get(i).getPetId() %>";

	    $("#registerPetContainer").css({
	                    "display": "none",
	                    "z-index": "0"
	                    }); // 펫 등록 화면 가리기
	    $("#searchMyPetContainer").css({
	                        "display": "block",
	                        "z-index" : "1"
	                        }); // 나의 펫 리스트 화면 보이기
	    //$("#petInfoName").html($("#petInfoName").html()+"<br/>"+petName+'('+breed+' / '+petAge+'살 / '+petWeight+'kg)');
        
        $("#searchMyPetInfoName").children().first().append('<li><span class="dogImage""><img src="<%=path%>/images/pet-friendly.svg"' 
                +' alt="강아지" width="23" height="25"></span>'
                +'<span class="petInfoText"><input type="hidden" id="myPetName'+checkPetBtnNo+'" value="'+petName+'">'
                +'<input type="hidden" id="myPetBreed'+checkPetBtnNo+'" value="'+breed+'">'
                +'<input type="hidden" id="myPetAge'+checkPetBtnNo+'" value="'+petAge+'">'
                +'<input type="hidden" id="myPetWeight'+checkPetBtnNo+'" value="'+petWeight+'">'
                +'<input type="hidden" id="myPetId'+checkPetBtnNo+'" value="'+petId+'">'
                +petName+'('+breed+' / '+petAge+'살 / '+petWeight+'kg)</span>'
                +'<span class="checkPetBtn" id="checkPetBtn'+checkPetBtnNo+'"><img src="<%=path%>/images/circle_icon.png"'
                +' alt="삭제" width="17" height="17"></span></li><input type="hidden" id="checkPetBtnFlag'+checkPetBtnNo+'" value="0">');
	    checkPetBtn[Number(checkPetBtnNo-1)]=document.getElementById("checkPetBtn"+checkPetBtnNo); // 해당 요소 받아오기
	    console.log(checkPetBtn[Number(checkPetBtnNo-1)]);
	    checkPetBtn[Number(checkPetBtnNo-1)].addEventListener('click', checkPetBtn_fn); // 이벤트 등록, checkPetBtn_fn 함수 출력됨
	
    <%	}
	 }else { // 등록된 반려견이 없으면	%>
	 	alert("아직 등록된 반려견이 없습니다.");
	 <%} %>
}

function checkPetBtn_fn(event) {
    // alert("나의 펫을 선택하였습니다.");
    // console.log($(this).children().first());
    var checkBtnFlagNo=this.id.substr(this.id.length-1);
    var petName = $("#myPetName" + checkBtnFlagNo).val();
    var breed = $("#myPetBreed" + checkBtnFlagNo).val();
    var petAge = $("#myPetAge" + checkBtnFlagNo).val();
    var petWeight=$("#myPetWeight"+checkBtnFlagNo).val();
    var petId=$("#myPetId"+checkBtnFlagNo).val();
    // console.log(checkBtnFlagNo);
    if($("#checkPetBtnFlag"+checkBtnFlagNo).val()==0) { // 체크 되면 반려견 정보 쿠키 추가
        if (petCount < 3) { // 3마리 미만이면
            $(this).children().first().attr("src", "<%=path%>/images/check_icon.png");
            $("#checkPetBtnFlag"+checkBtnFlagNo).val(1);
            // var test123=$(this).prev().children().first().val();
            // console.log(test123);
        
            petCount++;
            $("#msgContainer1").html("현재 등록된 반려견: "+petCount+"마리");
            $("#msgContainer2").html("현재 등록된 반려견: "+petCount+"마리");
            $("#selectMyPetMsgContainer").html("현재 등록된 반려견: "+petCount+"마리");

            $("#petName" + petCount).val(petName); // 반려견 이름 저장
            $("#breed" + petCount).val(breed); // 반려견 견종 저장
            $("#petAge" + petCount).val(petAge); // 반려견 나이 저장
            $("#petWeight" + petCount).val(petWeight); // 반려견 몸무게 저장
            $("#petId" + petCount).val(petId); // 반려견 아이디 저장
            $("#petCount").val(petCount); // 강아지 마리 수 저장
            
            console.log("등록한 강아지 마리 수:" + petCount);

            $("#petInfoName").children().first().append('<li><span class="dogImage""><img src="<%=path%>/images/pet-friendly.svg"' 
                    +' alt="강아지" width="23" height="25"></span>'
                    +'<span class="petInfoText">'+petName+'('+breed+' / '+petAge+'살 / '+petWeight+'kg)</span>'
                    +'<span class="removePetBtn" id="removePetBtn'+petCount+'"><img src="<%=path%>/images/icon_delete2.svg"'
                    +' alt="삭제" width="17" height="17"></span></li>');
            removePetBtn[Number(petCount-1)]=document.getElementById("removePetBtn"+petCount); // 해당 요소 받아오기
            console.log(removePetBtn[Number(petCount-1)]);
            removePetBtn[Number(petCount-1)].addEventListener('click', deletePet_fn); // 이벤트 등록, deletePet_fn 함수 출력됨

            // aJax 통신으로 쿠키 등록
            var xhr=new XMLHttpRequest();
            xhr.onreadystatechange=function(){
                if(xhr.readyState==4) {
                    if(xhr.status==200) {
                        console.log("쿠키 등록 완료:"+xhr.responseText);
                    }
                }
            }
            xhr.open("post", "<%=path%>/book/CookieAjaxServlet");
            xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
            xhr.send("executeType=add&petCount="+petCount+"&petName="+petName+"&breed="+breed+"&petAge="+petAge+"&petWeight="+petWeight+"&petId="+petId);
        }else {
            alert("최대 3마리까지만 가능합니다.");
        }

    }else { // 체크 해제 되면 반려견 정보 쿠키 삭제
        $(this).children().first().attr("src", "<%=path%>/images/circle_icon.png");
        $("#checkPetBtnFlag"+checkBtnFlagNo).val(0);

        var petNo=this.id.substr(this.id.length-1); // 해당 이벤트의 id(span태그의 id)중 마지막 숫자 가져오기
        console.log("나의 반려견 정보 삭제 버튼 누름");
        console.log("나의 반려견 "+petNo+"번째 반려견 삭제 버튼 누름");
        console.log("해당 이벤트 li의 No:"+petNo);

        var petNameTest=$(this).prev().children().first().val();
        console.log(petNameTest);
        for(var i=1; i<=petCount; i++) {
            if(petNameTest==$("#petName"+i).val()) {
                petNo=$("#petName"+i).attr("id").substr($("#petName"+i).attr("id").length-1);
                console.log("해당하는 petName의 쿠키 넘버:"+petNo);
            }
        }

        // aJax 통신으로 해당 pet 번호 쿠키 삭제
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    console.log("쿠키 삭제 완료:" + xhr.responseText);
                }
            }
        }
        xhr.open("post", "<%=path%>/book/CookieAjaxServlet");
        xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        xhr.send("executeType=delete&petCount="+petCount+"&petNo=" + petNo + "&petName=" + $("#petName" + petNo).val() + "&breed=" + $("#breed" + petNo).val()
            + "&petAge=" + $("#petAge" + petNo).val() + "&petWeight=" + $("#petWeight" + petNo).val()+ "&petId=" + $("#petId" + petNo).val());


        $("#removePetBtn"+petNo).parent().remove(); // span의 부모인 li 삭제
        if(petNo<petCount) { // 선택한 span태그의 번호가 petCount보다 작으면
            for(var i=petNo; i<petCount; i++) {
                var j=Number(i)+Number(1);
                console.log("삭제한 번호:"+i+", 삭제한 다음 번호:"+j);
                $("#petName" + i).val($("#petName"+j).val()); // petName+petNo hidden의 값에 다음 petNo+1의 값으로 대체
                $("#breed" + i).val($("#breed"+j).val()); // breed+petNo hidden의 값에 다음 petNo+1의 값으로 대체
                $("#petAge" + i).val($("#petAge"+j).val()); // petAge+petNo hidden의 값에 다음 petNo+1의 값으로 대체
                $("#petWeight" + i).val($("#petWeight"+j).val()); // petWeight+petNo hidden의 값에 다음 petNo+1의 값으로 대체
                $("#petId" + i).val($("#petId"+j).val()); // petId+petNo hidden의 값에 다음 petNo+1의 값으로 대체

                $("#removePetBtn" + j).attr('id', 'removePetBtn'+i); // removePetBtn+j의 아이디를 removePetBtn+(j+1)로 변경

                $("#petName" + j).val(""); // petName+petNo+1 hidden의 값 삭제
                $("#breed" + j).val(""); // breed+petNo+1 hidden의 값 삭제
                $("#petAge" + j).val(""); // petAge+petNo+1 hidden의 값 삭제
                $("#petWeight" + j).val(""); // petWeight+petNo+1 hidden의 값 삭제
                $("#petId" + j).val(""); // petId+petNo+1 hidden의 값 삭제
            }
        }else { // 선택한 span태그의 번호가 petCount보다 크거나 같으면
            $("#petName" + petNo).val(""); // petName+petNo hidden의 값 삭제
            $("#breed" + petNo).val(""); // breed+petNo hidden의 값 삭제
            $("#petAge" + petNo).val(""); // petAge+petNo hidden의 값 삭제
            $("#petWeight" + petNo).val(""); // petWeight+petNo hidden의 값 삭제
            $("#petId" + petNo).val(""); // petId+petNo hidden의 값 삭제
        }

        if(petCount<=1) { // 등록된 반려견이 1마리 이하이면
            petCount--; // 반려견 마리 수 감소
            $("#msgContainer1").html("현재 등록된 반려견: "+petCount+"마리");
            $("#msgContainer2").html("현재 등록된 반려견: "+petCount+"마리");
            $("#selectMyPetMsgContainer").html("현재 등록된 반려견: "+petCount+"마리");
            alert("최소 1마리 이상 선택해주세요.");
        }else{ // 등록된 반려견이 2마리 이상이면
            petCount--; // 반려견 마리 수 감소
            $("#msgContainer1").html("현재 등록된 반려견: "+petCount+"마리");
            $("#msgContainer2").html("현재 등록된 반려견: "+petCount+"마리");
            $("#selectMyPetMsgContainer").html("현재 등록된 반려견: "+petCount+"마리");
        }

        console.log("1마리 삭제 후 등록한 강아지 마리 수:"+petCount);

    }
}

 function registerPetNext() { // 반려견 정보 입력화면의 다음 버튼 클릭 시 실행되는 함수
     var petName=document.getElementById("petName").value.trim();
     var breed=document.getElementById("breed").value.trim();
     var petAge=document.getElementById("petAge").value.trim();
     var petWeight=document.getElementById("petWeight").value.trim();
     var petId='';
     
     var petAgeRegExp=/^0[1-9]$|^[1-9]$|^1[0-9]$|^2[0-9]$|^3[0-5]$/g; /*나이 정규표현식(1~35만 입력 가능), g : 전역비교를 수행 */
     var petWeightRegExp=/(^[0](\.[1-9])$)|(^[0-9]?[1-9](\.[0-9])?$)|(^100$)/g; /*몸무게 정규표현식(0.1~100만 입력 가능), g : 전역비교를 수행 */
     

     console.log("입력한 petAge:"+petAge);
     console.log("입력한 petWeight:"+petWeight);
     if(petName=="") {
        alert("반려견 이름을 입력해주세요.");  
        $("#petName").focus();      
     }else if(petName.length>10) {
        alert("반려견 이름은 10글자 이내로 입력해주세요.");  
        $("#petName").focus();      
     }else if(breed=="") {
        alert("반려견 견종을 입력해주세요.");
        $("#breed").focus();
     }else if(!possibleBreedFlag) { // 불가능한 견종이면
         alert("죄송합니다.\n입력하신 견종은 돌봄 서비스가 불가합니다.");
         $("#breed").focus();
      }else if(petAge=="") {
        alert("반려견 나이를 입력해주세요.");
        $("#petAge").focus();
     }else if(!petAgeRegExp.test(petAge)){ // 정규표현식이 틀리면
    	 alert("반려견의 나이는 소수점이 아닌 정수로 입력해 주세요.\n(1~35까지만 입력가능)");
         $("#petAge").focus();
     }else if(petWeight=="") {
        alert("반려견 몸무게를 입력해주세요.");
        $("#petWeight").focus();
     }else if(!petWeightRegExp.test(petWeight)){ // 정규표현식이 틀리면
        alert("반려견의 몸무게는 소수점 첫째자리까지만 입력가능합니다.\n(0.1~100까지만 입력가능)");
        $("#petWeight").focus();
     }else {
         petCount++; // 강아지 마리 수 증가
         $("#msgContainer1").html("현재 등록된 반려견: "+petCount+"마리");
         $("#msgContainer2").html("현재 등록된 반려견: "+petCount+"마리");
         $("#selectMyPetMsgContainer").html("현재 등록된 반려견: "+petCount+"마리");
         $("#petName"+petCount).val($("#petName").val()); // 반려견 이름 저장
         $("#breed"+petCount).val($("#breed").val()); // 반려견 견종 저장
         $("#petAge"+petCount).val($("#petAge").val()); // 반려견 나이 저장
         $("#petWeight"+petCount).val($("#petWeight").val()); // 반려견 몸무게 저장
         $("#petId"+petCount).val(''); // 반려견 아이디 저장
         $("#petCount").val(petCount); // 강아지 마리 수 저장
         console.log("등록한 강아지 마리 수:"+petCount);
         $("#registerPetContainer").css({
                            "display": "none",
                            "z-index": "0"
                            }); // 펫 등록 화면 가리기
         $("#checkPetContainer").css({
                                "display": "block",
                                "z-index" : "1"
                                }); // 펫 체크 화면 보이기
         //$("#petInfoName").html($("#petInfoName").html()+"<br/>"+petName+'('+breed+' / '+petAge+'살 / '+petWeight+'kg)');
         $("#petInfoName").children().first().append('<li><span class="dogImage""><img src="<%=path%>/images/pet-friendly.svg"' 
                +' alt="강아지" width="23" height="25"></span>'
                +'<span class="petInfoText">'+petName+'('+breed+' / '+petAge+'살 / '+petWeight+'kg)</span>'
                +'<span class="removePetBtn" id="removePetBtn'+petCount+'"><img src="<%=path%>/images/icon_delete2.svg"'
                +' alt="삭제" width="17" height="17"></span></li>');
        removePetBtn[Number(petCount-1)]=document.getElementById("removePetBtn"+petCount); // 해당 요소 받아오기
        console.log(removePetBtn[Number(petCount-1)]);
        removePetBtn[Number(petCount-1)].addEventListener('click', deletePet_fn); // 이벤트 등록, deletePet_fn 함수 출력됨
        
        // aJax 통신으로 쿠키 등록
        var xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4) {
				if(xhr.status==200) {
					console.log("쿠키 등록 완료:"+xhr.responseText);
				}
			}
		}
		xhr.open("post", "<%=path%>/book/CookieAjaxServlet");
		xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
		xhr.send("executeType=add&petCount="+petCount+"&petName="+petName+"&breed="+breed+"&petAge="+petAge+"&petWeight="+petWeight+"&petId="+petId);
        
     }
 }
  
////////////////////////////////////////////지민이가 만든 이벤트 시작 ///////////
var possibleBreedList=new Array(); // 입력 가능한 견종 저장할 변수
 $("#breed").keyup(function(){
			$.ajax({
				url : "<%=request.getContextPath()%>/searchTypes",
				type : "get",
				data : {"key" : $(this).val()},
				dataType : "json",
				success : function(data){
					possibleBreedList = data.split(",");
                    console.log("ajax안에서 실행:"+possibleBreedList);
					$("#breedList").html("");
					for(var i=0; i<possibleBreedList.length; i++){
						var option = $("<option>").attr({"value" : possibleBreedList[i]}).html(possibleBreedList[i]);
						$("#breedList").append(option);
					}
				}
			});
		});
		
		
		
		$("#breed").focusout(function(){
			if(possibleBreedList != "" && possibleBreedList!=$(this).val()){
                possibleBreedFlag=false; // 틀리면 possibleBreedFlag를 false로 바꿔주고
				console.log(possibleBreedList);
				$("#breedErr").show();
			}
			else if(possibleBreedList != "" && possibleBreedList==$(this).val()){
                possibleBreedFlag=true; // 맞으면 possibleBreedFlag를 true로 바꿔주고
				$("#breedErr").hide();
			}
			else{
                possibleBreedFlag=false; // 틀리면 possibleBreedFlag를 false로 바꿔주고
				$("#breedErr").show();
				
			}
		});
////////////////////////////////////////////지민이가 만든 이벤트 끝 ///////////	

 function submit_fn() { // 반려견 추가하기 아래 버튼 클릭 시 실행되는 함수
	 if(petCount>0) {
        document.getElementById('visitPetsitter3Frm').submit(); // submit 실행		 
	 }else {
		 alert("1마리 이상의 반려견을 등록해주세요.");
	 }
 }


</script>
</html>