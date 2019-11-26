package hwang.withpet.book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddPetsitterCookieServlet
 */
@WebServlet("/book/AddPetsitterCookieServlet")
public class AddPetsitterCookieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPetsitterCookieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String executeType=request.getParameter("executeType");
		String petsitterId=request.getParameter("petsitterId"); // 펫시터 아이디 받아오기
		
		if(executeType!=null && executeType.equals("add") && petsitterId!=null) { // executeType이 add이면
			System.out.println("\najax통신으로 petsitterId 쿠키 등록 시작!!");
			
			System.out.println("ajax통신으로 등록할 petsitterId 쿠키 값:"+petsitterId);
			
			Cookie petsitterIdC=new Cookie("petsitterId", URLEncoder.encode(petsitterId, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
			petsitterIdC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			response.addCookie(petsitterIdC); // 쿠키 추가
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.append("등록된 쿠키 이름:petsitterId, 쿠키 값:"+petsitterId);
			System.out.println("ajax통신으로 petsitterId 쿠키 등록 끝!!");
		}else if(executeType!=null && executeType.equals("delete") && petsitterId!=null){
			System.out.println("\najax통신으로 petsitterId 쿠키 삭제 시작!!");
			
			System.out.println("ajax통신으로 삭제할 petsitterId 쿠키 값:"+petsitterId);
			
			Cookie petsitterIdC=new Cookie("petsitterId", URLEncoder.encode(petsitterId, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
			petsitterIdC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			petsitterIdC.setMaxAge(0); // 쿠키 유효시간 만료
			response.addCookie(petsitterIdC); // 쿠키 추가
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.append("삭제된 쿠키 이름:petsitterId, 쿠키 값:"+petsitterId);
			System.out.println("ajax통신으로 petsitterId 쿠키 삭제 끝!!");
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
