;; We can represent pairs of nonnegative integers using only numbers and arithmetic operations
 ; if we represent the pair a and b as the integer that is the product (2^a)*(3^b). 
 ; Give the corresponding definitions of the procedures cons, car, and cdr.

(define (cons3 x y)
  (* (expt 2 x) (expt 3 y)))

(define (log_reduce n base)
  (define (iter n result)
    (if (= 0 (remainder n base))
      (iter (/ n base) (+ result 1))
      result))
  (iter n 0))

(define (car3 z) (log_reduce z 2))
(define (cdr3 z) (log_reduce z 3))