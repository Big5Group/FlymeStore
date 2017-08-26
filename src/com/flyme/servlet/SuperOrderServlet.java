package com.flyme.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flyme.dao.CustomerDao;
import com.flyme.dao.SuperOrderDao;
import com.flyme.entity.Customer;
import com.flyme.entity.SuperOrder;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class DoSearchCustomerServlet
 */
public class SuperOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public SuperOrderServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");

		SuperOrderDao dao = new SuperOrderDao();
		List<SuperOrder> userList = dao.getAllSuperOrder();
		request.setAttribute("userList", userList);  
        request.getRequestDispatcher("superorder.jsp").forward(request, response);  
		//

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

