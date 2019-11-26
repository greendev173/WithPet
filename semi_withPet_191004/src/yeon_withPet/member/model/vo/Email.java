package yeon_withPet.member.model.vo;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Email extends Authenticator {

	PasswordAuthentication pa;

	public Email() {

		// 관리자 Gmail id / pw
		String id = "withpet.adm";
		String pw = "semi_withpet";

		System.out.println(id);
		// 인증 객체 생성
		pa = new PasswordAuthentication(id, pw);
	}

	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}

}
