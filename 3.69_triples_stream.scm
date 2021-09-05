(load "stream_of_pairs.scm")

(define (triples s t u)
  (cons-stream 
  	(list (stream-car s) (stream-car t) (stream-car u))
  	(interleave 
  		(interleave (stream-map (lambda (x) (list (stream-car s) (stream-car t) x))
  														(stream-cdr u))
  								(stream-map (lambda (x) (append (list (stream-car s)) x))
  														(pairs (stream-cdr t) (stream-cdr u))))
  		(triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define pythago-triples
	（stream-filter	(lambda (x) (= (square (list-ref x 2))
																 (+ (square (list-ref x 0)) (square (list-ref x 1)))))
									(triples integers integers integers))