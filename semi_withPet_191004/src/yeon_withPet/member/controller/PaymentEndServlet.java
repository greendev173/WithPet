package yeon_withPet.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi_withPet.model.vo.Member;
import yeon_withPet.member.model.service.MemberService;

/**
 * Servlet implementation class PaymentEndServlet
 */
@WebServlet("/member/paymentEnd")
public class PaymentEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("loginMember");
		String id = m.getUserId();
		Member m1 = new MemberService().selectOne(id);
		int cPoint = m1.getPoint();
		int price = cPoint - (Integer.parseInt((String)request.getParameter("price")));
		int payNo = Integer.parseInt(request.getParameter("payNo"));
		int endPrice = Integer.parseInt(request.getParameter("price"));
		int result = new MemberService().paymentUpdate(id , price, payNo, endPrice);
		String msg = "";
		String loc = "/member/mypage";
		if(endPrice > cPoint) {
			msg = "잔여 포인트가 부족합니다";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		if(result > 0) {
			msg = "결제처리가 완료되었습니다";
		} else {
			msg = "정상적으로 처리되지 않았습니다. 다시 시도해 주십시오";
		}
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
