#include <stdio.h>

int main() {
    int x = 1000000;
    printf("%02X ", *((char*)&x + 0));
    printf("%02X ", *((char*)&x + 1));
    printf("%02X ", *((char*)&x + 2));
    printf("%02X\n", *((char*)&x + 3));
}

/****************************************************************
40 42 0F 00
リトルエンディアン


****************************************************************/