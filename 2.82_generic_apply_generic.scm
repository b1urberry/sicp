(define (apply-generic op . args)
  (if (or (null? (cdr args)) (null? (cddr args)))		
      (let ((type-args (map type-tag args)))
      	(let ((proc (get op type-args)))
      		(if proc
      		    (apply proc (map content args))	
      		    (if (= (length args) 2)
      		        (let ((type1 (type-tag (car args)))
      		        			(type2 (type-tag (cadr args)))
      		        			(a1 (content (car args)))
      		        			(a2 (content (cadr args))))
      		        	(let ((t1->t2 (get-coercion type1 type2))
      		        				(t2->t1 (get-coercion type2 type1)))
      		        		(cond (t1->t2 (apply-generic op (t1->t2 a1) a2))
      		        		      (t2->t1 (apply-generic op a1 (t2->t1 a2)))
      		        		    	(else (error "No method for these types" (list op type-tags))))))
      		        (error "No method for these types" (list op type-tags))))))
      (apply-generic op
      							 (apply-generic op (car args) (cadr args))
      							 (cddr args))))