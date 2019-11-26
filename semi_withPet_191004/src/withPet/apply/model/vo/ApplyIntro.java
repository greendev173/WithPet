package withPet.apply.model.vo;

public class ApplyIntro {
 
	private String userId;
	private String motivation;
	private String aspiration;
	private String personality;
	
	
	public ApplyIntro() {
		// TODO Auto-generated constructor stub
	}


	public ApplyIntro(String userId, String motivation, String aspiration, String personality) {
		super();
		this.userId = userId;
		this.motivation = motivation;
		this.aspiration = aspiration;
		this.personality = personality;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getMotivation() {
		return motivation;
	}


	public void setMotivation(String motivation) {
		this.motivation = motivation;
	}


	public String getAspiration() {
		return aspiration;
	}


	public void setAspiration(String aspiration) {
		this.aspiration = aspiration;
	}


	public String getPersonality() {
		return personality;
	}


	public void setPersonality(String personality) {
		this.personality = personality;
	}


	@Override
	public String toString() {
		return "ApplyIntro [userId=" + userId + ", motivation=" + motivation + ", aspiration=" + aspiration
				+ ", personality=" + personality + "]";
	}
	
	
	
	
	
	
}
