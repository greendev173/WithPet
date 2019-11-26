package jimin_withPet.petsitter.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jimin_withPet.model.vo.Petsitter;
import jimin_withPet.model.vo.Review;
import jimin_withPet.petsitter.model.service.PetsitterService;
import jimin_withPet.review.model.service.ReviewService;

/**
 * Servlet implementation class PetsitterInfoServlet
 */
@WebServlet("/petsitterInfo")
public class PetsitterInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		Petsitter p = new PetsitterService().selectPetsitter(id);
		p.setRevPoint(new ReviewService().avgReviewPoint(id));
		
		List<Review> list = new ReviewService().selectReviewList(id);
		
		request.setAttribute("p", p);
		request.setAttribute("list", list);

		request.getRequestDispatcher("/views/petsitter/petsitterInfo.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
