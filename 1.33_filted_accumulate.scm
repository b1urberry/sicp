(define (filtered_accumulate combiner null_value filter? f a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter? a) (iter (next a) (combiner (f a) result)))
          (else (iter (next a) result))))
  (iter a null_value))

(define (sum_squared_primes a b)
  (filtered_accumulate + 0 prime? square a (lambda (x) (+ x 1)) b))
