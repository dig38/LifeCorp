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
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		trans.begin();
		try{
			DemoCustomerDB.getAllDemoCustomers();
			
			@SuppressWarnings("unchecked")
				List<DemoCustomer> custList = (List<DemoCustomer>) em.createNamedQuery("DemoCustomer.findAll").getResultList();
			request.setAttribute("custList", custList);
		}finally{
			trans.commit();
			em.close();
			getServletContext().getRequestDispatcher("/adminCustomerList.jsp").forward(request, response);
		}
	}//END Post
}//END AdminCustomerList
