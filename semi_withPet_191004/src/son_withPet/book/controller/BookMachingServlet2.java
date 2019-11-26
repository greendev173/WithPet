package son_withPet.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookMachingServlet2
 */
@WebServlet("/book/book021")
public class BookMachingServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMachingServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		//1. 주소값 받아오기
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String addr4 = request.getParameter("addr4");
		
		//2. 펫 상세받기
		String petName = request.getParameter("petName");
		String petType = request.getParameter("petType");
		int petAge = Integer.parseInt(request.getParameter("petAge"));
		int petWeight = Integer.parseInt(request.getParameter("petWeight"));
		//1. 주소값
		request.setAttribute("addr1", addr1);
		request.setAttribute("addr2", addr2);
		request.setAttribute("addr3", addr3);
		request.setAttribute("addr4", addr4);
		//2. 펫상세
		request.setAttribute("petName", petName);
		request.setAttribute("petType", petType);
		request.setAttribute("petAge", petAge);
		request.setAttribute("petWeight", petWeight);
		
		request.getRequestDispatcher("/book/book021.jsp").forward(request, response);
		
//		System.out.println("펫이름: "+petName);
//		System.out.println("펫견종: "+petType);
//		System.out.println("펫나이: "+petAge);
//		System.out.println("펫몸무게: "+petWeight);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
