package add_withPet.mypage.controller;

import static common.filter.EncryptPasswordWrapper.getEncryptPw2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import add_withPet.pet.model.service.PetService;
import add_withPet.pet.model.vo.Pet;
import semi_withPet.model.vo.Member;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class UpdateMemberEndServlet
 */
@WebServlet("/member/updateMemberEnd")
public class UpdateMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginMember");
		String id = m.getUserId();
		Pet p = new PetService().selectPet(m.getUserId());
		
		//입력된 정보 받아오기
		String name = request.getParameter("mname");
		String cPw = request.getParameter("pwd");
		String nPw = request.getParameter("nPw");
		String email = request.getParameter("memail");
		String phone = request.getParameter("mphone");
		String addr1 = request.getParameter("maddr1");
		String addr2 = request.getParameter("maddr2");
		m.setUserName(name);
		
		if(nPw != "") {
			//암호화 거친 후 m에 값 넣기
			m.setUserPwd(getEncryptPw2(nPw));
		}else {
			m.setUserPwd(getEncryptPw2(cPw));
		}
	
		
		m.setEmail(email);
		m.setPhone(phone);
		m.setAddress(addr1+"subaddr"+addr2);
		
		int result = new MemberService().updateMember(m);
		
		String msg = "";
		String loc = "";
		
		System.out.println(result);
		if(result>0) {
			msg = "수정이 완료되었습니다.";
			loc = "/member/mypage";
		}else {
			msg = "수정 실패입니다. 다시 시도해주세요.";
			loc = "/member/updateMember";
		}
		
		request.setAttribute("p", p);
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
