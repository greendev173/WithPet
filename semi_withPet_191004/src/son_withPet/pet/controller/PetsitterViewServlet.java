package son_withPet.pet.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import son_withPet.pet.model.vo.PetsitterView;
import son_withPet.pet.service.PetService;

/**
 * Servlet implementation class petFilterServlet
 */
@WebServlet("/home/petsitterView")
public class PetsitterViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PetService service = new PetService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetsitterViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String userId = request.getParameter("userId"); //member테이블
//		String userName = request.getParameter("userName"); //member테이블
		
		
		
		/*
		 * int petCount = Integer.parseInt(request.getParameter("petCount")); //마리수
		 * String userCert = request.getParameter("userCert"); //자격증 recruit테이블 int
		 * revPoint = Integer.parseInt(request.getParameter("revPoint"));; //평점
		 * REVIEW테이블 String revContentCount = request.getParameter("revContentCount");
		 * //리뷰개수 REVIEW테이블
		 */	
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=5;
		int totalData=service.selectBoardCount();
		List<PetsitterView> list = service.memberFilter(cPage,numPerPage);
		PetsitterView totalCount = service.petsitterCount();
		
		
		String localName="서울"; // 지역 이름 받아오기
		int SeoulCount = service.localCount(localName);
		localName="경기"; // 지역 이름 받아오기
		int kyyungKiCount = service.localCount(localName);
		localName="인천"; // 지역 이름 받아오기
		int incheonCount = service.localCount(localName);
		
		//pagebar만들기
		
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
				pageBar+="<a href='"+request.getContextPath()
				+"/home/petsitterView?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span> [다음] </span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/home/petsitterView?cPage="+pageNo+"'> [다음] </a>";
		}
		
		System.out.println("SeoulCount:"+SeoulCount);
		System.out.println("kyyungKiCount:"+kyyungKiCount);
		System.out.println("incheonCount:"+incheonCount);
		System.out.println(list);
				
		
		request.setAttribute("SeoulCount", SeoulCount); //서울 게시글수
		request.setAttribute("kyyungKiCount", kyyungKiCount); //경기 게시글수
		request.setAttribute("incheonCount", incheonCount); //인천 게시글수
		request.setAttribute("cPage", cPage); //페이징
		request.setAttribute("pageBar", pageBar); //페이징
		request.setAttribute("totalCount", totalCount); //전체 펫시터 명수
		request.setAttribute("list", list); //전체 펫시터 출력
		request.getRequestDispatcher("/home/home01.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
