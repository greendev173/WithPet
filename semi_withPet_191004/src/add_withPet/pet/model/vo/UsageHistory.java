package add_withPet.pet.model.vo;

import java.util.Date;

public class UsageHistory {
	private int payNo; // 추가작업시작해야함
	private String userId;
	private String petName;
	private String petId;
	private String petsitterId;
	private Date startDate;
	private Date endDate;
	private String bookTime;
	private int price;
	private String payYN;
	private Date payDate;
	private String area;
	private String userPostCode;
	private String userRequest;
	private String petsitterImg;
	private int reviewCount;

	public UsageHistory(int payNo, String userId, String petName, String petId, String petsitterId, Date startDate,
			Date endDate, String bookTime, int price, String payYN, Date payDate, String area, String userPostCode,
			String userRequest, String petsitterImg, int reviewCount) {
		super();
		this.payNo = payNo;
		this.userId = userId;
		this.petName = petName;
		this.petId = petId;
		this.petsitterId = petsitterId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.bookTime = bookTime;
		this.price = price;
		this.payYN = payYN;
		this.payDate = payDate;
		this.area = area;
		this.userPostCode = userPostCode;
		this.userRequest = userRequest;
		this.petsitterImg = petsitterImg;
		this.reviewCount = reviewCount;
	}

	public UsageHistory() {
		// TODO Auto-generated constructor stub
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetId() {
		return petId;
	}

	public void setPetId(String petId) {
		this.petId = petId;
	}

	public String getPetsitterId() {
		return petsitterId;
	}

	public void setPetsitterId(String petsitterId) {
		this.petsitterId = petsitterId;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getBookTime() {
		return bookTime;
	}

	public void setBookTime(String bookTime) {
		this.bookTime = bookTime;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPayYN() {
		return payYN;
	}

	public void setPayYN(String payYN) {
		this.payYN = payYN;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getUserPostCode() {
		return userPostCode;
	}

	public void setUserPostCode(String userPostCode) {
		this.userPostCode = userPostCode;
	}

	public String getUserRequest() {
		return userRequest;
	}

	public void setUserRequest(String userRequest) {
		this.userRequest = userRequest;
	}

	public String getPetsitterImg() {
		return petsitterImg;
	}

	public void setPetsitterImg(String petsitterImg) {
		this.petsitterImg = petsitterImg;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	@Override
	public String toString() {
		return "UsageHistory [payNo=" + payNo + ", userId=" + userId + ", petName=" + petName + ", petId=" + petId
				+ ", petsitterId=" + petsitterId + ", startDate=" + startDate + ", endDate=" + endDate + ", bookTime="
				+ bookTime + ", price=" + price + ", payYN=" + payYN + ", payDate=" + payDate + ", area=" + area
				+ ", userPostCode=" + userPostCode + ", userRequest=" + userRequest + ", petsitterImg=" + petsitterImg
				+ ", reviewCount=" + reviewCount + "]";
	}
	
	
	
}
