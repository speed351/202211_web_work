package test.users.dto;

public class UsersDto {
	private String id;
	private String pwd;
	private String email;
	private String pnum;
	private String regdate;
	
	//새 비밀번호를 담을 필드
	private String newPwd;
	
	public UsersDto() {
	
	}

	public UsersDto(String id, String pwd, String email, String pnum, String regdate, String newPwd) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.pnum = pnum;
		this.regdate = regdate;
		this.newPwd = newPwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	
	
	
}
