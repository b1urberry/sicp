;; we could implement cons, car, and cdr 
 ; without using any data structures at all but only using procedures

;; returns a procedure "dispatch" that takes one argument m
 ; for determining which element of the pair to dispatch
(define (cons1 x y)
  (define (dispatch m)
    (cond ((= 0 m) x)
          ((= 1 m) y)
          (else (error "Argument not 0 or 1: CONS" m))))
  dispatch)
;; feeds z (the pair returned by cons1 which is the procedure "dispatch") with 0 to return the first element x
(define (car1 z) (z 0))
(define (cdr1 z) (z 1))


;; returns a procedure with an argument m
 ; m is a procedure that takes 2 arguments x and y
(define (cons2 x y)
  (lambda (m) (m x y)))
;; feeds z with a procedure that takes 2 argument p and q and returns p
 ; where z should be the procedure returned by cons2
(define (car2 z)
  (z (lambda (p q) p)))
(define (cdr2 z)
  (z (lambda (p q) q)))