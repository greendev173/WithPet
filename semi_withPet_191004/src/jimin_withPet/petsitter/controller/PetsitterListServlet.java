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
 * Servlet implementation class PetsitterServlet
 */
@WebServlet("/petsitterList")
public class PetsitterListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String area = request.getParameter("area");
		char grade = 'G';
		
		//펫시터 리스트 페이지 설정
		//cPage : 현재 페이지
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		//numPerPage : 한 페이지에 보여줄 데이터 수
		int numPerPage = 8;
		
		PetsitterService service = new PetsitterService();
		//totalData : DB에서 받아온 펫시터 수
		int totalData = service.selectCountPetsitter(area, grade);
		List<Petsitter> list = service.petsitterList(cPage, numPerPage, area, grade);
		
		//페이징바 만들기
		String pageBar = "";
		//totalPage : 전체 페이지 수
		int totalPage = (int)Math.ceil((double)totalData / numPerPage);
		//pageBarSize : 페이지바에서 페이지값이 출력되는 갯수
		int pageBarSize = 5;
		//pageNo : 페이지바에서 페이지값을 출력해줌
		int pageNo = ((cPage-1) / pageBarSize) * pageBarSize + 1;
		//pageEnd : 페이지바에서 페이지값의 끝번호
		int pageEnd = pageNo + pageBarSize - 1;
		
		//pageBar 소스코드 작성
		if(pageNo == 1) {
			pageBar += "<li><a><i class='fa fa-angle-left'></i></a></li>";
		}
		else {
			pageBar += "<li><a href='" + request.getContextPath() + "/petsitterList?area=" + area + "&cPage=" + (pageNo+1) + "&numPerPage=" + numPerPage + "'><i class='fa fa-angle-left'></i></a></li>";
		}
		
		//중간 클릭 페이지 만들기
		while(!(pageNo > pageEnd || pageNo>totalPage)) {
			if(pageNo == cPage) {
				pageBar += "<li class='active'><a>" + pageNo + "</a></li>";
			}
			else {
				pageBar += "<li><a href='" + request.getContextPath() + "/petsitterList?area=" + area + "&cPage=" + pageNo + "&numPerPage=" + numPerPage + "'>" + pageNo + "</a></li>";
			}
			pageNo++;
		}
		
		
		//[다음] 만들기
		if(pageNo > totalPage) {
			pageBar += "<li><a><i class='fa fa-angle-right'></i></a></li>";
		}
		else {
			pageBar += "<li><a href='" + request.getContextPath() + "/petsitterList?area=" + area + "&cPage=" + pageNo + "&numPerPage=" + numPerPage + "'><i class='fa fa-angle-right'></i></a></li>";
		}
		
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("numPerPage", numPerPage);
		request.setAttribute("list", list);
		request.setAttribute("area", area);
		
		
		request.getRequestDispatcher("/views/petsitter/petsitterList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
