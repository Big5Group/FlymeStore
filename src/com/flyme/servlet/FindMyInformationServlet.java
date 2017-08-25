package com.flyme.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyme.dao.CustomerDao;
import com.flyme.entity.Customer;

/**
 * Servlet implementation class FindMyInformationServlet
 */
public class FindMyInformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindMyInformationServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		String CallName = customer.getCallName();
		CustomerDao customerDao = new CustomerDao();
		
//		List<Customer> lpt=customerDao.getProductByProductID(id); 用id获取
		Customer currentCustomer= (Customer)customerDao.getuserDetilWithName(CallName); // 用callName获取
		request.setAttribute("name", currentCustomer.getCallName());
		request.setAttribute("pass", currentCustomer.getCustomPass());
		request.setAttribute("mail", currentCustomer.getEmail());
		request.setAttribute("sex", currentCustomer.getCustomSex());
		request.getRequestDispatcher("myinformation.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
