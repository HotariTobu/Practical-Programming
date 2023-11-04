#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
    for (int i = 0; i < argc; i++) {
        printf("< %s\n", argv[i]);
    }

    char line[265];

    while (1) {
        printf("> ");
        fgets(line, sizeof(line), stdin);

        if (line == NULL) {
            break;
        }

        if (strlen(line) == 1) {
            break;
        }

        printf("%s", line);
    }

    for (int i = 0; i < 10; i++) {
        fprintf(stderr, "Error: %d\n", i);
    }
}