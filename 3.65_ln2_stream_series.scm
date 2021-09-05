(load "stream_helper.scm")

(define (ln2-summands n)
  (cons-stream (/ 1 n)
  						 (stream-map
  						 	 -
  						 	 (ln2-summands (+ n 1)))))

(define ln2-stream
	(partial-sums (ln2-summands 1)))


