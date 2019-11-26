package son_withPet.book.controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hwang.withpet.book.model.service.BookService;
import hwang.withpet.book.model.vo.Book;
import hwang.withpet.book.model.vo.Price;
import semi_withPet.model.vo.Member;

/**
 * Servlet implementation class VisitPetSitterEndServlet
 */
@WebServlet("/book/petsitterHomeEnd")
public class VisitPetSitterEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisitPetSitterEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	//////////////////
		HttpSession session = request.getSession(false);
		
		String viewPath = "/views/common/msg.jsp"; // view 페이지 경로
		
		if(session!=null && session.getAttribute("loginMember")!=null) { // 로그인을 했으면
			Member sessionM = (Member)session.getAttribute("loginMember");  // 세션에서 로그인 정보 가져오기
			String sessionId = sessionM.getUserId(); // 로그인 정보의 아이디 받아오기
			System.out.println("로그인 한 아이디:"+sessionId);

			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				String userPostcodeC = "";
				String roadAddressC = "";
				String detailAddressC = "";
				System.out.println("쿠키 길이:" + cookies.length);
				for (int i = 0; i < cookies.length; i++) {
					String cookieName = cookies[i].getName();
					String cookieValue = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
					System.out.println("쿠키이름:" + cookieName+", 쿠키 값:"+cookieValue);
					if (cookieName.equals("userPostcode")) { // userPostcode 쿠키가 있으면
						userPostcodeC = cookieValue;
					} else if (cookieName.equals("roadAddress")) { // roadAddress 쿠키가 있으면
						roadAddressC = cookieValue;
					} else if (cookieName.equals("detailAddress")) { // detailAddress 쿠키가 있으면
						detailAddressC = cookieValue;
					}
				}

				if (userPostcodeC.equals("")) {
					String msg = "우편번호가 입력되지 않았습니다.";
					String loc = "/book/visitPetsitter1";
					viewPath = "/views/common/msg.jsp";
					request.setAttribute("msg", msg);
					request.setAttribute("loc", loc);
				} else if (roadAddressC.equals("")) {
					String msg = "도로주소가 입력되지 않았습니다.";
					String loc = "/book/visitPetsitter1";
					viewPath = "/views/common/msg.jsp";
					request.setAttribute("msg", msg);
					request.setAttribute("loc", loc);
				} else if (detailAddressC.equals("")) {
					String msg = "상세주소가 입력되지 않았습니다.";
					String loc = "/book/visitPetsitter1";
					viewPath = "/views/common/msg.jsp";
					request.setAttribute("msg", msg);
					request.setAttribute("loc", loc);
				}else { // 주소 쿠키가 있으면
					// /book/book1.jsp에서 입력한 값 받아오기
					String petsitterType=request.getParameter("petsitterType");
					String userPostcode=request.getParameter("userPostcode");
					String roadAddress = request.getParameter("roadAddress");
					String detailAddress = request.getParameter("detailAddress");
					String petsitterId=request.getParameter("petsitterId");
					String petsitterGrade=request.getParameter("petsitterGrade");

					if(petsitterType!=null && userPostcode!=null && roadAddress!=null && detailAddress!=null) { // 로그인한 상태에서 bookResult.jsp에서 다음 버튼 누르면
						String userAddress = roadAddress + "subaddr" + detailAddress;
						
						System.out.println("visitPetsitterEndSevlet 서블릿 디버깅, 펫시터 타입:"+petsitterType);
						System.out.println("visitPetsitterEndSevlet 서블릿 디버깅, 고객 우편번호:"+userPostcode);
						System.out.println("visitPetsitterEndSevlet 서블릿 디버깅, 고객 주소:"+userAddress);
						
						// /book/book2.jsp에서 입력한 값 받아오기
						int petCount=Integer.parseInt(request.getParameter("petCount"));
						System.out.println("visitPetsitterEndSevlet 서블릿 디버깅, 고객 강아지 마리 수:"+petCount);
						
						BookService bookService=new BookService();
						Price price=new Price();
						price=bookService.selectPrice();
						
						String[] petNameList=new String[petCount];
						String[] petBreedList=new String[petCount];
						int[] petAgeList=new int[petCount];
						Double[] petWeightList=new Double[petCount];
						int[] petIdList=new int[petCount];
						int[] priceList=new int[petCount];
						for(int i=0; i<petCount; i++) { // 고객 강아지 정보 배열에 저장하기
							if(request.getParameter("petId"+(i+1))!=null) { // 펫정보가 있으면
								petNameList[i]=request.getParameter("petName"+(i+1));
								petBreedList[i]=request.getParameter("breed"+(i+1));
								petAgeList[i]=Integer.parseInt(request.getParameter("petAge"+(i+1)));
								petWeightList[i]=Double.parseDouble(request.getParameter("petWeight"+(i+1)));
								if(petWeightList[i]>=20) { // 대형견일 때
									priceList[i]=price.getPricePerWeight()*3+price.getPricePerTime();
								}else if(petWeightList[i]>=10 && petWeightList[i]<20) { // 중형견일 때
									priceList[i]=price.getPricePerWeight()*2+price.getPricePerTime();
								}else { // 소형견일 때
									priceList[i]=price.getPricePerWeight()*1+price.getPricePerTime();
								}
								if(petsitterGrade.equals("G")) {
									priceList[i]+=priceList[i]+price.getPricePerGrade();
								}else if(petsitterGrade.equals("M")) {
									priceList[i]+=priceList[i]+(price.getPricePerGrade()*2);
								}
								System.out.println("visitPetsitterEndSevlet 서블릿 디버깅, 고객 "+(i+1)+"번째 강아지 정보:"
											+"이름:"+petNameList[i]+", 견종:"+petBreedList[i]+", 반려견 나이:"+petAgeList[i]+", 반려견 무게:"+petWeightList[i]);		
								if(request.getParameter("petId"+(i+1)).equals("0")) { // 새로운 반려견이면
									petIdList[i]=0;
									System.out.println("visitPetsitterEndSevlet 서블릿 디버깅, 고객 "+(i+1)+"번째 강아지 정보:"
												+"펫아이디:"+petIdList[i]+", 돌봄 가격:"+priceList[i]+"원");
								}else { // 기존에 등록된 반려견이면
									petIdList[i]=Integer.parseInt(request.getParameter("petId"+(i+1)));
									System.out.println("visitPetsitterEndSevlet 서블릿 디버깅, 고객 "+(i+1)+"번째 강아지 정보:"
												+"펫아이디:"+petIdList[i]+", 돌봄 가격:"+priceList[i]+"원");
								}
									
							}
						}

						// /book/book3.jsp에서 입력한 값 받아오기
						String startDate = request.getParameter("startDate");
						String endDate = request.getParameter("endDate");
						String time = request.getParameter("time");

						// /book/book4.jsp에서 입력한 값 받아오기
						int requestCount = Integer.parseInt(request.getParameter("requestCount")); // 체크 요청사항 개수 받아오기
						String[] checkRequestArray = new String[requestCount];
						for(int i=0; i<requestCount; i++) {
							checkRequestArray[i] = request.getParameter("checkRequest"+(i+1)); // 체크 요청사항 받아오기
						}
						String checkRequest = String.join(",", checkRequestArray); // 체크 요청사항 합치기
						String userRequest = request.getParameter("userRequest"); // 기타 요청사항 받아오기
						userRequest = checkRequest + "," + userRequest;

						System.out.println("visitPetsitterEndSevlet 서블릿 디버깅(요청사항):" + userRequest);
						Book b = new Book(); // 예약 객체 생성
						
						b.setUserId(sessionId); // 사용자 아이디 저장
						
						// /book/book1.jsp에서 입력한 값 저장
						b.setUserPostcode(userPostcode);
						b.setUserAddress(userAddress);

						// /book/book2.jsp에서 입력한 값 저장
						b.setPetNameList(petNameList);
						b.setPetBreedList(petBreedList);
						b.setPetAgeList(petAgeList);
						b.setPetWeightList(petWeightList);
						b.setPetIdList(petIdList);

						// /book/book3.jsp에서 입력한 값 저장
						b.setStartDate(startDate);
						b.setEndDate(endDate);
						b.setBookTime(time);

						// /book/book4.jsp에서 입력한 값 저장
						b.setUserRequest(userRequest);
						
						// /book/bookSelectPetsitter.jsp에서 입력한 값 저장
						b.setPetsitterId(petsitterId);
						
						b.setPriceList(priceList);
						b.setPayYN("N"); // 결제 이전이므로 N으로 저장

						//////////// 비즈니스 로직 시작
						int result=0;
						result=bookService.insertBook(b, petCount);
						///////////// 비즈니스 로직 끝
						
						String msg="";
						if(result>0) { // 예약이 되었으면
							msg="예약이 완료되었습니다.";
							
							// 모든 쿠키 삭제하기
							for (int i = 0; i < cookies.length; i++) {
								String cookieName=cookies[i].getName();
								System.out.println("쿠키 이름:"+cookieName+", 쿠키 값:"+URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
								if (cookieName.contains("petName")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("breed")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("petAge")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("petWeight")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("petCount")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("checkRequest")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("bookTime")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("detailAddress")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("endDate")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("petsitterType")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("requestCount")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("startDate")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("userPostcode")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("userRequest")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("roadAddress")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								} else if (cookieName.contains("petId")) {
									cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
									cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
									response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
								}
							}
							// 모든 쿠키 삭제하기 끝
							
						}else {
							msg="예약이 실패하였습니다.\\n다시 시도해 주세요.";
						}
						

						String loc="/";
						request.setAttribute("msg", msg);
						request.setAttribute("loc", loc);
					}else { // 로그인 한 상태에서 url(/book/visitPetsitterEnd)로 바로 접속하면
						String loc="/";
						String msg="잘못된 접근 경로 입니다.";
						request.setAttribute("msg", msg);
						request.setAttribute("loc", loc);
					}
					
				}
			}
			
			
			
		}else { // 로그인을 하지 않았으면
			request.setAttribute("msg", "로그인 후 이용하실 수 있습니다.");
			request.setAttribute("loc", "/login");
			request.setAttribute("afterLoc", "/book/visitPetsitter1");
			viewPath="/views/common/msg.jsp";
		}
		/////////////////
		
		
		
		request.getRequestDispatcher(viewPath).forward(request, response); // 해당 경로로 객체 보내기
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
