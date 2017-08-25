package com.flyme.entity;

public class CartItem {
	private Product product;
	private int num;

	public CartItem() {
		super();
	}

	public CartItem(Product product, int num) {
		super();
		this.product = product;
		this.num = num;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

}
