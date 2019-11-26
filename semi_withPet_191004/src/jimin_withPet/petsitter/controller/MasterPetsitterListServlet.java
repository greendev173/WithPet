package jimin_withPet.petsitter.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jimin_withPet.model.vo.Petsitter;
import jimin_withPet.petsitter.model.service.PetsitterService;

/**
 * Servlet implementation class MasterPetsitterListServlet
 */
@WebServlet("/masterPetsitterList")
public class MasterPetsitterListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MasterPetsitterListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String area = request.getParameter("area");
		char grade = 'M';

		
		//펫시터 리스트 페이지 설정
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 8;
		
		if(request.getParameter("numPerPage")!=null) {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		}
		
		PetsitterService service = new PetsitterService();
		int totalData = service.selectCountPetsitter(area, grade);
		List<Petsitter> list = service.petsitterList(cPage, numPerPage, area, grade);
		
		
		//페이징바 만들기
		String pageBar = "";
		int totalPage = (int)Math.ceil((double)totalData / numPerPage);
		int pageBarSize = 5;
		int pageNo = ((cPage-1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		//pageBar 소스코드 작성
		if(pageNo == 1) {
			pageBar += "<li><a><i class='fa fa-angle-left'></i></a></li>";
		}
		else {
			pageBar += "<li><a href='" + request.getContextPath() + "/materPetsitterList?area=" + area + "&cPage=" + (pageNo+1) + "&numPerPage=" + numPerPage + "'><i class='fa fa-angle-left'></i></a></li>";
		}
		
		//중간 클릭 페이지 만들기
		while(!(pageNo > pageEnd || pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<li class='active'><a>" + pageNo + "</a></li>";
			}
			else {
				pageBar += "<li><a href='" + request.getContextPath() + "/materPetsitterList?area=" + area + "&cPage=" + pageNo + "&numPerPage=" + numPerPage + "'>" + pageNo + "</a><li>";
			}
			pageNo++;
		}
		
		
		//[다음] 만들기
		if(pageNo > totalPage) {
			pageBar += "<li><a><i class='fa fa-angle-right'></i></a></li>";
		}
		else {
			pageBar += "<li><a href='" + request.getContextPath() + "/materPetsitterList?area=" + area + "&cPage=" + pageNo + "&numPerPage=" + numPerPage + "'><i class='fa fa-angle-right'></i></a></li>";
		}
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("list", list);
		request.setAttribute("area", area);
		
		
		request.getRequestDispatcher("/views/petsitter/masterPetsitterList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
