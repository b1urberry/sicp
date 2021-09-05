(load "3.60_mul_series.scm")

(define (invert-unit-series s)
	(define inverted
		(cons-stream
			1
			(scale-stream
				(mul-series
					(stream-cdr s)
					inverted)
				-1)))
	inverted)