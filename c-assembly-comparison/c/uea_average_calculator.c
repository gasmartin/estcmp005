#include <stdio.h>

int main() {
    float ap1, ap2, pf, average;

    scanf("%f %f", &ap1,&ap2);

    average = (ap1 + ap2) / 2.0;

    if(average < 8.0) {
        scanf("%f", &pf);

        average = (ap1 + ap2 + pf) / 3.0;
    }
    
    printf("%.2f\n",average);

    return 0;
}