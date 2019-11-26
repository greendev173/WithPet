package add_withPet.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import add_withPet.pet.model.service.PetService;
import add_withPet.pet.model.vo.Pet;
import add_withPet.pet.model.vo.UsageHistory;
import semi_withPet.model.vo.Member;
import semi_withPet.model.vo.Point;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/member/mypage")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션에 저장된 member 정보 받아오기
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginMember");
		Member m1 = new MemberService().selectOne(m.getUserId());
		//페이징 처리 
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		
		int numPerPage = 5;
		
		
		
		
		//mypage header부분에 pet 정보 저장하기 위해 pet p 객체 받아오기
		Pet p = new PetService().selectPet(m.getUserId());
		List<Pet> petList = new PetService().selectPetList(m.getUserId());
		List<Point> pointList = new MemberService().selectPointList(m.getUserId());
		List<UsageHistory> usageList = new MemberService().selectUserHistory(m.getUserId(), "N", cPage, numPerPage);
		List<String> pstImgs = new MemberService().selectPstProfiles(m.getUserId());
		List<Member> pstInfo = new MemberService().selectPstInfoList(m.getUserId());
		
		//---------------페이징 처리 2==============
		int totalData = new MemberService().selectUserHistoryList(m.getUserId(), "N");
		int totalPage = (int)Math.ceil((double)totalData / numPerPage);
		String pageBar = "";
		int pageBarSize = 5;
		int pageNo = ((cPage - 1)/pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		// 페이지바 만들기
		if(pageNo == 1) {
			pageBar += "<a class='page-link'>이전</a>";
		} else {
			pageBar += "<a class='page-link' href='" + request.getContextPath() + "/member/mypage?cPage=" + (pageNo -1) + "'>이전</a>";
		}
		
		// 페이지 숫자 출력
		while(!(pageNo > pageEnd || pageNo > totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<a class='page-link'>" + pageNo + "</a></li>";
			} else {
				pageBar += "<a class='page-link' href='" + request.getContextPath() + "/member/mypage?cPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
		}
		
		if(pageNo > totalPage) {
			pageBar += "<a class='page-link'>다음</a></li>";
		} else {
			pageBar += "<a class='page-link' href='" + request.getContextPath() + "/member/mypage?cPage=" + pageNo + "&numPerPage=" + numPerPage + "'></a>";
		}
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		
		
		
		
		
		
		
		
		if(m != null) {
		request.setAttribute("pstImgs", pstImgs);
		request.setAttribute("pstInfo", pstInfo);
		request.setAttribute("pointList", pointList);
		request.setAttribute("usageList", usageList);
		session.setAttribute("loginMember", m);
		request.setAttribute("changeMember", m1);
		session.setAttribute("p", p);
		request.setAttribute("petList", petList);
		
		
		request.getRequestDispatcher("/views/member/mypage.jsp").forward(request, response);
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
