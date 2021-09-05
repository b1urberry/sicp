(define (simpson_integral f a b n)
  (define h (/ (- b a) n))
  ; g(k) determines the kth element of the summation
  (define (g k)
    (define yk (f (+ a (* k h))))
    (cond ((or (= k 0) (= k n)) yk)
          ((even? k) (* 2 yk))
          (else (* 4 yk))))
  (* (/ h 3.00) (sum g 1 (lambda (x) (+ x 1)) n)))