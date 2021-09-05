;;assuming the implementation of frame to be a pair of var-list and val-list
; scans the frame, apply proc to the binding when it finds the binding for var

(define (env-loop continue-proc execute-proc var env)
  (define (scan vars vals)
    (cond ((null? vars) 
           (continue-proc))
          ((eq? (car vars) var)
           (execute-proc (var vals)))
          (else
           (scan (cdr vars) (cdr vals)))))
  (if (eq? env the-empty-environment)
      (error "unbound variable" var)
      (let ((frame (first-frame env)))
      	(scan (frame-variables frame)
             	(frame-values frame)))))

(define (scan continue-proc execute-proc var vars vals)
  (cond ((null? vars) 
         (continue-proc))
        ((eq? (car vars) var) 
         (execute-proc vals))
        (else 
          (scan 
            continue-proc
            execute-proc
            var
            (cdr vars)
            (cdr vals)))))

(define (lookup-variable-value var env)
  (define (env-loop env)
    (if (eq? env the-empty-environment)
        (error "unbound variable" var)		
        (scan (lambda () (env-loop (enclosing-environment env)))
              car
              var
              (frame-variables (first-frame env))
              (frame-values (first-frame env)))))
  (env-loop env))

(define (set-variable-value! var val env)
  (define (env-loop env)
    (if (eq? env the-empty-environment)
        (error "unbound variable" var)
        (scan (lambda () (env-loop (enclosing-environment env)))
              (lambda (vals) (set-car! vals val))
              var
              (frame-variables (first-frame env))
              (frame-values (first-frame env)))))
  (env-loop env))

(define (define-variable! var val env)
  (let ((frame (first-frame env)))
  	(scan (lambda () (add-binding-to-frame! var val frame))
         	(lambda (vals) (set-car! vals val))
          var
          (frame-variables frame)
          (frame-values frame))))


















