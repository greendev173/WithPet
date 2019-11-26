package withPet.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import withPet.admin.service.AdminService;

/**
 * Servlet implementation class UpdateGrade
 */
@WebServlet("/admin/updateGrade")
public class UpdateGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateGrade() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("userId");
		String status = request.getParameter("status");
		String grade = "";
		int result = 0;
		if(status.equals("Y")) {
			if(request.getParameter("grade").equals("전문 펫시터")) {
				grade = "M";
			} else {
				grade = "G";
			}
			result = new AdminService().updateGrade(id,grade)+1;
		} else {
			result = new AdminService().denyApply(id);
		}
		String msg = "";
		String loc = "/admin/permitApply";
		
		if(result == 2) {
			msg = "승인처리가 정상적으로 이루어졌습니다.";
			
		} else if(result == 1){
			msg = "거절처리 되었습니다.";
		} else {
			msg = "정상적으로 처리되지 않았습니다. 관리자에게 문의하세요";
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
