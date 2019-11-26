package withPet.apply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi_withPet.model.vo.Member;
import withPet.apply.model.service.ApplyService;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class ApplySuvlet
 */
@WebServlet("/apply/apply_form")
public class ApplyFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginMember");
		String id = m.getUserId();
		String status = new ApplyService().checkApplyStatus(id);
		if(status != null) {
			String msg = "이미 신청하셨습니다!. 지원 현황페이지로 이동합니다";
			String loc = "/apply/checkApplyStatus";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		Member ap_member = new MemberService().selectOne(id);
		
		request.setAttribute("ap_member", ap_member);
		
		request.getRequestDispatcher("/adminPage/apply_form.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
