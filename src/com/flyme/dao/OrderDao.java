package com.flyme.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import com.flyme.entity.CartItem;
import com.flyme.entity.Customer;
import com.flyme.entity.OrderMaster;
import com.flyme.entity.Product;
import com.flyme.util.DBPool;

public class OrderDao extends BaseDao<OrderMaster> {
	
	/**
	 * 创建订单
	 * @param map
	 * @param cus
	 * @return
	 */
	public int createOrder(Map<Integer, CartItem> map, Customer cus) {
		boolean flag = true;
		double total = 0;
		int id = 0;
		
		if(map.size()<1)
		{
			return -1;
		}
		while (flag) {
			id = (int) (10000 * Math.random());
			flag = CheckOrder(id);
		}

		Connection con = DBPool.getInstance().getConn();
		try {
			con.setAutoCommit(false); // be set as false to avoid
										// auto commit
			for (CartItem cart : map.values()) {
				Product pro = cart.getProduct();
				int num = cart.getNum();
				executeUpdateCon(con,
						"insert into fm_orderDetail(OrderID,ProductID,ProductNum,ProTotaltPrice) values(?,?,?,?)",
						new Object[] { id, pro.getProductID(), num, num * pro.getProductPrice() });
				total = total+num * pro.getProductPrice();

			}
			super.executeUpdateCon(con,
					"insert into fm_orderMaster(OrderID,CustomerID,OrderTime,TotalPrice) values(?,?,?,?)",
					new Object[] { id, cus.getCustomerID(), new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
							.format(Long.valueOf(System.currentTimeMillis())), total });
			con.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			return -1;

		}
		try {
			con.setAutoCommit(true);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // be set as false to avo
		closeAll(con, null, null);
		return 1;
	}

	/**
	 * 返回一个 boolean, 根据 ID 验证订单是否存在 
	 * @param id
	 * @return
	 */
	public boolean CheckOrder(int id) {
		List<OrderMaster> list = executeQuery("select * from fm_orderMaster where OrderID = ?", new Object[] { id });
		return list.size() > 0 ? true : false;
	}

}
