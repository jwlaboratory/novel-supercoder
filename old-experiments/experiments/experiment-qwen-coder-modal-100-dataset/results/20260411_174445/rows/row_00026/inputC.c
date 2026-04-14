#include<stdio.h>
#include<stdlib.h>

int n;
int map[100][100];

int pilehigh(int w){
  int i;
  for(i=0;i<n;i++)if(!map[w][i])break;
  return i;
}

void takeoff(int pickw ,int pickh){
  int i,j;

  for(i=n-1;i>pickh;i--){
    if(map[pickw][i]){
      for(j=0;j<n;j++){
	if(!map[j][0]){
	  map[j][0] = map[pickw][i];
	  map[pickw][i] = 0;
	  break;
	}
      }
    }
  }
}

void puton(int pickw,int pickh,int putw,int puth){
  map[putw][puth+1] = map[pickw][pickh];
  map[pickw][pickh] = 0;
}

void pileup(int pick , int put){
  int flag;
  int pickw,pickh;
  int putw,puth;

  if(pick == put)return;
    

  flag = 0;
  for(pickw=0;pickw<n;pickw++){
    for(pickh=0;pickh<n;pickh++){
      if(map[pickw][pickh] == pick){
	flag = 1;
	break;
      }
    }
    if(flag)break;
  }

  flag = 0;
  for(putw=0;putw<n;putw++){
    for(puth=0;puth<n;puth++){
      if(map[putw][puth] == put){
	flag = 1;
	break;
      }
    }
    if(flag)break;
  }

  if(put == 0){
    if(pickh == 0)return;
    else{
      takeoff(pickw,pickh-1);
      return;
    }
  }
 
  if(pickw == putw){
    if(pickh > puth)return;
    else{
      takeoff(pickw,pickh);
      flag = 0;
      for(putw=0;putw<n;putw++){
	for(puth=0;puth<n;puth++){
	  if(map[putw][puth] == put){
	    flag = 1;
	    break;
	  }
	}
	if(flag)break;
      }
      puton(pickw,pickh,putw,puth);
      return;
    }
  }else{
    takeoff(pickw,pickh);
    puton(pickw,pickh,putw,pilehigh(putw)-1);
    return;
  }
}

int main(void){
  int i,j;
  int pick,put;
  int high[100];
  int tmp,count;

  while(1){
    scanf(" %d ",&n);
    if(!n)break;
    
    for(i=0;i<n;i++)map[i][0] = i+1;
    for(i=0;i<n;i++){
      for(j=1;j<n;j++){
	map[i][j] = 0;
      }
    }

    while(1){
      scanf(" %d %d ",&pick,&put);
      if(!pick && !put)break;

      pileup(pick,put);
    }


    count = 0;
    for(i=0;i<n;i++){
      tmp = pilehigh(i);
      if(tmp){
	high[count] = tmp;
	count++;
      }
    }
    
    for(i=0;i<count;i++){
      for(j=i+1;j<count;j++){
	if(high[i] > high[j]){
	  tmp = high[i];
	  high[i] = high[j];
	  high[j] = tmp;
	}
      }
    }

    for(i=0;i<count;i++)printf("%d\n",high[i]);
    printf("end\n");
    
  }

  return 0;
}