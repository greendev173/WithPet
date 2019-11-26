package jimin_withPet.model.vo;

import java.util.Date;

public class Review {
	
	private int revNo;
	private String petsitterId;
	private String writer;
	private String revContent;
	private Date revDate;
	private double revPoint;
	private String petImg;
	private String petName;
	private int petId;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int revNo, String petsitterId, String writer, String revContent, Date revDate, double revPoint,
			String petImg, String petName, int petId) {
		super();
		this.revNo = revNo;
		this.petsitterId = petsitterId;
		this.writer = writer;
		this.revContent = revContent;
		this.revDate = revDate;
		this.revPoint = revPoint;
		this.petImg = petImg;
		this.petName = petName;
		this.petId = petId;
	}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public String getPetsitterId() {
		return petsitterId;
	}

	public void setPetsitterId(String petsitterId) {
		this.petsitterId = petsitterId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	public double getRevPoint() {
		return revPoint;
	}

	public void setRevPoint(double revPoint) {
		this.revPoint = revPoint;
	}

	public String getPetImg() {
		return petImg;
	}

	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public int getPetId() {
		return petId;
	}

	public void setPetId(int petId) {
		this.petId = petId;
	}

	@Override
	public String toString() {
		return "Review [revNo=" + revNo + ", petsitterId=" + petsitterId + ", writer=" + writer + ", revContent="
				+ revContent + ", revDate=" + revDate + ", revPoint=" + revPoint + ", petImg=" + petImg + ", petName="
				+ petName + ", petId=" + petId + "]";
	}
	
	
	
	
	
	
	
	
	
}
