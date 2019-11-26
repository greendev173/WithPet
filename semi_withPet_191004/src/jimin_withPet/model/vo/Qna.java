package jimin_withPet.model.vo;

import java.util.Date;

public class Qna {
	
	private int qNo;
	private char openYn;
	private String category;
	private char ansYn;
	private String writer;
	private String title;
	private String content;
	private Date qDate;
	private int viewCount;
	
	public Qna() {
		// TODO Auto-generated constructor stub
	}

	public Qna(int qNo, char openYn, String category, char ansYn, String writer, String title, String content,
			Date qDate, int viewCount) {
		super();
		this.qNo = qNo;
		this.openYn = openYn;
		this.category = category;
		this.ansYn = ansYn;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.qDate = qDate;
		this.viewCount = viewCount;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public char getOpenYn() {
		return openYn;
	}

	public void setOpenYn(char openYn) {
		this.openYn = openYn;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public char getAnsYn() {
		return ansYn;
	}

	public void setAnsYn(char ansYn) {
		this.ansYn = ansYn;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	@Override
	public String toString() {
		return "Qna [qNo=" + qNo + ", openYn=" + openYn + ", category=" + category + ", ansYn=" + ansYn + ", writer="
				+ writer + ", title=" + title + ", content=" + content + ", qDate=" + qDate + ", viewCount=" + viewCount
				+ "]";
	}
	
	
}
