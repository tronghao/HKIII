#include "stdio.h"
#include "string.h"
#include "windows.h"

void Sort(char a[]);
void swap(char &a, char &b);

int main()
{
	system("color F1");
	char a[50];


	printf("Nhap chuoi: ");
	fflush(stdin);
	gets(a);
	
	
	Sort(a);

	printf("Chuoi da sap xep: %s", a);



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
