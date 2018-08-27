;; procedure for exponentiation using successive squaring

(define (fast_exp a n)
  (if (= n 0)
      1
      (fast_exp_iter a 1 n)))

(define (fast_exp_iter base product n)
  (cond ((= n 0) product)
        ((even? n) (fast_exp_iter (square base) product (/ n 2)))
        (else (fast_exp_iter base (* base product) (- n 1)))))

(define (square x) (* x x))
