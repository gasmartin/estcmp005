#include <iostream>

int main() {
    int a, b;

    std::cin >> a >> b;

    if(a > b) {
        b = b + a;
        a = b - a;
        b = b - a;
    }

    while(++a != b) std::cout << a << std::endl;

    return 0;
}
