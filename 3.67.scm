(load "stream_of_pairs.scm")

(define (pairs s t)
  (cons-stream
  	(list (stream-car s) (stream-car t))
  	(interleave 
  		(interleave (stream-map (lambda (x) (list (stream-car s) x))
  														(stream-cdr t))
  								(stream-map (lambda (x) (list (stream-car t) x))
  														(stream-cdr s)))
  		(pairs (stream-cdr s)
  					 (stream-cdr t)))))