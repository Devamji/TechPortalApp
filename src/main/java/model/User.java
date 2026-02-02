package model;

public class User {
	
	private int userId;
	private String userFname;
	private String userLname;
	private String userEmail;
	private String role;//for admin and normal user purpose
	private String password;
	private String userImage;
	private String mobno;
	
	//constructor
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String userFname, String userLname, String userEmail, String role, String password, String userImage,
			String mobno) {
		super();
		this.userFname = userFname;
		this.userLname = userLname;
		this.userEmail = userEmail;
		this.role = role;
		this.password = password;
		this.userImage = userImage;
		this.mobno = mobno;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserFname() {
		return userFname;
	}

	public void setUserFname(String userFname) {
		this.userFname = userFname;
	}

	public String getUserLname() {
		return userLname;
	}

	public void setUserLname(String userLname) {
		this.userLname = userLname;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public String getMobno() {
		return mobno;
	}

	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	
	//getter and setter
	
	

}
