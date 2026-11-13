// Count primes <= N. Reads N on stdin, prints the count on stdout.
// Odd-only sieve of Eratosthenes. 2 is counted separately;
// index i represents the odd number 2*i+3.
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int main(void) {
    long N;
    if (scanf("%ld", &N) != 1) return 0;
    if (N < 2) { printf("0\n"); return 0; }
    long m = (N - 1) / 2;                 // odds 3..N
    unsigned char *sieve = calloc(m, 1);  // 0 = prime, 1 = composite
    long lim = (long)sqrt((double)N);
    for (long i = 0; 2 * i + 3 <= lim; i++) {
        if (!sieve[i]) {
            long p = 2 * i + 3;
            long start = (p * p - 3) / 2;
            for (long j = start; j < m; j += p) sieve[j] = 1;
        }
    }
    long count = 1;                       // prime 2
    for (long i = 0; i < m; i++) if (!sieve[i]) count++;
    printf("%ld\n", count);
    return 0;
}
