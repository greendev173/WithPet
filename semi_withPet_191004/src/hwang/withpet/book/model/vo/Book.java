package hwang.withpet.book.model.vo;

import java.util.Arrays;

public class Book {
	private String userId;
	private int[] petIdList;
	private String[] petNameList;
	private String[] petBreedList;
	private int[] petAgeList;
	private Double[] petWeightList;
	private String petsitterId;
	private String startDate;
	private String endDate;
	private String bookTime;
	private int[] priceList;
	private String payYN;
	private String userAddress;
	private String userPostcode;
	private String userRequest;
	
	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(String userId, int[] petIdList, String[] petNameList, String[] petBreedList, int[] petAgeList,
			Double[] petWeightList, String petsitterId, String startDate, String endDate, String bookTime,
			int[] priceList, String payYN, String userAddress, String userPostcode, String userRequest) {
		super();
		this.userId = userId;
		this.petIdList = petIdList;
		this.petNameList = petNameList;
		this.petBreedList = petBreedList;
		this.petAgeList = petAgeList;
		this.petWeightList = petWeightList;
		this.petsitterId = petsitterId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.bookTime = bookTime;
		this.priceList = priceList;
		this.payYN = payYN;
		this.userAddress = userAddress;
		this.userPostcode = userPostcode;
		this.userRequest = userRequest;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int[] getPetIdList() {
		return petIdList;
	}

	public void setPetIdList(int[] petIdList) {
		this.petIdList = petIdList;
	}

	public String[] getPetNameList() {
		return petNameList;
	}

	public void setPetNameList(String[] petNameList) {
		this.petNameList = petNameList;
	}

	public String[] getPetBreedList() {
		return petBreedList;
	}

	public void setPetBreedList(String[] petBreedList) {
		this.petBreedList = petBreedList;
	}

	public int[] getPetAgeList() {
		return petAgeList;
	}

	public void setPetAgeList(int[] petAgeList) {
		this.petAgeList = petAgeList;
	}

	public Double[] getPetWeightList() {
		return petWeightList;
	}

	public void setPetWeightList(Double[] petWeightList) {
		this.petWeightList = petWeightList;
	}

	public String getPetsitterId() {
		return petsitterId;
	}

	public void setPetsitterId(String petsitterId) {
		this.petsitterId = petsitterId;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getBookTime() {
		return bookTime;
	}

	public void setBookTime(String bookTime) {
		this.bookTime = bookTime;
	}

	public int[] getPriceList() {
		return priceList;
	}

	public void setPriceList(int[] priceList) {
		this.priceList = priceList;
	}

	public String getPayYN() {
		return payYN;
	}

	public void setPayYN(String payYN) {
		this.payYN = payYN;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserPostcode() {
		return userPostcode;
	}

	public void setUserPostcode(String userPostcode) {
		this.userPostcode = userPostcode;
	}

	public String getUserRequest() {
		return userRequest;
	}

	public void setUserRequest(String userRequest) {
		this.userRequest = userRequest;
	}

	@Override
	public String toString() {
		return "Book [bookTime=" + bookTime + ", endDate=" + endDate + ", payYN=" + payYN + ", petAgeList="
				+ Arrays.toString(petAgeList) + ", petBreedList=" + Arrays.toString(petBreedList) + ", petIdList="
				+ Arrays.toString(petIdList) + ", petNameList=" + Arrays.toString(petNameList) + ", petsitterId="
				+ petsitterId + ", petWeightList=" + Arrays.toString(petWeightList) + ", priceList="
				+ Arrays.toString(priceList) + ", startDate=" + startDate + ", userAddress=" + userAddress + ", userId="
				+ userId + ", userPostcode=" + userPostcode + ", userRequest=" + userRequest + "]";
	}


}
