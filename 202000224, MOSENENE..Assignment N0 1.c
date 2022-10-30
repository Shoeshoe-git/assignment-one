#include <stdio.h>
/*Author: MOSENENE S
STUDENT NUMBER: 202000224
*/

int reverse(int num){
	int  reverse = 0, rem;
	while(num != 0)
	{
		reverse= reverse * 10 + (num % 10);
		num = num / 10;
	}
 	return reverse;
}

int prime(int num)
{
	if(num < 2)
	{
		return 0;		
	}
	
	for(int i = 2; i < num; i++)
	{
		if(num % i == 0)
		{
			return 0;
		}
	}
	
	return 1;				//if then number is prime return 1
}

void reversibleprimes()
{
	for(int num = 1, counter = 0; counter < 10; num++){		//reversed prime square should not be more than 10

		if(prime(num) == 1)				//
		{
			int squared = num * num;		// square the prime number
			int reversed_square = reverse(squared);			// reverse the square prime then assign it to reversed_square
			if(squared != reversed_square)					//check if squared and reversed square are equivalent
			{
				for(int i = 0; i < reversed_square/2; i++)
				{
					if(i*i == reversed_square && prime(i))		// take the root of the reversed number then check if its prime
					{											//by passing it as an argument in prime function
						printf("\n%d",squared);					// print the square of the prime number
						counter ++;								// count + 1
						
					}
				}
			}
		}
	}
}

int main()
{
	printf("REVERSIBLE PRIMES SQUARES");		
    reversibleprimes();						//call the function
    return 1;
}
