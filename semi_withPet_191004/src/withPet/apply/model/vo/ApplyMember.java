package withPet.apply.model.vo;

import java.sql.Date;

public class ApplyMember {

	private String userId;
	private String applyGrade;
	private String features;
	private String profile;
	private String intro_1;
	private String intro_2;
	private String intro_3;
	private String applyType;
	private char care_in;
	private char care_out;
	private Date enrollDate;
	private String permitStatus;

	public ApplyMember() {
		// TODO Auto-generated constructor stub
	}

	public ApplyMember(String userId, String applyGrade, String features, String profile, String intro_1,
			String intro_2, String intro_3, String applyType, char care_in, char care_out, Date enrollDate,
			String permitStatus) {
		super();
		this.userId = userId;
		this.applyGrade = applyGrade;
		this.features = features;
		this.profile = profile;
		this.intro_1 = intro_1;
		this.intro_2 = intro_2;
		this.intro_3 = intro_3;
		this.applyType = applyType;
		this.care_in = care_in;
		this.care_out = care_out;
		this.enrollDate = enrollDate;
		this.permitStatus = permitStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getApplyGrade() {
		return applyGrade;
	}

	public void setApplyGrade(String applyGrade) {
		this.applyGrade = applyGrade;
	}

	public String getFeatures() {
		return features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getIntro_1() {
		return intro_1;
	}

	public void setIntro_1(String intro_1) {
		this.intro_1 = intro_1;
	}

	public String getIntro_2() {
		return intro_2;
	}

	public void setIntro_2(String intro_2) {
		this.intro_2 = intro_2;
	}

	public String getIntro_3() {
		return intro_3;
	}

	public void setIntro_3(String intro_3) {
		this.intro_3 = intro_3;
	}

	public String getApplyType() {
		return applyType;
	}

	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}

	public char getCare_in() {
		return care_in;
	}

	public void setCare_in(char care_in) {
		this.care_in = care_in;
	}

	public char getCare_out() {
		return care_out;
	}

	public void setCare_out(char care_out) {
		this.care_out = care_out;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getPermitStatus() {
		return permitStatus;
	}

	public void setPermitStatus(String permitStatus) {
		this.permitStatus = permitStatus;
	}

	@Override
	public String toString() {
		return "ApplyMember [userId=" + userId + ", applyGrade=" + applyGrade + ", features=" + features + ", profile="
				+ profile + ", intro_1=" + intro_1 + ", intro_2=" + intro_2 + ", intro_3=" + intro_3 + ", applyType="
				+ applyType + ", care_in=" + care_in + ", care_out=" + care_out + ", enrollDate=" + enrollDate
				+ ", permitStatus=" + permitStatus + "]";
	}

	
	
	
	
}
