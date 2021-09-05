(define (sub-poly p1 p2)
  (if (same-variable? p1 p2)
      (make-poly (variable p1)
      					 (sub-terms (term-list p1) (term-list p2)))
      (error "Polys not in same var: ADD-POLY" (list p1 p2))))\

(define (sub-terms l1 l2)
  (cond ((empty-termlist? l1) (negate l2))
        ((empty-termlist? l2) l1)
      	(else
      		(let ((t1 (first-term l1))
      					(t2 (first-term l2)))
      			(cond ((> (order t1) (order t2)) 
      							(ajoin-term t1 
      										(sub-terms (rest-terms l1) l2)))
      			      ((< (order t1) (order t2)) 
      			      	(ajoin-term (negate t2) 
      			      				(sub-terms l1 (rest-terms l2))))
      			    	(else (ajoin-term (make-term (order t1) (add (coeff t1) (coeff t2)))
      			    							(sub-terms (rest-terms l1) 
      			    												 (rest-terms l2)))))))))
