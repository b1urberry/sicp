(define (make-from-real-imag x y)
  (define (dispatch operation)
    (cond ((eq? operation 'real-part) x)
          ((eq? operation 'imag-part) y)
        	((eq? operation 'magnitude) (sqrt (+ (square x) (square y))))
        	((eq? operation 'angle) (atan y x))
        	(else (error "unknown operation for real-imag representation: " operation))))
	dispatch)

(define (make-from-mag-ang mag ang)
  (define (dispatch operation)
    (cond ((eq? operation 'real-part) (* mag (cos ang)))
          ((eq? operation 'imag-part) (* mag (sin ang)))
        	((eq? operation 'magnitude) mag)
      		((eq? operation 'angle) ang)
      		(else (error "unknown operation for mag-ang representation: " operation))))
	dispatch)