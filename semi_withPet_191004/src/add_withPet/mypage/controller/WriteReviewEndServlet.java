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
 * Servlet implementation class WriteReviewEndServlet
 */
@WebServlet("/member/writereviewEnd")
public class WriteReviewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteReviewEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int payNo = Integer.parseInt(request.getParameter("payNo"));
		String revContent = request.getParameter("revContent");
		int revPoint = Integer.parseInt(request.getParameter("revPoint"));
		
		String petName = request.getParameter("petName");
		String petsitter = request.getParameter("petsitter");
		// payNo 정보로 usageHistory불러옴
		UsageHistory uh = new MemberService().selectUserHistoryOne(payNo);
		
		// review 객체 정보 셋팅
		Review rv = new Review();
		rv.setPetId(Integer.parseInt(uh.getPetId()));
		rv.setPetsitterId(uh.getPetsitterId());
		rv.setPayNo(payNo);
		rv.setRevContent(revContent);
		rv.setRevPoint(revPoint);
		rv.setWriter(uh.getUserId());
		
		int result = new MemberService().insertReview(rv);
		
		// view페이지 선택
		String msg = "";
		String loc = "/";
		String view = "/views/common/msg.jsp";
		if(result > 0){
			msg = "리뷰를 성공적으로 등록하였습니다.";
			loc = "/close";
		} else {
			msg = "리뷰등록에 실패하였습니다. 다시시도하세요.";
			loc = "/member/writeReview?payNo="+payNo+"&petsitter="+petsitter+"&petName="+petName;
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
