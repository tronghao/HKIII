#include"stdio.h"
#include"conio.h"
#include"windows.h"

void nhap(int a[], int n);
void xuat(int a[], int n);
void copymang(int a[], int b[], int n);
int LinearSearch(int a[], int N, int x);
void sapxep(int a[], int n);
int BinarySearch(int a[],int N,int x );
void selectionSort(int a[], int n);
void selectionSort_Giam(int a[], int n);
void selectionSort_else(int a[], int n);
void insertionSort(int a[], int n);
void insertionSort_Giam(int a[], int n);
void insertionSort_else(int a[], int n);
void interchageSort(int a[], int n);
void interchageSort_Giam(int a[], int n);
void interchageSort_else(int a[], int n);
void bubbleSort(int a[], int n);
void bubbleSort_Giam(int a[], int n);
void bubbleSort_else(int a[], int n);
void swap(int &a, int &b);
void QuickSort(int a[], int left, int right, int n);
void QuickSort_else(int a[], int left, int right, int n);
void QuickSortChanLe(int a[], int left, int right, int n);
void CreateHeap(int a[], int N);
void Shift (int a[], int left, int right);
void HeapSort (int a[], int N);
void Shift_Giam (int a[], int left, int right);
void CreateHeap_Giam(int a[], int N);
void HeapSort_Giam (int a[], int N);

