(load "3.61_invert_unit_series.scm")
(load "3.59_power_series_streams.scm")

(define (invert-series s)
  (if (= (steram-car s) 0)
      (error "constant term is 0" invert-series)
      (scale-series 
		  	(invert-unit-series 
		  		(cons-stream 1 (stream-cdr s)))
		  	(/ 1 (steram-car s)))))

(define (div-series s denom-s)
  (if (= (steram-car denom-s) 0)
      (error "denominator series has constant term of 0")
      (mul-series 
      	(invert-series denom-s)
      	s)))

(define tangent-series 
	(div-series 
		sine-series
		cosine-series))