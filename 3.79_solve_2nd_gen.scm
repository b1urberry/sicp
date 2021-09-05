(load "stream_helper.scm")

(define (solve-2nd f-dy-y y0 dy0 dt)
  (define y (integral (delay dy) y0 dt))
	(define dy (integral (delay ddy) dy0 dt))
	(define ddy
		(steram-map f-dy-y
								dy
								y))
	y)
