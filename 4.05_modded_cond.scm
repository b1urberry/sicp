(define (cond? exp) (tagged-list? exp 'cond))
(define (cond-clauses exp) (cdr exp))
(define (cond-else-clause? clause) (eq? (cond-predicate clause) 'else))
(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))

(define (special-cond-clause? clause) (eq? (cadr clause) '=>)) ;special cond clause: (⟨test⟩ => ⟨recipient⟩)
(define (cond-recepient clause) (caddr clause)) 	

(define (cond->if exp) (expand-clauses (cond-clauses exp)))
(define (expand-clauses clauses)
  (if (null? clauses)
      'false												;no else clause
      (let ((first (car clauses))
            (rest (cdr clauses)))
      	(if (cond-else-clause? first)
      	    (if (null? rest)
      	        (sequence->exp (cond-actions first))
      	        (error "ELSE clause isn't last: COND->IF"))
      	    (make-if  
             (cond-predicate first)
             ;;if "first" is a special cond clause, we input (<recipient> <test>) as the <concequence> of make-if.
             (if (special-cond-clause? first)
                 (list (cond-recepient first) (cond-predicate first))
                 (sequence->exp (cond-actions first)))
             (expand-clauses rest))))))