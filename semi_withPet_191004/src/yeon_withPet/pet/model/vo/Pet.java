package yeon_withPet.pet.model.vo;

public class Pet {

	private int petId;
	private String userId;
	private String petName;
	private int petAge;
	private String petType;
	private double petWeight;
	private String vaccine;
	private String sickYN;
	private String petImg;
	
	public Pet() {
		// TODO Auto-generated constructor stub
	}

	public Pet(int petId, String userId, String petName, int petAge, String petType, double petWeight, String vaccine,
			String sickYN, String petImg) {
		super();
		this.petId = petId;
		this.userId = userId;
		this.petName = petName;
		this.petAge = petAge;
		this.petType = petType;
		this.petWeight = petWeight;
		this.vaccine = vaccine;
		this.sickYN = sickYN;
		this.petImg = petImg;
	}

	public int getPetId() {
		return petId;
	}

	public void setPetId(int petId) {
		this.petId = petId;
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

	public int getPetAge() {
		return petAge;
	}

	public void setPetAge(int petAge) {
		this.petAge = petAge;
	}

	public String getPetType() {
		return petType;
	}

	public void setPetType(String petType) {
		this.petType = petType;
	}

	public double getPetWeight() {
		return petWeight;
	}

	public void setPetWeight(double petWeight) {
		this.petWeight = petWeight;
	}

	public String getVaccine() {
		return vaccine;
	}

	public void setVaccine(String vaccine) {
		this.vaccine = vaccine;
	}

	public String getSickYN() {
		return sickYN;
	}

	public void setSickYN(String sickYN) {
		this.sickYN = sickYN;
	}

	public String getPetImg() {
		return petImg;
	}

	public void setPetImg(String petImg) {
		this.petImg = petImg;
	}

	@Override
	public String toString() {
		return "Pet [petId=" + petId + ", userId=" + userId + ", petName=" + petName + ", petAge=" + petAge
				+ ", petType=" + petType + ", petWeight=" + petWeight + ", vaccine=" + vaccine + ", sickYN=" + sickYN
				+ ", petImg=" + petImg + "]";
	}
}
