package son_withPet.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookMachingServlet31
 */
@WebServlet("/book/book031")
public class BookMachingServlet31 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMachingServlet31() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		// 1. 주소
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String addr4 = request.getParameter("addr4");
		// 2. 펫상세
		String petName = request.getParameter("petName");
		String petType = request.getParameter("petType");
		int petAge = Integer.parseInt(request.getParameter("petAge"));
		int petWeight = Integer.parseInt(request.getParameter("petWeight"));

		// 3. 정기및방문
//		String epic = request.getParameter("epic");
//		String standard = request.getParameter("standard");
		
		// 4. 날짜
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String time = request.getParameter("time");

		// 1. 주소값
		request.setAttribute("addr1", addr1);
		request.setAttribute("addr2", addr2);
		request.setAttribute("addr3", addr3);
		request.setAttribute("addr4", addr4);
		// 2. 펫상세
		request.setAttribute("petName", petName);
		request.setAttribute("petType", petType);
		request.setAttribute("petAge", petAge);
		request.setAttribute("petWeight", petWeight);

		// 3. 정기및방문
//		request.setAttribute("epic", epic);
//		request.setAttribute("standard", standard);
		
		// 4. 날짜
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("time", time);

		request.getRequestDispatcher("/book/book031.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
