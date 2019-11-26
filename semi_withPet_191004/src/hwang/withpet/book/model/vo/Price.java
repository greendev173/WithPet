package hwang.withpet.book.model.vo;

public class Price {

	private int pricePerTime; // 시간별 금액
	private int pricePerWeight; // 반려견 무게별 금액
	private int pricePerGrade; // 펫시터 등급별 금액
	
	public Price() {
		// TODO Auto-generated constructor stub
	}

	public Price(int pricePerTime, int pricePerWeight, int pricePerGrade) {
		super();
		this.pricePerTime = pricePerTime;
		this.pricePerWeight = pricePerWeight;
		this.pricePerGrade = pricePerGrade;
	}

	public int getPricePerTime() {
		return pricePerTime;
	}

	public void setPricePerTime(int pricePerTime) {
		this.pricePerTime = pricePerTime;
	}

	public int getPricePerWeight() {
		return pricePerWeight;
	}

	public void setPricePerWeight(int pricePerWeight) {
		this.pricePerWeight = pricePerWeight;
	}

	public int getPricePerGrade() {
		return pricePerGrade;
	}

	public void setPricePerGrade(int pricePerGrade) {
		this.pricePerGrade = pricePerGrade;
	}

	@Override
	public String toString() {
		return "Price [pricePerTime=" + pricePerTime + ", pricePerWeight=" + pricePerWeight + ", pricePerGrade="
				+ pricePerGrade + "]";
	}
	
	
}
