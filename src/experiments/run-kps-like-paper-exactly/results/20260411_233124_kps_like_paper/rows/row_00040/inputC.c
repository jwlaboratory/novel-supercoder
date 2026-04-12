#include<stdio.h>

#define MAXLEN 10000
 
  
int main( void ) 
{
 	int n,q;
 	int S[MAXLEN+1],T[MAXLEN+1];
 	int i,j;
	int cnt;	
	
    scanf( "%d", &n ); 
    for( i=0; i<n; i++ ) {
    	scanf( "%d", &S[i] ); 
    }

	for( i=0; i<n; i++ ) {
		for( j=i+1; j<n; j++ ) {
			if( S[i] == S[j] ) {
				S[j]=-1;
			}
		}
	}
    scanf( "%d", &q); 
    for( i=0; i<q; i++ ) {
    	scanf( "%d", &T[i] ); 
    }
	
	for( i=0; i<q; i++ ) {
		for( j=i+1; j<q; j++ ) {
			if( T[i] == T[j] ) {
				T[j]=-1;
			}
		}
	}
    
	cnt=0;
	for( i=0; i<n; i++ ) {
		if( -1==S[i] ) { continue; }
		for( j=0; j<q; j++ ) {
			if( S[i] == T[j] ) {
				cnt++;
				break;
			}
		}
	}
	
	if( cnt ) {
		printf( "%d\n", cnt );
	} else {
		printf( "0\n" );
	}

    return 0;
}