package dataTest;

import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import model.DemoCustomer;
import model.DemoOrder;
import model.DemoOrderItem;
import model.DemoProductInfo;

import org.junit.Test;

import data.DemoCustomerDB;
import data.DemoOrderDB;
import data.DemoProductInfoDB;

public class DemoOrderDBTest
{

	@Test
	public void testPresetOrderTotal()
	{
		BigDecimal total = new BigDecimal(0);
		BigDecimal knownTotalFromDb = new BigDecimal(1890);
		long orderId = 1;
		
		DemoOrder order = DemoOrderDB.getOrderById(orderId);
		order.setOrderTotal(total);	// set order to incorrect total of zero to enable test
		
		DemoOrderDB.presetOrderTotal(order);	// call method to reset order to proper total
		
		try
		{
			assertEquals(order.getOrderTotal(), knownTotalFromDb);
		}
		catch (Exception e)
		{
			fail("Error in testPresetOrderTotal method - not resetting total: " + e);
		}
		
	}

	@Test
	public void testInsertOrderReturnId()
	{
		boolean isDeleted = false;
		long orderId = 0;
		DemoCustomer customer = DemoCustomerDB.getCustomerById((long) 7);
		DemoOrder order = DemoOrderDB.getOrderById((long) 93);
		
		order.setDemoCustomer(customer);
		order.setOrderId((long)0);
		
		orderId = DemoOrderDB.insertOrderReturnId(order);
		
		try
		{
			assertTrue(orderId > 0);
		}
		catch (Exception e)
		{
			fail("A problem occurred while attempting to insert an order");
		}
		
		isDeleted = DemoOrderDB.deleteOrder(order);	// clean up after inserting dummy order
		
	}

	@Test
	public void testGetOrderById()
	{
		long orderId = 93;
		DemoOrder order = DemoOrderDB.getOrderById(orderId);
		
		try
		{
			assertEquals(order.getOrderId(), (long) 93);
		}
		catch (Exception e)
		{
			fail("A problem occurred while attempting to get an order by ID: " + e);
		}
	}
	
	@Test
	public void testDeleteOrder()
	{
		boolean isDeleted = false;
		long orderId = 0;
		DemoCustomer customer = DemoCustomerDB.getCustomerById((long) 6);
		DemoOrder order = new DemoOrder();
		DemoOrderItem item = new DemoOrderItem();
		DemoProductInfo product = DemoProductInfoDB.getProductById((long) 1);
		
		order.setDemoOrderItems(new ArrayList<DemoOrderItem>());
		item.setQuantity(new BigDecimal(2));
		item.setUnitPrice(product.getListPrice());
		item.setDemoProductInfo(product);
		
		
		order.setDemoCustomer(customer);
		order.addDemoOrderItem(item);
		
		order.setOrderId((long)0);
		
		orderId = DemoOrderDB.insertOrderReturnId(order);	// insert a dummy order to delete
		
		isDeleted = DemoOrderDB.deleteOrder(order);	// clean up after inserting dummy order
		
		try
		{
			assertTrue(isDeleted && orderId != -1);
		}
		catch (Exception e)
		{
			fail("A problem occurred while attempting to delete an order: " + e);
		}
	}
	
	@Test
	public void testGetAllDemoOrders()
	{
		List<DemoOrder> demoOrders = DemoOrderDB.getAllDemoOrders();
		boolean isDemoOrder = (demoOrders.get(1).getClass().equals(DemoOrder.class));
		
		try
		{
			assertTrue((demoOrders.size() > 0) && isDemoOrder);
		}
		catch (Exception e)
		{
			fail("A problem occurred while attempting retrieve all DemoOrders: " + e);
		}
	}
	

}
