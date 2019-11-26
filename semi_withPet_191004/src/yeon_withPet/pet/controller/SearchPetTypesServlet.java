package yeon_withPet.pet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import yeon_withPet.pet.model.service.PetService;
import yeon_withPet.pet.model.vo.Pet;

/**
 * Servlet implementation class SearchPetTypesServlet
 */
@WebServlet("/searchTypes")
public class SearchPetTypesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchPetTypesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("key");
		List<String> list = new PetService().searchType(key);
		
		String types="";
		// 비지니스 로직
		if(list != null) {
			for(int i = 0; i < list.size(); i++) {
				if(i != 0) {
				types += ",";
				}
				types += list.get(i);
				System.out.println(types);
			}
		} else {
			types="일치하는 데이터가 없습니다. 다시 확인해 주세요.";
		}
		
		new Gson().toJson(types, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
