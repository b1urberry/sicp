
(define (horner_eval x coefficient_sequence) 
	(accumulate (lambda (this_coeff higher_terms) (+ this_coeff (* x higher_terms)))
							0 
							coefficient_sequence))