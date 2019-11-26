package yeon_withPet.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class EmailAuthServlet
 */
@WebServlet("/emailcheck")
public class CheckEmailDupleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmailDupleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 유저 메일 받아옴
		String userEmail = request.getParameter("userMail");
		
		// DB에 EMAIL 중복확인
		// true 면 가입가능, false 면 이메일 중복
		boolean checkEmail = new MemberService().checkEmail(userEmail) == null? true : false;
		request.setAttribute("checkEmail", checkEmail);
		request.setAttribute("userMail", userEmail);
		request.getRequestDispatcher("/views/member/checkDupleEmail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
