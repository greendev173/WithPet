package hwang.withpet.book.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hwang.withpet.book.model.vo.Book;
import hwang.withpet.pet.model.service.PetService;
import hwang.withpet.pet.model.vo.Pet;
import semi_withPet.model.vo.Member;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class BookVisitPetsitterServlet
 */
@WebServlet(name="visitPetsitter2", urlPatterns="/book/visitPetsitter2")
public class VisitPetsitter2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisitPetsitter2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 현재 시간 출력
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
		Date time = new Date();
		String time1 = format1.format(time);
		System.out.println("\n" + time1+" visitPetsitter2Sevlet 들어옴");
		
		HttpSession session = request.getSession(false);

		String viewPath="/views/book/book2.jsp";

		if (session != null && session.getAttribute("loginMember") != null) { // 로그인을 했으면
			Member sessionM = (Member) session.getAttribute("loginMember"); // 세션에서 로그인 정보 가져오기
			String sessionId = sessionM.getUserId(); // 로그인 정보의 아이디 받아오기
			System.out.println("로그인 한 아이디:" + sessionId);
			// 회원 정보 받아오기
			Member m = new MemberService().selectOne(sessionId);
			request.setAttribute("member", m);
			
			// 회원의 반려견 정보 받아오기
			List<Pet> petList=new PetService().selectPetList(sessionId);
			request.setAttribute("petList", petList);
			
			
			String petsitterType = "방문펫시터";

			// /book/book1.jsp에서 입력한 값 받아오기
			String userPostcode = request.getParameter("postcode");
			System.out.println("visitPetsitter2Sevlet 서블릿 디버깅, 우편번호:" + userPostcode);

			//String jibunAddress = request.getParameter("jibunAddress");
			String roadAddress = request.getParameter("roadAddress");
			String detailAddress = request.getParameter("detailAddress");
			String userAddress = roadAddress + " " + detailAddress;
			System.out.println("visitPetsitter2Sevlet 서블릿 디버깅, 고객 주소:" + userAddress);
			

			// 쿠키 생성
			if(userPostcode!=null && roadAddress!=null && detailAddress!=null) { // 값들이 null 아닐 때만 쿠키 생성
				Cookie petsitterTypeC=new Cookie("petsitterType", URLEncoder.encode(petsitterType, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
				Cookie userPostcodeC=new Cookie("userPostcode", userPostcode);	// 쿠키 객체 생성, key : value 형식
				Cookie roadAddressC=new Cookie("roadAddress", URLEncoder.encode(roadAddress, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
				Cookie detailAddressC=new Cookie("detailAddress", URLEncoder.encode(detailAddress, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
//				petsitterTypeC.setPath("/semi_withPet/book"); // 쿠키 경로 지정, 해당 경로에서만 쿠키를 서버측으로 전송한다.
//				userPostcodeC.setPath("/semi_withPet/book"); // 쿠키 경로 지정
//				roadAddressC.setPath("/semi_withPet/book"); // 쿠키 경로 지정
//				detailAddressC.setPath("/semi_withPet/book"); // 쿠키 경로 지정
				petsitterTypeC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
				userPostcodeC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
				roadAddressC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
				detailAddressC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
				response.addCookie(petsitterTypeC); // 쿠키 추가
				response.addCookie(userPostcodeC); // 쿠키  추가
				response.addCookie(roadAddressC); // 쿠키 추가
				response.addCookie(detailAddressC); // 쿠키 추가
			}else { // null 값이 하나라도 있으면
				Cookie[] cookies=request.getCookies();
				if(cookies!=null) {
					String userPostcodeC="";
					String roadAddressC="";
					String detailAddressC="";
					System.out.println("쿠키 길이:"+cookies.length);
					for (int i = 0; i < cookies.length; i++) {
						String cookieName = cookies[i].getName();
						System.out.println("쿠키이름:"+cookieName);
						if (cookieName.equals("userPostcode")) { // userPostcode 쿠키가 있으면
							userPostcodeC=cookies[i].getValue();
						} else if (cookieName.equals("roadAddress")) { // roadAddress 쿠키가 있으면
							roadAddressC=cookies[i].getValue();
						} else if (cookieName.equals("detailAddress")) { // detailAddress 쿠키가 있으면
							detailAddressC=cookies[i].getValue();
						}
					}
					
					if(userPostcodeC.equals("")) {
						String msg = "우편번호가 입력되지 않았습니다.";
						String loc = "/book/visitPetsitter1";
						viewPath="/views/common/msg.jsp";
						request.setAttribute("msg", msg);
						request.setAttribute("loc", loc);
					}else if(roadAddressC.equals("")) {
						String msg = "도로주소가 입력되지 않았습니다.";
						String loc = "/book/visitPetsitter1";
						viewPath="/views/common/msg.jsp";
						request.setAttribute("msg", msg);
						request.setAttribute("loc", loc);
					}else if(detailAddressC.equals("")) {
						String msg = "상세주소가 입력되지 않았습니다.";
						String loc = "/book/visitPetsitter1";
						viewPath="/views/common/msg.jsp";
						request.setAttribute("msg", msg);
						request.setAttribute("loc", loc);
					}
				}
			}
		} else { // 로그인을 하지 않았으면
			request.setAttribute("msg", "로그인 후 이용하실 수 있습니다.");
			request.setAttribute("loc", "/login");
			viewPath = "/views/common/msg.jsp";
		}

		

		request.getRequestDispatcher(viewPath).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
