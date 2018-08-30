;;; Program to multiply two numbers using successive doubling
(define (double x) (* 2 x))
(define (half x) (/ x 2))

(define (fast_mul x y)
  (cond ((= y 0) 0)
        ((even? y) (double (fast_mul x (half y))))
        (else (+ x (fast_mul x (- y 1))))))
