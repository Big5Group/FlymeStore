package com.flyme.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyme.dao.CustomerDao;
import com.flyme.entity.Customer;
import com.flyme.util.MD5;

/**
 * Servlet implementation class doLoginServlet
 */
public class doLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doLoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		// 1、获得表单提交的数据
		String name = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String Ciphertext = MD5.encryptWithMD5(password); // MD5加密后的密文
		// 2、封装对象
		Customer customer = new Customer(name, Ciphertext);
		// 3、调用 CustomerDao 执行数据库操作
		CustomerDao customerDao = new CustomerDao();
		boolean isVaild = customerDao.checkUser(customer);

		HttpSession session = request.getSession();
		session.setAttribute("customer", customer);
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("inputCode").equals(session.getAttribute("authCode"))) {
			out.print("输入正确");
			// 4、根据数据库操作返回的结果，封装数据&页面跳转
			if (isVaild) { // 合法用户, 重定向到 IndexServlet
				response.sendRedirect("IndexServlet");
			} else {
				request.getSession().setAttribute("error", "用户登录失败！");
				response.sendRedirect("account.jsp"); // 非法用户, 重定向到 account.jsp
			}
		}else{
			out.print("输入错误");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
