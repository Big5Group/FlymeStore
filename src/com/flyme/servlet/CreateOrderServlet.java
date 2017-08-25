package com.flyme.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyme.dao.CustomerDao;
import com.flyme.dao.OrderDao;
import com.flyme.entity.CartItem;
import com.flyme.entity.Customer;

/**
 * Servlet implementation class CreateOrderServlet
 */
public class CreateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public CreateOrderServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Customer tem= (Customer) session.getAttribute("customer");
		Customer cus = (Customer) new CustomerDao().executeQuery("select* from fm_Customer where CallName=? and CustomPass=?", new Object[]{tem.getCallName(),tem.getCustomPass()}).get(0);
		session.setAttribute("customer", cus);
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
		OrderDao dao = new OrderDao();
		//创建表单
		PrintWriter out = response.getWriter();


		if (dao.createOrder(cart, cus)==1) {
			out.println("<script>alert(\"订单提交成功\")</script>");
		} else {
			out.println("<script>alert(\"订单提交失败\")</script>");
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
