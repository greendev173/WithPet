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
 * Servlet implementation class ViewReviewServlet
 */
@WebServlet("/member/viewReview")
public class ViewReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewReviewServlet() {
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
		// review 에 보여질 petsitter image 파일명 전송
		request.setAttribute("petsitter", petsitter);
		request.setAttribute("petName", petName);
		// payNo에 맞는 리뷰 DB조회
		Review rv = new MemberService().selectReview(payNo);
		request.setAttribute("rv", rv);
		System.out.println(rv);
		// review.jsp로 전송
		request.getRequestDispatcher("/views/review/review.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
