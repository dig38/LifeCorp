

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import data.DemoProductInfoDB;



/**
 * Servlet implementation class DisplayProducts
 */
@WebServlet("/DisplayProducts")
public class DisplayProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayProducts() {
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
		String url = "/displayProducts.jsp";
		String category = request.getParameter("category");
		
		
		if (request.getParameter("category") == null)
		{
			// start up case or user did not make a selection return all categories
			
			// get the entire list of products from database
			List<DemoProductInfo> allProducts = DemoProductInfoDB.getProductsByCategory("All");	
			
			// post entire list to session variable for retrieval in displayProducts screen
			request.setAttribute("products", allProducts);
		}
		else
		{
			// the user has selected a category so return only those products 
			List<DemoProductInfo> products = DemoProductInfoDB.getProductsByCategory(category);
			
			// post entire list to session variable for retrieval in displayProducts screen
						request.setAttribute("products", products);
		}
		
		
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

}
