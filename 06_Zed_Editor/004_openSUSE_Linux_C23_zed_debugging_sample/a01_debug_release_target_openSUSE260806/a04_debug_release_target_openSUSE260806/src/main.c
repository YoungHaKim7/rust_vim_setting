#include <stdio.h>

// Small helper — a good target for "step into" while debugging.
static int sum_range(int lo, int hi) {
    int total = 0;
    for (int i = lo; i <= hi; ++i) {
        total += i;
    }
    return total;
}

int main(void) {
    constexpr int count = 5; // C23
    int values[count] = {10, 20, 30, 40, 50};

    int total = sum_range(1, count);
    printf("sum 1..%d = %d\n", count, total);

    for (int i = 0; i < count; ++i) {
        printf("values[%d] = %d\n", i, values[i]);
    }

    return 0;
}
