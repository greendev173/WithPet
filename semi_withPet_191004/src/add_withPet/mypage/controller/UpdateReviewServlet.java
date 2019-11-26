package add_withPet.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import add_withPet.pet.model.vo.Review;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class UpdateReviewServlet
 */
@WebServlet("/member/updateReview")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
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
		Review rv = new MemberService().selectReview(payNo);
		rv.setPayNo(payNo);
		request.setAttribute("rv", rv);
		request.setAttribute("petName", petName);
		request.setAttribute("petsitter", petsitter);
		request.getRequestDispatcher("/views/review/updateReview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
