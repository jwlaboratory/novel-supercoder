#include <stdio.h>
#include <ctype.h>

int main()
{
    char ch;
    int i, count[26] = {};
    
    while(scanf("%c", &ch) != EOF){
        ch = tolower(ch);
        if ('a' <= ch && ch <= 'z') count[ch - 'a']++;
    }
    for (i = 0; i < 26; i++)
        printf("%c : %d\n", 'a' + i, count[i]);
    
    return 0;
}