package yeon_withPet.member.controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		// true 면 session == null 생성X //false -> session == null 새로생성
		if(session != null) {
			//세션 제거
			session.invalidate();
			
			// 모든 pet 관련 쿠키 삭제하기
			Cookie[] cookies = request.getCookies();
			
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					String cookieName=cookies[i].getName();
					System.out.println("로그아웃 시, 모든 쿠키 출력-> 이름:"+cookieName+", 쿠키 값:"+URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
					if (cookieName.contains("petName")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("breed")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("petAge")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("petWeight")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("petCount")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("checkRequest")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("bookTime")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("detailAddress")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("endDate")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("petsitterType")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("requestCount")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("startDate")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("userPostcode")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("userRequest")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("roadAddress")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("petId")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					} else if (cookieName.contains("petsitterId")) {
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
						System.out.println(cookieName+"쿠키 삭제됨");
					}
				}
			}
			// 모든  pet 관련 쿠키 삭제하기 끝
			
			
			//홈으로 전송
			response.sendRedirect(request.getContextPath()+"/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
