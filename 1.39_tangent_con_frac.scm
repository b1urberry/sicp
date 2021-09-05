(define (tan_cf x k)
  (define (n i)
    (if (= i 1)
      x
      (square x)))
  (define (d i) (- (* i 2) 1))
  (con_frac n d k))