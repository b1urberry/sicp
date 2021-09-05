(define (product f a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (f a)))))
  (iter a 1))

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(define (pi_approx n)
  (define (f n)
    (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))))
  (* 4 (product f 1.0 (lambda (x) (+ x 1)) n)))