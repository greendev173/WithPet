package add_withPet.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi_withPet.model.vo.Member;
import yeon_withPet.pet.model.service.PetService;
import yeon_withPet.pet.model.vo.Pet;

/**
 * Servlet implementation class InsertPetEndServlet
 */
@WebServlet("/member/insertPetEnd")
public class InsertPetEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPetEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginMember");
		
		
		//file을 받기위해 Multipart인지 확인
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "반려동물 정보 작성 오류![form:up_petimg 관리자에게 문의하세요]");
			request.setAttribute("loc", "/member/mypage");
			request.getRequestDispatcher("/views/common/jsp").forward(request, response);
			return;
		}
		
		
		String root = getServletContext().getRealPath("/");
		//이미지 업로드할 폴더
		String saveDir = root + "/" + "upload/pet";
		
		//file 크기 지정
		int maxSize = 1024 * 1024 * 10;
		
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy()); 
		
		//펫 정보 받아오기
		String img = mr.getFilesystemName("up_file");
		System.out.println("업로드:" + img);
		String name = mr.getParameter("petName");
		String type = mr.getParameter("petType");
		int age = Integer.parseInt(mr.getParameter("petAge"));
		double weight = Double.parseDouble(mr.getParameter("petWeight"));
		String vaccine = String.join(",", mr.getParameterValues("vaccine"));
		String sick = mr.getParameter("petSick");
		
		Pet p = new Pet();
		p.setUserId(m.getUserId());
		p.setPetImg(img);
		p.setPetName(name);
		p.setPetType(type);
		p.setPetAge(age);
		p.setPetWeight(weight);
		p.setVaccine(vaccine);
		p.setSickYN(sick);
		
		//비지니스 로직 수행
		int result = new PetService().insertPet(p);
		
		String msg = "";
		
		if(result>0) {
			msg = "등록이 완료되었습니다. ";
		}else {
			msg = "등록이 실패되었습니다.";
		}
		String loc = "/member/insertPet";
		String view = "/views/common/msg.jsp";
		
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
