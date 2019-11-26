package yeon_withPet.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi_withPet.model.vo.Member;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class UpdatePointServlet
 */
@WebServlet("/member/updatePoint")
public class UpdatePointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		Member lm = (Member)session.getAttribute("loginMember");
		Member m1 = new MemberService().selectOne(lm.getUserId());
		String msg = "";
		String loc = "/member/mypage";
		int point = Integer.parseInt(request.getParameter("point"));
		int cPoint = m1.getPoint() + point;
		int result = new MemberService().updatePoint(lm.getUserId(), point,cPoint);
		if(result > 0) {
			msg = "충전이 정상적으로 완료되었습니다";
		} else {
			msg = "정상적으로 처리되지 않았습니다. 다시시도하세요";
		}
		Member m5 = new MemberService().selectOne(lm.getUserId());
		System.out.println("포인트 : " + m5.getPoint());
		
		session.setAttribute("cpMember", m5);
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
