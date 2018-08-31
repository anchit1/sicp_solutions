#lang sicp

(define (square x) (* x x))

;;; Procedure for timing the prime? function
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;;; Procedure for checking the primality of a number
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (next test-divisor)))))

(define (next n)
  (if (= n 2) 3 (+ n 2)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


;;; Program to find the three smallest primes numbers larger than 1000, 10,000, 100,000 and 1,000,000
(define (search-for-primes first last)
  (define (search-iter curr last)
    (if (< curr last) (timed-prime-test curr))
    (if (< curr last) (search-for-primes (+ curr 2) last)))
  (search-iter (if (even? first) (+ first 1) first) last))

(search-for-primes 1000000 1000100)

(search-for-primes 10013 3)
