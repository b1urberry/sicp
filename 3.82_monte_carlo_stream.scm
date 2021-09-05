
(define (point-stream x2 y1 x2 y2)
  )

(define (random-stream-in-range low high)
  (let ((range (- high low)))
  	(cons-stream 
  		(+ low (random range))
  		(random-stream-in-range low high))))

(define (monte-carlo experiment-stream passed failed)
  (define (next passed failed)
    (cons-stream 
    	(/ passed (+ passed failed))
    	(monte-carlo (stream-cdr experiment-stream) passed failed)))
	;;if the current experiment passed, call "next" to produce the current estimation
	(if (stream-car experiment-stream)
	    (next (+ passed 1) failed)
	    (next passed (+ failed 1))))
