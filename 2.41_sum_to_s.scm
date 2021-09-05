(load "helpers.scm")

(define (unique_triples n)
  (flatmap (lambda (i) 
  					 (map (lambda (j) 
  					 			(map (lambda (k) 
  					 					 (list i j k))
  					 					 (enumerate_interval 1 (- j 1))))
  					 			(enumerate_interval 1 (- i 1))))
  				 (enumerate_interval 1 n)))


(define (sum_to_s s n)
  (define (sum_to_s? triple)
    (= (+ (car triple) (cadr triple) (caddr triple))
    	 s))
	(filter sum_to_s? (unique_triples n)))