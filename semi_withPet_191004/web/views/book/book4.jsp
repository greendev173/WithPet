<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hwang.withpet.book.model.vo.Book" %>
<%
	Cookie[] cookies=request.getCookies();
	
	int requestCount=0; // 요청사항 개수 변수
	String userRequest=null;
	
	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("requestCount")) {
				requestCount=Integer.parseInt(cookies[i].getValue());
			}else if(cookies[i].getName().equals("userRequest")) {
				userRequest=URLDecoder.decode(cookies[i].getValue(), "UTF-8");
			}
		}
	}
	
	String[] checkRequest=new String[requestCount];
	
	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			for(int j=0; j<requestCount; j++) {
				if(cookies[i].getName().equals("checkRequest"+(j+1))) {
					checkRequest[j]=URLDecoder.decode(cookies[i].getValue(), "UTF-8");
				}
			}
		}
	}

	String path = request.getContextPath(); // 프로젝트 주소
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

    <title>방문 펫시터 예약 - step 4/4</title>
</head>
<body>
    <div class="fixedHeader">
        <div style="height: 100%;">
            <button type="button" class="close" aria-label="Close"
                onclick="moveServicePage();">
                <span aria-hidden="true">&times;</span>
            </button>
            방문 펫시터 예약 - step 4/4
        </div>
    </div>
        <div class="container-fluid">
            <div class="row empty1"></div>
            <div class="row middle">
                <div class="col-12">
                    <div class="row empty2"></div>
                    <form action="<%=path%>/book/VisitPetsitterSelect" method="POST" onsubmit="return book4_Validate();">
                        <div class="row">
                            <div class="col-12 centerClass"><h5>펫시터에 전달 할 요청사항이 있으신가요?</h5></div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-8 checkClass"><h5><input type="checkbox" name="checkRequest" value="산책없이 놀이 서비스로 대체해주세요.">
                                산책없이 놀이 서비스로 대체해주세요.</h5></div>
                            <div class="col-2"></div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                                <div class="col-2"></div>
                            <div class="col-8 checkClass"><h5><input type="checkbox" name="checkRequest" value="산책 위주로 진행해주세요.">
                                산책 위주로 진행해주세요.</h5></div>
                                <div class="col-2"></div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                                <div class="col-2"></div>
                            <div class="col-8 checkClass"><h5><input type="checkbox" name="checkRequest" value="생식 급여가 필요합니다.">
                                생식 급여가 필요합니다.</h5></div>
                                <div class="col-2"></div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                                <div class="col-2"></div>
                            <div class="col-8 checkClass"><h5><input type="checkbox" name="checkRequest" value="노령견 및 환자견 케어가 필요합니다.">
                                노령견 및 환자견 케어가 필요합니다.</h5></div>
                                <div class="col-2"></div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-10 centerClass">기타 요청사항</div>
                            <div class="col-1"></div>       
                        </div>
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-10 centerClass textAreaWrapper"><textarea name="userRequest" id="userRequest" col="8" rows="10" 
                                placeholder='기타 요청사항을 작성해주세요.'></textarea></div>
                            <div class="col-1"></div>       
                        </div>
                        <div class="row" >
                            <div class="col-2"></div>
                            <div class="col-8" id="charCountContainer" style="text-align: center;" >
                                (현재 0자 / 최대 200자)
                            </div>
                            <div class="col-2"></div>
                        </div>
                        <div class="row empty3"></div>
                        <!-- <div class="row" id="tempSaveBtnContainer">
                            <div class="col-2"></div>
                            <div class="col-8">
                                <input type="button" class='btn btn-outline-dark' style="width: 100%;" 
                                value='기타 요청사항 임시 저장' onclick="requestSave('임시 저장되었습니다.');">
                            </div>
                            <div class="col-2"></div>
                        </div> -->
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-12 select">
                                <input type="button" class='btn btn-dark btn2' value="놀이프로그램 자세히 보기" id="smallDogBtn">
                            </div>
                        </div>
                        <div class="row empty3"></div>
                        <div class="row">
                            <div class="col-6 centerClass">
                                <input type='button' class='btn-primary form-control submitBtn' value='이전'
                                    onclick="location.href='<%=path%>/book/visitPetsitter3';">
                            </div>
                            <div class="col-6 centerClass">
                                <input type='submit' class='btn-primary form-control submitBtn' value='다음'>
                            </div>
                        </div>
                        <div class="row empty3"></div>
                    </form>
            </div>
        </div>
    </div>
