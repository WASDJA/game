package cn.zhku.entity;

public class Goods {
	private int goods_id; // …Ã∆∑ID
	private String goods_name; // goods_name
	private String goods_price; // goods_price
	private String goods_introduce; // goods_introduce
	private String goods_pic_src; // goods_pic_src
	private String business_id;// goods_bus_id

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

	public String getGoods_introduce() {
		return goods_introduce;
	}

	public void setGoods_introduce(String goods_introduce) {
		this.goods_introduce = goods_introduce;
	}

	public String getGoods_pic_src() {
		return goods_pic_src;
	}

	public void setGoods_pic_src(String goods_pic_src) {
		this.goods_pic_src = goods_pic_src;
	}

	public String getBusiness_id() {
		return business_id;
	}

	public void setBusiness_id(String business_id) {
		this.business_id = business_id;
	}

}
