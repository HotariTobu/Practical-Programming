#include <cstdio>
#include <stdio.h>

int main() {
    std::FILE* p = popen("gnuplot --persist", "w");

    for (int i = 0; i < 50; i++)
    {
        std::fprintf(p, "plot sin(x + %f)\n", 0.05 * i);
        std::fprintf(p, "pause 0.1\n");
    }

    pclose(p);
}