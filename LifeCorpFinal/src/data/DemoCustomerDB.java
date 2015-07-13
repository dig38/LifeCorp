package data;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import model.DemoCustomer;
import myTools.DBUtil;

public class DemoCustomerDB 
{
	public static long insertCustomerReturnId(DemoCustomer customer)
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		long customerId = 0;
		
		try
		{
			trans.begin();
			em.persist(customer);
			em.flush();
			customerId = customer.getCustomerId();
			trans.commit();
			return customerId;
		}
		catch (Exception e)
		{
			System.out.println("Error inserting customer: " + e);
			return 0;
		}
		finally
		{
			em.close();
		}
	}
	
	public static DemoCustomer getCustomerById(long customerId)
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		
		try
		{
			DemoCustomer customer = em.find(DemoCustomer.class, customerId);
			return customer;
		}
		catch (Exception e)
		{
			System.out.println("A problem occurred retrieving a customer by Id: " +e);
			return null;
		}
		finally
		{
			em.close();
		}
	}
	
	public static DemoCustomer getCustomerByLogin(String email, String password)
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "SELECT d FROM DemoCustomer d WHERE d.custPassword = :password AND d.custEmail = :email";
		// String qString = "SELECT d FROM DemoCustomer d WHERE d.custEmail = :email";
		TypedQuery<DemoCustomer> q = em.createQuery(qString, DemoCustomer.class);
		q.setParameter("email", email);
		q.setParameter("password", password);
		
		DemoCustomer customer = null;
		
		try
		{
			customer = q.getSingleResult();
		}
		catch (NoResultException nre)
		{
			System.out.println("A problem occurred retrieveing a customer by login: " + nre);
		}
		finally
		{
			em.close();
		}
		
		return customer;
	}
	
	public static DemoCustomer doesCustomerEmailExist(String email)
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "SELECT d FROM DemoCustomer d WHERE d.custEmail = :email";
		TypedQuery<DemoCustomer> q = em.createQuery(qString, DemoCustomer.class);
		q.setParameter("email", email);
		
		DemoCustomer customer = null;
		
		try
		{
			customer = q.getSingleResult();
			return customer;
		}
		catch (NoResultException nre)
		{
			System.out.println("A problem occurred retrieveing a customer by login: " +nre);
			return null;
		}
		finally
		{
			em.close();
		}
	}
}
