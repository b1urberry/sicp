(load "stream_helper.scm")

(define (RC R C dt)
  (define (calculate-v i-stream v0)
    (add-streams
    	(scale-stream i-stream R)
    	(scale-stream (integral i-stream v0 dt)
    								(/ 1 C))))
	calculate-v)

;;takes as input a stream "integrand", a constant "initial-value", and a small increment "dt"
 ;and produces a stream of integrals of the "integrand"
(define (integral integrand initial-value dt)
  (define int
  	(cons-stream 
  		initial-value
  		(add-streams (scale-stream integrand dt)
  								int))))