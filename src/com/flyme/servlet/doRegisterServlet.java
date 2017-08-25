package com.flyme.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flyme.dao.CustomerDao;
import com.flyme.entity.Customer;
import com.flyme.util.MD5;

/**
 * Servlet implementation class doRegisterServlet
 */
public class doRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public doRegisterServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1、获得表单提交的数据
		String username = request.getParameter("username").trim();
		String email = request.getParameter("email").trim();
		Integer gender = Integer.parseInt(request.getParameter("gender").trim());
		
//		System.out.println(request.getParameter("password").trim()); // 打印了明文
		
		String password = request.getParameter("password").trim();
		String Ciphertext = MD5.encryptWithMD5(password); // MD5加密后的密文
		
		String nowStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Long.valueOf(System.currentTimeMillis()));
		// 2、封装对象
		Customer customer = new Customer(username, email, gender, Ciphertext);
		customer.setFoundDate(nowStr);
		customer.setState(new Integer(1));
		// 3、调用 CustomerDao 执行数据库操作
		CustomerDao customerDao = new CustomerDao();
		boolean isSuccessful = customerDao.register(customer);
		PrintWriter out = response.getWriter();
		
		if (isSuccessful) {
			out.print("true");
			out.println("注册成功,请登录!");
			response.sendRedirect("account.jsp");
		} else {
			request.getSession().setAttribute("error", "用户注册失败！");
			out.print("false");
			response.sendRedirect("account.jsp"); // 注册失败, 重定向到 account.jsp
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
