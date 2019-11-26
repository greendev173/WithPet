package add_withPet.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class DeleteReviewServlet
 */
@WebServlet("/member/deleteReview")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewServlet() {
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
		System.out.println(payNo);
		//DB처리
		int result = new MemberService().deleteReview(payNo);
		
		// view페이지 선택
		String msg = "";
		String loc = "/";
		String view = "/views/common/msg.jsp";
		if(result > 0){
			msg = "리뷰를 성공적으로 삭제하였습니다.";
			loc = "/close";
		} else {
			msg = "리뷰삭제에 실패하였습니다. 다시시도하세요.";
			loc = "/member/viewReview?payNo="+payNo+"&petsitter="+petsitter+"&petName="+petName;
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
