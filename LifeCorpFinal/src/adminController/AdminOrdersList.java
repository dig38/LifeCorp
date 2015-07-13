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
import model.DemoOrder;
import myTools.DBUtil;

@WebServlet("/AdminOrderList")
public class AdminOrdersList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AdminOrdersList() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		trans.begin();
		try{
			@SuppressWarnings("unchecked")
				List<DemoOrder> ordList = (List<DemoOrder>) em.createNamedQuery("DemoOrder.findAll").getResultList();
			request.setAttribute("ordList", ordList);
		}finally{
			em.close();
			getServletContext().getRequestDispatcher("/adminOrderList.jsp").forward(request, response);
		}
	}
}//END AdminOrdersList
