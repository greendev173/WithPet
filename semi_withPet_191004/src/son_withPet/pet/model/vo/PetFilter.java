package son_withPet.pet.model.vo;

public class PetFilter {

	private String userId; //유저아이디(Member)
	private String petsitterId; //펫시터아이디(Petsitter)
	private char grade; //펫시터등급(Petsitter)
	private String psAddr; //펫시터주소(Petsitter)
	private int petAge; //펫나이(Pet)
	private double petWeight; //펫사이즈(Pet)
	private String userCert; //펫시터자격증보유(Recruit)
	
	public PetFilter() {
		// TODO Auto-generated constructor stub
	}

	public PetFilter(String userId, String petsitterId, char grade, String psAddr, int petAge, double petWeight,
			String userCert) {
		super();
		this.userId = userId;
		this.petsitterId = petsitterId;
		this.grade = grade;
		this.psAddr = psAddr;
		this.petAge = petAge;
		this.petWeight = petWeight;
		this.userCert = userCert;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPetsitterId() {
		return petsitterId;
	}

	public void setPetsitterId(String petsitterId) {
		this.petsitterId = petsitterId;
	}

	public char getGrade() {
		return grade;
	}

	public void setGrade(char grade) {
		this.grade = grade;
	}

	public String getPsAddr() {
		return psAddr;
	}

	public void setPsAddr(String psAddr) {
		this.psAddr = psAddr;
	}

	public int getPetAge() {
		return petAge;
	}

	public void setPetAge(int petAge) {
		this.petAge = petAge;
	}

	public double getPetWeight() {
		return petWeight;
	}

	public void setPetWeight(double petWeight) {
		this.petWeight = petWeight;
	}

	public String getUserCert() {
		return userCert;
	}

	public void setUserCert(String userCert) {
		this.userCert = userCert;
	}

	@Override
	public String toString() {
		return "PetFilter [userId=" + userId + ", petsitterId=" + petsitterId + ", grade=" + grade + ", psAddr="
				+ psAddr + ", petAge=" + petAge + ", petWeight=" + petWeight + ", userCert=" + userCert + "]";
	}
	
	
	
}
