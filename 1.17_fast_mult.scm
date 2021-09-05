
;; multiplication using repeated addition improved by successive doubling.......
(define (fast_mult a b)
  (define (iter x y n)
    (cond ((= n 0) y)
          ((even? n) (iter (double x) y (halve n)))
          (else (iter x (+ x y) (- n 1)))))
  (iter a 0 b))

(define (double x) (* x 2))
(define (halve x) (/ x 2))