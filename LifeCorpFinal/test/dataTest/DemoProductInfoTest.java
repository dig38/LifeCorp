package dataTest;

import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import model.DemoProductInfo;

import org.junit.Test;

import data.DemoProductInfoDB;

public class DemoProductInfoTest
{

	@Test
	public void testGetProductsByCategory()
	{
		String category = "Mens";
		List<DemoProductInfo> products = DemoProductInfoDB.getProductsByCategory(category);
		
		try
		{
			assertEquals(products.size(), 4);
		}
		catch (Exception e)
		{
			fail("Expected number of products was not equal to 4: " + e);
		}
	}

	@Test
	public void testGetProductById()
	{
		long productId = 1;
		DemoProductInfo product = DemoProductInfoDB.getProductById(productId);
		
		try
		{
			assertTrue ((product.getCategory().equals("Mens")) && (product.getProductName().equals("Business Shirt")));
		}
		catch (Exception e)
		{
			fail("Description/category for product returned by getProductById differ from expected: " + e);
		}
		
	}

}
