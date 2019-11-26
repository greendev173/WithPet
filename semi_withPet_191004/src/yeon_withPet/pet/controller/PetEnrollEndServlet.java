package yeon_withPet.pet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import yeon_withPet.pet.model.service.PetService;
import yeon_withPet.pet.model.vo.Pet;

/**
 * Servlet implementation class PetEnrollEndServlet
 */
@WebServlet("/petEnrollEnd")
public class PetEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// file 받아함
		if(!ServletFileUpload.isMultipartContent(request)) {
			String userId = (String)request.getAttribute("userId");
			request.setAttribute("msg", "반려동물 정보 작성 오류![form:up_petimg 관리자에게 문의하세요]");
			request.setAttribute("loc", "/enrollPet?userId="+userId);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		// getContextPath()와 같은 기능!
		String root = getServletContext().getRealPath("/");
		// upload할 위치
		String saveDir = root + "/upload/pet";
		
		// file크기 지정
		int maxSize = 1024*1024*10;
		
		MultipartRequest mr = new MultipartRequest(
				request,
				saveDir,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		String id = mr.getParameter("userId");
		String petName = mr.getParameter("petName");
		int petAge = Integer.parseInt(mr.getParameter("petAge"));
		String petType = mr.getParameter("petType");
		double petWeight = Double.parseDouble(mr.getParameter("petWeight"));
		String[] vaccine = mr.getParameterValues("vaccine");
		String sickYN = mr.getParameter("sickYN");
		String petImg = mr.getFilesystemName("up_petimg");
		
		// vaccine을  단일 string vaccines로 받음
		String vaccines = String.join(",", vaccine);
		
		Pet p = new Pet();
		p.setUserId(id);
		p.setPetName(petName);
		p.setPetAge(petAge);
		p.setPetType(petType);
		p.setPetWeight(petWeight);
		p.setVaccine(vaccines);
		p.setSickYN(sickYN);
		p.setPetImg(petImg);
		System.out.println(p);
		int result = new PetService().insertPet(p);
		
		// view 선택
		String msg = "";
		String loc = "";
		String view = "/views/common/msg.jsp";
		if(result > 0) {
			msg = "반려견 정보가 성공적으로 등록되었습니다.";
			loc = "/";
		} else {
			msg = "반려견 정보 등록에 실패하였습니다. 다시 시도해주세요.";
			loc = "/petEnroll?userId="+id;
		}
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
