package son_withPet.pet.model.vo;

public class PetsitterView {

	private String userId;
	private String userName;
	private String petsitterName;
	private int petCount; //마리수
	private String haveDog; //강아지유무
//	private int price; //금액
	private String features; //자격증
	private int revPoint; //평점
	private String viewCount; //리뷰개수
	private int petsitterCount; //펫시터 명수
	private String address; //멤버주소
	private char grade; //멤버등급
	private String profileImg; //프로필 이미지
	private String intro1Img; //이미지1
	private String intro2Img; //이미지2
	
	public PetsitterView() {
		// TODO Auto-generated constructor stub
	}

	public PetsitterView(String userId, String userName, String petsitterName, int petCount, String haveDog,
			String features, int revPoint, String viewCount, int petsitterCount, String address, char grade,
			String profileImg, String intro1Img, String intro2Img) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.petsitterName = petsitterName;
		this.petCount = petCount;
		this.haveDog = haveDog;
		this.features = features;
		this.revPoint = revPoint;
		this.viewCount = viewCount;
		this.petsitterCount = petsitterCount;
		this.address = address;
		this.grade = grade;
		this.profileImg = profileImg;
		this.intro1Img = intro1Img;
		this.intro2Img = intro2Img;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPetsitterName() {
		return petsitterName;
	}

	public void setPetsitterName(String petsitterName) {
		this.petsitterName = petsitterName;
	}

	public int getPetCount() {
		return petCount;
	}

	public void setPetCount(int petCount) {
		this.petCount = petCount;
	}

	public String getHaveDog() {
		return haveDog;
	}

	public void setHaveDog(String haveDog) {
		this.haveDog = haveDog;
	}

	public String getFeatures() {
		return features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}

	public int getRevPoint() {
		return revPoint;
	}

	public void setRevPoint(int revPoint) {
		this.revPoint = revPoint;
	}

	public String getViewCount() {
		return viewCount;
	}

	public void setViewCount(String viewCount) {
		this.viewCount = viewCount;
	}

	public int getPetsitterCount() {
		return petsitterCount;
	}

	public void setPetsitterCount(int petsitterCount) {
		this.petsitterCount = petsitterCount;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public char getGrade() {
		return grade;
	}

	public void setGrade(char grade) {
		this.grade = grade;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getIntro1Img() {
		return intro1Img;
	}

	public void setIntro1Img(String intro1Img) {
		this.intro1Img = intro1Img;
	}

	public String getIntro2Img() {
		return intro2Img;
	}

	public void setIntro2Img(String intro2Img) {
		this.intro2Img = intro2Img;
	}

	@Override
	public String toString() {
		return "PetsitterView [userId=" + userId + ", userName=" + userName + ", petsitterName=" + petsitterName
				+ ", petCount=" + petCount + ", haveDog=" + haveDog + ", features=" + features + ", revPoint="
				+ revPoint + ", viewCount=" + viewCount + ", petsitterCount=" + petsitterCount + ", address=" + address
				+ ", grade=" + grade + ", profileImg=" + profileImg + ", intro1Img=" + intro1Img + ", intro2Img="
				+ intro2Img + "]";
	}

	
	
}
