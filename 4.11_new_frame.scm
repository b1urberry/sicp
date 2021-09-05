;;defining frame as an alist(associated list) of variable-value pairs
(define (make-frame variables values)
  (map cons variables values))
(define (add-binding-to-frame! var val frame)
  (cons (cons var val)
        frame))

;;lookup procedure for variable-value implementation
(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan frame)
      (let ((binding (assq var frame)))
        (if binding
            (cdr binding)
            (env-loop (enclosing-environment env)))))
    (if (eq? env the-empty-environment)
        (error "unbound varibale" var)
        (scan (first-frame env))))
  (env-loop env))