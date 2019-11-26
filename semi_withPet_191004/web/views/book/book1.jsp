<%@page import="semi_withPet.model.vo.Member"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member loginMember = null;
	if (request.getAttribute("member") != null) {
		loginMember = (Member) request.getAttribute("member");
	}
	
	Cookie[] cookies = request.getCookies();
	String userPostcode = ""; // 고객 우편번호
	String roadAddress = "";
	String detailAddress = "";

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			switch (cookies[i].getName()) {
			case "userPostcode":
				userPostcode = (cookies[i].getValue() == null) ? "" : cookies[i].getValue();
				break;
			case "roadAddress":
				roadAddress = URLDecoder.decode((cookies[i].getValue() == null) ? "" : cookies[i].getValue(),
						"UTF-8");
				break;
			case "detailAddress":
				detailAddress = URLDecoder.decode((cookies[i].getValue() == null) ? "" : cookies[i].getValue(),
						"UTF-8");
				break;
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

    <!-- 카카오 주소 찾기 API -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

    <!-- 폰트 추가 -->
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-jp.css' rel='stylesheet' type='text/css'>

    <title>방문 펫시터 예약 - step 1/4</title>
</head>

<body>
    <div class="fixedHeader">
        <div style="height: 100%;">
			<button type="button" class="close" aria-label="Close"
				onclick="location.href='<%=path%>/service';">
				<span aria-hidden="true">&times;</span>
			</button>
			방문 펫시터 예약 - step 1/4
        </div>
    </div>
    <div class="container-fluid"  style="height: 90%;">
        <div class="row empty1"></div>
        <div class="row middle">
            <div class="col-12">
                <form action="<%=path%>/book/visitPetsitter2" method="post" onsubmit="return book1_Validate();">
                    <div class="row empty3"></div>
                    <div class="row">
                        <div class="col-12" id="printPetsitterType">
                            방문 펫시터 예약을 위해<br>고객님의 주소를 알려주세요
                        </div>
                    </div>
                    <div class="row empty3"></div>
                    <div class="row">
                        <div class="col-12 centerClass">
                            <!-- 카카오 주소 검색 연동됨 -->
                            <input type="button" class="btn btn-dark btn2" id="searchAddressBtn" style="width:100%;"
                            onclick="execDaumPostcode();" value="주소 검색">
                        </div>
                    </div>
                    <div class="row empty3"></div>
                    <div class="row empty3"></div>
                    <div class="row">
                        <div class="col-12 centerClass">
                            <!-- 카카오 주소 검색 연동됨 -->
                            <input type="button" class="btn btn-dark btn2" id="myAddressBtn" style="width:100%;"
                            onclick="myAddress_fn();" value="내 주소 불러오기">
                        </div>
                    </div>
                    <div class="row empty3"></div>
                    <div class="row" id="addressContainer" style="display: none;">
                        <div class="col" id="address">
                            <label for="" class="addressLabel">우편번호</label>
                            <%if(userPostcode!=null && !userPostcode.equals("")) { %>
                            <input type="text" name="postcode" id="postcode"
                                placeholder="우편번호" class="readonlyInput" value="<%=userPostcode%>" readonly>                            
                            <%}else { %>
                            <input type="text" name="postcode" id="postcode"
                                placeholder="우편번호" class="readonlyInput" readonly>
                            <%} %>
                            <label for="" class="addressLabel">주소</label>
                            <%if(roadAddress!=null && !roadAddress.equals("")) { %>
                            <input type="text" name="roadAddress" id="roadAddress"
                                placeholder="도로명주소" class="readonlyInput" value="<%=roadAddress %>" readonly>
                            <%}else { %>
                            <input type="text" name="roadAddress" id="roadAddress"
                                placeholder="도로명주소" class="readonlyInput" readonly>
                            <%} %>
                            <!-- <label for="" class="addressLabel">지번주소</label><input type="text" name="jibunAddress" id="jibunAddress"
                                placeholder="지번주소" class="readonlyInput" readonly> -->
                            <span id="guide" style="color:#999; display:none"></span>
                            <label for="" class="addressLabel">상세주소</label>
                            <%if(detailAddress!=null && !detailAddress.equals("")) { %>
							<input type="text" name="detailAddress" id="detailAddress" value="<%=detailAddress%>">
                            <%}else { %>
                            <input type="text" name="detailAddress" id="detailAddress">
                            <%} %>
                        </div>
                    </div>

                    <div class="row empty3"></div>
                    <div class="row empty3"></div>
                    <div class="row" id="nextBtnContainer" style="display: none;">
                        <div class="col-12"><input type='submit' class='btn-primary form-control joonsoonBtn' value='다음' id="nextBtn"></div>
                    </div>
                    <div class="row empty3"></div>
                    <div class="row empty3"></div>
                    <div class="row empty3"></div>
                    <div class="row empty3"></div>
                </form>
            </div>
        </div>
        <!-- <div class="row centerClass" id="loginMsgContainer">
        	<div class="col-12" style="font-size:10px;">회원이신가요?<br>로그인 후 빠르게 예약을 진행해보세요</div>
        </div>
        <div class="row" id="loginBtnContainer">
            <div class="col-12"><input type='button' class='btn-primary form-control joonsoonBtn' value='로그인' id="loginBtn"></div>
        </div> -->
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

    /* html{
        font-size:15px;
    } */
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
        height: 50.5px;
    }

    .empty2 {
        height: 50px;
    }

    .empty3 {
        height: 25px;
    }

    .middle {
        /* border: 1px solid black; */
        background-color: whitesmoke;
        height: 100%;
    }

    .footer {
        /* border: 2px solid red; */
        background-color: greenyellow;
        height: 50px;
        text-align: center;
        align-content: center;
    }

    /* div 나누는 거 확인하기 위해 필요한 스타일, 지우지 말 것 */
    /* div[class|=col] {
        border: 2px solid green;
    } */

    .select {
        text-align: center;
    }

    .btn2 {
        width: 45%;
        padding-left: 0px;
        padding-right: 0px;
        margin-right: 10px;
    }

    .joonsoonBtn {
        width: 100%;
    }


    #printPetsitterType {
        text-align: center;
    }

    .centerClass{
        text-align: center;
    }
    .readonlyInput, #detailAddress{
        background-color:whitesmoke;
        color:#7e7a7a;
        border: 1px solid whitesmoke;
        border-bottom-color: #7e7a7a;
        padding: 0px 2px 0px;
        margin-bottom: 10px;
        width: 100%;
        font-size: 14px;
    }
    .addressLabel{
        margin-top: 10px;
        margin-bottom: 0px;
        text-align: right;
    }
    input:-webkit-autofill { /*크롬에서 커서가 올라가면 색상 자동으로 바뀌는 것을 흰색으로 세팅*/
        caret-color: black;
    }
