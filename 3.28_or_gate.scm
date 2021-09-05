(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value (logical-or (get-value a1) (get-value a2))))
    	(after-delay or-gate-delay
    							 (lambda () (set-value! output new-value))))
  	(add-action! a1 or-action-procedure)
  	(add-action! a2 or-action-procedure)))

(define (logical-or a1 a2)
  (if (and (= 0 a1) (= 0 a2))
      0
      1))

