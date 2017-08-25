package com.flyme.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyme.entity.CartItem;
import com.flyme.entity.Product;

/**
 * Servlet implementation class AddCartServlet
 */
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Product product = (Product) session.getAttribute("Product");
		@SuppressWarnings("unchecked")
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
		if (cart == null) { // 如果没有，则创建一个
			cart = new HashMap<>();
		}
		CartItem item = (CartItem) cart.get(product.getProductID());// 查看购物车里是否有数据
		if (item == null) {
			item = new CartItem();// 没有怎么新建一个，默认数量为1
			item.setProduct(product);
			item.setNum(1);
		} else {
			item.setNum(item.getNum() + 1);
		}

		cart.put(product.getProductID(), item);
		session.setAttribute("cart", cart);
		response.sendRedirect("cart.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
