package add_withPet.pet.model.vo;

import java.util.Date;

public class Review {
	private int revNo;
	private String petsitterId;
	private String writer;
	private int petId;
	private String revContent;
	private Date revDate;
	private int revPoint;
	private int payNo;

	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int revNo, String petsitterId, String writer, int petId, String revContent, Date revDate,
			int revPoint, int payNo) {
		super();
		this.revNo = revNo;
		this.petsitterId = petsitterId;
		this.writer = writer;
		this.petId = petId;
		this.revContent = revContent;
		this.revDate = revDate;
		this.revPoint = revPoint;
		this.payNo = payNo;
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

	public int getPetId() {
		return petId;
	}

	public void setPetId(int petId) {
		this.petId = petId;
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

	public int getRevPoint() {
		return revPoint;
	}

	public void setRevPoint(int revPoint) {
		this.revPoint = revPoint;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	@Override
	public String toString() {
		return "Review [payNo=" + payNo + ", petId=" + petId + ", petsitterId=" + petsitterId + ", revContent="
				+ revContent + ", revDate=" + revDate + ", revNo=" + revNo + ", revPoint=" + revPoint + ", writer="
				+ writer + "]";
	}

}
