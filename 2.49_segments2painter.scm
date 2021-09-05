(load "2.46_basic_vectors.scm"
			"2.47_make_frame.scm"
			"2.48_line_segments.scm"
      "helpers.scm")

(define (segments->painter segment-list) 
	(lambda (frame)
		(for-each
			(lambda (segment)
				(draw-line ((frame-coord-map frame) (start-segment segment)) 
									 ((frame-coord-map frame) (end-segment segment)))) 
			segment-list)))


(define (draw-ouline frame)
  (let ((one (make-vect 0 0))
  			(two (make-vect 1 0))
  			(three (make-vect 1 1))
  			(four (make-vect 0 1)))
  	(let (a (make-segment one two)
  				b (make-segment two three)
  				c (make-segment three four)
  				d (make-segment four one))
  		((segments->painter (list a b c d)) frame))))

(define (draw-x frame)
  (let ((one (make-vect 0 0))
  			(two (make-vect 1 0))
  			(three (make-vect 1 1))
  			(four (make-vect 0 1)))
  	(let ((seg1 (make-segment one three))
  				(seg2 (make-segment two four)))
  		((segments->painter (list seg1 seg2)) frame))))