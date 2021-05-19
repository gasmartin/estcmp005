#include <stdio.h>

int main() {
    float f, c;

    scanf("%f", &f);

    c = (f - 32.0) * 5.0 / 9.0;

    printf("%f\n", c);

    return 0;
}