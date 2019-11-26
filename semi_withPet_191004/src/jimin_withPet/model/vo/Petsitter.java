package jimin_withPet.model.vo;

import java.util.Date;

public class Petsitter {
	
	private String petsitterId;
	private char grade;
	private String petsitterName;
	private String area;
	private String intro;
	private String profileImg;
	private String infImg1;
	private String infImg2;
	private String infImg3;
	private String feature;
	private char careIn;
	private char careOut;
	private double revPoint;
	private Date enrollDate;
	
	public Petsitter() {
		// TODO Auto-generated constructor stub
	}

	public Petsitter(String petsitterId, char grade, String petsitterName, String area, String intro, String profileImg,
			String infImg1, String infImg2, String infImg3, String feature, char careIn, char careOut, double revPoint,
			Date enrollDate) {
		super();
		this.petsitterId = petsitterId;
		this.grade = grade;
		this.petsitterName = petsitterName;
		this.area = area;
		this.intro = intro;
		this.profileImg = profileImg;
		this.infImg1 = infImg1;
		this.infImg2 = infImg2;
		this.infImg3 = infImg3;
		this.feature = feature;
		this.careIn = careIn;
		this.careOut = careOut;
		this.revPoint = revPoint;
		this.enrollDate = enrollDate;
	}

	public String getPetsitterId() {
		return petsitterId;
	}

	public void setPetsitterId(String petsitterId) {
		this.petsitterId = petsitterId;
	}

	public char getGrade() {
		return grade;
	}

	public void setGrade(char grade) {
		this.grade = grade;
	}

	public String getPetsitterName() {
		return petsitterName;
	}

	public void setPetsitterName(String petsitterName) {
		this.petsitterName = petsitterName;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getInfImg1() {
		return infImg1;
	}

	public void setInfImg1(String infImg1) {
		this.infImg1 = infImg1;
	}

	public String getInfImg2() {
		return infImg2;
	}

	public void setInfImg2(String infImg2) {
		this.infImg2 = infImg2;
	}

	public String getInfImg3() {
		return infImg3;
	}

	public void setInfImg3(String infImg3) {
		this.infImg3 = infImg3;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public char getCareIn() {
		return careIn;
	}

	public void setCareIn(char careIn) {
		this.careIn = careIn;
	}

	public char getCareOut() {
		return careOut;
	}

	public void setCareOut(char careOut) {
		this.careOut = careOut;
	}

	public double getRevPoint() {
		return revPoint;
	}

	public void setRevPoint(double revPoint) {
		this.revPoint = revPoint;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Petsitter [petsitterId=" + petsitterId + ", grade=" + grade + ", petsitterName=" + petsitterName
				+ ", area=" + area + ", intro=" + intro + ", profileImg=" + profileImg + ", infImg1=" + infImg1
				+ ", infImg2=" + infImg2 + ", infImg3=" + infImg3 + ", feature=" + feature + ", careIn=" + careIn
				+ ", careOut=" + careOut + ", revPoint=" + revPoint + ", enrollDate=" + enrollDate + "]";
	}

	
	
	
}
