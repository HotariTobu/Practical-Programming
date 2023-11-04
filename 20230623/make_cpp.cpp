#include <cstdio>
#include <cstdlib>

int main() {
    char cmd_str[1024];

    std::system("mkdir cpps");

    for (int i = 0; i < 200; i++)
    {
        int num = i + 1;
        std::sprintf(cmd_str, "touch cpps/kadai%03d.cpp", num);
        std::system(cmd_str);
    }
    
}