package add_withPet.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import add_withPet.pet.model.service.PetService;
import add_withPet.pet.model.vo.Pet;
import semi_withPet.model.vo.Member;

/**
 * Servlet implementation class DeletePetServlet
 */
@WebServlet("/member/deletePet")
public class DeletePetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginMember");
		
		List<Pet> pList = new PetService().selectPetList(m.getUserId());
		
		
		if(pList.size()<=0) {
			String msg = "등록된 펫이 없습니다. 등록 후 이용해주세요.";
			String loc = "/member/insertPet";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}else {
			request.setAttribute("pList", pList);
			request.getRequestDispatcher("/views/pet/deletePet.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
