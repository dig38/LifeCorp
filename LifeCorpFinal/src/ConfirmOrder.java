

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DemoCustomer;
import model.DemoOrder;
import data.DemoOrderDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ConfirmOrder
 */
@WebServlet("/ConfirmOrder")
public class ConfirmOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		String url = "/thanks.jsp";
		long orderId = 0;
		DemoOrder order = (DemoOrder)session.getAttribute("order");
		
		if (order.getDemoCustomer() == null)
		{
			DemoCustomer customer = (DemoCustomer)session.getAttribute("customer");
			order.setDemoCustomer(customer);
		}
		
		orderId = DemoOrderDB.insertOrderReturnId(order);
		
		System.out.println("The order number is: " + orderId);
	
		request.setAttribute("orderId", orderId);
		
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

}
