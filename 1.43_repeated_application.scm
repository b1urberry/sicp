

(define (repeated times f)
  (define (iter count result_f)
    (if (= count 1)
      result_f
      (iter (- count 1) (lambda (x) (f (result_f x))))))
  (iter times f))