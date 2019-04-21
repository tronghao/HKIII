#include "stdio.h"
#include "windows.h"

typedef struct NODE
{
	int data;
	NODE* left;
	NODE* right;
} NODE;

typedef NODE* TREE;
void  InsertTree(TREE  &root , int  x);
void CreateTree(TREE &root);
void	NLR(TREE root);
void	LNR(TREE root);
void	LRN(TREE root);
NODE * searchNode(TREE root, int X);
NODE* searchNode2(TREE root, int X);
void removeTree(TREE &root);
void search(TREE root);
int delNode(TREE &root, int X);
void searchStandFor(TREE &p, TREE &q);

int main()
{
	system("color F1");
	TREE root;
	root = NULL;
	CreateTree(root);
	
	printf("\n\n\t----Duyet cay nhu the nay: Left Node Right nha!----\n\t");
	LNR(root);
	
	printf("\n\n\t----Duyet cay nhu the nay: Node Left Right nha!----\n\t");
	NLR(root);
	
	printf("\n\n\t----Duyet cay nhu the nay: Left Right Node nha!----\n\t");
	LRN(root);
	
	search(root);
	
	int x;
	printf("\n\n\tNhap so can xoa: ");
	scanf("%d", &x);
	if(delNode(root, x)==0) printf("\n\t\tKhong co so nay nen khong xoa duoc do hihi!");
	
	printf("\n\n\t----Duyet cay nhu the nay: Left Node Right nha!----\n\t");
	LNR(root);
	
	printf("\n\n\t----Duyet cay nhu the nay: Node Left Right nha!----\n\t");
	NLR(root);
	
	printf("\n\n\t----Duyet cay nhu the nay: Left Right Node nha!----\n\t");
	LRN(root);
	
	//delete();
	
	return 0;
}

void  InsertTree(TREE  &root , int  x)
	{
		if(root != NULL)
		{
			if(root->data==x) return;
			if(root->data>x) 
				InsertTree(root->left,x);
			else 
				InsertTree(root->right,x);
		}
		else
		{
			root=new(NODE);
			root->data=x;
			root->left=root->right=NULL;
		}
	}

void CreateTree(TREE &root)
	{
		int x,n;
		printf("\tNhap n = "); scanf("%d",&n);
		for(int i=1; i<=n;i++)
		{
			printf("%d | ", i);
			scanf("%d",&x);
			InsertTree(root,x);
			
		}
	}
void	NLR(TREE root)
{
	if (root != NULL)
	{
		printf("%3d", root->data);
		NLR(root->left);
		NLR(root->right);
	}
}

void	LNR(TREE root)
{
	if (root != NULL)
	{
		LNR(root->left);
		printf("%3d", root->data);
		LNR(root->right);
	}
}

void	LRN(TREE root)
{
	if (root != NULL)
	{
		LRN(root->left);
		LRN(root->right);
		printf("%3d", root->data);
	}
}


NODE* searchNode2(TREE root, int X)
{
	if(root!=NULL)	
	{
		if(root->data == X)
			return root;
		else if(root->data > X)
			searchNode2(root->left, X);
		else
			searchNode2(root->right, X);
	}
	return NULL;
} 

NODE * searchNode(TREE root,  int x)
{  
	NODE *p = root;
	while (p != NULL)
	{
		if(x == p->data)   return p;
		else    
			if(x < p->data) p = p->left;
			else	p = p->right;
	}
	return NULL;
}


void search(TREE root)
{
	int x;
	printf("\n\n\tNhap so can tim: ");
	scanf("%d", &x);
	NODE *dlieu;
	dlieu=searchNode2(root, x);
	if(dlieu==NULL) printf("\n\n\t\t|Khong Co So Nay hihi|");
	else printf("\n\n\t\t|Co So Nay Do hihi|");
}

int delNode(TREE &root, int X)
{	
		if(root== NULL)	return 0;
		if(root->data > X)	delNode(root->left, X);
		if(root->data < X)	delNode(root->right, X);

		if(root->data==X)
		{	
			NODE* p = root;
			if(root->left == NULL)
			root = root->right;
		else
		   if(root->right == NULL) 
			root = root->left;
		   else 
			searchStandFor(p, root->left);
	free(p);
	}
}

void searchStandFor(TREE &p, TREE &q)
{
	if(q->right!=NULL)
		  searchStandFor(p, q->right);
	else	
	{
		p->data = q->data;
	 	p  = q;
		if(q->left!=NULL)
			q = q->left;
		else
	  		q = q->right;
	}
}

void removeTree(TREE &root)
{
	if(root!=NULL)	{
		  removeTree(root->left);
		  removeTree(root->right);
		  delNode(root,root->data);
	}
} 


