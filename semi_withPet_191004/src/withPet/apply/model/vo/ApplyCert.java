package withPet.apply.model.vo;

public class ApplyCert {

	private String userId;
	private String diploma;
	private String cert_1;
	private String cert_2;
	private String cert_3;
	
	public ApplyCert() {
		// TODO Auto-generated constructor stub
	}

	public ApplyCert(String userId, String diploma, String cert_1, String cert_2, String cert_3) {
		super();
		this.userId = userId;
		this.diploma = diploma;
		this.cert_1 = cert_1;
		this.cert_2 = cert_2;
		this.cert_3 = cert_3;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDiploma() {
		return diploma;
	}

	public void setDiploma(String diploma) {
		this.diploma = diploma;
	}

	public String getCert_1() {
		return cert_1;
	}

	public void setCert_1(String cert_1) {
		this.cert_1 = cert_1;
	}

	public String getCert_2() {
		return cert_2;
	}

	public void setCert_2(String cert_2) {
		this.cert_2 = cert_2;
	}

	public String getCert_3() {
		return cert_3;
	}

	public void setCert_3(String cert_3) {
		this.cert_3 = cert_3;
	}

	@Override
	public String toString() {
		return "ApplyCert [userId=" + userId + ", diploma=" + diploma + ", cert_1=" + cert_1 + ", cert_2=" + cert_2
				+ ", cert_3=" + cert_3 + "]";
	}

	


	
	
	
	
}
