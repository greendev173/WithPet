package yeon_withPet.member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import yeon_withPet.member.model.vo.Email;

/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/sendMail")
public class SendAuthCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendAuthCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("userMail");
		String authCode = String.valueOf((int)((Math.random() + 1)* 100000));
		
		Authenticator auth = new Email();
		
		// Gmail smtp 정보
		Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은  무조건 true 고정
        p.put("mail.smtp.port", "587");                 // gmail 포트
		
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);
		
		try {
			// 메일 발송 시간
			msg.setSentDate(new Date());
			
			// 발신자 설정
			InternetAddress sender = new InternetAddress();
			sender = new InternetAddress("withpetADMIN<withpet.adm@gmail.com>");
			msg.setFrom(sender);
			
			// 수신자 설정
			InternetAddress receiver = new InternetAddress(userEmail);
			msg.setRecipient(Message.RecipientType.TO, receiver);
			
			// 메일 관련 셋팅
			msg.setSubject("가입 인증 메일입니다.", "UTF-8"); // 보내는 메일 제목
			msg.setText("인증코드 : " + authCode, "UTF-8"); // 인증코드
			msg.setHeader("content-type", "text/html");
			
			// 메일 전송
			javax.mail.Transport.send(msg);
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// view page로 전송
			request.setAttribute("authCode", authCode);
			request.setAttribute("userMail", userEmail);
			request.getRequestDispatcher("/views/member/inputAuthCode.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
