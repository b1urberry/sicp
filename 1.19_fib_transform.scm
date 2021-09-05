(define (fib n)
  (fib_trans_iter 1 0 0 1 n))

(define (fib_trans_iter a b p q count)
  (cond ((= 0 count) b)
        ((even? count) 
          (fib_trans_iter a
                          b
                          (+ (square p) (square q))
                          (+ (square q) (* 2 p q))
                          (/ count 2)))
        (else (fib_trans_iter (+ (* b p) (* a q) (* a p))
                              (+ (* b p) (* a q))
                              p
                              q
                              (- count 1)))))