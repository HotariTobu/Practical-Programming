#include <iostream>
#include <cstdio>
#include <cstdlib>

int main() {
    FILE* p = popen("python -c \"print(2 ** 127 - 1)\"", "r");

    double m;

    std::fscanf(p, "%lf", &m);
    std::cout << "12番目のメルセンヌ素数の値は約" << m << "です" << std::endl;

    pclose(p);
}