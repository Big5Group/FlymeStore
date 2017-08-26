package com.flyme.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.flyme.dao.ProductDao;
import com.flyme.entity.Product;

/**
 * Servlet implementation class CategoryServlet
 */
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		ProductDao productdao = new ProductDao();
		int productnum = productdao.listAll().size();
		int pagesize;
		//获取商品页数（9件一页）
		if(productnum%9!=0){
			pagesize = (productnum/9)+1;
		}else{
			pagesize = productnum/9;
		}
		//存储页数
		HttpSession session = request.getSession();
		session.setAttribute("pagesize", pagesize);
		//依照传递的页数参数获取相应的产品
		int num1,num2,page;//num1为起始位置，num2为获取的商品数量
		page = Integer.parseInt(request.getParameter("page"));	//获取当前页数
		session.setAttribute("nowpage",page);
		num1 =(page-1)*9;
		if((productnum-(page-1)*9)>=9){
			num2=9;
		}else{
			num2=productnum-(page-1)*9;
		}
		session.setAttribute("num2", num2);
		Object[] obj = new Object[]{num1,num2};
		List<Product> list = productdao.listNine(obj);
		session.setAttribute("categoryProduct", list);//存储
		request.getRequestDispatcher("category.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
