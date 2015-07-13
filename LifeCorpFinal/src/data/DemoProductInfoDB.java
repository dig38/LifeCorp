package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.*;
import myTools.DBUtil;

public class DemoProductInfoDB 
{
	public static List<DemoProductInfo> getProductsByCategory(String category)
	{
		List<DemoProductInfo> allProducts = null;
		
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "SELECT d FROM DemoProductInfo d WHERE d.category = :category "
				+ "OR :category = 'All'";
		TypedQuery<DemoProductInfo> q = em.createQuery(qString, DemoProductInfo.class);
		q.setParameter("category", category);
		
		try
		{
			allProducts = q.getResultList();
			if (allProducts == null || allProducts.isEmpty())
				allProducts = null;
		}
		catch (Exception e)
		{
			System.out.println("An exception occurred in getAllProducts()" + e);
		}
		finally 
		{
			em.close();
		}
		
		return allProducts;
	}
	
	public static DemoProductInfo getProductById(long productId)
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		
		try
		{
			DemoProductInfo product = em.find(DemoProductInfo.class, productId);
			return product;
		}
		catch (Exception e)
		{
			System.out.println("Exception occurred in getProductById: " + e);
			return null;
		}
		finally
		{
			em.clear();
		}
	}
}
