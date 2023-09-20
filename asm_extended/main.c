#include <stdio.h>

// Define the assembly function prototype
extern void matrix_multiply(int* A, int* B, int* C, int size);

// Function to print a matrix
void print_matrix(int* matrix, int size) {
    for (int i = 0; i < size; i++) {
        for (int j = 0; j < size; j++) {
            printf("%d ", matrix[i * size + j]);
        }
        printf("\n");
    }
    printf("\n");
}

int main() {
    // Matrix size and data
    int size = 3;
    int matrix_A[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    int matrix_B[] = {9, 8, 7, 6, 5, 4, 3, 2, 1};
    int result_matrix[size * size];

    // Call the assembly function using Extended Asm
    asm volatile (
        "bl matrix_multiply"
        :
        : "r" (matrix_A), "r" (matrix_B), "r" (result_matrix), "r" (size)
        : "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11"
    );

    // Print the result
    printf("Matrix A:\n");
    print_matrix(matrix_A, size);

    printf("Matrix B:\n");
    print_matrix(matrix_B, size);

    printf("Result Matrix:\n");
    print_matrix(result_matrix, size);

    return 0;
}