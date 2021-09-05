;;equ? for scheme-number
(put 'equ? 'scheme-number =)

;;equ? for rational number
(define (equ? x y) 
	(= (* (numer x) (denom y)) 
	   (* (numer y) (denom x))))
(put 'equ? 'rational equ?)

;;equ? for complex number
(define (equ? x y)
  (and (= (real-part x) (real-part y))
  		 (= (imag-part x) (imag-part y))))
(put 'equ? 'complex equ?)