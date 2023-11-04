#include <signal.h>
#include <stdio.h>
#include <stdlib.h>

void my_signal_handler(int sig_num) {
    puts("Trapped!");
    exit(sig_num);
}

int main() {
    signal(SIGINT, my_signal_handler);

    int n;
    scanf("%d", &n);
    printf("%d\n", n);
}