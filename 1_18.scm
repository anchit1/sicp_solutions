;; Program to multiply two numbers iteratively using successiv adding

(define (double x) (* 2 x))
(define (half x) (/ x 2))

(define (fast_mul x y)
  (define (fast_mul_iter base sum n)
    (cond ((= n 0) sum)
          ((even? n) (fast_mul_iter
                        (double base)
                        sum
                        (half n)))
          (else (fast_mul_iter base (+ base sum) (- n 1)))))
          
  (fast_mul_iter x 0 y))

(fast_mul 7 9)
