package adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DemoCustomerDB;
import model.DemoOrder;

@WebServlet("/AdminCustomerOrderHistory")
public class AdminCustomerOrderHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;   
    public AdminCustomerOrderHistory() {
        super();
    }//END Constructor
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}//END Get
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if((boolean)session.getAttribute("isAdmin") == true)
			AdminCustomerOrderHistoryAction(request, response);
		else
			getServletContext().getRequestDispatcher("/404").forward(request, response);
	}//END Post
	private void AdminCustomerOrderHistoryAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String custId = request.getParameter("id");
		List<DemoOrder> demoOrd = null;
		try{	
			demoOrd = DemoCustomerDB.getCustomerById(new Long(custId)).getDemoOrders();	
		}catch(Exception e){
			System.out.println(e);	
		}finally{
			request.setAttribute("single", true);
			request.setAttribute("ordList", demoOrd);
			getServletContext().getRequestDispatcher("/adminOrderList.jsp").forward(request, response);
		}	
	}//END AdminCustomerOrderHistoryAction
}//END AdminCustomerOrderHistory
