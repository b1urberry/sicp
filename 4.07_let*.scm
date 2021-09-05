(define (let*2let exp)
  (if (null? (cadr exp))
      (let-body exp)		
      (make-let 
        (caadr exp)     ;the first var-val pair of a let* expression
        (let*2let 
          (make-let* 
            (cdadr exp) ;the rest of var-val pair of the let* expression
            (let-body exp))))))

(define (make-let var-val-pairs body)
  (cons 'let (cons var-val-pairs body)))
(define (make-let* var-val-pairs body)
  (cons 'let* (cons var-val-pairs body)))