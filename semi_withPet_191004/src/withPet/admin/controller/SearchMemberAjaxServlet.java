package withPet.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi_withPet.model.vo.Member;
import withPet.admin.model.vo.SearchMemberAjaxPack;
import withPet.admin.service.AdminService;

/**
 * Servlet implementation class SearchMemberAjaxServlet
 */
@WebServlet("/admin/searchMemberAjax")
public class SearchMemberAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMemberAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("name");
		String grade = request.getParameter("grade");
		// =======================페이징처리 시작
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage;
		if (request.getParameter("numPerPage") != null) {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} else {
			numPerPage = 2;
		}

		AdminService service = new AdminService();
		int totalData = service.selectCountMember(grade);
		System.out.println("total : " +totalData);
		List<Member> list = new ArrayList();
		list = new AdminService().viewApplyMemberList(grade, cPage, numPerPage,userName);
		
		// 페이징처리 ->페이지 바 만들기
		String pageBar = "";
		int totalPage = (int) Math.ceil((double) totalData / numPerPage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		// pageBar 소스코드작성!
		if(pageNo==1) {
			pageBar += "<span>[이전]</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() +
					"/admin/view_member?cPage=" + (pageNo-1) + 
					"&numPerPage=" + numPerPage+"&grade="+grade  + "'>[이전]</a>";	
		}
		
		//중간 숫자
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar += "<span>"+pageNo+"</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath()+
						"/admin/view_member?cPage="+pageNo + 
						"&numPerPage=" + numPerPage +"&grade="+grade + "'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		//다음
		if(pageNo>totalPage) {
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() +
					   "/admin/view_member?cPage="+pageNo +
					   "&numPerPage="+numPerPage+"&grade="+grade  + "'>[다음]</a>";
						
		}

		/// =======================페이징처리 끝===============
		SearchMemberAjaxPack smap = new SearchMemberAjaxPack();
		smap.setcPage(cPage);
		smap.setList(list);
		smap.setNumPerPage(numPerPage);
		smap.setPageBar(pageBar);
		new Gson().toJson(smap,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
