// Count primes <= N. Read N on stdin, print the count on stdout.
// Odd-only sieve of Eratosthenes on a Uint8Array. 2 is counted separately;
// index i represents the odd number 2*i+3. Marking starts at p*p, steps 2p.
const fs = require('fs');
const N = parseInt(fs.readFileSync(0, 'utf8').trim(), 10);
if (N < 2) { console.log(0); process.exit(0); }
const m = ((N - 1) >> 1);            // odds from 3..N -> indices 0..m-1
const sieve = new Uint8Array(m);     // 0 = prime, 1 = composite
const lim = Math.floor(Math.sqrt(N));
for (let i = 0; (2 * i + 3) <= lim; i++) {
  if (!sieve[i]) {
    const p = 2 * i + 3, step = p, start = (p * p - 3) >> 1;
    for (let j = start; j < m; j += step) sieve[j] = 1;
  }
}
let count = 1;                        // prime 2
for (let i = 0; i < m; i++) if (!sieve[i]) count++;
console.log(count);
