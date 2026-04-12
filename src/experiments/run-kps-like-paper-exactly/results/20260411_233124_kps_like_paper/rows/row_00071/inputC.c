#include <stdio.h>

int stringLength(char a[]){
int length = 0;
while(a[length]) length++;
return length;
}

int main(){
char s1 [20];
char s2 [20];
char s3 [20];
scanf("%s\n%s", s1, s2);

int length = stringLength(s1);

int i;
for(i = 0; i<length; i++){
    s3[i] = s2[i];
}

if (stringLength(s2) != length+1){
    printf("No\n");
    return 0;
}
else {
        for(i = 0; i<length; i++){
            if (s3[i] != s1[i]){
                printf("No\n");
                return 0;
        }
    }
}

printf("Yes\n");

return 0;
}