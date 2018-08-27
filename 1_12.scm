;Program to calculate the r'th row and c'th column of the Pascal's 
triangle

(define (pascal r c)
  (if (or (= c 1) (= r c))
      1
      (+  (pascal (- r 1) (- c 1))
          (pascal (- r 1) c))))
