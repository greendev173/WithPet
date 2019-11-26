package semi_withPet.model.vo;

import java.util.Date;

public class Point {

	private String userId;
	private Date pointDate;
	private String price;
	private String pointDW;
	
	public Point() {
		// TODO Auto-generated constructor stub
	}

	public Point(String userId, Date pointDate, String price, String pointDW) {
		super();
		this.userId = userId;
		this.pointDate = pointDate;
		this.price = price;
		this.pointDW = pointDW;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getPointDate() {
		return pointDate;
	}

	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPointDW() {
		return pointDW;
	}

	public void setPointDW(String pointDW) {
		this.pointDW = pointDW;
	}

	@Override
	public String toString() {
		return "Point [userId=" + userId + ", pointDate=" + pointDate + ", price=" + price + ", pointDW=" + pointDW
				+ "]";
	}
	
	
	
	
}
