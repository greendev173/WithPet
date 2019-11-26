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
 * Servlet implementation class CookieAjaxServlet
 */
@WebServlet(name="CookieAjaxServlet", urlPatterns = "/book/CookieAjaxServlet")
public class CookieAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CookieAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String executeType=request.getParameter("executeType");
		String petCount=request.getParameter("petCount"); // 반려견 마리수
		String petName=request.getParameter("petName");
		String breed=request.getParameter("breed");
		String petAge=request.getParameter("petAge");
		String petWeight=request.getParameter("petWeight");
		String petId=request.getParameter("petId");
		
		String startDate=request.getParameter("startDate");
		String endDate=request.getParameter("endDate");
		String bookTime=request.getParameter("bookTime");
		
		if(executeType!=null && executeType.equals("delete") && petCount!=null) {
			System.out.println("\najax통신으로 쿠키 삭제 시작!!");
			int petNo=Integer.parseInt(request.getParameter("petNo")); // 해당 pet의 쿠키 번호
			int integerPetCount=Integer.parseInt(petCount);
			
			System.out.println("ajax통신으로 삭제할 쿠키 이름들: petName"+petNo+", breed"+petNo+", petAge"+petNo+", petWeight"+petNo);
			Cookie[] cookies=request.getCookies();
			
			for (int i = 0; i < cookies.length; i++) {
				String cookieName=cookies[i].getName();
				System.out.println("쿠키 이름:"+cookieName+", 쿠키 값:"+URLDecoder.decode(cookies[i].getValue(), "UTF-8"));
				if (cookieName.equals("petName" + petNo)) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				} else if (cookieName.equals("breed" + petNo)) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				} else if (cookieName.equals("petAge" + petNo)) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				} else if (cookieName.equals("petWeight" + petNo)) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				} else if (cookieName.equals("petId" + petNo)) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
				} else if (cookieName.equals("petCount")) {
					cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					cookies[i].setMaxAge(0); // 반려견 쿠키 유효시간 만료
					response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
					Cookie petCountC = new Cookie("petCount", Integer.toString((integerPetCount - 1))); // 반려견 마리수 쿠키: 반려견 마리수-1로 저장
					petCountC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
					response.addCookie(petCountC); // 반려견 마리수 추가
				}
				for (int j = petNo; j < integerPetCount; j++) {
					if(cookieName.equals("petName"+(int)(j+1))) {
						System.out.println("petName"+j+" 쿠키 삭제 후 추가");
						// 삭제된 자리에 쿠키 추가하기
						Cookie petNameC=new Cookie("petName"+j, cookies[i].getValue());
						petNameC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						response.addCookie(petNameC); // 쿠키 추가
						// 삭제된 다음 자리의 쿠키 삭제하기
						System.out.println("petName"+(int)(j+1)+" 쿠키 삭제");
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
					}else if(cookieName.equals("breed"+(int)(j+1))) {
						System.out.println("breed"+j+" 쿠키 삭제 후 추가");
						// 삭제된 자리에 쿠키 추가하기
						Cookie breedC=new Cookie("breed"+j, cookies[i].getValue());
						breedC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						response.addCookie(breedC); // 쿠키 추가
						// 삭제된 다음 자리의 쿠키 삭제하기
						System.out.println("petName"+(int)(j+1)+" 쿠키 삭제");
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
					}else if(cookieName.equals("petAge"+(int)(j+1))) {
						System.out.println("petAge"+j+" 쿠키 삭제 후 추가");
						// 삭제된 자리에 쿠키 추가하기
						Cookie petAgeC=new Cookie("petAge"+j, cookies[i].getValue());
						petAgeC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						response.addCookie(petAgeC); // 쿠키 추가
						// 삭제된 다음 자리의 쿠키 삭제하기
						System.out.println("petAge"+(int)(j+1)+" 쿠키 삭제");
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
					}else if(cookieName.equals("petWeight"+(int)(j+1))) {
						System.out.println("petWeight"+j+" 쿠키 삭제 후 추가");
						// 삭제된 자리에 쿠키 추가하기
						Cookie petWeightC=new Cookie("petWeight"+j, cookies[i].getValue());
						petWeightC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						response.addCookie(petWeightC); // 쿠키 추가
						// 삭제된 다음 자리의 쿠키 삭제하기
						System.out.println("petWeight"+(int)(j+1)+" 쿠키 삭제");
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
					}else if(cookieName.equals("petId"+(int)(j+1))) {
						System.out.println("petId"+j+" 쿠키 삭제 후 추가");
						// 삭제된 자리에 쿠키 추가하기
						Cookie petIdC=new Cookie("petId"+j, cookies[i].getValue());
						petIdC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						response.addCookie(petIdC); // 쿠키 추가
						// 삭제된 다음 자리의 쿠키 삭제하기
						System.out.println("petId"+(int)(j+1)+" 쿠키 삭제");
						cookies[i].setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
						cookies[i].setMaxAge(0); // 쿠키 유효시간 만료
						response.addCookie(cookies[i]); // 쿠키 추가해서 삭제
					}
				}
			}
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.append(petName+", "+breed+", "+petAge+", "+petWeight);
			System.out.println("ajax통신으로 쿠키 삭제 끝!!");
			
		}else if(executeType!=null && executeType.equals("add") && petCount!=null) {
			System.out.println("\najax통신으로 쿠키 등록 시작!!");
			
			System.out.println("ajax통신으로 등록할 쿠키 이름들: petName"+petCount+", breed"+petCount+", petAge"+petCount+", petWeight"+petCount+", petId"+petCount);
			
			Cookie petCountC=new Cookie("petCount", petCount);
			Cookie petNameC=new Cookie("petName"+petCount, URLEncoder.encode(petName, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
			Cookie breedC=new Cookie("breed"+petCount, URLEncoder.encode(breed, "UTF-8"));	// 쿠키 객체 생성, key : value 형식
			Cookie petAgeC=new Cookie("petAge"+petCount, URLEncoder.encode(petAge, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
			Cookie petWeightC=new Cookie("petWeight"+petCount, URLEncoder.encode(petWeight, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
			Cookie petIdC=new Cookie("petId"+petCount, URLEncoder.encode(petId, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
			petCountC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			petNameC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			breedC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			petAgeC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			petWeightC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			petIdC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			response.addCookie(petCountC); // 쿠키 추가
			response.addCookie(petNameC); // 쿠키 추가
			response.addCookie(breedC); // 쿠키 추가
			response.addCookie(petAgeC); // 쿠키 추가
			response.addCookie(petWeightC); // 쿠키 추가
			response.addCookie(petIdC); // 쿠키 추가
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.append(petName+", "+breed+", "+petAge+", "+petWeight+", 펫아이디:"+petId);
			System.out.println("ajax통신으로 쿠키 등록 끝!!");
		}else if(executeType!=null && executeType.equals("add") && bookTime!=null) {
			System.out.println("\najax통신으로 쿠키 등록 시작!!");
			
			System.out.println("ajax통신으로 등록할 쿠키 이름들: bookTime");
			
			Cookie bookTimeC=new Cookie("bookTime", URLEncoder.encode(bookTime, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
			bookTimeC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			response.addCookie(bookTimeC); // 쿠키 추가
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.append(bookTime);
			System.out.println("ajax통신으로 쿠키 등록 끝!!");
		}else if(executeType!=null && executeType.equals("add") && startDate!=null && endDate!=null) {
			System.out.println("\najax통신으로 쿠키 등록 시작!!");
			
			System.out.println("ajax통신으로 등록할 쿠키 이름들: startDate, endDate");
			
			Cookie startDateC=new Cookie("startDate", URLEncoder.encode(startDate, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
			Cookie endDateC=new Cookie("endDate", URLEncoder.encode(endDate, "UTF-8"));	// 쿠키 객체 생성, key : value 형식, 쿠키 value 한글 UTF-8로 인코딩
			startDateC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			endDateC.setPath("/"); // 해당 쿠키의 유효한 디렉토리를 "/"로 설정
			response.addCookie(startDateC); // 쿠키 추가
			response.addCookie(endDateC); // 쿠키 추가
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.append(startDate+", "+endDate);
			System.out.println("ajax통신으로 쿠키 등록 끝!!");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
