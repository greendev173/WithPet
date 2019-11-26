package yeon_withPet.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi_withPet.model.vo.Member;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class LoginExecServlet
 */
@WebServlet(name="loginServlet", urlPatterns="/loginexec")
public class LoginExecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginExecServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// id, pw 값 받아옴
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		
		// 아이디 저장 체크 값 받아오기
		String saveId = request.getParameter("saveId");
		
		// 비지니스 로직
		MemberService service = new MemberService();
		char isMemberYN = service.checkIsMember(id);
		
		Member m = null;
		if(isMemberYN=='Y') {
			m = service.selectId(id, pw);			
		}
		
		System.out.println(m);
		
		// view page 선택
		String msg = "";
		String loc = "/";
		String view = "/views/common/msg.jsp";
		if(m != null) {
			// session에 로그인한 회원 데이터 저장
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", m);
			
			// 세션 timeout : 30min 설정
			session.setMaxInactiveInterval(60*30);
			
			// 아이디 저장 프로세스
			if(saveId != null) {
				// key value형식으로 cookie객체 생성
				Cookie c = new Cookie("saveId", id);
				
				c.setMaxAge(24*60*60); // 쿠기 만료시간 설정
				response.addCookie(c);
			} else {
				// 아이디 저장 체크되있지 않으면 saveId 초기화
				Cookie c = new Cookie("saveId", id);
				c.setMaxAge(0);
				response.addCookie(c);
			}
			
			response.sendRedirect(request.getContextPath());
		} else {
			msg = "로그인에 실패하였습니다. 다시 시도하세요.";
			loc = "/login";
			// msg.jsp로 안내
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher(view).forward(request, response);
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
