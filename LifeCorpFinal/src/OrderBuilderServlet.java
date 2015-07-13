

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DemoCustomer;
import model.DemoOrder;
import model.DemoOrderItem;
import model.DemoProductInfo;
import data.DemoOrderDB;
import data.DemoProductInfoDB;

/**
 * Servlet implementation class oderBuilderServlet
 */
@WebServlet("/OrderBuilderServlet")
public class OrderBuilderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderBuilderServlet() {
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
    	DemoCustomer customer = (DemoCustomer)session.getAttribute("customer");
    	// perform action and set URL to a default page - may be changed based on logic below
        String url = "/displayProducts.jsp";
		
		// get current action from hidden input fields in jsp page(s)
		String action = request.getParameter("action");
		
        if (action == null) 
        {
            action = "cart";  // default action in case none specified
        }
        
        if (action.equals("shop"))	// user wants to continue shopping or add items to order/cart
        {
        	url = "/displayProducts.jsp";
        }
        else if (action.equals("cart"))	// to get here customer had to at least click one 
        								// item into order/cart
        {
        	String productIdString = request.getParameter("productId");
        	String quantityString = request.getParameter("quantity");
        	
        	
        	// initialize the order variables to enable adding order items
        	DemoOrder order = (DemoOrder)session.getAttribute("order");
        	
        	// if no order under construction is found, create a new one
        	if(order == null)
        	{
        		order = new DemoOrder();
        		order.setDemoOrderItems(new ArrayList<DemoOrderItem>());
        		// order.setOrderId(0);	// attempt to work around problems with order object connected to database
        	}
        	
        	// if the user enters a negative or invalid quantity on the order page
        	// automatically set the quantity to 1
        	int quantity;
        	try
        	{
        		quantity = Integer.parseInt(quantityString);
        		if (quantity < 0)
        		{
        			quantity = 1;
        		}
        	}
        	catch (NumberFormatException nfe)
        	{
        		quantity = 1;
        	}
        	
        	int productId = Integer.parseInt(productIdString);
        	
        	DemoProductInfo product = DemoProductInfoDB.getProductById(productId);
        	
        	// potentially check for login here
        	//
        	//
        	DemoOrderItem orderItem = new DemoOrderItem();
        	orderItem.setDemoProductInfo(product);
        	orderItem.setQuantity(new BigDecimal(quantity));
        	
        	if (quantity > 0)
        	{
        		// special class created in the Order object to enable 
        		// changing of a quantity for a specified Order/Cart item.
        		// while it appears on the surface to add an order item, in fact
        		// it iterates through the existing order items and merely changes
        		// the quantity for the order item found by iterating through the 
        		// all the order items for the order.
        		order.addCartOrderItem(orderItem);
        		DemoOrderDB.presetOrderTotal(order);	// update the order total based on item change
        	}
        	else if (quantity == 0)
        	{
        		// special class created in the Order object to enable 
        		// changing of a quantity for a specified Order/Cart item.
        		order.removeCartOrderItem(orderItem);
        		DemoOrderDB.presetOrderTotal(order);	// update the order total based on item deletion
        	}
        	
        	// List<OrderItem> items = order.getOrderItems();	// used for debug purposes to inspect order items
        	
        	session.setAttribute("order", order);
        	
        	url="/orderCart.jsp";
        }
        
        else if (action.equals("checkout") && customer == null)  // possible spot to check for re-routing around customer 
        {
        	url = "/login.jsp";
        }
        
        else if (action.equals("checkout") && customer != null)  // if customer != null must have been authenticated before
        {
        	url = "/confirmOrder.jsp";
        }
        
        getServletContext().getRequestDispatcher(url).forward(request, response);
	}

}
