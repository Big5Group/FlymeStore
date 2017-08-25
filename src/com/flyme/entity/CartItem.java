package com.flyme.entity;

public class CartItem {

	private int num;			// key
	private Product product;	// value

	public CartItem() {
		super();
	}

	public CartItem(Product product, int num) {
		super();
		this.product = product;
		this.num = num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
