(define (make-account balance password)

	(define passwords (list password))

  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
        						 balance)
        (display "insufficient funds")))

	(define (deposit amount)
	  (set! balance (+ balance amount))
		balance)

	(define (add-psswd new-psswd)
	  (append passwords (list new-psswd)))

	(define (dispatch psswd m)
	  (if (filter (lambda (p) (eq? p psswd)) passwords)
	      (cond ((eq? m 'withdraw) withdraw)
	            ((eq? m 'deposit) deposit)
	            ((eq? m 'add-psswd) add-psswd)
	           	(else (error "unkown request: make-account" m)))
	      (display "incorrect password")))
	dispatch)

(define (make-joint acc psswd1 psswd2)
  ((acc 'psswd1 'add-psswd) psswd2)
	acc)