</style>

<script>
    // jQeury 코드
    // $('#commissionBtn').click(function onclick() {   // 가정집펫시터 버튼 클릭 시
    //     $('#printPetsitterType').html('<h1>가정집펫시터를 선택하셨습니다.</h1>').css('color', 'white').css('fontFamily', 'stylish');
    // });
    // $('#visitBtn').click(function onclick() {   // 방문펫시터 버튼 클릭 시
    //     $('#printPetsitterType').html('<h1>방문펫시터를 선택하셨습니다.</h1>').css('color', 'white').css('fontFamily', 'stylish');
    // });


    // $('#nextBtn').click(function onclick() {
    //     // location.href='/book_02.html';
    //     document.id.action='book_02.html';
    //     document.id.submit();
    // });

    
    $(function() { // 화면이 로드되면
    	<%if(!userPostcode.equals("") || !roadAddress.equals("") || !detailAddress.equals("")) { %>
        document.getElementById('addressContainer').style.display = "block";
        document.getElementById('nextBtnContainer').style.display = "block";
        // document.getElementById('loginBtnContainer').style.display = "none";
        // document.getElementById('loginMsgContainer').style.display = "none";
        document.getElementById("searchAddressBtn").value = "주소 다시 검색";
    	<%} %>
    });
	
    function book1_Validate() {
        var postcode=document.getElementById("postcode").value.trim();
        var roadAddress=document.getElementById("roadAddress").value.trim();
        var detailAddress=document.getElementById("detailAddress").value.trim();
        console.log("book1_Validate 실행됨");
        console.log(postcode=="");
        if(postcode=="") {
            alert("우편번호를 입력해주세요.");
            return false;
        }else if(roadAddress=="") {
            alert("도로주소를 입력해주세요.");
            return false;
        }else if(detailAddress=="") {
            alert("상세주소를 입력해주세요.");
            return false;
        }
    }

    function myAddress_fn() {
        // 주소창과 다음 버튼을 보이게 한다.
        document.getElementById('addressContainer').style.display="block";
        document.getElementById('nextBtnContainer').style.display="block";
        // document.getElementById('loginBtnContainer').style.display="none";
        // document.getElementById('loginMsgContainer').style.display="none";
        document.getElementById("searchAddressBtn").value="주소 다시 검색";

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('postcode').value = '000'; // 무조건 000으로 초기화!! 왜냐햐면 회원가입할 때, 우편번호 입력 안받기 때문에
        document.getElementById("roadAddress").value = '<%=loginMember.getAddress().split("subaddr")[0]%>';
        
    	// 상세주소 입력창 값 지우기.
        document.getElementById('detailAddress').value="<%=loginMember.getAddress().split("subaddr")[1]%>";
        
    }

 	// 카카오 주소검색 서비스
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수

                var buildingName = data.buildingName; // 빌딩 이름 받기
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) { // 정규표현식으로 확인
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 주소창과 다음 버튼을 보이게 한다.
                document.getElementById('addressContainer').style.display="block";
                document.getElementById('nextBtnContainer').style.display="block";
                // document.getElementById('loginBtnContainer').style.display="none";
                // document.getElementById('loginMsgContainer').style.display="none";
                document.getElementById("searchAddressBtn").value="주소 다시 검색";

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr+" "+buildingName;

                // 상세주소 입력창에 커서를 옮겨준다.
                document.getElementById('detailAddress').value="";
                document.getElementById('detailAddress').focus();
                // document.getElementById("jibunAddress").value = data.jibunAddress;


                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

</html>