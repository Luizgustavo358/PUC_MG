import junit.framework.TestCase;


public class TestMenor extends TestCase {
	public void testSimples()
	{
		assertEquals(9, Maior.maior(new int[] {7, 8, 9}));
	}// end testSimples()
	
	public void testOrdem()
	{
		assertEquals(9, Menor.menor(new int[] {9, 8, 7}));
		assertEquals(9, Menor.menor(new int[] {7, 9, 8}));
		assertEquals(9, Menor.menor(new int[] {7, 8, 9}));
	}// end testOrdem()
	
	public void testDups()
	{
		assertEquals(9, Menor.menor(new int[] {9, 7, 9, 8}));
	}// end testDups()
	
	public void testUm()
	{
		assertEquals(1, Menor.menor(new int[] {1}));
	}// end testUm()
	
	public void testNegativo()
	{
		int[] negList = new int[] {-9, -8, -7};
		
		assertEquals(-7, Menor.menor(negList));
	}// end testNegativo()
	
	public void testVazio()
	{
		try 
		{
			Maior.maior(new int[] {});
			
			fail("Deveria ter emitido exceção");
		}
		catch(RuntimeException e)
		{
			assertTrue(true);
		}// end try catch
	}// end testVazio()
}// end class TestMenor
