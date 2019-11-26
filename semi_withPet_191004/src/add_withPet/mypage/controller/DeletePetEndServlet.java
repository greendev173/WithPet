package add_withPet.mypage.controller;

import java.io.File;
import java.io.IOException;

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
 * Servlet implementation class DeletePetEndServlet
 */
@WebServlet("/member/deletePetEnd")
public class DeletePetEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePetEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginMember");
		
		int id = Integer.parseInt(request.getParameter("id"));
		//펫 삭제(사진)를 위해 pet id로 DB에서 정보 가져오기
		Pet p = new PetService().selectPetOne(id);
		
		
		
		int result = new PetService().deletePet(id);
		
		String msg = "";
		String loc = "/member/deletePet";
		
		if(result>0) {
			String root = getServletContext().getRealPath("/");
			String saveDir = root + "/upload/pet";
			File f = new File(saveDir + "/" + p.getPetImg());
			boolean delPic = f.delete();
			System.out.println("삭제 : " + delPic);
			
			msg = "정상적으로 삭제되었습니다.";
		}
		else {
			msg = "삭제 실패";
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
