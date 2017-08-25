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
	public List<Product> listNine() {
		List<Product> list = super.executeQuery("select * from fm_product order by rand() limit 9", null);
		return list;
	}

	/**
	 * 获取全部产品
	 * 
	 * @return
	 */
	public List<Product> listAll() {
		List<Product> list = super.executeQuery("select * from fm_product", null);
		return list;
	}

	public List<Product> queryAll() {
		List<Product> list = executeQuery("select * from fm_product");
		return list;
	}

	public int add(Product info) throws ClassNotFoundException {

		return executeUpdate(
				"insert into fm_product(ProductID,ProductName,ProductCate,ProductPrice,ProductColor,ProductNum) values(?,?,?,?,?,?)",
				new Object[] { info.getProductID(), info.getProductName(), info.getProductCate(),
						info.getProductPrice(), info.getProductColor(), info.getProductNum() });

	}

	public int update(Product info, int id) {

		return executeUpdate(
				"update fm_product set ProductID=?,ProductName=?,ProductCate=?,ProductPrice=?,ProductColor=?,ProductNum=?  where ProductID=?",
				new Object[] { info.getProductID(), info.getProductName(), info.getProductCate(),
						info.getProductPrice(), info.getProductColor(), info.getProductNum(), id });

	}

	public int delete(int id) {

		return executeUpdate("delete from fm_product where ProductID=?", new Object[] { id });

	}
}
