#include <stdio.h>

int main() {
    int a, b, greater;

    scanf("%d %d", &a,&b);

    if(a > b) {
        greater = a;
    }
    else {
        greater = b;
    }
    
    printf("%d \n", greater);
    
    return 0;
}