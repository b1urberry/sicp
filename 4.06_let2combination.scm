(define (let? exp) (eq? (car exp) 'let))
(define (eval-let exp env) 
  (eval (let->combination exp) env))

(define (let->combination exp)
  (cons (make-lambda (let-vars (cadr exp))
        		         (cddr exp))      ;body of the let expression
        (let-vals (cadr exp))))

(define (let-vars var-val-pairs)
  (if (null? var-val-pairs)
      '()
      (cons (car (car var-val-pairs)) 
            (let-vars (cdr var-val-pairs)))))
(define (let-vals var-val-pairs)
  (if (null? var-val-pairs)
      '()
      (cons (cadr (car var-val-pairs))
            (let-vals (cdr var-val-pairs)))))