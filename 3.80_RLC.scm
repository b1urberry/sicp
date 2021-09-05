(load "stream_helper.scm")

(define (RLC R L C dt)
  (define (rlc1 vc0 il0)
    (define vc
    	(integral (delay (scale-stream il (- (/ 1 C))))
    						vc0
    						dt))
    (define il
    	(integral (delay (add-streams
    									   (scale-stream vc (/ 1 L))
    									 	 (scale-stream il (- (/ R L)))))
    						il0
    						dt))
  	(cons vc il))
  rlc1)