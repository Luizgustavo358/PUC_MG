
public class Menor
{
	public static int menor(int[] list)
	{
		int index, menor = Integer.MAX_VALUE;
		
		if(list.length == 0)
		{
			throw new RuntimeException("Empty list.");
		}// end if
		
		for(index = 0; index < list.length-1; index++)
		{
			if(list[index] < menor)
			{
				menor = list[index];
			}// end if
		}// end for
		return menor;
	}// end menor()
}
