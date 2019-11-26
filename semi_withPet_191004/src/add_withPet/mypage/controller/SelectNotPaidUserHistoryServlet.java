package add_withPet.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import add_withPet.pet.model.vo.UsageHistory;
import jimin_withPet.model.vo.Petsitter;
import semi_withPet.model.vo.Member;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class SelectNotPaidUserHistoryServlet
 */
@WebServlet("/member/selectUH")
public class SelectNotPaidUserHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNotPaidUserHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		// 세션에서 Member 객체 값 가져오기
		Member m = (Member)session.getAttribute("loginMember");
		MemberService service = new MemberService();
		// 페이징 처리
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		
		int numPerPage = 10;
		
		//비지니스로직
		String userId= m.getUserId();
		String purpose = "N"; //Y= 결제완료 , N = 결제X
		List<UsageHistory> list = service.selectUserHistory(userId, purpose, cPage, numPerPage);
		
		// 
		int totalData = service.selectUserHistoryList(userId, purpose);
		int totalPage = (int)Math.ceil((double)totalData / numPerPage);
		String pageBar = "";
		int pageBarSize = 5;
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		// 페이지바 만들기
		if(pageNo == 1) {
			pageBar += "<li class='page-item'><a class='page-link'>이전</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/member/selectUH?cPage=" + (pageNo -1) + "'>이전</a></li>";
		}
		
		// 페이지 숫자 출력
		while(!(pageNo > pageEnd || pageNo > totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<li class='page-item'><a class='page-link'>" + pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/member/selectUH?cPage=" + pageNo + "'>" + pageNo + "</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo > totalPage) {
			pageBar += "<li class='page-item'><a class='page-link'>다음</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() + "/member/selectUH?cPage=" + pageNo + "&numPerPage=" + numPerPage + "'></a></li>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		
		String view = "";
		// list 값 유무에 따른 분기
		if(list != null) {
			// 임시저장내역 가지고오기
			for(UsageHistory uh : list) {
				// 펫 이름 DB에서 가지고 오기
				String petName = service.selectPet(uh.getPetId());
				uh.setPetName(petName);
				uh.setReviewCount(service.countReview(uh.getPayNo()));
			}
			view = "/views/member/temp_userHistory.jsp";
			request.setAttribute("list", list);
		} else {
			String msg = "임시 저장 내역이 없습니다.";
			String loc = request.getContextPath()+"/member/mypage";
			view = "/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		
		// view 페이지 호출
		request.setAttribute("purpose", purpose);
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
