package son_withPet.pet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import son_withPet.pet.model.vo.PetsitterView;
import son_withPet.pet.service.PetService;

/**
 * Servlet implementation class PetsitterSearchNameServlet
 */
@WebServlet("/home/petsitterSearchName")
public class PetsitterSearchNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PetService service = new PetService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterSearchNameServlet() {
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
		int totalData=0;
		
		String key = request.getParameter("key");
		List<String> filter=null;
		List<PetsitterView> list = null;
		PetsitterView totalCount =null;
		String featuresTemp="";
		
		if(request.getParameter("filter")!=null) {
			filter=new Gson().fromJson(request.getParameter("filter"), List.class); //String 형식으로 바꿔줌
//			String features[] = filter.toArray(new String[filter.size()]); //list를 String으로 변환
//	//		String featuresS = String.valueOf(features);
//			featuresTemp=String.join(",", features);
		}
		
		//1 name만 검색
		if(key!=null&&!key.equals("")&&filter.isEmpty()) { //이름값이 있으면
			list = service.searchName(key, cPage, numPerPage);
			totalCount = new PetService().petsitterCount();
			totalData = new PetService().selectBoardNameCount(key);
			request.setAttribute("totalData", totalData);
			System.out.println("Name list값: " + list);
			System.out.println("Name key값: " + key);
		}//
		//2 filter만 검색
		else if(filter!=null&&!filter.isEmpty()&&key.isEmpty()){ //특징값이 있으면
			list = service.searchFeatures(filter, cPage, numPerPage);
			totalCount = new PetService().petsitterCount();
			System.out.println("토탈카운트"+totalCount);
			totalData = new PetService().selectBoardFeaturesCount(filter);
			request.setAttribute("totalData", totalData);
			System.out.println("특징만 list값: "+ list);
			System.out.println("특징만 key값: "+ filter);
		}//
		//3 name filter 둘다 검색 
		else { 
			//이름이 null이 아니고 빈값이 없거나 특징이 null이 아니고  값이 비어있으면 실행됨
			list = service.searchAll(key,filter, cPage, numPerPage);
			totalCount = new PetService().petsitterCount();
			totalData = new PetService().selectBoardAllCount(key, filter);
			request.setAttribute("totalData", totalData);
			System.out.println("둘다 list값: "+ list);
			System.out.println("둘다 filter값: "+ filter);
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
				pageBar+="<a href='javascript:void(0);' onclick=petsitterSearchName(\'"+key+"\',\'"+pageNo+"\');>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span> [다음] </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/home/petsitterView?cPage="+pageNo+"'> [다음] </a>";
		}
		
		System.out.println("최종 list: "+filter); //자차보유   마당보유   미용 자격보유   행동교정 자격보유   반려동물 관리사 자격보유   반려견 텔런트 메이커 자격보유 
		System.out.println("최종 key: "+key);
		System.out.println("최종 filter: " + filter);
//		System.out.println(filter);
		request.setAttribute("cPage", cPage);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("list",list);
		request.setAttribute("totalCount", totalCount);
		
		request.getRequestDispatcher("/home/ajax_searchName.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
