package add_withPet.mypage.controller;

import java.io.File;
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

import add_withPet.pet.model.service.PetService;
import add_withPet.pet.model.vo.Pet;
import semi_withPet.model.vo.Member;

/**
 * Servlet implementation class UpdatePetEndServlet
 */
@WebServlet("/member/updatePetEnd")
public class UpdatePetEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePetEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginMember");
		
		// file 받기위해 Multipart인지 확인하기
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "반려동물 정보 작성 오류![form:up_petimg 관리자에게 문의하세요]");
			request.setAttribute("loc", "/enrollPet?userId="+m.getUserId());
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		
		// getContextPath()와 같은 기능
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
		//Member m이 보유한 펫 마리 수
		int cnt = Integer.parseInt(mr.getParameter("cnt"));
		

		//펫정보 받아오기
		//pet1
		String upFile1 = mr.getFilesystemName("up_file1");
		String oriFile1 = mr.getParameter("ori_file1");
		
		//기존 HelloMVC에서 배운 mr.getFile("up_file1")로 받을시 
		//C:\Users\지민\Desktop\semi_withPet09_28_3th\semi_withPet\web\images\pet\mal.jpg 파일 이름이 경로까지 다 들어감.
//		File f1 = mr.getFile(upFile1);


		
		//새로 업로드한 파일이 있을 경우 기존 파일 삭제
		if(upFile1 != null && upFile1.length()>0) {
			File deleteFile = new File(saveDir + "/" + oriFile1);
			boolean result = deleteFile.delete();
		}
		else {
			upFile1 = oriFile1;
		}
		
		Pet p1 = new Pet(Integer.parseInt(mr.getParameter("petId1")),
				m.getUserId(),
				mr.getParameter("petName1"),
				Integer.parseInt(mr.getParameter("petAge1")),
				mr.getParameter("petType1"),
				Double.parseDouble(mr.getParameter("petWeight1")),
				String.join(",", mr.getParameterValues("vaccine1")),
				mr.getParameter("petSick1"),
				upFile1 //if-else문을 통해 저장된 이미지를 pet객체에 넣어줌
				);
	
		
		//공통으로 사용할 변수
		PetService service = new PetService();
		int result1 = 0;
		
		String msg = "";
		String loc = "";
		String view = "/views/common/msg.jsp";
		
	
		//pet 한마리이상 소유시 servlet으로 오기 때문에 p1의 비지니스 로직 수행
		result1 = service.updatePet(p1);
		
		//보유한 펫이 1마리일 경우
		if(cnt==1) {
			if(result1>0) {
				msg = "수정이 완료되었습니다.";
				loc ="/member/mypage";
			}else {
				msg = "수정 실패입니다. 다시 시도해주세요.";
				loc = "/pet/updatePet";
			}
		}
		//보유한 펫이 2마리 이상일 경우
		else if(cnt>=2) {
			String upFile2 = mr.getFilesystemName("up_file2");
			String oriFile2 = mr.getParameter("ori_file2");
			
			//새로 업로드한 파일이 있을 경우 기존 파일 삭제
			if(upFile2 != null && upFile2.length()>0) {
				File deleteFile = new File(saveDir + "/" + oriFile2);
				boolean result = deleteFile.delete();
			}
			else {
				upFile2 = oriFile2;
			}
			
			//pet2 객체 생성
			Pet p2 = new Pet(Integer.parseInt(mr.getParameter("petId2")),
					m.getUserId(),
					mr.getParameter("petName2"),
					Integer.parseInt(mr.getParameter("petAge2")),
					mr.getParameter("petType2"),
					Double.parseDouble(mr.getParameter("petWeight2")),
					String.join(",", mr.getParameterValues("vaccine2")),
					mr.getParameter("petSick2"),
					upFile2 //if-else문을 통해 저장된 이미지를 pet객체에 넣어줌
					);
			
			//비지니스 로직 수행
			int result2 = service.updatePet(p2);
			

			//보유한 펫이 3마리일 경우
			if(cnt==3) {
				String upFile3 = mr.getFilesystemName("up_file3");
				String oriFile3 = mr.getParameter("ori_file3");
				
				//새로 업로드한 파일이 있을 경우 기존 파일 삭제
				if(upFile3 != null && upFile3.length()>0) {
					File deleteFile = new File(saveDir + "/" + oriFile3);
					boolean result = deleteFile.delete();
				}
				else {
					upFile3 = oriFile3;
				}
				//pet3 객체 생성
				Pet p3 = new Pet(Integer.parseInt(mr.getParameter("petId3")),
						m.getUserId(),
						mr.getParameter("petName3"),
						Integer.parseInt(mr.getParameter("petAge3")),
						mr.getParameter("petType3"),
						Double.parseDouble(mr.getParameter("petWeight3")),
						String.join(",", mr.getParameterValues("vaccine3")),
						mr.getParameter("petSick3"),
						upFile3 //if-else문을 통해 저장된 이미지를 pet객체에 넣어줌
						);
				
				//pet3 비지니스로직 수행
				int result3 = service.updatePet(p3);
				
				if(result1>0 && result2>0 && result3>0) {
					msg = "수정이 완료되었습니다.";
					loc ="/member/mypage";
				}else {
					msg = "수정 실패입니다. 다시 시도해주세요.";
					loc = "/pet/updatePet";
				}
				
				request.setAttribute("msg", msg);
				request.setAttribute("loc", loc);
				
				request.getRequestDispatcher(view).forward(request, response);
				return;	
			}
			
			//보유 펫 2마리
			if(result1>0 && result2>0) {
				msg = "수정이 완료되었습니다.";
				loc ="/member/mypage";
			}
			else {
				msg = "수정 실패입니다. 다시 시도해주세요.";
				loc = "/pet/updatePet";
			}
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
