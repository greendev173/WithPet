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
 * Servlet implementation class PetsitterAreaFilterServlet
 */
@WebServlet("/home/areaFilter")
public class PetsitterAreaFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterAreaFilterServlet() {
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
		List<PetsitterView> list;
		PetsitterView totalCount =null;
		if(key.equals("전체")) {
			list = new PetService().areaAllView(cPage,numPerPage);
			totalCount = new PetService().petsitterCount();
			totalData = new PetService().selectBoardCount();
		}else {
			list = new PetService().areaView(key,cPage,numPerPage);
			totalCount = new PetService().petsitterCountAddr(key);
			totalData = new PetService().selectBoardAreaCount(key);
		}
		
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
				pageBar+="<a href='javascript:void(0);' onclick=areaFilter(\'"+key+"\',\'"+pageNo+"\');>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span> [다음] </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/home/petsitterView?cPage="+pageNo+"'> [다음] </a>";
		}
		
		System.out.println(list);
		request.setAttribute("list", list);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
//		response.setContentType("application/json;charset=utf-8"); 이놈들은 html구문을 직접다 써줘야함
//		new Gson().toJson(list,response.getWriter());
//		
		request.getRequestDispatcher("/home/component_area.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
