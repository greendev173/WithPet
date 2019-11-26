package son_withPet.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookSelectServlet
 */
@WebServlet("/book/book02")
public class BookMachingServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMachingServlet1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		String addrInput1 = request.getParameter("addrInput1");
		String addrInput2 = request.getParameter("addrInput2");
		String addrInput3 = request.getParameter("addrInput3");
		String addrInput4 = request.getParameter("addrInput4");
		
		request.setAttribute("addrInput1", addrInput1);
		request.setAttribute("addrInput2", addrInput2);
		request.setAttribute("addrInput3", addrInput3);
		request.setAttribute("addrInput4", addrInput4);
		request.getRequestDispatcher("/book/book02.jsp").forward(request, response);
		
//		System.out.println("우편번호: "+addrInput1);
//		System.out.println("주소: "+addrInput2);
//		System.out.println("서브주소: "+addrInput3);
//		System.out.println("상세주소: "+addrInput4);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
