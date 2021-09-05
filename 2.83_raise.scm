;;raise integer to rational
(define (int2rat int)
  (define (make-rat n d) (get 'make 'rational))
	(make-rat int 1))
(put 'raise 'integer int2rat)

;;raise rational to real numbers
(define (rat2real rat)
  body)
(put 'raise 'rat rat2real)

;;raise real numbers to complex numbers
(define (real2complex real)
  (define (make-from-real-imag x y)
    (get 'make-from-real-imag 'complex))
	(make-from-real-imag real 0))
(put 'rasie 'real real2complex)