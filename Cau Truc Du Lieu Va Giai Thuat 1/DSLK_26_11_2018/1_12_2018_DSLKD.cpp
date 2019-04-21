#include "stdio.h"
#include "conio.h"
#include "windows.h"
#include "string.h"
#include "stdlib.h"
#include "math.h"

typedef struct Sach
{
	char tenSach[50];
	char tenTacGia[20];
	int nam;
}S;

typedef struct Node
{
	S data;
	Node * link;
}Node;

typedef struct List 
{
	Node* first;
	Node* last; 	
}List;


void nhapS(S &a);
void xuatS(S a);
Node*	GetNode(S x);
void AddFirst(List &l, Node* new_ele);
void AddLast(List &l, Node *new_ele);
void Addafter(List &l,Node *q, Node* new_ele);
void Init(List &l);  //Khoi tao danh sach rong
void Output(List l);
void InputLast(List &l); // them du lieu vao cuoi
void InputFirst(List &l);// them du lieu vao dau

void docfile(List &l);
/*
void rutGonDT(List &l);
void RemoveAfter(List &l, Node *q );
void  RemoveFirst(List &l);
long giaTriDT(List &l, int x);
*/

//color
void chuongtrinh(int &lc);


//-----------------------------------------Ham Main-------------------------------------------------


