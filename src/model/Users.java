package model;

//用户信息
public class Users {
	private String username; // 用户名
	private String password; // 密码
	private long phone; // 手机
	private String mail; // 邮箱
	private String activation_code;// 激活码

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getActivation_code() {
		return activation_code;
	}

	public void setActivation_code(String activation_code) {
		this.activation_code = activation_code;
	}

}
