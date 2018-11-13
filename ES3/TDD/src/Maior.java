
public class Maior 
{
	public static int maior(int[] list)
	{
		int index, max = 0;
		
		if(list.length == 0)
		{
			throw new RuntimeException("Empty list.");
		}// end if
		
		for(index = 0; index < list.length-1; index++)
		{
			if(list[index] > max)
			{
				max = list[index];
			}// end if
		}// end for
		return max;
	}// end maior()
}// end class Maior
