;;uses the built-in general version of map
 ;which multiplies each element of v by the corresponding element of w
 ;and constructs the list of their products with the same length 
(define (dot_product v w)
  (accumulate + 0 (map * v w)))

(define (matrix_*_vector m v)
  (map (lambda (m_vector) (dot_product m_vector v)) m))

(define (transpose m)
;  (if (null? (car m))
;      ()
;      (cons (accumulate cons () (map car m))
;      			(transpose (map cdr m))))
	;;using accumulate_n:
	(accumulate_n cons () m))

(define (matrix_*_matrix m n)
  )