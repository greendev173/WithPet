package son_withPet.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookMachingServlet22
 */
@WebServlet("/book/book03")
public class BookMachingServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookMachingServlet3() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		String epic = request.getParameter("epic");
		String standard = request.getParameter("standard");

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

		request.getRequestDispatcher("/book/book03.jsp").forward(request, response);
		
		System.out.println(addr1);
		System.out.println(addr2);
		System.out.println(addr3);
		System.out.println(addr4);
		System.out.println(petName);
		System.out.println(petType);
		System.out.println(petAge);
		System.out.println(petWeight);
//		System.out.println(epic);
//		System.out.println(standard);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
