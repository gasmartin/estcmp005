#include <stdio.h>

int main() {
    int a, b;

    scanf("%d %d", &a,&b);

    if(a > b) {
        b = b + a;
        a = b - a;
        b = b - a;
    }

    while(++a != b) printf("%d\n", a);

    return 0;
}