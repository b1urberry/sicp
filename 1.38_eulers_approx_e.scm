;; a continued fraction expansion for e − 2, where e is the base of the natural logarithms. 
;; In this fraction, the Ni are all 1, 
;; and the Di are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ......

(define (approx_e k)
  (define (n i) 1)
  (define (d i)
    (if (= (remainder i 3) 2)
      (* 2 (+ 1 (truncate (/ i 3.0))))
      1))
  ; find con_frac in helpers.scm
  (+ 2 (con_frac n d k)))