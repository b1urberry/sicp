(load "helpers.scm"
			"2.48_basic_vectors.scm")


(define (transform-painter painter origin corner1 corner2) 
	(lambda (frame)
		(let ((m (frame-coord-map frame))) 
			(let ((new-origin (m origin)))
				(painter (make-frame 
									new-origin
									(sub-vect (m corner1) new-origin) 
									(sub-vect (m corner2) new-origin)))))))


(define (flip-horiz painter)
  (transform-painter painter 
  									 (make-vect 1.0 0.0)
  									 (make-vect 0.0 0.0)
  									 (make-vect 1.0 1.0)))

(define (cc-90 painter)
  (transform-painter painter
  									 (make-vect 1.0 0.0)
  									 (make-vect 1.0 1.0)
  									 (make-vect 0.0 0.0)))		

(define (cc-180 painter)
  ((repeat cc-90 2) painter))

(define (cc-270 painter)
  ((repeat cc-90 3) painter))