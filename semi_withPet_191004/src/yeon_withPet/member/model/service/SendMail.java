package yeon_withPet.member.model.service;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import yeon_withPet.member.model.vo.Email;

public class SendMail {

	public int sendMail(String purpose, String target, String email) {
		
		Authenticator auth = new Email();
		
		// Gmail smtp 정보
		Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은  무조건 true 고정
        p.put("mail.smtp.port", "587");                 // gmail 포트
		
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);
		
		// 반환할 결과값
		int result = 0;
		
		try {
			// 메일 발송 시간
			msg.setSentDate(new Date());
			
			// 발신자 설정
			InternetAddress sender = new InternetAddress();
			sender = new InternetAddress("withpetADMIN<withpet.adm@gmail.com>");
			msg.setFrom(sender);
			
			// 수신자 설정
			InternetAddress receiver = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, receiver);
			
			// 메일 관련 셋팅
			msg.setSubject(purpose + " 안내 메일입니다.", "UTF-8"); // 보내는 메일 제목
			msg.setText(purpose + " : " + target, "UTF-8"); // 인증코드
			msg.setHeader("content-type", "text/html");
			
			// 메일 전송
			javax.mail.Transport.send(msg);
			result = 1;
		} catch(Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}
}
