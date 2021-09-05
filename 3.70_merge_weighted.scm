(load "stream_helper.scm")

(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
      	(else 
      		(let ((s1car (stream-car s1))
      					(s2car (stream-car s2)))
      			(cond ((< (weight s1car) (weight s2car))
      						 	(cons-stream s1car
      						 							 (merge-weighted (stream-cdr s1) 
      						 							 								 s2 
      						 							 								 weight)))			
      			      (else 
      			      	(cons-stream s2car
      			      							 (merge-weighted s1 
      			      							 								 (stream-cdr s2)
      			      							 								 weight))))))))

(define (weighted-pairs s t weight)
  (cons-stream 
  	(list (stream-car s) (stream-car t))
  	(merge-weighted (stream-map (lambda (x) (list (stream-car s) x))
  															(stream-cdr t))
  									(weighted-pairs (stream-cdr s) (stream-cdr t) weight)
  									weight)))

;;a)
(define s1
	(weighted-pairs integers
									integers
									(lambda (x) (apply + x))))
;;b)
(define (weight2 pair) (+ (* 2 (car pair)) (* 3 (cadr pair)) (* 5 (car pair) (cadr pair))))
(define (undiv-2-3-5 n)
  (and (< 0 (remainder n 2))
  		 (< 0 (remainder n 3))
  		 (< 0 (remainder n 5))))
(define s2
	(stream-filter (lambda (x) (and (undiv-2-3-5 (car x))
																	(undiv-2-3-5 (cadr x))))
								 (weighted-pairs integers integers weight2)))