int main()
{
	system("color F1");
	S a;	
	int n, lc, con;
	List l;
	Init(l);
do{
	system("cls");	
	chuongtrinh(lc);
	
	switch(lc)
	{
		case 1:
		{
			system("cls");
			printf("Chuong trinh hien tai: Nhap da thuc\n");
			InputLast(l);
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}
		
		case 2:
		{
			system("cls");
			printf("Chuong trinh hien tai: Xuat da thuc\n");
			printf("\nDu lieu da thuc:");
			Output(l);
			printf("\n\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}
		
		case 3:
		{
			system("cls");
			printf("Chuong trinh hien tai: Doc file\n");
			docfile(l);
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}
		
		case 4:
		{
			system("cls");
			printf("Chuong trinh hien tai: Rut Gon Da Thuc\n");
		//	rutGonDT(l);
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}
		
		case 5:
		{
			system("cls");
			printf("Chuong trinh hien tai: Tinh gia tri da thuc voi gia tri x\n");
			int x;
			printf("\n---------Nhap gia tri x: ");
			scanf("%d", &x);
		//	printf("\n\t=>Gia Tri Da Thuc: P(%d)=%ld\n\n", x, giaTriDT(l, x));
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}		
		
		
	}
}while(lc!=0);


	return 0;
}



//---------------------------------Ket Thuc Ham Main---------------------------------

void chuongtrinh(int &lc)
{
	printf("0. Exit");
	printf("\n1. Nhap Sach");
	printf("\n2. Xuat Sach");
	printf("\n3. Doc file");
	printf("\n4. Rut Gon da thuc");
	printf("\n5. Tinh gia tri da thuc voi gia tri x");

	do{
		printf("\nChon Chuong trinh: ");
		scanf("%d", &lc);
		if(lc!=0 && lc!=1 && lc!=2 && lc!=3 && lc!=4  && lc!=5) printf("\n\tToi khong hieu!\n");
	}while(lc!=0 && lc!=1 && lc!=2 && lc!=3 && lc!=4  && lc!=5);
}



void nhapS(S &a)
{	
	printf("Nhap Ten Sach: ");
	fflush(stdin);
	gets(a.tenSach);
	
	printf("Nhap Ten Tac Gia: ");
	fflush(stdin);
	gets(a.tenTacGia);
	
	printf("Nhap Nam Xuat Ban: ");
	scanf("%d", &a.nam);
}


void xuatS(S a)
{
	printf("\nTen Sach:%-30s Ten Tac Gia:%-20s Nam Xuat Ban:%d", a.tenSach, a.tenTacGia, a.nam);
}

Node*	GetNode(S x) 
{	
	Node *p;
	
	p= new Node;
	p->data = x; 
	p->link = NULL;
	return p; 
}

void AddFirst(List &l, Node* new_ele)
{
	if (l.first == NULL)  
	{
		l.first = new_ele;
		l.last  = l.first;
	}
	else 
	{	
		new_ele->link = l.first;  
		l.first = new_ele; 	
	}
}

void AddLast(List &l, Node *new_ele)
{
	if (l.first==NULL)  
	{
		l.last = new_ele;
		 l.first = l.last;
	}
	else
	{
		l.last->link = new_ele;
		 l.last = new_ele ;
	}	
}

void Addafter(List &l,Node *q, Node* new_ele)
{
		if (q!=NULL && new_ele !=NULL)  
		{
			new_ele->link = q->link;
			q->link = new_ele; 	
			if(q == l.last)
					l.last = new_ele; 
		}
		else
			AddFirst(l,new_ele);
}
void Init(List &l)
{
	l.first = l.last = NULL;
}
void Output(List l)
{
		Node* p=l.first;
		while(p!=NULL)
		{
			
			xuatS(p->data);
			p=p ->link;
		
		}
} 

void InputFirst(List &l)
{	
	S x;
	int n;     
	printf("Nhap so phan tu :");
	scanf("%d",&n);
	for(int i=0;i<n;i++)
	{
		printf("Nhap phan tu thu %d :",i);
		nhapS(x);
		Node* p=GetNode(x);
		AddFirst(l, p);
	}
}
void InputLast(List &l)
{	
	S x;
	int n;     
	printf("Nhap so phan tu :");
	scanf("%d",&n);
	for(int i=0;i<n;i++)
	{
		printf("----------------------");
		printf("\nNhap phan tu thu %d :\n",i);
		nhapS(x);
		Node* p=GetNode(x);
		AddLast(l, p);
	}
}

void docfile(List &l)
{
		char dd[30];
		printf("\nNhap duong dan: ");
		fflush(stdin); gets(dd);
		FILE *fp;
		fp = fopen(dd, "r");
		S a;
		if(fp==NULL) printf("\n-----Khong doc duoc file!-----\n");
		else
		{
			while(!feof(fp))
			{
				char b[5];
				fgets(b, 5, fp);
				fgets(a.tenSach, 50, fp);
				//fgets(b, 5, fp);
				fgets(a.tenTacGia, 20, fp);
				fscanf(fp, "%d", &a.nam);
  				Node* p=GetNode(a);
  				AddLast(l, p);	
			}
			printf("\n------Thanh Cong!-------\n");
		}
				
		fclose(fp);
}
/*
void rutGonDT(List &l)
{
	Node *p=l.first, *tam;
	
	while(p!=NULL)
	{
		tam=p;
		Node *pos=p->link;
		
		while(pos!=NULL)
		{
			if(p->data.soMu == pos->data.soMu)
			{
				p->data.hangSo += pos->data.hangSo;
				RemoveAfter(l, tam);
				pos=tam->link;
			}
			else
			{
				tam=pos;
				pos=pos->link;
			}
		
		}
		p=p->link;
	}
	printf("\n-------------Bieu thuc da duoc rut gon--------------\n");
}*/

void RemoveAfter(List &l, Node *q )
{
	if(q !=NULL && q->link !=NULL)
	{
		Node*   p = q->link;
		q->link = p->link;
		if(p==l.last)	 l.last=q;
		free(p);
	}
}
void  RemoveFirst(List &l)
{
	if(l.first != NULL)
	{
		Node* p=l.first;
		l.first=p->link;
		if(l.first == NULL) l.last=NULL;
		free(p);
	}
}
/*
long giaTriDT(List &l, int x)
{
	long sum=0;
	Node *p=l.first;
	while(p!=NULL)
	{
		sum+=(p->data.hangSo * pow(x, p->data.soMu));
		p=p->link;
	}
	return sum;
}
*/