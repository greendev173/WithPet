package yeon_withPet.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi_withPet.model.vo.Member;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class MemberEnrollEnd
 */
@WebServlet(name="memberEnroll",urlPatterns="/memberEnrollEnd")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 입력정보 받아오기
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(pwd);
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String roadaddress= request.getParameter("roadaddress");
		String address_etc = request.getParameter("address_etc");
		String email = request.getParameter("userMail");
		String address = roadaddress + "subaddr" + address_etc;
		// member 객체 생성
		Member m = new Member();
		m.setUserId(id);
		m.setUserPwd(pwd);
		m.setUserName(name);
		m.setPhone(phone);
		m.setAddress(address);
		m.setEmail(email);
		System.out.println(m);
		
		int result = new MemberService().insertMember(m);
		
		String msg = "";
		String loc = "";
		String loc1 = "";
		String view = "/views/common/msg.jsp";
		
		if(result > 0) {
			view = "/views/common/select.jsp";
			msg = "회원 가입이 완료되었습니다. 펫시터 매칭서비스 이용 시, 최소 1마리의 반려동물의 정보가 필요합니다. 입력하시겠습니까?";
			loc = "/enrollPet";
			loc1 = "/";
			request.setAttribute("loc1", loc1);
			request.setAttribute("userId", id);
		} else {
			msg = "회원가입 실패. 다시 시도하세요.";
			loc = "/memberEnroll?userMail="+email;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
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
