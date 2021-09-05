(define (let2combination exp)
  (if (pair? (cadr exp))
      (cons (make-lambda (let-vars (cadr exp))
                         (cddr exp))
            (let-vals (cadr exp)))
      (cons (make-lambda 
              (cons (cadr exp)
                    (let-vars (caddr exp)))
              (cdddr exp))
            (cons 
              (make-lambda 
                (cons (cadr exp)
                      (let-vars (caddr exp)))
                (cdddr exp))
              (let-vals (caddr exp))))))

