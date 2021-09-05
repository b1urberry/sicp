(define (stream-limit s d)
	(define (diff a b) (abs (- a b)))
  (let ((s0 (stream-ref s 0))
  			(s1 (stream-ref s 1)))
  	(if (< (diff s0 s1) d)
  	    s1
  	    (stream-limit (stream-cdr s) d))))