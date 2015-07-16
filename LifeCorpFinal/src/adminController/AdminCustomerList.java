package adminController;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DemoCustomerDB;
import model.DemoCustomer;
import myTools.DBUtil;

@WebServlet("/AdminCustomerList")
public class AdminCustomerList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminCustomerList() {
        super();
    }//END Construct
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}//END Get
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if((boolean)session.getAttribute("isAdmin") == true)
			AdminCustomerListAction(request, response);
		else
			getServletContext().getRequestDispatcher("/404").forward(request, response);
	}//END Post
	private void AdminCustomerListAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<DemoCustomer> custList = DemoCustomerDB.getAllDemoCustomers();			
		
		request.setAttribute("custList", custList);
		
		getServletContext().getRequestDispatcher("/adminCustomerList.jsp").forward(request, response);
	}//END AdminCustomerListAction
}//END AdminCustomerList
