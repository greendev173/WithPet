package hwang.withpet.book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CookieAjax2Servlet
 */
@WebServlet("/book/requestCookieAjaxServlet")
public class CookieAjax2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookieAjax2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String executeType=request.getParameter("executeType");
		String checkRequest=request.getParameter("checkRequest"); // 체크박스 고객 요청사항 내용
		String requestCount=request.getParameter("requestCount"); // 체크박스 고객 요청사항 개수
		String userRequest=request.getParameter("userRequest"); // 고객 기타 요청사항 내용
		

		
		if(executeType!=null && executeType.equals("delete") && requestCount!=null) { // executeType이 delete이면
			System.out.println("\najax통신으로 쿠키 삭제 시작!!");
			int requestNo=Integer.parseInt(request.getParameter("requestNo")); // 고객 요청사항 체크박스 id 번호
			int integerRequestCount=Integer.parseInt(requestCount); // requestCount 정수형으로 변환
			
			System.out.println("ajax통신으로 삭제할 쿠키 이름들: checkRequest"+requestNo);
			Cookie[] cookies=request.getCookies(); // 쿠키 배열로 받기
			
			for (int i = 0; i < cookies.length; i++) { // 쿠키들 하나씩 검사
				String cookieName=cookies[i].getName();
				// System.out.println("모든 쿠키 이름 출력:"+cookieName+", 쿠키 값:"+URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
				if (cookieName.equals("checkRequest" + requestNo)) { // 쿠키 이름이 checkRequest+requestNo와 같으면
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				} else if (cookieName.equals("requestCount")) { // 쿠키 이름이 requestCount와 같으면
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 요청사항 개수 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
					
					// 요청사항 개수 쿠키: 요청사항 개수-1로 저장(요청사항 하나 삭제했기 때문에)
					Cookie requestCountC = new Cookie("requestCount", Integer.toString((integerRequestCount - 1))); 
					requestCountC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					response.addCookie(requestCountC); // 새로운 요청사항 개수 쿠키 추가
				}
				for (int j = requestNo; j < integerRequestCount; j++) {
					if(cookieName.equals("checkRequest"+(int)(j+1))) {
						System.out.println("checkRequest"+j+" 쿠키 삭제 후 새롭게 추가");
						
						// 삭제된 자리에 쿠키 추가하기
						Cookie checkRequestC=new Cookie("checkRequest"+j, cookies[i].getValue());
						checkRequestC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						response.addCookie(checkRequestC); // 쿠키 추가
						
						// 삭제된 다음 자리의 쿠키 삭제하기
						System.out.println("checkRequest"+(int)(j+1)+" 쿠키 삭제");
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
					}
				}
			}
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.append("등록된 요청사항 개수:"+requestCount+", "+", 삭제된 요청사항:"+checkRequest);
			System.out.println("ajax통신으로 쿠키 삭제 끝!!");
			
		}else if(executeType!=null && executeType.equals("add") && requestCount!=null) { // executeType이 add이면
			System.out.println("\najax통신으로 쿠키 등록 시작!!");
			
			System.out.println("ajax통신으로 등록할 쿠키 이름들: checkRequest"+requestCount);
			
			Cookie requestCountC=new Cookie("requestCount", requestCount);
			Cookie checkRequestC=new Cookie("checkRequest"+requestCount, URLEncoder.encode(checkRequest, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
			requestCountC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			checkRequestC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			response.addCookie(requestCountC); // 쿠키 추가
			response.addCookie(checkRequestC); // 쿠키 추가
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.append("등록된 요청사항 개수:"+requestCount+", "+", 추가된 요청사항:"+checkRequest);
			System.out.println("ajax통신으로 쿠키 등록 끝!!");
		}else if(executeType!=null && executeType.equals("add") && userRequest!=null) {
			System.out.println("\najax통신으로 쿠키 등록 시작!!");
			
			System.out.println("ajax통신으로 등록할 쿠키 이름들: userRequest");
			String cookieValue=URLEncoder.encode(userRequest, "UTF-8");
			Cookie userRequestC=new Cookie("userRequest", cookieValue);	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
			userRequestC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			response.addCookie(userRequestC); // 쿠키 추가
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.append("등록된 기타 요청사항:"+userRequest);
			
			System.out.println("ajax통신으로 등록한 쿠키 value:"+userRequest);
			System.out.println("ajax통신으로 쿠키 등록 끝!!");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
