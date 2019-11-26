package son_withPet.book.model.vo;

public class Book {

//	book1, book_01 = 주소값
//			book_02 = 이름,견종,나이
//			book_02-1 = 정기 및 방문 선택
//			book_02-2 = 
//			book_03-1 = 요청사항 및 요청체크박스
//			book-04(결제) =
	
	private String addr;
	private String petName;
	private String petType;
	private int petAge;
	private String machingAns; //요청사항
	private int optionNo; //요청체크박스
	
	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(String addr, String petName, String petType, int petAge, String machingAns, int optionNo) {
		super();
		this.addr = addr;
		this.petName = petName;
		this.petType = petType;
		this.petAge = petAge;
		this.machingAns = machingAns;
		this.optionNo = optionNo;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetType() {
		return petType;
	}

	public void setPetType(String petType) {
		this.petType = petType;
	}

	public int getPetAge() {
		return petAge;
	}

	public void setPetAge(int petAge) {
		this.petAge = petAge;
	}

	public String getMachingAns() {
		return machingAns;
	}

	public void setMachingAns(String machingAns) {
		this.machingAns = machingAns;
	}

	public int getOptionNo() {
		return optionNo;
	}

	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}

	@Override
	public String toString() {
		return "Book [addr=" + addr + ", petName=" + petName + ", petType=" + petType + ", petAge=" + petAge
				+ ", machingAns=" + machingAns + ", optionNo=" + optionNo + "]";
	}
	
	
	
}
