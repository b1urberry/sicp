(define (make-account balance password)

	(define attempts 0)

  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
        						 balance)
        (display "insufficient funds")))

	(define (deposit amount)
	  (set! balance (+ balance amount))
		balance)

	(define (psswd-wrong amount)
		(set! attempts (+ attempts 1))
	  (if (> attempts 7)
	      (display "call the cops")
	      (display "incorrect password")))

	(define (dispatch psswd m)
	  (if (and (eq? psswd password) (<= attempts 7))
	      (cond ((eq? m 'withdraw) withdraw)
	            ((eq? m 'deposit) deposit)
	           	(else (error "unkown request: make-account" m)))
	      psswd-wrong))
	dispatch)