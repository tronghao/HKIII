#include "stdio.h"
#include "conio.h"
#include "windows.h"
#include "string.h"
#include "stdlib.h"

typedef struct Sinh_Vien
{
	char mssv[10];
	char tenSV[30];
	float diem;
}SV;

typedef struct Node
{
	SV data;
	Node * link;
}Node;

typedef struct List 
{
	Node* first;
	Node* last; 	
}List;


void nhapSV(SV &a);
void xuatSV(SV a);
Node*	GetNode(SV x);
void AddFirst(List &l, Node* new_ele);
void AddLast(List &l, Node *new_ele);
void Addafter(List &l,Node *q, Node* new_ele);
void Init(List &l);  //Khoi tao danh sach rong
void Output(List l);
void InputLast(List &l); // them du lieu vao cuoi
void InputFirst(List &l);// them du lieu vao dau
int dem(List l);
void ds_lon_hon_5(List l);
void ghifile(List l);
void docfile(List &l);
void RemoveAfter(List &l, Node *q );
void  RemoveFirst(List &l);
void InsertionSortList(List &l);
void InsertionSortList2(List &l);

//color
void chuongtrinh(int &lc);


//-----------------------------------------Ham Main-------------------------------------------------


int main()
{
	SV a;	
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
			printf("Chuong trinh hien tai: Nhap danh sach\n");
			InputLast(l);
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}
		
		case 2:
		{
			system("cls");
			printf("Chuong trinh hien tai: Xuat danh sach\n");
			printf("\nDanh sach sinh vien:");
			Output(l);
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}
		case 3:
		{
			system("cls");
			printf("Chuong trinh hien tai: Dem so luong sinh vien co trong danh sach\n");
			printf("\nSo luong sinh vien hien tai la: %d", dem(l));
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}	
		case 4:
		{
			system("cls");
			printf("Chuong trinh hien tai: Danh sach sinh vien co diem >= 5\n");
			printf("\nDanh sach sinh vien:");
			ds_lon_hon_5(l);
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}	
		case 5:
		{
			system("cls");
			printf("Chuong trinh hien tai: Xuat file\n");
			ghifile(l);
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}	
		case 6:
		{
			system("cls");
			printf("Chuong trinh hien tai: Doc file\n");
			docfile(l);
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}	
		case 7:
		{
			system("cls");
			printf("Chuong trinh hien tai: Xoa dau danh sach\n");
		    RemoveFirst(l);
		    printf("\n Thanh Cong!");
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}	
		case 8:
		{
			system("cls");
			printf("Chuong trinh hien tai: Xoa danh sach sau q\n");
		    RemoveAfter(l, l.first);
		    printf("\n Thanh Cong!");
			printf("\nNhan phim bat ky de tiep tuc!");
			getch();
			break;
		}
		case 9:
		{
			system("cls");
			printf("Chuong trinh hien tai: InsertionSort\n");
		    InsertionSortList2(l);
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
	printf("\n1. Nhap danh sach");
	printf("\n2. Xuat danh sach");
	printf("\n3. Dem so luong sinh vien trong danh sach");
	printf("\n4. Danh sach sinh vien co diem >= 5");
	printf("\n5. Xuat file");
	printf("\n6. Doc file");
	printf("\n7. Xoa dau danh sach");
	printf("\n8. Xoa danh sach sau q");
	printf("\n9. InsertionSort");
	do{
		printf("\nChon Chuong trinh: ");
		scanf("%d", &lc);
		if(lc!=0 && lc!=1 && lc!=2 && lc!=3 && lc!=4  && lc!=5  && lc!=6 && lc!=7 && lc!=8  && lc!=9) printf("\n\tToi khong hieu!\n");
	}while(lc!=0 && lc!=1 && lc!=2 && lc!=3 && lc!=4  && lc!=5  && lc!=6 && lc!=7 && lc!=8 && lc!=9);
}
void c2()
{
		/*Cach 2 them du lieu vao cuoi*/
//	do{	
//		system("cls");	
//		nhapSV(a);
//		AddLast(l, GetNode(a));
//		printf("\n\nTiep tuc nhap:1 \t Dung:0");
//		
//		do
//		{
//			printf("\nLua chon cua ban: ");
//			scanf("%d", &n);
//			if(n!=1 && n!=0) printf("Toi Khong Hieu!\n");	
//		}while(n!=1 && n!=0);
//		
//	}while(n!=0);
}

