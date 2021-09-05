(define f 
	(let ((y 1))
		(lambda (x) 
			(if (= y 1)
			    (begin (set! y x) y)
			    y))))