package withPet.apply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi_withPet.model.vo.Member;
import withPet.admin.service.AdminService;
import withPet.apply.model.service.ApplyService;
import withPet.apply.model.vo.ApplyMember;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class CheckApplyStatusServlet
 */
@WebServlet("/apply/checkApplyStatus")
public class CheckApplyStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckApplyStatusServlet() {
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
		String msg = "";
		String loc = "";
		int result = new ApplyService().checkApply(id);
		System.out.println("ap조회 : " + result);
		if(result > 0 ) {
//			String status = new ApplyService().checkApplyStatus(id);
				Member ckMember = new MemberService().selectOne(id);
				request.setAttribute("ckMember", ckMember);
				ApplyMember ap = new AdminService().selectApplyMemberId(id);
				request.setAttribute("ckApm", ap);
				request.getRequestDispatcher("/adminPage/views/checkApply_Permit.jsp").forward(request, response);
//			} else if(status.equals("D")){
//				Member ckMember = new MemberService().selectOne(id);
//				request.setAttribute("ckMember", ckMember);
//				ApplyMember ap = new AdminService().selectApplyMemberId(id);
//				request.setAttribute("ckApm", ap);
//				request.getRequestDispatcher("/adminPage/views/checkApply_Deny.jsp").forward(request, response);
//			} else {
//				Member ckMember = new MemberService().selectOne(id);
//				request.setAttribute("ckMember", ckMember);
//				ApplyMember ap = new AdminService().selectApplyMemberId(id);
//				request.setAttribute("ckApm", ap);
//				request.getRequestDispatcher("/adminPage/views/checkApply_Ready.jsp").forward(request, response);
//			}
			
		} else {
			msg = "지원중이지 않습니다, 지원페이지로 이동합니다";
			loc = "/apply/apply_form";
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
