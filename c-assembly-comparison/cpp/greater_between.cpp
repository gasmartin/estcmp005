#include <iostream>

int main() {
    int a, b, greater;

    std::cin >> a >> b;

    if(a > b) {
        greater = a;
    }
    else {
        greater = b;
    }
    
    std::cout << greater << std::endl;

    return 0;
}
