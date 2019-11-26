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
import withPet.apply.model.vo.ApplyCert;
import withPet.apply.model.vo.ApplyIntro;
import withPet.apply.model.vo.ApplyMember;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class ShowMemberDetailServlet
 */
@WebServlet("/apply/showMemberDetail")
public class ShowMemberDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowMemberDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String id = loginMember.getUserId();
		
		Member m = new MemberService().selectOne(id);
		if (m != null) {
			request.setAttribute("sMember", m);
			ApplyMember ap = new AdminService().selectApplyMemberId(id);
			ApplyCert cert = new AdminService().selectCert(id);
			ApplyIntro intro = new AdminService().selectIntro(id);
			request.setAttribute("ApplyMember", ap);
			request.setAttribute("cert", cert);
			request.setAttribute("intro", intro);
		}

		request.getRequestDispatcher("/adminPage/views/showMemberDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
