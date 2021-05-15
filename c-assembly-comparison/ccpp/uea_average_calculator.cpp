#include <iostream>

int main() {
    float ap1, ap2, pf, average;

    std::cin >> ap1 >> ap2;

    average = (ap1 + ap2) / 2.0;

    if(average < 8.0) {
        std::cin >> pf;

        average = (ap1 + ap2 + pf) / 3.0;
    }
    
    std::cout << average << std::endl;

    return 0;
}
