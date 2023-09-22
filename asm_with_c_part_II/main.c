#include <stdio.h>

// Declare the assembly function prototype
extern void calculate_fibonacci(int n, int* result);

int main() {
    int n = 10; // Compute the 10th Fibonacci number
    int result; // Variable to store the result
    
    // Call the assembly function using the GRV
    calculate_fibonacci(n, &result);
    
    // Print the result
    printf("F(%d) = %d\n", n, result);
    
    return 0;
}