//Do Trong Hao | MSSV: 110117051
int main()
{
	system("color F1");
	printf("Do Trong Hao\tMSSV:110117051\tDA17TT\n\n");
	
	int soSanh, swap;
	int a[50], a2[50],phanTu;
	
	printf("Nhap so phan tu: ");
	scanf("%d", &phanTu);
	
	nhap(a, phanTu);
	int n, x;
do{	
	
	system("cls");

	printf("0.Exit\n");
	printf("1.LinearSearch: Tim Kiem Phan Tu\n");
	printf("2.BinarySearch: Tim Kiem Phan Tu\n");
	printf("3.Selection Sort: Tang dan (duyet Start-End)\n");
	printf("4.Selection Sort: Giam dan (duyet Start-End)\n");
	printf("5.Selection Sort: Tang dan (duyet End-Start)\n");
	printf("6.Insertion Sort: Tang dan (duyet Start-End)\n");
	printf("7.Insertion Sort: Giam dan (duyet Start-End)\n");
	printf("8.Insertion Sort: Tang dan (duyet End-Start)\n");
	printf("9.Interchage Sort: Tang dan (duyet Start-End)\n");
	printf("10.Interchage Sort: Giam dan (duyet Start-End)\n");
	printf("11.Interchage Sort: Tang dan (duyet End-Start)\n");
	printf("12.Bubble Sort: Tang dan (duyet Start-End)\n");
	printf("13.Bubble Sort: Giam dan (duyet Start-End)\n");
	printf("14.Bubble Sort: Tang dan (duyet End-Start)\n");
	printf("15.Quick Sort: Tang dan\n");
	printf("16.Quick Sort: Giam dan\n");
	printf("17.Quick Sort: Chan Le\n");
	printf("18.Heap Sort: Tang dan\n");
	printf("19.Heap Sort: Giam dan\n");
	
	
		printf("Chon Chuong Trinh: ");
		scanf("%d", &n);
	

	switch(n)
	{
		case 0: break;
		case 1:{
			system("cls");
			printf("\nChuong trinh hien tai: LinearSearch: Tim Kiem Phan Tu\n\n");	
			
			printf("\nDu lieu mang: ");
			xuat(a, phanTu);
			
			printf("\nNhap gia tri can tim: ");
			scanf("%d", &x);
			
			int kq= LinearSearch(a, phanTu, x);
			
			if(kq==-1) printf("Khong tim thay gia tri %d trong mang!\n", x);
			else printf("Gia tri %d nam o vi tri %d", x, kq);
			
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 2:{
			system("cls");
			printf("\nChuong trinh hien tai: BinarySearch: Tim Kiem Phan Tu\n\n");	
			
			printf("\nDu lieu mang: ");
			xuat(a, phanTu);
			
			copymang(a, a2, phanTu);
			sapxep(a2, phanTu);
			printf("\nMang da duoc sap xep thanh: ");
			xuat(a2, phanTu);
			
			printf("\nNhap gia tri can tim: ");
			scanf("%d", &x);
			
			int kq= BinarySearch(a2, phanTu, x);
			
			if(kq==-1) printf("Khong tim thay gia tri %d trong mang!\n", x);
			else printf("Gia tri %d nam o vi tri %d trong mang da sap xep!", x, kq);
			
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 3:{
			system("cls");
			printf("\nChuong trinh hien tai: Selection Sort: Tang dan (duyet Start-End)\n\n");
			copymang(a, a2, phanTu);
			selectionSort(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 4:{
			system("cls");
			printf("\nChuong trinh hien tai: Selection Sort: Giam dan (duyet Start-End)\n\n");
			copymang(a, a2, phanTu);
			selectionSort_Giam(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 5:{
			system("cls");
			printf("\nChuong trinh hien tai: Selection Sort: Tang dan (duyet End-Start)\n\n");
			copymang(a, a2, phanTu);
			selectionSort_else(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 6:{
			system("cls");
			printf("\nChuong trinh hien tai: Insertion Sort: Tang dan (duyet Start-End)\n\n");
			copymang(a, a2, phanTu);
			insertionSort(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 7:{
			system("cls");
			printf("\nChuong trinh hien tai: Insertion Sort: Giam dan (duyet Start-End)\n\n");
			copymang(a, a2, phanTu);
			insertionSort_Giam(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 8:{
			system("cls");
			printf("\nChuong trinh hien tai: Insertion Sort: Tang dan (duyet End-Start)\n\n");
			copymang(a, a2, phanTu);
			insertionSort_else(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		
		case 9:{
			system("cls");
			printf("\nChuong trinh hien tai: Interchage Sort: Tang dan (duyet Start-End)\n\n");
			copymang(a, a2, phanTu);
			interchageSort(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 10:{
			system("cls");
			printf("\nChuong trinh hien tai: Interchage Sort: Giam dan (duyet Start-End)\n\n");
			copymang(a, a2, phanTu);
			interchageSort_Giam(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 11:{
			system("cls");
			printf("\nChuong trinh hien tai: Interchage: Tang dan (duyet End-Start)\n\n");
			copymang(a, a2, phanTu);
			interchageSort_else(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 12:{
			system("cls");
			printf("\nChuong trinh hien tai: Bubble Sort: Tang dan (duyet Start-End)\n\n");
			copymang(a, a2, phanTu);
			bubbleSort(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 13:{
			system("cls");
			printf("\nChuong trinh hien tai: Bubble Sort: Giam dan (duyet Start-End)\n\n");
			copymang(a, a2, phanTu);
			bubbleSort_Giam(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 14:{
			system("cls");
			printf("\nChuong trinh hien tai: Bubble Sort: Tang dan (duyet End-Start)\n\n");
			copymang(a, a2, phanTu);
			bubbleSort_else(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 15:{
			system("cls");
			printf("\nChuong trinh hien tai: Quick Sort: Tang dan\n\n");
			copymang(a, a2, phanTu);
			
			printf("\n i  j  x");
  			xuat(a2, phanTu);
  			printf("       i'  j' ");	
			
			
			QuickSort(a2, 1, phanTu, phanTu);	
			printf("\n\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 16:{
			system("cls");
			printf("\nChuong trinh hien tai: Quick Sort: Giam dan\n\n");
			copymang(a, a2, phanTu);
			
			printf("\n i  j  x");
  			xuat(a2, phanTu);
  			printf("       i'  j' ");
			
			QuickSort_else(a2, 1, phanTu, phanTu);	
			printf("\n\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 17:{
			system("cls");
			printf("\nChuong trinh hien tai: Quick Sort: Chan Le\n\n");
			copymang(a, a2, phanTu);
			
			printf("\n i  j");
  			xuat(a2, phanTu);
  			printf("       i'  j' ");
			
			QuickSortChanLe(a2, 1, phanTu, phanTu);	
			printf("\n\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 18:{
			system("cls");
			printf("\nChuong trinh hien tai: Heap Sort: Tang dan\n\n");
			copymang(a, a2, phanTu);
			HeapSort(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
		case 19:{
			system("cls");
			printf("\nChuong trinh hien tai: Heap Sort: Giam dan\n\n");
			copymang(a, a2, phanTu);
			HeapSort_Giam(a2, phanTu);	
			printf("\nMang truoc khi sap xep: ");
			xuat(a, phanTu);
			printf("\nMang sau khi sap xep: ");
			xuat(a2, phanTu);
			printf("\n\nAn phim bat ki de tiep tuc!");
			getch();		
			break;
		}
	}
	
}while(n!=0);

	
	
	return 0;
}





//1.
void nhap(int a[], int n)
{
	for(int i=1; i<=n; i++)
	{
		printf("Nhap a[%d]:", i);
		scanf("%d", &a[i]);
	}
}

void copymang(int a[], int b[], int n)
{
	
	for(int i=1; i<=n; i++)
	{
		b[i]=a[i];
	}
	
}

//2.
void xuat(int a[], int n)
{
	for(int i=1; i<=n; i++)
	{
		printf("%3d", a[i]);
	}
}

//3.
int LinearSearch(int a[], int N, int x)
{	
	int i;
	for (i=1; (i<=N)&&(a[i]!=x ); i++);
	if (i<=N)	
		return i; 	
	return -1; 
}

void sapxep(int a[], int n)
{
	for(int i=1; i<n; i++)
	{
		for(int j=i+1; j<=n; j++)
		{
			if(a[i]>a[j])
				swap(a[i], a[j]);
		}
	}
}

//4.
int BinarySearch(int a[],int N,int x )
{ 
	int  left =1, right = N, midle;
	while (left <= right)	
	{	
		midle = (left + right)/2;
		if (x == a[midle])
		   return midle;
		if (x<a[midle])right = midle -1;
		else           left  = midle +1;
	}
	return -1; 
}
//5.
void swap(int &a, int &b)
{
	int tam;
	tam= a;
	a=b;
	b=tam;
}

//6.
void selectionSort(int a[], int n)
{
	
	int min;

	for(int i=1; i<=n-1; i++)
	{	
		for(int k=1; k<=n; k++)
		{
			if(k<i-1) printf("   ");
			else printf("%3d", a[k]);
		}
		min	= i;
	
		for(int j=i+1; j<=n; j++)
		{
		
			if(a[j]<a[min])
			{
				min=j;
			}
			
		}
		printf("\nMin=%-2d  %2d<=>%-2d ==>", a[min], a[i], a[min]);
		swap(a[i], a[min]);
	
	}
	for(int k=1; k<=n; k++)
	{
		if(k<n-1) printf("   ");
		else printf("%3d", a[k]);
	}
}
//7.
void selectionSort_Giam(int a[], int n)
{
	
	int max;

	for(int i=1; i<=n-1; i++)
	{	
		for(int k=1; k<=n; k++)
		{
			if(k<i-1) printf("   ");
			else printf("%3d", a[k]);
		}
		max	= i;
	
		for(int j=i+1; j<=n; j++)
		{
		
			if(a[j]>a[max])
			{
				max=j;
			}
			
		}
		printf("\nMax=%-2d  %2d<=>%-2d ==>", a[max], a[i], a[max]);
		swap(a[i], a[max]);
	
	}
	for(int k=1; k<=n; k++)
	{
		if(k<n-1) printf("   ");
		else printf("%3d", a[k]);
	}
}

void selectionSort_else(int a[], int n)
{
	
	int max;

	for(int i=n; i>1; i--)
	{	
		for(int k=1; k<=n; k++)
		{
			if(k>i+1) printf("   ");
			else printf("%3d", a[k]);
		}
		max	= i;
	
		for(int j=i-1; j>=1; j--)
		{
			
			if(a[j]>a[max])
			{
				max=j;
			}
		
		}
		printf("\nMax=%-2d  %2d<=>%-2d ==>", a[max], a[i], a[max]);
		swap(a[i], a[max]);
		
	}
	for(int k=1; k<=n; k++)
	{
		if(k>2) printf("   ");
		else printf("%3d", a[k]);
	}
}


//8
void insertionSort(int a[], int n)
{
	
	int x;
	int pos;
	xuat(a, n);
	for(int i=2; i<=n; i++)
	{
		
		x=a[i];	
		
		for(pos=i-1; pos>=1 && a[pos]>x; pos--)
		{
			
			a[pos+1]=a[pos];
			
		}
		a[pos+1] = x;
		printf("\ni=%-2d  ==>", i);
		for(int k=1; k<=i; k++)
		{
			 printf("%3d", a[k]);
		}
	}
}
//9
void insertionSort_Giam(int a[], int n)
{
	
	int x;
	int pos;
	xuat(a, n);
	for(int i=2; i<=n; i++)
	{
		
		x=a[i];	
		
		for(pos=i-1; pos>=1 && a[pos]<x; pos--)
		{
			
			a[pos+1]=a[pos];
			
		}
		a[pos+1] = x;
		printf("\ni=%-2d  ==>", i);
		for(int k=1; k<=i; k++)
		{
			 printf("%3d", a[k]);
		}
	}
}

void insertionSort_else(int a[], int n)
{

	int x;
	int pos;
	xuat(a, n);
	for(int i=n-1; i>=1; i--)
	{
		x=a[i];	
		
		for(pos=i+1; pos<=n && a[pos]<x; pos++)
		{
			
			a[pos-1]=a[pos];
			
		}
		a[pos-1] = x;
		
		printf("\ni=%-2d  ==>", i);
		for(int k=1; k<=n; k++)
		{
			if(k<i) printf("   ");
			else printf("%3d", a[k]);
		}
	}
}

//10
void interchageSort(int a[], int n)
{
	
	for(int i=1; i<n; i++)
	{
		for(int k=1; k<=n; k++)
		{
			if(k<i-1) printf("   ");
			else printf("%3d", a[k]);
		}
	
		for(int j=i+1; j<=n; j++)
		{
		
			if(a[j]<a[i])
			{
				swap(a[i], a[j]);
			}
			
		}
		printf("\ni=%-2d  ==>", i);
	
	}
	for(int k=1; k<=n; k++)
	{
		if(k<n-1) printf("   ");
		else printf("%3d", a[k]);
	}
}

//11.
void interchageSort_Giam(int a[], int n)
{
	
	for(int i=1; i<n; i++)
	{
		for(int k=1; k<=n; k++)
		{
			if(k<i-1) printf("   ");
			else printf("%3d", a[k]);
		}
	
		for(int j=i+1; j<=n; j++)
		{
		
			if(a[j]>a[i])
			{
				swap(a[i], a[j]);
			}
			
		}
		printf("\ni=%-2d  ==>", i);
	
	}
	for(int k=1; k<=n; k++)
	{
		if(k<n-1) printf("   ");
		else printf("%3d", a[k]);
	}
}

void interchageSort_else(int a[], int n)
{

	for(int i=n; i>1; i--)
	{
		for(int k=1; k<=n; k++)
		{
			if(k>i+1) printf("   ");
			else printf("%3d", a[k]);
		}
		
		for(int j=i-1; j>=1; j--)
		{
				
			if(a[j]>a[i])
			{
				swap(a[i], a[j]);
				
			}
	
		}
		printf("\ni=%-2d  ==>", i);
	
	}
	for(int k=1; k<=n; k++)
	{
		if(k>2) printf("   ");
		else printf("%3d", a[k]);
	}
}




//12.
void bubbleSort(int a[], int n)
{
	xuat(a, n);
	for(int i=1; i<n;i++)
	{
		
		for(int j=n; j>i; j--)
		{
			
			if(a[j]<a[j-1])
			{
				
				swap(a[j],a[j-1]);
			
				
			}
				
		}
		printf("\ni=%-2d  ==>", i);
		for(int k=1; k<=n; k++)
		{
			if(k<i) printf("   ");
			else printf("%3d", a[k]);
		}
	}
	
}

//13.
void bubbleSort_Giam(int a[], int n)
{
	xuat(a, n);
	for(int i=1; i<n;i++)
	{
		
		for(int j=n; j>i; j--)
		{
			
			if(a[j]>a[j-1])
			{
				
				swap(a[j],a[j-1]);
			
				
			}
				
		}
		printf("\ni=%-2d  ==>", i);
		for(int k=1; k<=n; k++)
		{
			if(k<i) printf("   ");
			else printf("%3d", a[k]);
		}
	}
	
}


void bubbleSort_else(int a[], int n)
{
	xuat(a, n);
	for(int i=n; i>1;i--)
	{
		
		
		for(int j=1; j<i; j++)
		{
		
			if(a[j]>a[j+1])
			{
				
				swap(a[j],a[j+1]);
				
				
			}
				
		}
		printf("\ni=%-2d  ==>", i);
		for(int k=1; k<=n; k++)
		{
			if(k>i) printf("   ");
			else printf("%3d", a[k]);
		}
	}
	
}


//14.
void QuickSort(int a[], int left, int right , int n)
{ 	
	int	i, j, x;
	if (left >= right)	return;
  	x = a[(left+right)/2];
  	i = left; j = right;
  	printf("\n%2d%3d%3d", i, j, x);
  	while(i <= j) 
	{
	
     	while(a[i] < x) i++;
     	while(a[j] > x) j--;
     	if(i <= j) 
		{ 
			swap(a[i], a[j]);
       	i++ ; j--;
	 	}
	}
	if(left==1)
	{
		for(int k=1; k<=n; k++)
  		{
  			if(k>right) printf("   ");
  			else	printf("%3d", a[k]);	
		}
	}
	else
	{
		for(int k=1; k<=n; k++)
  		{
  			if(k<left) printf("   ");
  			else	printf("%3d", a[k]);	
		}	
	}
	
	printf("%8d%4d", i, j);
	QuickSort(a, left, j, n);
	QuickSort(a, i, right, n);

}


//15.
void QuickSort_else(int a[], int left, int right, int n)
{ 	
	int	i, j, x;
	if (left >= right)	return;
  	x = a[(left+right)/2];
  	i = left; j = right;
  	
	printf("\n%2d%3d%3d", i, j, x);
  	while(i <= j) 
	{
     	while(a[i] > x) i++;
     	while(a[j] < x) j--;
     	if(i <= j) 
		{ 
			swap(a[i], a[j]);
       	i++ ; j--;
	 	}
	}
	if(left==1)
	{
		for(int k=1; k<=n; k++)
  		{
  			if(k>right) printf("   ");
  			else	printf("%3d", a[k]);	
		}
	}
	else
	{
		for(int k=1; k<=n; k++)
  		{
  			if(k<left) printf("   ");
  			else	printf("%3d", a[k]);	
		}	
	}
	printf("%8d%4d", i, j);
	QuickSort_else(a, left, j, n);
	QuickSort_else(a, i, right, n);

}


//16.
void QuickSortChanLe(int a[], int left, int right, int n)
{ 	
	int	i, j;
	if (left >= right)	return;
	i = left; j = right;	
	printf("\n%2d%3d", i, j);
  	while(i <= j) 
	{
     	while(a[i] %2==0) i++;
     	while(a[j] %2==1) j--;
     	if(i <= j) 
		{ 
			swap(a[i], a[j]);
       	i++ ; j--;
	 	}
	}

	if(left==1)
	{
		for(int k=1; k<=n; k++)
  		{
  			if(k>right) printf("   ");
  			else	printf("%3d", a[k]);
			  	
		}
	}
	else
	{
		for(int k=1; k<=n; k++)
  		{
  			if(k<left) printf("   ");
  			else	printf("%3d", a[k]);	
		}	
	}
	printf("%8d%4d", i, j);
	

}

//17.
void Shift (int a[], int left, int right)
{  
	 int  x, curr, joint;
   curr = left; joint =2*curr;
   x = a[curr];
   while (joint <= right) 
	{  	
		if (joint < right)        
         if (a[joint] < a[joint+1])
			joint = joint+1;
      if (a[joint]<x) break; 
		else
		{
		a[curr] = a[joint];
      	curr = joint; 
       joint = 2*curr;
		}
	 	a[curr] = x;
	}
}

//18.
void CreateHeap(int a[], int N)
{	
   int  left;	
    printf("\nGiai Doan 1:\n");
	printf("left");
	xuat(a, N);
	 for (left = (N)/2; left >= 1; left --)
	 {
	 	Shift(a, left, N);
	 	printf("\n%4d", left);
	 	for(int i=1; i<=N; i++)
	 	{
	 		if(i<left) printf("   ");
	 		else printf("%3d", a[i]);
		 }
	 	
	 }
		

	
}

//19.
void	HeapSort (int a[], int N)
{
   int   right;
   CreateHeap(a, N); 
   right = N; 
   printf("\n\nGiai doan 2:\n");
	printf("right");
	xuat(a, N);
   while (right > 1)
   {   printf("\n%4d", right);		
     swap(a[1],a[right]);
      right --;
      Shift(a,1,right);
	 
	 	for(int i=1; i<=N; i++)
	 	{
	 		if(i>right+1) printf("   ");
	 		else printf("%3d", a[i]);
		 }
   }
   printf("\n");
}

//20.
void Shift_Giam (int a[], int left, int right)
{  
	 int  x, curr, joint;
   curr = left; joint =2*curr;
   x = a[curr];
   while (joint <= right) 
	{  	
		if (joint < right)        
         if (a[joint] > a[joint+1])
			joint = joint+1;
      if (a[joint]>x) break; 
		else
		{
		a[curr] = a[joint];
      	curr = joint; 
       joint = 2*curr;
		}
	 	a[curr] = x;
	}
	 
}

//21.
void CreateHeap_Giam(int a[], int N)
{	
   int  left;
   printf("\nGiai Doan 1:\n");
	printf("left");
	xuat(a, N);
	 for (left = (N)/2; left >= 1; left --)
	 {
	 	Shift_Giam(a, left, N);
	 	printf("\n%4d", left);
	 	for(int i=1; i<=N; i++)
	 	{
	 		if(i<left) printf("   ");
	 		else printf("%3d", a[i]);
		 }
	 }
		
}

//22.
void HeapSort_Giam (int a[], int N)
{
   int   right;
   CreateHeap_Giam(a, N); 
   right = N; 
   printf("\n\nGiai doan 2:\n");
	printf("right");
	xuat(a, N);
   while (right > 1)
   {printf("\n%4d", right);
      swap(a[1],a[right]);
      right --;
      Shift_Giam(a,1,right);
       
	 	for(int i=1; i<=N; i++)
	 	{
	 		if(i>right+1) printf("   ");
	 		else printf("%3d", a[i]);
		 }
   }
   printf("\n");
}