</body>
<style>
    html, body{
        /* font-size: 100%; */
        font-family: 'Spoqa Han Sans', 'Spoqa Han Sans JP', 'Sans-serif';
        height: 100%;
        max-width: 650px;
        margin:0 auto;
    }
    /* html{
        font-size:15px;
    } */
    .fixedHeader{
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
        border:2px solid red;
        background-color: greenyellow;
        height: 50px;
        text-align: center;
        align-content: center;
    }

    /* div 나누는 거 확인하기 위해 필요한 스타일, 지우지 말 것 */
    /* div[class|=col] {
        border:2px solid green;
    } */

    .select {
        text-align: center;
    }
    .btn2 {
        width: 100%;
        padding-left: 0px;
        padding-right: 0px;
        margin-right: 5px;
    }
    .submitBtn {
        width:100%;
    }
    #requestedTerm{
        line-height: 10px;
        resize: none;
    }
    .centerClass {
        text-align: center;
        font-size: 17px;
        line-height: 1.7;
        letter-spacing: -.5px;
    }
    .checkClass {
        text-align: left;
        font-size: 17px;
        line-height: 1.7;
        letter-spacing: -.5px;
    }
    #userRequest{
        width: 100%;
        height: 100%;
        border: none;
        background-color: transparent;
        color: #828282;
        font-size: 14px;
        -webkit-appearance: none;
        outline: none;
        resize: none;
    }
    .textAreaWrapper {
        width: 80%;
        height: 170px;
        padding: 12px 15px;
        box-sizing: border-box;
        border: 1px solid hsla(0,0%,65%,.5);
    }
</style>

<script>
// jQuery 코드
var checkRequest=new Array(); // 체크박스 저장할 변수
var requestCount=0; // request 개수 저장할 변수
var charCount1=0; // 추가 요청사항 글자 수 저장할 변수

<%if(requestCount!=0) { %>
	requestCount=Number(<%=requestCount%>);
<% } %>

$(function() {

    checkRequest=document.getElementsByName("checkRequest");
    /* for(var i=0; i<checkRequest.length; i++) {
    	console.log(checkRequest[i].value);
    } */

	<%
	if(cookies!=null) {
	 for(int i=0; i<cookies.length; i++) { 
         String checkTagVal=URLDecoder.decode(cookies[i].getValue(), "UTF-8");
         %>
		
		<%if(checkTagVal.equals("산책없이 놀이 서비스로 대체해주세요.")) {%>
			$(checkRequest[0]).attr("checked", "checked");
			$(checkRequest[0]).attr("id", "<%=cookies[i].getName()%>");
			console.log("페이지 로드 된 후 체크된 태그의 value:<%=checkTagVal %>");
		<%}else if(checkTagVal.equals("산책 위주로 진행해주세요.")) {%>
			$(checkRequest[1]).attr("checked", "checked");
			$(checkRequest[1]).attr("id", "<%=cookies[i].getName()%>");
			console.log("페이지 로드 된 후 체크된 태그의 value:<%=checkTagVal %>");
		<%}else if(checkTagVal.equals("생식 급여가 필요합니다.")) {%>
			$(checkRequest[2]).attr("checked", "checked");
			$(checkRequest[2]).attr("id", "<%=cookies[i].getName()%>");
			console.log("페이지 로드 된 후 체크된 태그의 value:<%=checkTagVal %>");
		<%}else if(checkTagVal.equals("노령견 및 환자견 케어가 필요합니다.")) {%>
			$(checkRequest[3]).attr("checked", "checked");
			$(checkRequest[3]).attr("id", "<%=cookies[i].getName()%>");
			console.log("페이지 로드 된 후 체크된 태그의 value:<%=checkTagVal %>");
		<%}
	
	 }
	}%>
	
	<% if(userRequest!=null) {%>
		$("#userRequest").val("<%=userRequest%>");
        var userRequestVal=$("#userRequest").val();
        charCount1=userRequestVal.length;

        $("#charCountContainer").html("(현재 "+charCount1+"자 / 최대 100자)");
		// $("#userRequest").val("잘 부탁드려요 ㅋㅋㅋ   ^_^ \n 테스트입니다.");
	<%} %>
    
    for(var i=0; i<checkRequest.length; i++) {
        //var checkrequestIndex=i-1;
        // console.log(typeof checkrequestIndex);
        // console.log(checkrequestIndex);
        //checkRequest[checkrequestIndex]=document.getElementById("checkRequest"+i); // 해당 요소 받아오기
        // console.log(checkRequest[checkrequestIndex]);
        checkRequest[i].addEventListener('change', checkbox_fn); // 이벤트 등록, checkbox_fn 함수 출력됨
    }
    

    // $("#checkRequest1").change(function(){
    //     if($("#checkRequest1").is(":checked")){
    //         alert("체크박스 체크했음!");
    //     }else{
    //         alert("체크박스 체크 해제!");
    //     }
    // });
});

