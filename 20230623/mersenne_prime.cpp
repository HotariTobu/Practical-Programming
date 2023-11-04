#include <cstdio>
#include <cstdlib>

int main() {
    std::puts("12番目のメルセンヌ素数");

    FILE* p = popen("python", "w");

    std::fprintf(p, "p = 127\n");
    std::fprintf(p, "m = 2 ** p - 1\n");
    std::fprintf(p, "print(m)\n");

    pclose(p);
}