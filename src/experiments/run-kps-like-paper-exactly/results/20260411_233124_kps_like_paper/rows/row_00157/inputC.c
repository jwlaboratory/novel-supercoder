#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct a{
    int num;
	struct a *next,*before;
}Node;

void insert(int n,Node* nil){
    Node* node = (Node*)malloc(sizeof(Node));
    node->num=n;
    nil->next->before = node;
    node->next = nil->next;
    node->before = nil;
    nil->next = node;
}

void delete(Node* node){
    node->next->before = node->before;
    node->before->next = node->next;
    free(node);
}

void dsearch(Node* nil,int x){
    Node* node;
    for(node=nil->next;node!=nil;node = node->next){
        if(node->num==x){
            delete(node);
            break;
        }
    }
}

int main(void){
    int n,i,x;
    char str[16];
    Node *nil;
    Node *aa;
    nil = (Node*)malloc(sizeof(Node));
    nil->next = nil;
    nil->before = nil;
    scanf("%d",&n);
    for(i=0;i<n;i++){
        scanf("%s",str);
        if(strcmp(str,"deleteFirst")==0){
            delete(nil->next);
        }else if(strcmp(str,"deleteLast")==0){
            delete(nil->before);
        }else if(strcmp(str,"insert")==0){
            scanf("%d",&x);
            insert(x,nil);
        }else if(strcmp(str,"delete")==0){
            scanf("%d",&x);
            dsearch(nil,x);
        }
    }
    for(aa=nil->next;aa!=nil;aa=aa->next){
        printf("%d",aa->num);
        if(aa->next!=nil){
            printf(" ");
        }
    }
    printf("\n");
	return 0;
}


