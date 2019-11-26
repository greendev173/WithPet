package hwang.withpet.pet.model.vo;

public class Pet {
	
	private int petId;
	private String userId;
	private String petName;
	private int petAge;
	private String petBreed;
	private double petWeight;
	private String vaccine; //예방접종유무
	private String sickYn; //질병유무
	private String petImg;
	
	
	public Pet() {
		// TODO Auto-generated constructor stub
	}


	public Pet(int petId, String userId, String petName, int petAge, String petBreed, double petWeight, String vaccine,
			String sickYn, String petImg) {
		super();
		this.petId = petId;
		this.userId = userId;
		this.petName = petName;
		this.petAge = petAge;
		this.petBreed = petBreed;
		this.petWeight = petWeight;
		this.vaccine = vaccine;
		this.sickYn = sickYn;
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


	public String getPetBreed() {
		return petBreed;
	}


	public void setPetBreed(String petBreed) {
		this.petBreed = petBreed;
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


	public String getSickYn() {
		return sickYn;
	}


	public void setSickYn(String sickYn) {
		this.sickYn = sickYn;
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
				+ ", petBreed=" + petBreed + ", petWeight=" + petWeight + ", vaccine=" + vaccine + ", sickYn=" + sickYn
				+ ", petImg=" + petImg + "]";
	}

	
	
	
	
}