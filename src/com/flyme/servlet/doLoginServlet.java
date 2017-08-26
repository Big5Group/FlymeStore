package com.flyme.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		// 0、获得表单提交的数 使用URLEncoder解决在 Cookie 中保存中文问题
		String username = URLEncoder.encode(request.getParameter("username").trim(), "utf-8");
		String password = URLEncoder.encode(request.getParameter("password").trim(), "utf-8");

		String Ciphertext = MD5.encryptWithMD5(password); // MD5加密后的密文

		// 1、首先判断用户是否选择了记录登录状态
		String[] isUserCookies = request.getParameterValues("isUserCookie");
		if (null != isUserCookies && isUserCookies.length > 0) {
			// 把用户名和密码保存在 Cookie 里面
			Cookie nameCooike = new Cookie("name", username);
			Cookie passCookie = new Cookie("password", password);
			nameCooike.setMaxAge(864000);// 十天 = 864000秒
			passCookie.setMaxAge(864000);// 设置 cookie 最大生存期限为 10 天
			response.addCookie(nameCooike);
			response.addCookie(passCookie);
		} else {
			Cookie[] cookies = request.getCookies();
			if (null != cookies && cookies.length > 0) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("username") || cookie.getName().equals("password")) {
						cookie.setMaxAge(0); // 设置 cookie 失效
						response.addCookie(cookie);// 重新保存
					}
				}
			}
		}

		// 2、封装对象
		Customer customer = new Customer(username, Ciphertext);
		// 3、调用 CustomerDao 执行数据库操作
		CustomerDao customerDao = new CustomerDao();
		boolean isVaild = customerDao.checkUser(customer);
		// 4、判断验证码是否正确
		if (request.getParameter("inputCode").equals(session.getAttribute("authCode"))) {
			out.print("输入正确");
			// 获取全部 Customer 信息
			customer = customerDao.getuserDetilWithName(username).get(0); 
			session.setAttribute("customer", customer);
			// 5、根据数据库操作返回的结果，封装数据&页面跳转
			if (isVaild) {
				response.sendRedirect("index.jsp");
			} else {
				request.getSession().setAttribute("error", "用户登录失败！");
				response.sendRedirect("account.jsp"); // 非法用户, 重定向到 account.jsp
			}
		} else {
			out.print("<script language='javascript'>"
						+ "alert('inValid UserName or Password');"
					+ "</script>");
		}
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
