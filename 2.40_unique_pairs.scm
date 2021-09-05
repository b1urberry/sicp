(load "helpers.scm")

(define (unique_pairs n)
  (flatmap (lambda (i) 
  					 (map (lambda (j) (list i j)) 
  					 			(enumerate_interval 1 (- i 1))))
					 (enumerate_interval 2 n)))

(define (prime_sum_pairs n)
  (define (prime_sum? pair)
    (prime? (+ (car pair) (cadr pair))))
	(define (make_triple pair)
	  (append pair (list (+ (car pair) (cadr pair)))))
	(map make_triple (filter prime_sum? (unique_pairs n))))