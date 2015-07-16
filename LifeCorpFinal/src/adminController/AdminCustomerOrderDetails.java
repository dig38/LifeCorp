package adminController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DemoOrderDB;
import model.DemoOrder;

@WebServlet("/AdminCustomerOrderDetails")
public class AdminCustomerOrderDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminCustomerOrderDetails() {
        super();
    }//END Constructor
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}//END Get
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if((boolean)session.getAttribute("isAdmin") == true)
			AdminCustomerOrderDetailsAction(request, response);
		else
			getServletContext().getRequestDispatcher("/404").forward(request, response);
	}//END Post
	private void AdminCustomerOrderDetailsAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ordId = request.getParameter("id");
		DemoOrder custOrd = null;
		try{	
			custOrd = DemoOrderDB.getOrderById((new Long(ordId)));			
		}catch(Exception e){
			System.out.println(e);
		}finally{
			request.setAttribute("custOrd", custOrd);
			request.setAttribute("ordItemList", custOrd.getDemoOrderItems());
			getServletContext().getRequestDispatcher("/adminCustomerOrderDetails.jsp").forward(request, response);
		}
	}//END AdminCustomerOrderDetailsAction
}//END AdminCustomerOrderDetail
