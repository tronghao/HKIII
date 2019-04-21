#include "stdio.h"
#include "stdlib.h"
#include "conio.h"
#include "time.h"

int main()
{
	srand(time(NULL));
	printf("\n--1...100--\tCac so: ");
	for(int i=0; i<10; i++)
	{
		printf("%3d", 1+rand()%(100));
	}
	
	printf("\n\n--1...30--\tCac so: ");
	for(int i=0; i<10; i++)
	{
		printf("%3d", 1+rand()%(30));
	}
	
	getch();
	return 0;
}
