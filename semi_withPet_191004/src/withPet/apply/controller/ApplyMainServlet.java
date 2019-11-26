package withPet.apply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi_withPet.model.vo.Member;

/**
 * Servlet implementation class ApplyMainServlet
 */
@WebServlet("/apply/apply_main")
public class ApplyMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = "";
		String msg = "";
		String loc = "";
		HttpSession session = request.getSession();
		Member m = null;
		
		if(session.getAttribute("loginMember")!=null) {
			m = (Member)session.getAttribute("loginMember");
			id = request.getParameter("userId");
			msg = "지원 페이지 메인화면으로 이동합니다.";
			loc = "/adminPage/apply_main.jsp";
		} else {
			msg = "로그인이 필요한 서비스입니다. 로그인화면으로 이동합니다.";
			loc = "/member/login";
		}
		
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
