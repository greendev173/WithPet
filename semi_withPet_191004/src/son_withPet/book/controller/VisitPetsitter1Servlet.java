package son_withPet.book.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi_withPet.model.vo.Member;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class VisitPetsitter1Servlet
 */
//@WebServlet(name="visitPetsitter1", urlPatterns="/book/visitPetsitter1")
@WebServlet("/book/petsitterHome1")
public class VisitPetsitter1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VisitPetsitter1Servlet() {
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
		System.out.println("\n" + time1+" visitPetsitter1Sevlet 들어옴");
		
		// 준순 추가(url창에 주소 입력하고 들어올때 접근 막기) 
		// getSession(true) : 세션아이디가 있으면 가져오고 없으면 생성해서 가져와라
		// getSession(false) : 세션아이디가 있으면 가져오고 없으면 null값 반환
		//request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		
		String viewPath="";
		
		if(session!=null && session.getAttribute("loginMember")!=null) { // 로그인을 했으면
			Member sessionM = (Member)session.getAttribute("loginMember");  // 세션에서 로그인 정보 가져오기
			String sessionId = sessionM.getUserId(); // 로그인 정보의 아이디 받아오기
			System.out.println("로그인 한 아이디:"+sessionId);
			Member m=new MemberService().selectOne(sessionId);
			request.setAttribute("member", m);
			viewPath="/views/homePetsitter/book1.jsp";
		}else { // 로그인을 하지 않았으면
			request.setAttribute("msg", "로그인 후 이용하실 수 있습니다.");
			request.setAttribute("loc", "/login");
			request.setAttribute("afterLoc", "/book/petsitterHome1");
			viewPath="/views/common/msg.jsp";
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
