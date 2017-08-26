package com.flyme.dao;

import java.util.List;


import com.flyme.entity.SuperOrder;

public class SuperOrderDao extends BaseDao<SuperOrder> {

	/**
	 * 查询所有
	 * 
	 * @return
	 */
	public List<SuperOrder> getAllSuperOrder() {
		List<SuperOrder> list = super.executeQuery("select * from super_order", null);
		return list;
	}
}
