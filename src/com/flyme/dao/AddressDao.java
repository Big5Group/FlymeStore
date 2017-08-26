package com.flyme.dao;

import java.util.List;

import com.flyme.entity.*;

public class AddressDao extends BaseDao<Address> {

	//获取用户住址信息
	public List<Address> getAddress(String callname){
		List<Address> address = super.executeQuery("select * from fm_address where CustomerID = (select CustomerID from fm_customer where CallName = ?)", new Object[]{callname});
		return address;
	}
}
