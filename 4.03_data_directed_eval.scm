(define (eval exp env)
  (let ((exp-type (type-tag exp)))
  	(let ((proc (get 'eval exp-type)))
  		(if proc
  		    (proc exp env)
  		    (error "not evaluation method for expression type: EVAL" exp-type)))))

(define (type-tag exp)
	(cond ((pair? exp) '(car exp))
	      ((number? exp) 'number)
       	((symbol? exp) 'variable)
        (else 
         (error "unknown expression type: EVAL" exp))))


