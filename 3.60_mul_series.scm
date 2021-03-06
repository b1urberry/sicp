(load "stream_helper.scm")

(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1)
  								(stream-car s2))
							 (add-streams (scale-stream (stream-cdr s1)
							 														(stream-car s2))
														(mul-series s1
																				(stream-cdr s2)))))