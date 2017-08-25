package com.flyme.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flyme.dao.ProductDao;
import com.flyme.entity.Product;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


/**
 * Servlet implementation class DoSearchCustomerServlet
 */
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public ProductServlet() {

		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		ProductDao dao = new ProductDao();
		JsonObject jsonObject = new JsonObject();

		String flag = request.getParameter("f");
		if (flag.equals("query")) {
			List<Product> mlist = dao.getAllProduct();
			out.write(new Gson().toJson(mlist));
		} else if (flag.equals("addUser")) {
			Product userinfo = new Product();
			int k = Integer.parseInt(request.getParameter("ProductID"));
			userinfo.setProductID(k);
			userinfo.setProductName(request.getParameter("ProductName"));
			userinfo.setProductCate(request.getParameter("ProductCate"));
			int i = Integer.parseInt(request.getParameter("ProductPrice"));
			userinfo.setProductPrice(i);
			userinfo.setProductColor(request.getParameter("ProductColor"));
			int j = Integer.parseInt(request.getParameter("ProductNum"));
			userinfo.setProductNum(j);
			System.out.println("name: " + userinfo.getProductName());
			try {
				if (dao.add(userinfo) == 1) {
					jsonObject.addProperty("success", true);
					jsonObject.addProperty("message", "添加成功");
				} else {
					jsonObject.addProperty("success", false);
					jsonObject.addProperty("message", "添加失败");
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.write(jsonObject.toString());
		} else if (flag.equals("updateUser")) {
			Product userinfo = new Product();
			int id = Integer.parseInt(request.getParameter("ProductID"));
			int k = Integer.parseInt(request.getParameter("ProductID"));
			userinfo.setProductID(k);
			userinfo.setProductName(request.getParameter("ProductName"));
			userinfo.setProductCate(request.getParameter("ProductCate"));
			int i = Integer.parseInt(request.getParameter("ProductPrice"));
			userinfo.setProductPrice(i);
			userinfo.setProductColor(request.getParameter("ProductColor"));
			int j = Integer.parseInt(request.getParameter("ProductNum"));
			userinfo.setProductNum(j);

			if (dao.update(userinfo, id) == 1) {
				jsonObject.addProperty("success", true);
				jsonObject.addProperty("message", "修改成功");
			} else {
				jsonObject.addProperty("success", false);
				jsonObject.addProperty("message", "修改失败");
			}
			out.write(jsonObject.toString());
			
		} else if (flag.equals("deleteUser")) {
			int id = Integer.parseInt(request.getParameter("ProductID"));
			if (dao.delete(id) == 1) {
				jsonObject.addProperty("success", true);
				jsonObject.addProperty("message", "删除成功");
			} else {
				jsonObject.addProperty("success", false);
				jsonObject.addProperty("message", "删除失败");
			}
			out.write(jsonObject.toString());
		}
		//
		out.flush();
		out.close();
}
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}
}