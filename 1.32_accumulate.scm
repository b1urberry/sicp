(define (accumulate combiner null_value f a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner (f a) result))))
  (iter a null_value))