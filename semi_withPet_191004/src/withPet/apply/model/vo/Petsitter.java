package withPet.apply.model.vo;

import java.sql.Date;

public class Petsitter {
	
	private String petsitterId;
	private String petsitterName;
	private String grade;
	private String careIn;
	private String careOut;
	private Date enrollDate;
	public Petsitter() {
		// TODO Auto-generated constructor stub
	}
	public Petsitter(String petsitterId, String petsitterName, String grade, String careIn, String careOut,
			Date enrollDate) {
		super();
		this.petsitterId = petsitterId;
		this.petsitterName = petsitterName;
		this.grade = grade;
		this.careIn = careIn;
		this.careOut = careOut;
		this.enrollDate = enrollDate;
	}
	public String getPetsitterId() {
		return petsitterId;
	}
	public void setPetsitterId(String petsitterId) {
		this.petsitterId = petsitterId;
	}
	public String getPetsitterName() {
		return petsitterName;
	}
	public void setPetsitterName(String petsitterName) {
		this.petsitterName = petsitterName;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCareIn() {
		return careIn;
	}
	public void setCareIn(String careIn) {
		this.careIn = careIn;
	}
	public String getCareOut() {
		return careOut;
	}
	public void setCareOut(String careOut) {
		this.careOut = careOut;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	@Override
	public String toString() {
		return "Petsitter [petsitterId=" + petsitterId + ", petsitterName=" + petsitterName + ", grade=" + grade
				+ ", careIn=" + careIn + ", careOut=" + careOut + ", enrollDate=" + enrollDate + "]";
	}

	
	
	
	
}
