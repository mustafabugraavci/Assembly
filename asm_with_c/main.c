#include <stdio.h>

#define UNUSED(x) x

int puts(const char *str)
{
    UNUSED(str);
    return 0;
}

void hello_from_c() {
    printf("Hello from C!\n");
}

int main() {
    hello_from_c();
    return 0;
}