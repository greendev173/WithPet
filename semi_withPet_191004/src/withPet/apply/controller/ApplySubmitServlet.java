package withPet.apply.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import withPet.apply.model.service.ApplyService;
import withPet.apply.model.vo.ApplyCert;
import withPet.apply.model.vo.ApplyIntro;
import withPet.apply.model.vo.ApplyMember;

/**
 * Servlet implementation class ApplyServlet
 */
@WebServlet("/apply/submit")
public class ApplySubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplySubmitServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String msg;
		String loc;
		request.setCharacterEncoding("UTF-8");
		if (!ServletFileUpload.isMultipartContent(request)) {
			// 파일 전송 오류 예외처리 입력예정

		}
		// ============파일 업로드용 코드================
		String root = getServletContext().getRealPath("/");
		String saveDir = root + "/upload/petsitter";
		int maxSize = 1024 * 1024 * 10; // 10mb
		
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		// ==========파일 업로드 용 코드 끝================
		
		
		

		String userId = mr.getParameter("userId"); // 아이디
		String applyGrade = mr.getParameter("applyGrade"); // 지원등급
		if (!(applyGrade.equals("G") || applyGrade.equals("M"))) {
			msg = "펫시터 등급을 선택하지 않았습니다. 지원페이지로 돌아갑니다.";
			loc = "/adminPage/apply_form.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		String applyType = "NEW";
		if (request.getParameter("applyType") != null) {
			applyType = request.getParameter("applyType");
		}

		String[] feature = mr.getParameterValues("feature");
		String features = "신규";
		if (feature != null) {
			features = String.join(",", feature);// 특징
		}
		String diploma = mr.getFilesystemName("diploma");

		String cert_1 = mr.getFilesystemName("cert_1");

		String cert_2 = mr.getFilesystemName("cert_2");

		String cert_3 = mr.getFilesystemName("cert_3");

		String profile = mr.getFilesystemName("profile");

		String intro_1 = mr.getFilesystemName("intro_1");

		String intro_2 = mr.getFilesystemName("intro_2");

		String intro_3 = mr.getFilesystemName("intro_3");

		String motivation = mr.getParameter("motivation");

		String aspiration = mr.getParameter("aspiration");

		String personality = mr.getParameter("personality");

		String care_radio = mr.getParameter("care_radio"); //서비스 가능형태 라디오버튼 값
		System.out.println(care_radio);
		
		char care_in = 'N';
		char care_out = 'N'; 
		
		
		if(care_radio.equals("all")) {
			care_in = 'Y';
			care_out = 'Y';
		} else if (care_radio.equals("out")) {
			care_out = 'Y';
		} else if (care_radio.equals("in")) {
			care_in = 'Y';
		}
		
		ApplyMember am = null;
		ApplyCert ac = null;
		ApplyIntro ai = null;

		if (userId != null) {

			am = new ApplyMember();
			am.setUserId(userId);
			
			am.setApplyType(applyType);
			am.setApplyGrade(applyGrade);
			am.setFeatures(features);
			am.setProfile(profile);
			am.setIntro_1(intro_1);
			am.setIntro_2(intro_2);
			am.setIntro_3(intro_3);
			am.setCare_in(care_in);
			am.setCare_out(care_out);

			ac = new ApplyCert();
			ac.setUserId(userId);
			ac.setDiploma(diploma);
			ac.setCert_1(cert_1);
			ac.setCert_2(cert_2);
			ac.setCert_3(cert_3);

			ai = new ApplyIntro();
			ai.setUserId(userId);
			ai.setMotivation(motivation);
			ai.setAspiration(aspiration);
			ai.setPersonality(personality);
		}
		// 각각 기본정보(Member-am),자격증(Cert-ac),자기소개글(Intro-ai)객체에 담아서 전송
		int result = new ApplyService().insertApplyMember(am, ac, ai);

		if (result > 0) {
			msg = "펫시터 지원이 정상적으로 처리되었습니다!";
			loc = "/adminPage/apply_main.jsp";

		} else {
			msg = "펫시터 지원에 실패했습니다 다시 시도해주세요!";
			loc = "/adminPage/apply_form.jsp";
			File prof = new File(saveDir + "/" + profile);
			File intro1 = new File(saveDir + "/" + intro_1);
			File intro2 = new File(saveDir + "/" + intro_2);
			File intro3 = new File(saveDir + "/" + intro_3);
			File cert1 = new File(saveDir + "/" + cert_1);
			File cert2 = new File(saveDir + "/" + cert_2);
			File cert3 = new File(saveDir + "/" + cert_3);
			prof.delete();
			intro1.delete();
			intro2.delete();
			intro3.delete();
			cert1.delete();
			cert2.delete();
			cert3.delete();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
