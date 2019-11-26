package yeon_withPet.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi_withPet.model.vo.Member;
import yeon_withPet.member.model.service.MemberService;
import yeon_withPet.member.model.service.SendMail;

/**
 * Servlet implementation class MemberIDFindServlet
 */
@WebServlet("/memberFindId")
public class MemberIDFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIDFindServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		// DB에서 일치하는 이름과 이메일 확인
		Member m = new MemberService().findId(name, email);
		String msg = "";
		String loc = "";
		String view = "";
		String purpose = "아이디";
		String target = "";
		if(m != null) {
			
			target = m.getUserId();
			
			// 메일발송 객체
			// purpose : 찾고자하는 종류(Id, pw)
			// target : 찾은 대상값
			// email : 전송할 이메일주소
			// 찾은 결과는 1, -1을 리턴함
			int result = new SendMail().sendMail(purpose, target, email);
			if(result > 0) {
			view = "/views/member/findResult.jsp";
			request.setAttribute("target", target);
			request.setAttribute("purpose", purpose);
			request.setAttribute("email", email);
			} else {
				msg = "이메일 전송에 오류가 발생했습니다. 관리자에게 문의하세요.";
	 			view = "/views/common/msg.jsp";
	 			loc = "/";
	 			request.setAttribute("msg", msg);
	 			request.setAttribute("loc", loc);
			}
 		} else {
 			msg = "일치하는 아이디가 없습니다. 다시 시도하세요.";
 			view = "/views/common/msg.jsp";
 			loc = "/member/findId";
 			request.setAttribute("msg", msg);
 			request.setAttribute("loc", loc);
 		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
