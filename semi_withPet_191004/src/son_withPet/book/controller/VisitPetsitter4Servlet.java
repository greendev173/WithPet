package son_withPet.book.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hwang.withpet.book.model.vo.Book;

/**
 * Servlet implementation class visitPetsitter4Servlet
 */
@WebServlet("/book/petsitterHome4")
public class VisitPetsitter4Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisitPetsitter4Servlet() {
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
		System.out.println("\n" + time1+" visitPetsitter4Sevlet 들어옴");
			
		String viewPath = "/views/homePetsitter/book4.jsp"; // view 페이지 경로
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			String userPostcodeC = "";
			String roadAddressC = "";
			String detailAddressC = "";
			System.out.println("쿠키 길이:" + cookies.length);
			for (int i = 0; i < cookies.length; i++) {
				String cookieName = cookies[i].getName();
				System.out.println("쿠키이름:" + cookieName);
				if (cookieName.equals("userPostcode")) { // userPostcode 쿠키가 있으면
					userPostcodeC = cookies[i].getValue();
				} else if (cookieName.equals("roadAddress")) { // roadAddress 쿠키가 있으면
					roadAddressC = cookies[i].getValue();
				} else if (cookieName.equals("detailAddress")) { // detailAddress 쿠키가 있으면
					detailAddressC = cookies[i].getValue();
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
			}
		}
		
		
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