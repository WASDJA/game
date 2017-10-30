package model;

public class Order {
	private String username; // 买家姓名
	private long phone; // 买家联系电话
	private int goods_id; // goods_id
	private String goods_name; // goods_name
	private String goods_price; // goods_price
	private long business_id;// business_id
	private String business_name;// business_name
	private long business_phone;// business_phone
	private String business_home;// business_home

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}

	public long getBusiness_id() {
		return business_id;
	}

	public void setBusiness_id(long business_id) {
		this.business_id = business_id;
	}

	public String getBusiness_name() {
		return business_name;
	}

	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
	}

	public long getBusiness_phone() {
		return business_phone;
	}

	public void setBusiness_phone(long business_phone) {
		this.business_phone = business_phone;
	}

	public String getBusiness_home() {
		return business_home;
	}

	public void setBusiness_home(String business_home) {
		this.business_home = business_home;
	}

}
