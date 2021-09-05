(define (solve-2nd y0 d-y0 a b dt)
  (define y (integral (delay dy) y0 dt))
	(define dy (integral (delay ddy) d-y0 dt))
	(define ddy 
		(map-stream (lambda (x1 x2) (+ (* a x1) (* b x2)))
								dy
								y))
	y)


(define (integral delayed-integrand initial-value dt)
  (define int
  	(cons-stream 
  		initial-value
  		(let ((integrand (force delayed-integrand)))
  		 	(add-streams (scale-stream integrand dt)
  		 							 int))))
	int)