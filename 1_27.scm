;;; Procedure to check whether the Carmichael numbers fool the Fermat test
#lang sicp

(define (square x) (* x x))

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

(define (is-congruent n)
  (define (test n a)
    (cond ((= a 0) true)
          ((= (expmod a n n) a) (test n (- a 1)))
          (else false)))
  (test n (- n 1)))

(is-congruent 6602)
