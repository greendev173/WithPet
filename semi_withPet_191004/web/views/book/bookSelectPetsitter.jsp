<%@page import="jimin_withPet.model.vo.Petsitter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hwang.withpet.pet.model.vo.Pet"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hwang.withpet.book.model.vo.Book" %>    
<%  
	
    List<Petsitter> petsitterList=(ArrayList)request.getAttribute("petsitterList");
	Cookie[] cookies=request.getCookies();
	
	String petsitterId=null;
	
	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("petsitterId")) {
				petsitterId=URLDecoder.decode(cookies[i].getValue(), "UTF-8");
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

    <title>방문 펫시터 예약 - 펫시터 선택</title>
</head>
<body>
    <div class="fixedHeader">
        <div style="height: 100%;">
            <button type="button" class="close" aria-label="Close"
            onclick="moveServicePage();">
				<!-- onclick="location.href='<%=path%>/book/visitPetsitter1';"> -->
				<span aria-hidden="true">&times;</span>
			</button>
			방문 펫시터 예약 - 펫시터 선택
        </div>
    </div>

<div class="container-fluid" id="checkPetContainer">
    <div class="row middle">
        <div class="col-12">
            <div class="row empty2"></div>
            <div class="row empty2"></div>
            <div class="row">
                <div class="col-12 msgContainer">
                    펫시터 한명을  선택해 주세요.
                </div>
            </div>
            <div class="row">
                <div class="col-12 msgContainer" id="msgContainer2">
                    현재 조회된 펫시터: <%=petsitterList.size()%>명
                </div>
            </div>
            <div class="row">
                <div class="col-12 petsitterInfo" id="petsitterInfo">
                    <ul>
						<%if(petsitterList!=null) {
							for(int i=0; i<petsitterList.size(); i++) { %>
						<li id="petsitterId<%=(i+1) %>"><img width=95px; src="<%=path%>/images/team/<%=petsitterList.get(i).getProfileImg()%>"> &nbsp;<%=petsitterList.get(i).getPetsitterName() %>,&nbsp;&nbsp;펫시터등급:<%=petsitterList.get(i).getGrade() %>
						&nbsp;&nbsp;기타사항:<%=petsitterList.get(i).getFeature() %></li>
                        <input type="hidden" id="hiddenPetsitterId<%=(i+1) %>" value="<%=petsitterList.get(i).getPetsitterId() %>"/>
                        <input type="hidden" id="checkPetsitterBtnFlag<%=(i+1) %>" value="0"/>
						<%	}
						  }else {%>
						  <li>조회된 펫시터가 없습니다.</li>
						  <%} %>
                    </ul>
                </div>
            </div>
            <div class="row empty2"></div>
            <div class="row">
                <div class="col-6">
                    <input type='button' class='btn-primary form-control bookBtnType' 
                    id="bookBtnType" value='이전' onclick="location.href='<%=path%>/book/visitPetsitter4';">
                </div>
                <div class="col-6">
                    <input type="button" class='btn-primary form-control bookBtnType' onclick="submit_fn();" value="다음"/>
                </div>
            </div>
            <div class="row empty2"></div>
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
    .petsitterInfo>ul {
        padding:0px 0px 40px; /*위, 오른쪽 왼쪽, 아래*/
        list-style: none;
    }
    .petsitterInfo>ul>li {
        position: relative;
        padding:9px 7px;
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
    var petsitterCount=<%=petsitterList.size() %>; // 펫시터 인원 저장하는 변수
    var selectPetsitter=false;
    var checkPetBtn=new Array(); // 펫시터 체크 버튼 저장할 변수
	var index=0;
	
    $(function(){ // 페이지 로드 되면
    	<%if(petsitterList!=null) {
			for(int i=0; i<petsitterList.size(); i++) { %>
                checkPetBtn[<%=i%>]=document.getElementById("petsitterId<%=(i+1)%>"); // 해당 요소 받아오기
                console.log(checkPetBtn[<%=i%>]);
                checkPetBtn[<%=i%>].addEventListener('click', checkPetsitterBtn_fn); // 이벤트 등록, checkPetsitterBtn_fn 함수 출력됨
		<%	}
		  }%>

		  
    	<% if(petsitterId!=null) { 
    		for(int i=0; i<petsitterList.size(); i++) {%>
    			if($("#hiddenPetsitterId<%=(i+1)%>").val()=="<%=petsitterId%>") {
                    selectPetsitter=true;
    				$("#checkPetsitterBtnFlag"+<%=i+1%>).val(1);
    		        $("#hiddenPetsitterId"+<%=i+1%>).prev().css({
    		        'backgroundColor' : '#6ec4c1',
    		        'color' : "#fff"
    		        });
    			}
    	<%  }
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


function checkPetsitterBtn_fn(event) {
    var index=this.id.substr(this.id.length-1);
    console.log(index);
    console.log("펫시터 아이디:"+$("#hiddenPetsitterId"+index).val());
    if($("#checkPetsitterBtnFlag"+index).val()==0) { // 체크 되면 반려견 정보 쿠키 추가
        $("#checkPetsitterBtnFlag"+index).val(1);
        selectPetsitter=true;
        $(this).css({
        'backgroundColor' : '#6ec4c1',
        'color' : "#fff"
        });
        for(var i=1; i<=petsitterCount; i++) {
            if(index!=i) {
                $("#checkPetsitterBtnFlag"+i).val(0);
                $('#petsitterId'+i).css({
                    'backgroundColor': '',
                    'color' : "black"
                });
            }
        }

        // aJax 통신으로 쿠키 등록
        var xhr=new XMLHttpRequest();
        xhr.onreadystatechange=function(){
            if(xhr.readyState==4) {
                if(xhr.status==200) {
                    console.log("펫시터 쿠키 등록 완료:"+xhr.responseText);
                }
            }
        }

        xhr.open("post", "<%=path%>/book/AddPetsitterCookieServlet");
        xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        xhr.send("executeType=add&petsitterId="+$("#hiddenPetsitterId"+index).val());


    }else { // 체크 해제되면 반려견 정보 쿠키 삭제
        // aJax 통신으로 쿠키 삭제
        selectPetsitter=false;
        var xhr=new XMLHttpRequest();
        xhr.onreadystatechange=function(){
            if(xhr.readyState==4) {
                if(xhr.status==200) {
                    console.log("펫시터 쿠키 삭제 완료:"+xhr.responseText);
                }
            }
        }

        xhr.open("post", "<%=path%>/book/AddPetsitterCookieServlet");
        xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
        xhr.send("executeType=delete&petsitterId="+$("#hiddenPetsitterId"+index).val());

        $("#checkPetsitterBtnFlag"+index).val(0);
        for(var i=1; i<=petsitterCount; i++) {
            $("#checkPetsitterBtnFlag"+i).val(0);
            $('#petsitterId'+i).css({
                    'backgroundColor': '',
                    'color' : "black"
            });
        }
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

 function submit_fn() { // 반려견 추가하기 아래 버튼 클릭 시 실행되는 함수
	 if(selectPetsitter) {
        location.href="<%=path%>/book/visitPetsitter5";
	 }else {
		 alert("1명의 펫시터를 선택해주세요.");
	 }
 }


</script>
</html>