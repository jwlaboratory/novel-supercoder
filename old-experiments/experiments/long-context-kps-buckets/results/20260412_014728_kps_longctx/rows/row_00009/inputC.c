#include <stdio.h>
#include <stdlib.h>

struct node
{
  struct node *rt;
  struct node *lt;
  struct node *pt;
  int key;
};
typedef struct node *Node;

Node root;

void insert(int k)
{
  Node y = NULL;
  Node x = root;
  Node z;

  z = malloc(sizeof(struct node));
  z->key = k;
  z->lt = NULL;
  z->rt = NULL;

  while (x != NULL)
  {
    y = x;
    if (z->key < x->key) x = x->lt;
    else x = x->rt;
  }
  z->pt = y;

  if (y == NULL) root = z;
  else if (z->key < y->key) y->lt = z;
  else y->rt = z;
}

void inorder(Node u)
{

  if (u == NULL)
    return;
  inorder(u->lt);
  printf(" %d", u->key);
  inorder(u->rt);
}
void preorder(Node u)
{

  if (u == NULL)
    return;
  printf(" %d", u->key);
  preorder(u->lt);
  preorder(u->rt);
}
Node find(int key)
{
  Node X = root;

  while (1)
  {
    if (X == NULL) return NULL;
    if (X->key == key) return X;
    if (X->key < key)  X = X->rt;
    else X = X->lt;
  }
  }


Node treeSuccessor(Node A)
{
  Node X;
  Node B;
  A = A->rt;
  while (A->lt != NULL)A = A->lt;
  
  return A;
}

void treeDelete (Node X)
{
  Node B;
  Node child;

  if (X->rt == NULL && X->lt == NULL)
  {
    if (X->pt->rt == X)X->pt->rt = NULL;
    else X->pt->lt = NULL;
    free(X);
  }

  else if (X->rt != NULL && X->lt != NULL)
  {
    B = treeSuccessor(X);
    X->key = B->key;
    treeDelete(B);
  }

  else
  {
    if (X->rt==NULL)child=X->lt;
    else child=X->rt;

    if (X->pt==NULL)
    {
      child->pt=NULL;
      return;
    }
    if (X->pt->key < X->key) X->pt->rt=child;
    else X->pt->lt=child;
    child->pt=X->pt;
    free(X);
  }
}

int main()
{
  int n, i, x,count = 0;;
  char com[10];
  scanf("%d", &n);
  
  for (i = 0; i < n; i++)
  {
    scanf("%s", com);
    if (com[0] == 'i')
    {
      scanf("%d", &x);
      insert(x);
    }
    else if (com[0] == 'f')
    {
      scanf("%d", &x);
      
      if (count) printf("\n");
      if (find(x) != NULL)printf("yes\n");
      else printf("no\n");
    }
    else if (com[0] == 'd')
    {
      scanf("%d", &x);
      treeDelete (find(x));
    }
    else if (com[0] == 'p')
    {
      inorder(root);
      printf("\n");
      preorder(root);
      printf("\n");
    }
  }
  return 0;
}

