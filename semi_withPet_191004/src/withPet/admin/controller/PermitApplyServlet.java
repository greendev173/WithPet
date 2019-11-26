package withPet.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import withPet.admin.service.AdminService;
import withPet.apply.model.vo.ApplyMember;

/**
 * Servlet implementation class PermitApplyServlet
 */
@WebServlet("/admin/permitApply")
public class PermitApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PermitApplyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String status = "";
		int readyCPage;
		try {
			readyCPage = Integer.parseInt(request.getParameter("readyCPage"));
		} catch (NumberFormatException e) {
			readyCPage = 1;
		}
		int readyNumPerPage;
		if (request.getParameter("numPerPage") != null) {
			readyNumPerPage = Integer.parseInt(request.getParameter("readyNumPerPage"));
		} else {
			readyNumPerPage = 3;
		}
		int doneCPage;
		try {
			doneCPage = Integer.parseInt(request.getParameter("doneCPage"));
		} catch (NumberFormatException e) {
			doneCPage = 1;
		}
		int doneNumPerPage;
		if (request.getParameter("numPerPage") != null) {
			doneNumPerPage = Integer.parseInt(request.getParameter("doneNumPerPage"));
		} else {
			doneNumPerPage = 3;
		}
		int totalReadyData = 0 ;
		int totalDoneData = 0;
		// =============페이징 상단 끝
		List<ApplyMember> listReady = new AdminService().selectPermitReady(readyCPage, readyNumPerPage);
		List<ApplyMember> listDone = new AdminService().selectPermitDone(doneCPage, doneNumPerPage);
		request.setAttribute("listReady", listReady);
		if (!listReady.isEmpty()) {
			status = "N";

			totalReadyData = new AdminService().selectCountApplyMember(status);
			List<String> nameReady = new AdminService().applyMemberName(status,readyCPage, readyNumPerPage);
			List<String> gradeReady = new AdminService().applyMemberGrade(status,readyCPage, readyNumPerPage);
			request.setAttribute("nameReady", nameReady);
			request.setAttribute("gradeReady", gradeReady);
		}
		request.setAttribute("listDone", listDone);
		if (!listDone.isEmpty()) {
			status = "Y";
			totalDoneData = new AdminService().selectCountApplyMember(status);
			List<String> nameDone = new AdminService().applyMemberName(status, doneCPage, doneNumPerPage);
			List<String> gradeDone = new AdminService().applyMemberGrade(status, doneCPage, doneNumPerPage);
			request.setAttribute("nameDone", nameDone);
			request.setAttribute("gradeDone", gradeDone);
		}
		
		
		//=========================미승인 지원자 페이지바 생성 시작 ============================
		String readyPageBar = "";
		int readyTotalPage = (int) Math.ceil((double) totalReadyData / readyNumPerPage);
		int readyPageBarSize = 5;
		int readyPageNo = ((readyCPage - 1) / readyPageBarSize) * readyPageBarSize + 1;
		int readyPageEnd = readyPageNo + readyPageBarSize - 1;

		// pageBar 소스코드작성!
		if (readyPageNo == 1) {
			readyPageBar += "<span>[이전]</span>";
		} else {
			readyPageBar += "<a href='" + request.getContextPath() + "/admin/permitApply?readyCPage=" + (readyPageNo - 1)
					+ "&readyNumPerPage=" + readyNumPerPage + "'>[이전]</a>";
		}

		// 중간 숫자
		while (!(readyPageNo > readyPageEnd || readyPageNo > readyTotalPage)) {
			if (readyPageNo == readyCPage) {
				readyPageBar += "<span>" + readyPageNo + "</span>";
			} else {
				readyPageBar += "<a href='" + request.getContextPath() + "/admin/permitApply?readyCPage=" + readyPageNo
						+ "&readyNumPerPage=" + readyNumPerPage + "'>" + readyPageNo + "</a>";
			}
			readyPageNo++;
		}

		// 다음
		if (readyPageNo > readyTotalPage) {
			readyPageBar += "<span>[다음]</span>";
		} else {
			readyPageBar += "<a href='" + request.getContextPath() + "/admin/permitApply?readyCPage=" + readyPageNo
					+ "&readyNumPerPage=" + readyNumPerPage + "'>[다음]</a>";

		}
		//===========================================미승인  지원자 페이지바 생성 종료 =====================
		
		//###########################################승인된 지원자 페이지바 생성 시작######################
		String donePageBar = "";
		int doneTotalPage = (int) Math.ceil((double) totalDoneData / doneNumPerPage);
		int donePageBarSize = 3;
		int donePageNo = ((doneCPage - 1) / donePageBarSize) * donePageBarSize + 1;
		int donePageEnd = donePageNo + donePageBarSize - 1;

		// pageBar 소스코드작성!
		if (donePageNo == 1) {
			donePageBar += "<span>[이전]</span>";
		} else {
			donePageBar += "<a href='" + request.getContextPath() + "/admin/permitApply?doneCPage=" + (donePageNo - 1)
					+ "&doneNumPerPage=" + doneNumPerPage + "'>[이전]</a>";
		}

		// 중간 숫자
		while (!(donePageNo > donePageEnd || donePageNo > doneTotalPage)) {
			if (donePageNo == doneCPage) {
				donePageBar += "<span>" + donePageNo + "</span>";
			} else {
				donePageBar += "<a href='" + request.getContextPath() + "/admin/permitApply?doneCPage=" + donePageNo
						+ "&doneNumPerPage=" + doneNumPerPage + "'>" + donePageNo + "</a>";
			}
			donePageNo++;
		}

		// 다음
		if (donePageNo > doneTotalPage) {
			donePageBar += "<span>[다음]</span>";
		} else {
			donePageBar += "<a href='" + request.getContextPath() + "/admin/permitApply?doneCPage=" + donePageNo
					+ "&doneNumPerPage=" + doneNumPerPage + "'>[다음]</a>";

		}
		
		
		
		//###############################################승인된 지원자 페이지바 생성 종료######################################
		
		
		
		/// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@페이징처리 끝@@@@@@@@@@@@@@@@@@@@@@2@@@@@@@@@@@@@@@@@@@@@@@@

		if (listReady.isEmpty() && listDone.isEmpty()) {
			String msg = "담당자에게 문의하세요 ErrorCode : 404(확인할 인원이 없습니다.)";
			String loc = "/adminPage/adminMain.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

		} else {
			request.setAttribute("readyCPage", readyCPage);
			request.setAttribute("readyNumPerPage", readyNumPerPage);
			request.setAttribute("readyPageBar", readyPageBar);
			
			
			request.setAttribute("doneCPage", doneCPage);
			request.setAttribute("doneNumPerPage", doneNumPerPage);
			request.setAttribute("donePageBar", donePageBar);
			
			
			request.getRequestDispatcher("/adminPage/adminPermit_Apply.jsp").forward(request, response);
		}

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
