(load "circuit.scm")

(define (ripple a b s c)
  (cond ((null? a) 'ok)
        (else (let ((c-out (make-wire)))
        				(full-adder (car a) (car b) c (car s) c-out)
        	 			(ripple (cdr a) (cdr b) c-out (cdr s))))))