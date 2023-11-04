#include <iostream>
#include <unistd.h>

int main() {
    if (isatty(fileno(stdin)) != 0) {
        std::cout << "入力" << std::endl;
    }

    if (isatty(fileno(stdout)) != 0) {
        std::cout << "出力" << std::endl;
    }

    if (isatty(fileno(stderr)) != 0) {
        std::cout << "エラー" << std::endl;
    }
}

// 2XXXX1@ISE88u:~/Practical-Programming/20230623$ g++ detect_terminal.c && ./a.out
// 入力
// 出力
// エラー
// 2XXXX1@ISE88u:~/Practical-Programming/20230623$ g++ detect_terminal.c && ls | ./a.out
// 出力
// エラー