function checkbox_fn(event) {
    if($(this).is(":checked")) { // 체크박스가 체크 되면
        requestCount++; // request 개수 증가
        $(this).attr("id", "checkRequest"+requestCount); // 해당 체크박스에 아이디 추가
        // aJax 통신으로 해당 checkRequest 번호 쿠키 등록
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    console.log("쿠키 등록 완료:" + xhr.responseText);
                }
            }
        }
        xhr.open("post", "<%=path%>/book/requestCookieAjaxServlet");
        xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        xhr.send("executeType=add&checkRequest="+this.value+"&requestCount="+requestCount);
    }else{ // 체크박스가 해제 되면
        var idLastIndex=this.id.length-1;
        // console.log(idLastIndex);
        var index=this.id.substr(idLastIndex); // 해당 이벤트의 id(체크박스 태그의 id)중 마지막 문자 가져오기
        // aJax 통신으로 해당 checkRequest 번호 쿠키 삭제
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    console.log("쿠키 삭제 완료:" + xhr.responseText);
                }
            }
        }
        xhr.open("post", "<%=path%>/book/requestCookieAjaxServlet");
        xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        xhr.send("executeType=delete&checkRequest="+this.value+"&requestNo="+index+"&requestCount="+requestCount);

        if(index<requestCount) { // 선택한 체크박스 태그의 id 번호가 requestCount보다 작으면
            $("#checkRequest" + index).attr("id", ""); // 해당 이벤트 태그의 아이디를 없앤다.
            for(var i=index; i<requestCount; i++) {
                var j=Number(i)+Number(1);
                console.log("삭제한 번호:"+i+", 삭제한 다음 번호:"+j);
                
                $("#checkRequest" + j).attr("id", "checkRequest"+i); // 해당 이벤트 다음 태그들의 아이디 번호를 -1 해준다.

            }
        }else { // 선택한 체크박스 태그의 id 번호가 requestCount보다 크거나 같으면
            $("#checkRequest" + index).attr("id", ""); // 해당 이벤트 태그의 아이디를 없앤다.
        }

        requestCount--; // request 개수 감소

        console.log("요청사항 해제 후 체크된 요청사항 수:"+requestCount);
        
    }
}

$("#userRequest").keyup(function(e) {
    console.log("입력됨");
    charCount1=$(this).val().length;
    if(charCount1<100) {
        $("#charCountContainer").html("(현재 "+charCount1+"자 / 최대 100자)"); 
    }else {
        alert("최대 100자까지 입력 가능합니다.");
        $('#charCountContainer').html("(현재 100자 / 최대 100자)");
    }
    requestSave("");
});

function requestSave(alertMsg) {
    var userRequest = $("#userRequest").val();
    console.log(userRequest);
    userRequest = userRequest.replace(/(?:\r\n|\r|\n)/g, '\\n'); // 개행한 것들 정규표현식으로 찾아서 \\n로 바꾸기
    console.log(userRequest);

    // aJax 통신으로 해당 checkRequest 번호 쿠키 등록
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                console.log("쿠키 등록 완료:" + xhr.responseText);
                if(alertMsg!="") {
                    alert(alertMsg);
                }
                return true;
            }else {
            	alert("다시 한번 시도해 주세요.");
            	return false;
            }
        }
    }
    xhr.open("post", "<%=path%>/book/requestCookieAjaxServlet");
    xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
    xhr.send("executeType=add&userRequest=" + userRequest);
}

function book4_Validate() {
    if(requestCount<1 && charCount1<1) { // 체크 요청사항도 없고, 기타 요청사항도 없으면
        if(confirm("요청사항이 없습니다. 그대로 진행하시겠습니까?")) {
            return true;
        }else {
            return false;
        }
    }else { // 체크 요청사항이 있거나 기타 요청사항이 있으면
	    return true;
    }  
}

function moveServicePage() {
    if(confirm("예약화면에서 나가시겠습니까?")) {
        location.href="<%=path%>/service";
        return true;
    }else {
        return false;
    }
}

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

</script>
</html>