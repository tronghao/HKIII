#include "stdio.h"

void nhap(int a[], int n);
void xuat(int a[], int n);
void chiaChanLe(int a[], int n, int chan[], int &c, int le[], int &l);
void sapXep(int a[], int n);
void swap(int &a, int &b);
void gopMang(int a[], int chan[], int c, int le[], int l);

int main()
{
	int a[50], n, chan[50], le[50], c, l;
	do{
		printf("Nhap so phan tu: ");
		scanf("%d", &n);
		if(n<=0) printf("\nSo phan tu phai lon hon 0!!\n\n");
	}while(n<=0);

	nhap(a, n);

	chiaChanLe(a, n, chan, c, le, l);

	/* Cach1 in truc tiep
	printf("Mang da sap xep: ");
	xuat(chan, c);
	xuat(le, l);
	*/

	//cach2 gop mang roi in
	gopMang(a, chan, c, le, l);
	printf("Mang da sap xep: ");
	xuat(a, n);


	int abcd;
	scanf("%d", &abcd);
	return 0;
}

void nhap(int a[], int n)
{
	for(int i=0; i<n; i++)
	{
		printf("Nhap a[%d]=", i);
		scanf("%d", &a[i]);
	}
}

void xuat(int a[], int n)
{
	for(int i=0; i<n; i++)
	{
		printf("%3d", a[i]);
	}
}

void chiaChanLe(int a[], int n, int chan[], int &c, int le[], int &l)
{
	c=l=0;
	for(int i=0; i<n; i++)
	{
		if(a[i]%2==0)
		{
			chan[c]=a[i];
			c++;
		}
		else
		{
			le[l]=a[i];
			l++;
		}
	}
	sapXep(chan, c);
	sapXep(le, l);
}

void sapXep(int a[], int n)
{
	for(int i=0; i<n-1; i++)
	{
		for(int j=i+1; j<n; j++)
		{
			if(a[i]>a[j])
				swap(a[i], a[j]);
		}

	}
}
void swap(int &a, int &b)
{
	char tam;
	tam=a;
	a=b;
	b=tam;
}

void gopMang(int a[], int chan[], int c, int le[], int l)
{
	int n=0;
	for(int i=0; i<c; i++)
	{
		a[n]=chan[i];
		n++;
	}
	for(int i=0; i<l; i++)
	{
		a[n]=le[i];
		n++;
	}

}