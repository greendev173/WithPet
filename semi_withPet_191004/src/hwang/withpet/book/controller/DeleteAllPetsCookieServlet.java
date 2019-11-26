package hwang.withpet.book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteAllPetsCookieServlet
 */
@WebServlet("/book/DeleteAllPetsCookieServlet")
public class DeleteAllPetsCookieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAllPetsCookieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String executeType=request.getParameter("executeType");
		String petCount=request.getParameter("petCount"); // 반려견 마리수
		String petName=request.getParameter("petName");
		String breed=request.getParameter("breed");
		String petAge=request.getParameter("petAge");
		String petWeight=request.getParameter("petWeight");
		String petId=request.getParameter("petId");
		
		
		if(executeType!=null && executeType.equals("delete") && petCount!=null) {
			System.out.println("\najax통신으로 모든 쿠키 삭제 시작!!");
			int petNo=Integer.parseInt(request.getParameter("petNo")); // 해당 pet의 쿠키 번호
			int integerPetCount=Integer.parseInt(petCount);
			
			System.out.println("ajax통신으로 삭제할 쿠키 이름들: petName"+petNo+", breed"+petNo+", petAge"+petNo+", petWeight"+petNo+", 현재 반려견 수:"+petCount);
			Cookie[] cookies=request.getCookies();
			
			for (int i = 0; i < cookies.length; i++) {
				String cookieName=cookies[i].getName();
				System.out.println("모든 쿠키 이름:"+cookieName+", 쿠키 값:"+URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
				if (cookieName.equals("petName" + petNo)) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				} else if (cookieName.equals("breed" + petNo)) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				} else if (cookieName.equals("petAge" + petNo)) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				} else if (cookieName.equals("petWeight" + petNo)) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				} else if (cookieName.equals("petId" + petNo)) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				} else if (cookieName.equals("petCount")) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
					Cookie petCountC = new Cookie("petCount", Integer.toString((integerPetCount - 1))); // 반려견 마리수 쿠키: 반려견 마리수-1로 저장
					petCountC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					response.addCookie(petCountC); // 반려견 마리수 추가
				}
			}
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.append(petName+", "+breed+", "+petAge+", "+petWeight+", 펫아이디:"+petId);
			System.out.println("ajax통신으로 모든 pet 관련 쿠키 삭제 끝!!");
			
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
