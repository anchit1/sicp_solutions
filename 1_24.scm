#lang sicp

(define (square x) (* x x))

;;; Procedure for timing the prime? function
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 3)
      (report-prime (- (runtime) 
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;;; Procedure for checking the primality of a number using Fermat Test
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else false)))
;;; Program to find the three smallest primes numbers larger than 1000, 10,000, 100,000 and 1,000,000
(define (search-for-primes first last)
  (define (search-iter curr last)
    (if (< curr last) (timed-prime-test curr))
    (if (< curr last) (search-for-primes (+ curr 2) last)))
  (search-iter (if (even? first) (+ first 1) first) last))

(search-for-primes 1000000000 1000000100)

(search-for-primes 10013 3)

;;; Conclusion - the running times are much better (logarithmic) in comparision to the sqrt(n) method.
