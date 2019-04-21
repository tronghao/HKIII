#include "stdio.h"
#include "string.h"

void Sort(char a[]);
void swap(char &a, char &b);

int main()
{
	char a[50];

	do{
		printf("Nhap chuoi: ");
		fflush(stdin);
		gets(a);
	}while (0>1);
	
	Sort(a);

	printf("Chuoi da sap xep: %s", a);



	int abcd;
	scanf("%d", &abcd);
	return 0;
}

void Sort(char a[])
{
	int len = strlen(a);
	for(int i=0; i<len-1; i++)
	{
		for(int j=i+1; j<len; j++)
		{
			if((int)a[i]>(int)a[j])
				swap(a[i], a[j]);
		}
	}
}

void swap(char &a, char &b)
{
	char tam;
	tam=a;
	a=b;
	b=tam;
}