void nhapSV(SV &a)
{
	printf("\nNhap MSSV: ");
	fflush(stdin); gets(a.mssv);
	
	printf("Nhap Ten SV: ");
	fflush(stdin); gets(a.tenSV);
	
	printf("Nhap Diem: ");
	scanf("%f", &a.diem);
}


void xuatSV(SV a)
{
	printf("\nMSSV: %-10s | TenSV: %-30s | Diem: %.2f", a.mssv,a.tenSV,a.diem);
}

Node*	GetNode(SV x) 
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
			xuatSV(p->data);
			p=p ->link;
		}
} 

void InputFirst(List &l)
{	
	SV x;
	int n;     
	printf("Nhap so phan tu :");
	scanf("%d",&n);
	for(int i=0;i<n;i++)
	{
		printf("Nhap phan tu thu %d :",i);
		nhapSV(x);
		Node* p=GetNode(x);
		AddFirst(l, p);
	}
}
void InputLast(List &l)
{	
	SV x;
	int n;     
	printf("Nhap so phan tu :");
	scanf("%d",&n);
	for(int i=0;i<n;i++)
	{
		printf("----------------------");
		printf("\nNhap phan tu thu %d :\n",i);
		nhapSV(x);
		Node* p=GetNode(x);
		AddLast(l, p);
	}
}

int dem(List l)
{
	int dem=0;
	Node* p=l.first;
		while(p!=NULL)
		{
			dem++;
			p=p ->link;
		}
	return dem;
}

void ds_lon_hon_5(List l)
{
	Node* p=l.first;
		while(p!=NULL)
		{
			if(p->data.diem>=5)
				xuatSV(p->data);
			p=p ->link;
		}
}
void ghifile(List l)
{
		char dd[30];
		printf("\nNhap duong dan: ");
		fflush(stdin); gets(dd);
		Node* p=l.first;
		FILE *fp;
		fp = fopen(dd, "a");
		while(p!=NULL)
		{		
  			fprintf(fp, "%s\t%s\t%.2f", p->data.tenSV, p->data.mssv, p->data.diem);
  		
			p=p ->link;
		}
		fclose(fp);
}
void docfile(List &l)
{
		char dd[30];
		printf("\nNhap duong dan: ");
		fflush(stdin); gets(dd);
		FILE *fp;
		fp = fopen(dd, "r");
		SV a;
		while(!feof(fp))
		{
			char tx[10];
			fscanf(fp, "%s" , a.mssv);
			fgets(tx, 10, fp);
  			fgets(a.tenSV, 30, fp);
  			fscanf(fp, "%f" , &a.diem);
  			Node* p=GetNode(a);
  			AddLast(l, p);	
		}			
		fclose(fp);
}
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

void InsertionSortList(List &l)
{
		SV x,a;
		Node* p=l.first;
		p=p->link;
		while(p!=NULL)
		{
			x=p->data;
			Node * pos=l.first;
			while(pos != p)
			{
			
				if(atoi(pos->data.mssv) >= atoi(x.mssv))
				{
					a=pos->data;
					pos->data=x;
					x=a;
				}
	
				pos=pos->link;
			
			}
			pos->data=x;
			p=p ->link;
		}
}

void InsertionSortList2(List &l)
{
		int dem, dem2=0;
		SV x,a;
		Node* p=l.first, *tam=l.first, *tam2;
		tam2=p;
		p=p->link;
		
		while(p!=NULL)
		{
			dem=0;
			x=p->data;
			Node * pos=l.first;
			while(pos != p)
			{
				
				
				if(atoi(pos->data.mssv) >= atoi(x.mssv))
				{
					if(dem==0)
					{
						AddFirst(l,GetNode(x));
						RemoveAfter(l, tam2);
						break;
					}
					else
					{
						Addafter(l,tam, GetNode(x));
						RemoveAfter(l, tam2);
						break;
					}	
				}
				tam=pos;
				pos=pos->link;
				dem++;
			}
			if(dem2!=0) tam2=tam2->link;
			dem2++;
			p=p ->link;
		}
}

