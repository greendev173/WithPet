package son_withPet.pet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import son_withPet.pet.model.vo.PetsitterView;
import son_withPet.pet.service.PetService;

/**
 * Servlet implementation class PetsitterGradeServlet
 */
@WebServlet("/home/petsitterGrade")
public class PetsitterGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=5;
		int totalData;
		
		String key = request.getParameter("key");
		System.out.println("grade: "+key);
		
		List<PetsitterView> list;
		PetsitterView totalCount = null;
		
		list = new PetService().petsitterGrade(key,cPage,numPerPage);
		totalCount = new PetService().petsitterGradeCount(key);
		totalData = new PetService().selectBoardGradeCount(key);
		System.out.println("GradeList: " +list);
		System.out.println("totalData: "+totalData);
		System.out.println("totalCount: "+totalCount);
		
		//페이지바
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		String pageBar="";
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		if(pageNo==1) {
			pageBar+="<span> [이전] </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/home/petsitterView?cPage="+(pageNo-1)+"'> [이전] </a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='javascript:void(0);' onclick=petsitterGrade(\'"+key+"\',\'"+pageNo+"\');>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span> [다음] </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/home/petsitterView?cPage="+pageNo+"'> [다음] </a>";
		}
		
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/home/ajax_petsitterGrade.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
