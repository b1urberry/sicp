(define fibs
	(cons-stream 0
							 (cons-stream 1
							 							(add-streams fibs
							 													 (stream-cdr fibs)))))