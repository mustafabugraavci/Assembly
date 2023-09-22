#include <stdio.h>

#define UNUSED(x) x

int puts(const char *str)
{
    UNUSED(str);
    return 0;
}

int putc(int str, FILE *stream)
{
    UNUSED(str);
    UNUSED(stream);
    return 0;
}

int putchar(int str)
{
    UNUSED(str);
    return 0;
}

// Declare the assembly function prototype
extern void calculate_fibonacci(int n, int* result);

int main() {
    int n = 10; // Compute the 10th Fibonacci number
    int result; // Variable to store the result
    
    // Call the assembly function using the GRV
    calculate_fibonacci(n, &result);
    
    return 0;
}
