package cn.zhku.entity;

public class Business {
	private long business_id; // …Ãº“ID
	private String business_name; // business_name
	private String business_password; // business_password
	private long business_phone; // business_phone
	private String goods_pic_src; // goods_pic_src
	private String business_home;// business_home

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

	public String getBusiness_password() {
		return business_password;
	}

	public void setBusiness_password(String business_password) {
		this.business_password = business_password;
	}

	public long getBusiness_phone() {
		return business_phone;
	}

	public void setBusiness_phone(long business_phone) {
		this.business_phone = business_phone;
	}

	public String getGoods_pic_src() {
		return goods_pic_src;
	}

	public void setGoods_pic_src(String goods_pic_src) {
		this.goods_pic_src = goods_pic_src;
	}

	public String getBusiness_home() {
		return business_home;
	}

	public void setBusiness_home(String business_home) {
		this.business_home = business_home;
	}

}
