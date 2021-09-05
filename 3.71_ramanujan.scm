(load "3.70_merge_weighted.scm")

(define (cube-sum-pair pair)
  (+ (cube (car pair))
  	 (cube (cadr pair))))

(define s 
	(stream-map (lambda (x) (cube-sum-pair x))
							(weighted-pairs integers
															integers
															cube-sum-pair)))

(define r
	(stream-filter (lambda (x) x)
								 (stream-map (lambda (a b) (if (= a b) a false))
						  							 s
														 (stream-cdr s))))