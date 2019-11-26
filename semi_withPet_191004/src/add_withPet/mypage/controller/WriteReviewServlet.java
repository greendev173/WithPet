package add_withPet.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import add_withPet.pet.model.vo.Review;
import add_withPet.pet.model.vo.UsageHistory;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class WriteReviewServlet
 */
@WebServlet("/member/writeReview")
public class WriteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int payNo = Integer.parseInt(request.getParameter("payNo"));
		String petsitter = request.getParameter("petsitter");
		String petName = request.getParameter("petName");
		
		// payNo에 맞는 리뷰 DB조회
		UsageHistory uh = new MemberService().selectUserHistoryOne(payNo);
		String msg = "";
		String loc = "";
		String view = "";
		if(uh != null) {
			// review 에 보여질 petsitter image 파일명 전송
			request.setAttribute("petsitter", petsitter);
			request.setAttribute("petName", petName);
			request.setAttribute("uh", uh);
			view = "/views/review/writeReview.jsp";
		} else {
			msg = "조회 결과가 존재하지 않습니다.";
			loc = "/member/mypage";
			view = "/views/common/msg.jsp";
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
