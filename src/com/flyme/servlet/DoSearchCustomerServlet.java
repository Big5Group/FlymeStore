package com.flyme.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.flyme.dao.CustomerDao;
import com.flyme.entity.Customer;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class DoSearchCustomerServlet
 */
public class DoSearchCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public DoSearchCustomerServlet() {
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
		PrintWriter out = response.getWriter();

		CustomerDao dao = new CustomerDao();
		JsonObject jsonObject = new JsonObject();

		String flag = request.getParameter("f");
		if (flag.equals("query")) {
			List<Customer> mlist = dao.getAllUser();
			out.write(new Gson().toJson(mlist));
		}
		else if (flag.equals("add")) {
			Customer userinfo = new Customer();
			userinfo.setCallName(request.getParameter("CallName"));
			userinfo.setCustomPass(request.getParameter("CustomPass"));
			userinfo.setEmail(request.getParameter("Email"));
			int I =Integer.parseInt(request.getParameter("CustomSex"));
			userinfo.setCustomSex(I);
			I=Integer.parseInt(request.getParameter("State"));
			userinfo.setFoundDate(request.getParameter("FoundDate"));
			userinfo.setState(I);


			System.out.println("name: " + userinfo.getCallName());

			if (dao.addUser(userinfo) == 1) {
				jsonObject.addProperty("success", true);
				jsonObject.addProperty("message", "添加成功");
			} else {
				jsonObject.addProperty("success", false);
				jsonObject.addProperty("message", "添加失败");
			}
			out.write(jsonObject.toString());
		} else if (flag.equals("update")) {
			Customer userinfo = new Customer();
			int id = Integer.parseInt(request.getParameter("id"));
			userinfo.setCallName(request.getParameter("CallName"));
			userinfo.setCustomPass(request.getParameter("CustomPass"));
			userinfo.setEmail(request.getParameter("Email"));
			int I =Integer.parseInt(request.getParameter("CustomSex"));
			userinfo.setCustomSex(I);
			I=Integer.parseInt(request.getParameter("State"));
			userinfo.setFoundDate(request.getParameter("FoundDate"));
			userinfo.setState(I);

			if (dao.updateUser(userinfo, id) == 1) {
				jsonObject.addProperty("success", true);
				jsonObject.addProperty("message", "修改成功");
			} else {
				jsonObject.addProperty("success", false);
				jsonObject.addProperty("message", "修改失败");
			}
			out.write(jsonObject.toString());
		} else if (flag.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			if (dao.deleteUser(id) == 1) {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			doGet(request, response);
	}

}
