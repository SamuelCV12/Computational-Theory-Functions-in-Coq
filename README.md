# Computational Theory Functions in Coq

## Samuel Correa Velasquez

---

## Functions Specification

### 1. mult (n m : nat) : nat
- **Description:** Recursive implementation of multiplication using repeated addition.
- **Base Case:** mult n 0 = 0.
- **Recursive Case:** mult n (S p) = n + mult n p.

### 2. exp (b e : nat) : nat
- **Description:** Computes b raised to the power e using mult.
- **Base Case:** exp b 0 = S(0).
- **Recursive Case:** exp b (S p) = mult b (exp b p).

### 3. fact (n : nat) : nat
- **Description:** Calculates the factorial of n using mult.
- **Base Case:** fact 0 = S(0).
- **Recursive Case:** fact (S p) = mult (S p) (fact p).

### 4. fib (n : nat) : nat
- **Description:** Computes the Fibonacci number at position n.
- **Base Cases:** 
  - fib 0 = 0
  - fib 1 = S(0)
- **Recursive Case:** fib (S (S q)) = fib (S q) + fib q.

### 5. rem (n m : nat) : nat
- **Description:** Calculates the remainder of n divided by m.
- **Special Case:** If m = 0, returns 0.
- **Recursive Logic:** Decrements n and tracks the remainder until alignment with m.

### 6. div (n m : nat) : nat
- **Description:** Computes the integer division of n by m using rem.
- **Special Case:** If m = 0, returns 0.
- **Recursive Logic:** Counts how many times m fits into n.

### 7. max (n m : nat) : nat
- **Description:** Returns the greater of two natural numbers n and m.
- **Base Cases:**
  - max 0 m = m
  - max n 0 = n
- **Recursive Case:** Compares decremented values of n and m.

### 8. is_even (n : nat) : nat
- **Description:** Checks if n is even.
- **Returns:** 0 if even, 1 if odd.
- **Recursive Logic:** Toggles between 0 and 1 as n decrements.

### 9. sum_divisors (n m : nat) : nat
- **Description:** Sums all divisors of n up to m.
- **Logic:** Iterates from m to 1, adding i to the sum if n is divisible by i.

### 10. is_perfect (n : nat) : nat
- **Description:** Checks if n is a perfect number (sum of proper divisors equals n).
- **Returns:** 0 if perfect, 1 otherwise.
- **Uses:** sum_divisors to compute the sum.

### 11. gcd (n m : nat) : nat
- **Description:** Computes the greatest common divisor using the Euclidean algorithm.
- **Base Case:** gcd n 0 = n.
- **Recursive Case:** gcd n (S p) = gcd (S p) (rem n (S p)).

---

## References
1. **Web pages:** 
   - Inductive types and recursive functions: (https://coq.inria.fr/doc/v8.13/refman/language/core/inductive.html#).
2. **videos**
   - Operation of the functions in coq proof assistant (https://www.youtube.com/watch?v=5JktGsAUras&t=579s)
3. **AI Tools:**
   - ChatGPT and DeepSeek for code organization, explanation of function operation and documentation guidance.

---
