;;given the predicate (equation of the function), 
 ;estimate its integral as the fraction of the rectangle's area surrounding the function's graph.
(define (estimate-integral x1 y1 x2 y2 predicate trials)
	(* ;;probability of a random point in the ractangle appears inside the function's graph
		 (monte-carlo trials
									(lambda () (predicate (random-in-range x1 x2)
										 									  (random-in-range y1 y2))))
		 ;;area of the rectangle
		 (* (- x2 x1) (- y2 y1))))


(define (estimate-circle-area radius trials)
	;;test whether the point (x, y) is in the circle centering (0, 0) with radius "radius"
	(define (circle-test x y)
		(display x)
		(newline)
	  (>= (square radius)
	  		(+ (square x) (square y))))

	(estimate-integral (- 0 radius)
										 (- 0 radius)
										 radius
										 radius
										 circle-test										 
										 trials))

;;estimate pi: area = (* (square radius) pi)
(define (estimate-integral-pi trials)
  (define radius 1000.0)
	(/ (estimate-circle-area radius trials) 
		 (square radius)))

(define (random-in-range low high)
  (let ((range (- high low)))
  	(+ low (random range))))

;;using "experiment", passed trials / all trials
(define (monte-carlo trials experiment)
  (define (iter passed-trials remaining-trials)
    (cond ((= remaining-trials 0) (/ passed-trials trials))
          ((experiment) (iter (+ passed-trials 1) 
          										(- remaining-trials 1)))
        	(else (iter passed-trials 
        							(- remaining-trials 1)))))
	(iter 0 trials))