package com.flyme.dao;

import java.util.List;

import com.flyme.entity.Product;

public class ProductDao extends BaseDao<Product> {
	/**
	 * 获取所有商品信息
	 * 
	 * @return
	 */
	public List<Product> getAllProduct() {
		List<Product> list = super.executeQuery("select * from fm_Product", null);
		return list;
	}

	public List<Product> getProductByProductID(Product product) {
		List<Product> list = super.executeQuery("select * from fm_Product where ProductID = ?",
				new Object[] { product.getProductID() });
		return list;
	}

	/**
	 * 按编号获得信息
	 * 
	 * @param n
	 * @return
	 */
	public List<Product> getProductByProductID(int n) {
		List<Product> list = super.executeQuery("select * from fm_Product where ProductID = ?", new Object[] { n });
		return list;
	}

	/**
	 * 随机获取四个产品
	 * 
	 * @return
	 */
	public List<Product> getRandProduct() {
		List<Product> list = super.executeQuery("select * from fm_product order by rand() limit 8", null);
		return list;
	}

	/**
	 * 获取9个产品
	 * 
	 * @return
	 */
	public List<Product> listAll() {
		List<Product> list = super.executeQuery("select * from fm_product order by rand() limit 9", null);
		return list;
	}
}
