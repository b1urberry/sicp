(load "2.50_flip_horiz.scm")

(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
  	(let ((paint-up 
  					(transform-painter painter2 
  														 split-point
  														 (make-vect 1.0 0.5)
  														 (make-vect 0.0 1.0)))
  				(paint-down
  					(transform-painter painter1
  														  (make-vect 0.0 0.0)
  															(make-vect 1.0 0.0)
  															split-point)))
  		(lambda (frame) 
  			(paint-down frame)
  			(paint-up frame)))))

(define (beside painter1 painter2)
	(let ((split-point (make-vect 0.5 0.0)))
		(let ((paint-left 
						(transform-painter painter1
												 			 (make-vect 0.0 0.0) 
												 			 split-point 
												 			 (make-vect 0.0 1.0)))
					(paint-right 
						(transform-painter painter2
															 split-point 
															 (make-vect 1.0 0.0) 
															 (make-vect 0.5 1.0))))
			(lambda (frame)
			 	(paint-left frame)
			 	(paint-right frame)))))

(define (below2 painter1 painter2)
  (let ((new-painter1 (cc-270 painter1)
  			(new-painter2 (cc-270 painter2))))
  	(cc-90 (beside painter1 painter2))))