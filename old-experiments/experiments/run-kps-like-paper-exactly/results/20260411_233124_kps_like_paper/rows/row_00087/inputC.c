#include <stdio.h>

void bubbleSort(int numbers[], int array_size);

int main(){
    int moji[3] = {0};
    int i;
    int flag = 0;

    for(i = 0; i < 3; i++){
        scanf("%d", &moji[i]);
    }

    bubbleSort(moji, 3);

    if(moji[0] != 7) flag = 1;

    for(i = 1; i < 3; i++){
        if(moji[i] != 5) flag = 1;
    }

    if(flag == 0) printf("YES\n");
    else printf("NO\n");

    return 0;

}

void bubbleSort(int numbers[], int array_size){
  
    int i, j, temp;

  for (i = 0; i < (array_size - 1); i++) {
    for (j = (array_size - 1); j > i; j--) {
      if (numbers[j-1] < numbers[j]) {
        temp = numbers[j-1];
        numbers[j-1] = numbers[j];
        numbers[j] = temp;
      }
    }
  }
}