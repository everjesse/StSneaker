package cn.edu.uestc.shoe.shop.util;


import junit.framework.Assert;

import org.junit.Test;

public class FunctionTest {
	
	

	@Test
	public void addTest() {
		
		// assertThat("Hello", is(allOf(notNullValue(),
		// instanceOf(String.class), equalTo("Hello"))));
		Assert.assertEquals(3+2, 5);
	}
}
