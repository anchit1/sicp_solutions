(define (f x)
  (if (< x 3)
      x
      (f_iter 2 1 0 (- x 2))))

(define (f_iter a b c count)
  (if (= count 0)
      a
      (f_iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- count 1))))
