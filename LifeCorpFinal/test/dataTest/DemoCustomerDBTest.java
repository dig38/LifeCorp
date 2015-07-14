package dataTest;

import static org.junit.Assert.*;

import java.math.BigDecimal;

import model.DemoCustomer;

import org.junit.Test;

import data.DemoCustomerDB;

public class DemoCustomerDBTest
{

	@Test
	public void testInsertCustomerReturnId()
	{
		DemoCustomer customer = new DemoCustomer();
		customer.setCustFirstName("Gomer");
		customer.setCustLastName("Pyle");
		customer.setCustEmail("pyle@gmail.com");
		customer.setCustPassword("password");
		customer.setCreditLimit(new BigDecimal(1000));
		customer.setCustStreetAddress1("123 Mainstreet");
		customer.setCustCity("Mayberry");
		customer.setCustState("NC");
		customer.setCustPostalCode("29807");
		customer.setPhoneNumber1("919-555-1212");
		
		long custId = DemoCustomerDB.insertCustomerReturnId(customer);
		
		try
		{
			assertTrue(custId > 0);
		}
		catch (Exception e)
		{
			fail("InsertCustomerReturnId method failed: " + e);
		}
		
		// clean up customer table entry
		boolean isDeleted = false;
		
		if (custId > 0)
			isDeleted = DemoCustomerDB.deleteCustomer(customer);
		System.out.println("Clean-up from InsertCustomerReturnId occurred correctly: " + isDeleted);
	}

	@Test
	public void testGetCustomerById()
	{
		DemoCustomer customer = DemoCustomerDB.getCustomerById((long) 1);
		boolean isCustIdReturnedOK = false;
		boolean isEmailReturnedOK = false;
		
		isCustIdReturnedOK = (customer.getCustomerId() == (long) 1);
		isEmailReturnedOK = (customer.getCustEmail().equals("dulles@gmail.com"));
		
		try
		{
			assertTrue(isCustIdReturnedOK && isEmailReturnedOK);
		}
		catch (Exception e)
		{
			fail("GetCustomerById method failed: " + e);
		}
	}

	@Test
	public void testGetCustomerByLogin()
	{
		fail("Not yet implemented");
	}

	@Test
	public void testDoesCustomerEmailExist()
	{
		fail("Not yet implemented");
	}
	
	@Test
	public void testDeleteCustomer()
	{
		fail("Not yet implemented");
	}

}
